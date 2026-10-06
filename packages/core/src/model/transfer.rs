use bytes::Bytes;
use futures_util::stream::{Stream, StreamExt};
use serde::{Deserialize, Serialize};
use std::path::PathBuf;
use std::pin::Pin;
use tokio::sync::mpsc;
use tokio_stream::wrappers::ReceiverStream;

/// Limit queued file read-ahead to 2 MiB per active stream.
const FILE_CHANNEL_CAPACITY: usize = 4;

/// Buffer size used when reading a file into chunks.
const READ_BUFFER_SIZE: usize = 512 * 1024;

/// A file's content as a stream of chunks, ending with an [`Err`] item when the
/// file could not be read.
///
/// `Sync` on top of `Send`, because the web download handler turns this stream
/// into a boxed response body and `http_body_util::BodyExt::boxed` requires a
/// `Sync` body.
pub type FileStream = Pin<Box<dyn Stream<Item = Result<Bytes, std::io::Error>> + Send + Sync>>;

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
    /// [`FileContent::Stream`] is forwarded as-is. For [`FileContent::Path`] and
    /// [`FileContent::Fd`], a background task reads the file and forwards the
    /// chunks; the stream ends after the last chunk on EOF.
    ///
    /// An I/O failure is yielded as a final [`Err`] item rather than ending the
    /// stream early. The consumer builds a request or response body from this
    /// stream, so a silent end would be indistinguishable from a complete file:
    /// the peer would store a truncated (or empty) file and the transfer would
    /// look successful on this side.
    pub fn into_stream(self) -> FileStream {
        match self {
            FileContent::Stream(rx) => {
                tracing::info!("Reading file content via byte stream from application");
                Box::pin(ReceiverStream::new(rx).map(Ok))
            }
            FileContent::Path(path) => {
                tracing::info!("Reading file content from path: {}", path.display());
                let (tx, rx) = mpsc::channel(FILE_CHANNEL_CAPACITY);
                tokio::spawn(async move {
                    match tokio::fs::File::open(&path).await {
                        Ok(file) => read_file_into_sender(file, tx).await,
                        Err(e) => {
                            tracing::error!("Failed to open {}: {e}", path.display());
                            // Re-wrapped with the path: this message is what the
                            // user gets to see, and the bare OS error does not
                            // say which file could not be read.
                            let _ = tx
                                .send(Err(std::io::Error::new(
                                    e.kind(),
                                    format!("Failed to open {}: {e}", path.display()),
                                )))
                                .await;
                        }
                    }
                });
                Box::pin(ReceiverStream::new(rx))
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
                Box::pin(ReceiverStream::new(rx))
            }
        }
    }
}

/// Reads `file` to EOF, forwarding chunks on `tx`.
///
/// Stops early if the receiver is gone. A read error is forwarded as a final
/// [`Err`] item, so the consumer aborts the transfer instead of treating the
/// bytes read so far as the complete file.
async fn read_file_into_sender(
    mut file: tokio::fs::File,
    tx: mpsc::Sender<Result<Bytes, std::io::Error>>,
) {
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
                if tx.send(Ok(buffer.split().freeze())).await.is_err() {
                    break;
                }
            }
            Err(e) => {
                tracing::error!("Failed to read file content: {e}");
                let _ = tx.send(Err(e)).await;
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
    /// The timestamps of the file at `path`, or `None` when the file cannot be
    /// inspected or provides no timestamps.
    pub fn from_path(path: &std::path::Path) -> Option<Self> {
        Self::from_fs_metadata(&std::fs::metadata(path).ok()?)
    }

    /// See [`FileMetadata::from_path`], on an already obtained [`std::fs::Metadata`].
    pub fn from_fs_metadata(metadata: &std::fs::Metadata) -> Option<Self> {
        let modified = metadata.modified().ok().and_then(format_timestamp);
        let accessed = metadata.accessed().ok().and_then(format_timestamp);
        if modified.is_none() && accessed.is_none() {
            return None;
        }
        Some(Self { modified, accessed })
    }

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

/// Formats a timestamp as RFC 3339 with nanosecond precision.
#[cfg(feature = "http")]
fn format_timestamp(value: std::time::SystemTime) -> Option<String> {
    match time::OffsetDateTime::from(value).format(&time::format_description::well_known::Rfc3339) {
        Ok(formatted) => Some(formatted),
        Err(e) => {
            tracing::warn!("Could not format file timestamp: {e}");
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
    fn formats_nanosecond_timestamp() {
        let time = SystemTime::UNIX_EPOCH + Duration::from_nanos(123_456_789);
        let formatted = format_timestamp(time).unwrap();
        assert_eq!(formatted, "1970-01-01T00:00:00.123456789Z");
        assert_eq!(parse_timestamp(&formatted), Some(time));
    }

    #[test]
    fn reads_file_timestamps() {
        let path =
            std::env::temp_dir().join(format!("localsend-metadata-{}", uuid::Uuid::new_v4()));
        std::fs::write(&path, b"hello").unwrap();
        // 100 ns aligned, so the values are exactly representable on NTFS.
        let modified = SystemTime::UNIX_EPOCH + Duration::new(1_600_000_000, 123_456_700);
        let accessed = SystemTime::UNIX_EPOCH + Duration::new(1_600_000_001, 987_654_300);
        let file = std::fs::File::options().write(true).open(&path).unwrap();
        file.set_times(
            std::fs::FileTimes::new()
                .set_modified(modified)
                .set_accessed(accessed),
        )
        .unwrap();
        drop(file);

        let metadata = FileMetadata::from_path(&path).unwrap();
        std::fs::remove_file(&path).unwrap();
        assert_eq!(metadata.modified_time(), Some(modified));
        assert_eq!(metadata.accessed_time(), Some(accessed));
    }

    #[test]
    fn reads_no_metadata_from_missing_file() {
        assert!(
            FileMetadata::from_path(std::path::Path::new("/nonexistent/localsend-test")).is_none()
        );
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

    /// A file that cannot be opened must fail the stream. Ending it silently
    /// would be indistinguishable from an empty file, so the peer would store
    /// a 0-byte file while this side reports a successful transfer.
    #[tokio::test]
    async fn unopenable_path_fails_the_stream() {
        let missing =
            std::env::temp_dir().join(format!("localsend-missing-{}", uuid::Uuid::new_v4()));
        let chunks: Vec<_> = FileContent::Path(missing).into_stream().collect().await;

        assert_eq!(chunks.len(), 1);
        assert!(chunks[0].is_err());
    }

    /// The happy path still yields the file content and then ends.
    #[tokio::test]
    async fn readable_path_yields_the_content() {
        let path = std::env::temp_dir().join(format!("localsend-content-{}", uuid::Uuid::new_v4()));
        std::fs::write(&path, b"hello").unwrap();

        let chunks: Vec<_> = FileContent::Path(path.clone())
            .into_stream()
            .collect()
            .await;
        std::fs::remove_file(&path).unwrap();

        let mut content = Vec::new();
        for chunk in chunks {
            content.extend_from_slice(&chunk.expect("a readable file must not fail the stream"));
        }
        assert_eq!(content.as_slice(), b"hello");
    }
}
