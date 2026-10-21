use crate::model::transfer::FileContent;
use sha2::{Digest, Sha256};
use tokio_util::sync::CancellationToken;

/// Buffer size used when hashing a file chunk by chunk.
const HASH_BUFFER_SIZE: usize = 512 * 1024;

#[derive(Debug, thiserror::Error)]
pub enum HashError {
    #[error("Failed to read the file: {0}")]
    Io(#[from] std::io::Error),

    #[error("Hashing has been cancelled")]
    Cancelled,

    #[error("File hashing task failed: {0}")]
    Task(#[from] tokio::task::JoinError),
}

pub fn sha256(data: &[u8]) -> Vec<u8> {
    let mut hasher = Sha256::new();
    hasher.update(data);
    hasher.finalize().to_vec()
}

/// Computes the SHA-256 checksum of `data`, encoded as lowercase hex.
pub fn sha256_hex(data: &[u8]) -> String {
    to_hex(&sha256(data))
}

/// Computes the SHA-256 checksum of a file's content, encoded as lowercase hex.
///
/// `progress` is invoked with the cumulative number of bytes hashed as each
/// chunk is consumed, mirroring the upload progress callback.
/// For files it runs on a blocking worker, along with the reads and hashing,
/// so neither CPU work nor a thread-pool round trip per chunk occupies the
/// async runtime. The file is never fully loaded into memory.
pub async fn sha256_file_content(
    content: FileContent,
    cancel_token: &CancellationToken,
    progress: impl Fn(u64) + Send + 'static,
) -> Result<String, HashError> {
    let mut hasher = Sha256::new();
    match content {
        FileContent::Stream(mut receiver) => {
            let mut hashed = 0_u64;
            loop {
                let chunk = tokio::select! {
                    biased;
                    _ = cancel_token.cancelled() => return Err(HashError::Cancelled),
                    chunk = receiver.recv() => chunk,
                };
                match chunk {
                    Some(chunk) => {
                        hasher.update(&chunk);
                        hashed += chunk.len() as u64;
                        progress(hashed);
                    }
                    None => break,
                }
            }
        }
        FileContent::Path(path) => {
            tracing::info!("Hashing file content from path: {}", path.display());
            return read_and_hash_from_file(
                move || std::fs::File::open(path),
                cancel_token,
                progress,
            )
            .await;
        }
        #[cfg(target_os = "android")]
        FileContent::Fd(fd) => {
            use std::os::fd::FromRawFd;

            tracing::info!("Hashing file content from file descriptor: {fd}");
            // SAFETY: the descriptor is owned by this call; wrapping it in a File
            // transfers that ownership so it is closed once hashing finishes.
            let std_file = unsafe { std::fs::File::from_raw_fd(fd) };
            return read_and_hash_from_file(move || Ok(std_file), cancel_token, progress).await;
        }
    }

    Ok(to_hex(&hasher.finalize()))
}

/// Opens, reads and hashes a file in one blocking task. Tokio's file API would
/// otherwise dispatch a blocking read and copy its buffer for every chunk.
async fn read_and_hash_from_file(
    open: impl FnOnce() -> std::io::Result<std::fs::File> + Send + 'static,
    cancel_token: &CancellationToken,
    progress: impl Fn(u64) + Send + 'static,
) -> Result<String, HashError> {
    use std::io::Read;

    // A blocking task cannot be aborted. Stop it between reads when the caller
    // cancels or drops this future, without cancelling the caller's own token.
    let token = cancel_token.child_token();
    let _cancel_on_drop = token.clone().drop_guard();
    let task = tokio::task::spawn_blocking(move || {
        if token.is_cancelled() {
            return Err(HashError::Cancelled);
        }
        let mut file = open()?;
        let mut hasher = Sha256::new();
        let mut buffer = vec![0u8; HASH_BUFFER_SIZE];
        let mut hashed = 0_u64;
        loop {
            if token.is_cancelled() {
                return Err(HashError::Cancelled);
            }
            let read = file.read(&mut buffer)?;
            if token.is_cancelled() {
                return Err(HashError::Cancelled);
            }
            if read == 0 {
                break;
            }
            hasher.update(&buffer[..read]);
            hashed += read as u64;
            progress(hashed);
        }
        Ok(to_hex(&hasher.finalize()))
    });

    tokio::select! {
        biased;
        _ = cancel_token.cancelled() => Err(HashError::Cancelled),
        result = task => result?,
    }
}

pub(crate) fn to_hex(bytes: &[u8]) -> String {
    bytes.iter().map(|byte| format!("{byte:02x}")).collect()
}
