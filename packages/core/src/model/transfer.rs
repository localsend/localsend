use bytes::Bytes;
use serde::{Deserialize, Serialize};
use std::path::PathBuf;
use tokio::sync::mpsc;

/// Channel capacity used when normalizing a file-backed [`FileContent`] into a stream.
const FILE_CHANNEL_CAPACITY: usize = 16;

/// Buffer size used when reading a file into chunks.
const READ_BUFFER_SIZE: usize = 512 * 1024;

/// The binary content of a file provided by the application for a transfer.
///
/// Shared by the HTTP client (upload) and server (download API) so both can
/// obtain a file's content as an in-memory stream of chunks, from a regular
/// file path, or, on Android, directly from a raw file descriptor.
#[derive(Debug)]
pub enum FileContent {
    /// A stream of binary chunks. The channel is closed once the file has been
    /// fully provided.
    Stream(mpsc::Receiver<Bytes>),

    /// A path to a regular file the content is read from.
    Path(PathBuf),

    /// A raw file descriptor the content is read from (Android only).
    #[cfg(target_os = "android")]
    Fd(std::os::fd::RawFd),
}

impl FileContent {
    /// Normalizes the content into a stream of binary chunks.
    ///
    /// [`FileContent::Stream`] is returned as-is. For [`FileContent::Path`] and
    /// [`FileContent::Fd`], a background task reads the file and forwards the
    /// chunks; the channel is closed on EOF or on an I/O error.
    pub fn into_receiver(self) -> mpsc::Receiver<Bytes> {
        match self {
            FileContent::Stream(rx) => {
                tracing::info!("Reading file content via byte stream from application");
                rx
            }
            FileContent::Path(path) => {
                tracing::info!("Reading file content from path: {}", path.display());
                let (tx, rx) = mpsc::channel(FILE_CHANNEL_CAPACITY);
                tokio::spawn(async move {
                    match tokio::fs::File::open(&path).await {
                        Ok(file) => read_file_into_sender(file, tx).await,
                        Err(e) => {
                            tracing::error!("Failed to open {}: {e}", path.display());
                        }
                    }
                });
                rx
            }
            #[cfg(target_os = "android")]
            FileContent::Fd(fd) => {
                use std::os::fd::FromRawFd;

                tracing::info!("Reading file content from file descriptor: {fd}");
                let (tx, rx) = mpsc::channel(FILE_CHANNEL_CAPACITY);
                // SAFETY: the descriptor is owned by this transfer; wrapping it in
                // a File transfers that ownership so it is closed once reading finishes.
                let std_file = unsafe { std::fs::File::from_raw_fd(fd) };
                let file = tokio::fs::File::from_std(std_file);
                tokio::spawn(read_file_into_sender(file, tx));
                rx
            }
        }
    }
}

/// Reads `file` to EOF, forwarding chunks on `tx`.
///
/// Stops early if the receiver is gone or a read error occurs.
async fn read_file_into_sender(mut file: tokio::fs::File, tx: mpsc::Sender<Bytes>) {
    use tokio::io::AsyncReadExt;

    let mut buffer = bytes::BytesMut::new();
    let mut total: u64 = 0;
    loop {
        // Re-reserve every iteration: `split()` hands the filled part off, which
        // can leave little spare capacity for the next read.
        buffer.reserve(READ_BUFFER_SIZE);
        match file.read_buf(&mut buffer).await {
            Ok(0) => break,
            Ok(n) => {
                total += n as u64;
                if tx.send(buffer.split().freeze()).await.is_err() {
                    break;
                }
            }
            Err(e) => {
                tracing::error!("Failed to read file content: {e}");
                break;
            }
        }
    }
    tracing::info!("Finished reading file content ({total} bytes)");
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct FileDto {
    pub id: String,
    pub file_name: String,
    pub size: u64,
    pub file_type: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub sha256: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub preview: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub metadata: Option<FileMetadata>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FileMetadata {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub modified: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub accessed: Option<String>,
}

#[cfg(feature = "http")]
impl FileMetadata {
    /// The `modified` timestamp parsed as a [`std::time::SystemTime`],
    /// or `None` when absent or not parsable.
    pub fn modified_time(&self) -> Option<std::time::SystemTime> {
        parse_timestamp(self.modified.as_deref()?)
    }

    /// The `accessed` timestamp parsed as a [`std::time::SystemTime`],
    /// or `None` when absent or not parsable.
    pub fn accessed_time(&self) -> Option<std::time::SystemTime> {
        parse_timestamp(self.accessed.as_deref()?)
    }
}

/// Parses an RFC 3339 timestamp (e.g. `2026-08-01T10:20:30.456Z`), the format
/// the protocol uses for file metadata.
#[cfg(feature = "http")]
fn parse_timestamp(value: &str) -> Option<std::time::SystemTime> {
    match time::OffsetDateTime::parse(value, &time::format_description::well_known::Rfc3339) {
        Ok(parsed) => Some(parsed.into()),
        Err(e) => {
            tracing::warn!("Could not parse file timestamp {value:?}: {e}");
            None
        }
    }
}

#[cfg(all(test, feature = "http"))]
mod tests {
    use super::*;
    use std::time::{Duration, SystemTime};

    fn metadata(modified: &str) -> FileMetadata {
        FileMetadata {
            modified: Some(modified.to_string()),
            accessed: None,
        }
    }

    #[test]
    fn parses_utc_timestamp() {
        assert_eq!(
            metadata("2000-01-01T00:00:00Z").modified_time(),
            Some(SystemTime::UNIX_EPOCH + Duration::from_secs(946_684_800)),
        );
    }

    #[test]
    fn parses_fractional_seconds() {
        // The Dart implementation sends `DateTime.toIso8601String()` of a UTC
        // value, which includes fractional seconds: 1970-01-01T00:00:00.500Z.
        assert_eq!(
            metadata("1970-01-01T00:00:00.500Z").modified_time(),
            Some(SystemTime::UNIX_EPOCH + Duration::from_millis(500)),
        );
    }

    #[test]
    fn parses_offset_timestamp() {
        assert_eq!(
            metadata("2000-01-01T01:00:00+01:00").modified_time(),
            Some(SystemTime::UNIX_EPOCH + Duration::from_secs(946_684_800)),
        );
    }

    #[test]
    fn ignores_invalid_timestamp() {
        assert_eq!(metadata("yesterday").modified_time(), None);
        assert_eq!(metadata("2000-01-01T00:00:00").modified_time(), None);
    }

    #[test]
    fn ignores_absent_timestamp() {
        let metadata = FileMetadata {
            modified: None,
            accessed: None,
        };
        assert_eq!(metadata.modified_time(), None);
        assert_eq!(metadata.accessed_time(), None);
    }
}
