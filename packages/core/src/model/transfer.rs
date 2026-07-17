use bytes::Bytes;
use serde::{Deserialize, Serialize};
use std::path::PathBuf;
use tokio::sync::mpsc;

/// Channel capacity used when normalizing a file-backed [`FileContent`] into a stream.
const FILE_CHANNEL_CAPACITY: usize = 16;

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

    let mut buffer = bytes::BytesMut::with_capacity(64 * 1024);
    let mut total: u64 = 0;
    loop {
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
