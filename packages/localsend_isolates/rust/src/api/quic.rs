pub use localsend::quic::{ControlMessage, FileAck, FileHeader, OutgoingTransfer};

use bytes::Bytes;
use localsend::quic::{IncomingTransfer, QuicClient, QuicServer, memmap2};
use std::collections::HashMap;
use std::io::Write;
use std::net::SocketAddr;
use std::path::Path;
use std::sync::Arc;
use std::sync::atomic::{AtomicU64, Ordering};
#[allow(unused_imports)] // used by read_exact in quic_receive_files_parallel
use tokio::io::AsyncReadExt;
use tokio::sync::Semaphore;
use tokio::task::JoinSet;

// ─── Zero-copy mmap chunk ───────────────────────────────────────────

/// A slice of an mmap'd file.  Holds an `Arc<Mmap>` so the underlying
/// pages stay alive until Quinn finishes transmitting.  Implements
/// `AsRef<[u8]>` so `Bytes::from_owner()` can create a zero-copy `Bytes`
/// that Quinn sends directly from the mmap pages — no userspace memcpy.
struct MmapChunk {
    _mmap: Arc<memmap2::Mmap>,
    ptr: *const u8,
    len: usize,
}

// Safety: MmapChunk only reads from mmap pages backed by the Arc<Mmap>,
// which is Send + Sync.  The raw pointer is derived from the mmap slice
// and is valid as long as the Arc is alive.
unsafe impl Send for MmapChunk {}

impl MmapChunk {
    fn new(mmap: Arc<memmap2::Mmap>, offset: usize, len: usize) -> Self {
        assert!(offset + len <= mmap.len());
        let ptr = unsafe { mmap.as_ptr().add(offset) };
        Self {
            _mmap: mmap,
            ptr,
            len,
        }
    }
}

impl AsRef<[u8]> for MmapChunk {
    fn as_ref(&self) -> &[u8] {
        unsafe { std::slice::from_raw_parts(self.ptr, self.len) }
    }
}

// ─── Cross-platform file opener ──────────────────────────────────────

/// Open a file from a path or Android `content://` URI.
///
/// - Regular paths: `std::fs::File::open`
/// - `content://` URIs: Android SAF via JNI (only on `target_os = "android"`)
fn open_file_or_uri(path: &str) -> Result<std::fs::File, String> {
    if path.starts_with("content://") {
        #[cfg(target_os = "android")]
        {
            crate::api::saf::open_content_uri(path)
        }
        #[cfg(not(target_os = "android"))]
        {
            Err(format!(
                "content:// URIs are only supported on Android, got: {path}"
            ))
        }
    } else {
        std::fs::File::open(Path::new(path)).map_err(|e| e.to_string())
    }
}

// ─── Server (receiver side) ──────────────────────────────────────────

/// Wrapper around the core QuicServer for FFI.
pub struct RsQuicServer {
    inner: QuicServer,
}

/// Start a QUIC server on the given port with PEM cert/key.
pub async fn quic_server_start(
    port: u16,
    cert_pem: String,
    key_pem: String,
) -> Result<RsQuicServer, String> {
    let server = QuicServer::bind(port, cert_pem, key_pem)
        .await
        .map_err(|e: anyhow::Error| e.to_string())?;
    Ok(RsQuicServer { inner: server })
}

/// Accept an incoming connection and perform the Hello handshake.
/// Returns an RsQuicReceiveTransfer handle and the sender's info as JSON:
/// `{ "version": "3.0", "alias": "...", "fingerprint": "..." }`
pub async fn quic_server_accept(
    server: &RsQuicServer,
    server_alias: String,
    server_fingerprint: String,
) -> Result<(RsQuicReceiveTransfer, String), String> {
    let (conn, _remote) = server
        .inner
        .accept()
        .await
        .map_err(|e: anyhow::Error| e.to_string())?;
    let (transfer, sender_info) =
        IncomingTransfer::accept(conn, &server_alias, &server_fingerprint)
            .await
            .map_err(|e: anyhow::Error| e.to_string())?;

    let info_json = localsend::serde_json::json!({
        "version": sender_info.version,
        "alias": sender_info.alias,
        "fingerprint": sender_info.fingerprint,
    });

    let (cancel_tx, cancel_rx) = tokio::sync::watch::channel(false);
    Ok((
        RsQuicReceiveTransfer {
            inner: tokio::sync::Mutex::new(Some(transfer)),
            bytes_progress: Arc::new(AtomicU64::new(0)),
            per_file_progress: std::sync::Mutex::new(HashMap::new()),
            cancel_tx,
            cancel_rx,
        },
        localsend::serde_json::to_string(&info_json).map_err(|e| e.to_string())?,
    ))
}

/// Get the local address the QUIC server is bound to.
pub async fn quic_server_local_addr(server: &RsQuicServer) -> Result<String, String> {
    server
        .inner
        .local_addr()
        .map(|a| a.to_string())
        .map_err(|e: anyhow::Error| e.to_string())
}

// ─── Receiver transfer state ─────────────────────────────────────────

/// Thread-safe wrapper for the incoming transfer state machine.
/// `bytes_progress` tracks total bytes received (readable from Dart
/// without locking the mutex).  `per_file_progress` tracks per-file
/// progress for parallel receives.
pub struct RsQuicReceiveTransfer {
    inner: tokio::sync::Mutex<Option<IncomingTransfer>>,
    bytes_progress: Arc<AtomicU64>,
    /// Per-file progress counters for parallel receives.
    ///
    /// SAFETY: Uses `std::sync::Mutex` (not tokio) because every lock
    /// site performs only trivial operations — HashMap reads, Arc clones,
    /// AtomicU64 loads — **never** `.await`.  This avoids the overhead of
    /// an async mutex for what is always a <1µs critical section.
    /// Do NOT add `.await` inside a lock guard.
    per_file_progress: std::sync::Mutex<HashMap<String, Arc<AtomicU64>>>,
    /// Cancel channel.  When Dart calls `quic_receive_cancel`, this is
    /// set to `true`.  In-flight receive tasks check this via
    /// `tokio::select!` and abort immediately.
    cancel_tx: tokio::sync::watch::Sender<bool>,
    /// Cloneable receiver for cancel-aware tasks.
    cancel_rx: tokio::sync::watch::Receiver<bool>,
}

/// Receive the file list from the sender.
/// Returns a JSON-encoded map of file_id -> FileDto.
pub async fn quic_receive_file_list(transfer: &RsQuicReceiveTransfer) -> Result<String, String> {
    let mut guard = transfer.inner.lock().await;
    let t = guard.as_mut().ok_or("transfer already consumed")?;
    let files = t
        .receive_file_list()
        .await
        .map_err(|e: anyhow::Error| e.to_string())?;
    localsend::serde_json::to_string(&files).map_err(|e| e.to_string())
}

/// Accept the proposed file list and send tokens back.
pub async fn quic_accept_files(
    transfer: &RsQuicReceiveTransfer,
    session_id: String,
    file_tokens_json: String,
) -> Result<(), String> {
    let mut guard = transfer.inner.lock().await;
    let t = guard.as_mut().ok_or("transfer already consumed")?;
    let file_tokens: HashMap<String, String> =
        localsend::serde_json::from_str(&file_tokens_json).map_err(|e| e.to_string())?;
    t.accept_files(session_id, file_tokens)
        .await
        .map_err(|e: anyhow::Error| e.to_string())
}

/// Decline the transfer.
pub async fn quic_decline(transfer: &RsQuicReceiveTransfer) -> Result<(), String> {
    let mut guard = transfer.inner.lock().await;
    let t = guard.as_mut().ok_or("transfer already consumed")?;
    t.decline().await.map_err(|e: anyhow::Error| e.to_string())
}

/// Acknowledge a received file on the control stream.
/// If `error` is `None`, success is reported. Otherwise, the error message is sent.
pub async fn quic_ack_file(
    transfer: &RsQuicReceiveTransfer,
    file_id: String,
    error: Option<String>,
) -> Result<(), String> {
    let mut guard = transfer.inner.lock().await;
    let t = guard.as_mut().ok_or("transfer already consumed")?;
    let ack = FileAck {
        file_id,
        success: error.is_none(),
        error,
    };
    t.ack_file(ack)
        .await
        .map_err(|e: anyhow::Error| e.to_string())
}

/// Cancel an in-progress receive.
///
/// Sends a `Cancel` control frame to the sender AND signals all
/// in-flight receive tasks to abort via the cancel channel.
/// The Quinn connection is then closed to reset any remaining streams.
pub async fn quic_receive_cancel(
    transfer: &RsQuicReceiveTransfer,
    session_id: &str,
) -> Result<(), String> {
    // Signal in-flight tasks to stop.
    let _ = transfer.cancel_tx.send(true);

    // Send the cancel control frame (best-effort).
    let cancel_result = {
        let mut guard = transfer.inner.lock().await;
        if let Some(t) = guard.as_mut() {
            t.cancel(session_id).await
        } else {
            Ok(())
        }
    };

    // Close the connection — resets all in-flight streams.
    {
        let mut guard = transfer.inner.lock().await;
        if let Some(mut t) = guard.take() {
            t.close_connection();
        }
    }

    cancel_result.map_err(|e: anyhow::Error| e.to_string())
}

/// Receive a single file entirely in Rust using zero-copy I/O.
///
/// Accepts the next uni stream, reads the file header, then drains all data
/// to disk using Quinn's `read_chunk` (zero-copy from Quinn's recv buffer).
/// Progress is tracked via the atomic counter, polled from Dart via timer.
///
/// Returns JSON: `{ "fileId": "...", "token": "...", "bytesWritten": 1234, "ackSent": true }`.
pub async fn quic_receive_single_file(
    transfer: &RsQuicReceiveTransfer,
    output_path: String,
) -> Result<String, String> {
    // Reset progress counter for this file.
    transfer.bytes_progress.store(0, Ordering::Relaxed);

    // Accept the uni stream and read the header (needs transfer mutex).
    let (header, mut stream) = {
        let mut guard = transfer.inner.lock().await;
        let t = guard.as_mut().ok_or("transfer already consumed")?;
        let (header, stream) = t
            .receive_file()
            .await
            .map_err(|e: anyhow::Error| e.to_string())?;
        (header, stream)
    };
    // Transfer mutex released here.

    tracing::info!("Receiving file {} -> {}", header.file_id, output_path);

    // Create parent directories if needed.
    if let Some(parent) = Path::new(&output_path).parent() {
        std::fs::create_dir_all(parent).map_err(|e| e.to_string())?;
    }

    let file = std::fs::File::create(&output_path).map_err(|e| e.to_string())?;
    let mut writer = std::io::BufWriter::with_capacity(1024 * 1024, file);

    // Cancel-aware zero-copy receive loop.  Uses `tokio::select!` to
    // abort when the cancel channel is signaled (Dart called cancel).
    let mut cancel_rx = transfer.cancel_rx.clone();
    let mut cancelled = false;
    loop {
        tokio::select! {
            chunk_result = stream.read_chunk(usize::MAX, true) => {
                match chunk_result.map_err(|e| e.to_string())? {
                    Some(chunk) => {
                        let n = chunk.bytes.len() as u64;
                        writer
                            .write_all(&chunk.bytes)
                            .map_err(|e| e.to_string())?;
                        transfer
                            .bytes_progress
                            .fetch_add(n, Ordering::Relaxed);
                    }
                    None => break, // stream FIN
                }
            }
            _ = cancel_rx.changed() => {
                if *cancel_rx.borrow() {
                    tracing::info!("Receive cancelled for file {}", header.file_id);
                    cancelled = true;
                    break;
                }
            }
        }
    }

    writer.flush().map_err(|e| e.to_string())?;
    drop(writer);

    if cancelled {
        return Err("transfer cancelled".to_string());
    }

    let bytes_written = transfer.bytes_progress.load(Ordering::Relaxed);
    let FileHeader { file_id, token } = header;

    tracing::info!("Received {} bytes for file {}", bytes_written, file_id);

    // Send ACK on the control stream.
    let ack_result = {
        let mut guard = transfer.inner.lock().await;
        let t = guard.as_mut().ok_or("transfer already consumed")?;
        let ack = localsend::quic::FileAck {
            file_id: file_id.clone(),
            success: true,
            error: None,
        };
        t.ack_file(ack).await
    };

    match ack_result {
        Ok(()) => tracing::debug!("ACK sent for file {}", file_id),
        Err(e) => tracing::warn!("Failed to send ACK for file {}: {}", file_id, e),
    }

    let result = localsend::serde_json::json!({
        "fileId": file_id,
        "token": token,
        "bytesWritten": bytes_written,
        "ackSent": true,
    });
    Ok(result.to_string())
}

// ─── Client (sender side) ────────────────────────────────────────────

/// Wrapper around the core QuicClient for FFI.
pub struct RsQuicClient {
    inner: QuicClient,
}

/// Create a new QUIC client.
/// If `server_cert_pem` is provided, only that cert will be trusted.
/// Must be async because Quinn's Endpoint::client requires a Tokio runtime.
pub async fn quic_client_new(server_cert_pem: Option<String>) -> Result<RsQuicClient, String> {
    let client = QuicClient::new(server_cert_pem).map_err(|e: anyhow::Error| e.to_string())?;
    Ok(RsQuicClient { inner: client })
}

/// Wrapper for the outgoing transfer state machine.
/// `bytes_progress` tracks total bytes sent (readable from Dart
/// without locking the mutex).  `per_file_progress` tracks per-file
/// progress for parallel sends.
pub struct RsQuicSendTransfer {
    inner: tokio::sync::Mutex<Option<OutgoingTransfer>>,
    bytes_progress: Arc<AtomicU64>,
    /// Per-file progress counters for parallel sends.
    ///
    /// SAFETY: Uses `std::sync::Mutex` (not tokio) because every lock
    /// site performs only trivial operations — HashMap reads, Arc clones,
    /// AtomicU64 loads — **never** `.await` inside a lock guard.
    per_file_progress: std::sync::Mutex<HashMap<String, Arc<AtomicU64>>>,
    /// Cancel channel.  When Dart calls `quic_cancel`, this is set to
    /// `true`.  In-flight send tasks check via `tokio::select!` and abort.
    cancel_tx: tokio::sync::watch::Sender<bool>,
    cancel_rx: tokio::sync::watch::Receiver<bool>,
}

/// Connect to a QUIC receiver and perform the Hello handshake.
pub async fn quic_client_connect(
    client: &RsQuicClient,
    addr: String,
    alias: &str,
    fingerprint: &str,
) -> Result<RsQuicSendTransfer, String> {
    let socket_addr: SocketAddr = addr
        .parse()
        .map_err(|e: std::net::AddrParseError| e.to_string())?;
    let transfer = client
        .inner
        .connect(socket_addr, alias, fingerprint)
        .await
        .map_err(|e: anyhow::Error| e.to_string())?;
    let (cancel_tx, cancel_rx) = tokio::sync::watch::channel(false);
    Ok(RsQuicSendTransfer {
        inner: tokio::sync::Mutex::new(Some(transfer)),
        bytes_progress: Arc::new(AtomicU64::new(0)),
        per_file_progress: std::sync::Mutex::new(HashMap::new()),
        cancel_tx,
        cancel_rx,
    })
}

/// Send a file list to the receiver.
/// Returns JSON with { sessionId, files } on accept, or null on decline.
pub async fn quic_prepare_upload(
    transfer: &RsQuicSendTransfer,
    files_json: String,
) -> Result<Option<String>, String> {
    let mut guard = transfer.inner.lock().await;
    let t = guard.as_mut().ok_or("transfer already consumed")?;
    let files: HashMap<String, localsend::model::transfer::FileDto> =
        localsend::serde_json::from_str(&files_json).map_err(|e| e.to_string())?;

    match t
        .prepare_upload(files)
        .await
        .map_err(|e: anyhow::Error| e.to_string())?
    {
        Some((session_id, file_tokens)) => {
            let result = localsend::serde_json::json!({
                "sessionId": session_id,
                "files": file_tokens,
            });
            Ok(Some(result.to_string()))
        }
        None => Ok(None),
    }
}

/// Send a file using memory-mapped I/O in a **single** FFI call.
///
/// Handles both regular file paths and Android `content://` URIs.
/// On Android, SAF content URIs are resolved via JNI
/// (`ContentResolver.openFileDescriptor`) to a raw fd, then mmap'd.
pub async fn quic_send_single_file(
    transfer: &RsQuicSendTransfer,
    file_path: String,
    file_id: &str,
    token: &str,
) -> Result<(), String> {
    transfer.bytes_progress.store(0, Ordering::Relaxed);

    // Open uni stream + send header — short lock on transfer mutex.
    let mut uni = {
        let guard = transfer.inner.lock().await;
        let t = guard.as_ref().ok_or("transfer already consumed")?;
        t.connection().open_uni().await.map_err(|e| e.to_string())?
    };

    let header = FileHeader {
        file_id: file_id.to_string(),
        token: token.to_string(),
    };
    let header_json = localsend::serde_json::to_vec(&header).map_err(|e| e.to_string())?;
    let len_bytes = (header_json.len() as u32).to_be_bytes();
    uni.write_all(&len_bytes).await.map_err(|e| e.to_string())?;
    uni.write_all(&header_json)
        .await
        .map_err(|e| e.to_string())?;

    // Open the file — content:// URIs on Android go through JNI SAF.
    let file = open_file_or_uri(&file_path)?;
    let mmap = Arc::new(unsafe { memmap2::Mmap::map(&file).map_err(|e| e.to_string())? });

    // Cancel-aware zero-copy send: each chunk creates a Bytes that
    // references the mmap pages directly via Bytes::from_owner(MmapChunk).
    // Quinn's write_chunk sends from those pages — no userspace memcpy.
    let chunk_size = localsend::quic::SEND_CHUNK_SIZE;
    let mut offset = 0;
    let mut cancel_rx = transfer.cancel_rx.clone();
    while offset < mmap.len() {
        // Check cancel flag before each chunk.
        if *cancel_rx.borrow() {
            tracing::info!("Single-file send cancelled at offset {offset}");
            return Err("transfer cancelled".to_string());
        }

        let end = (offset + chunk_size).min(mmap.len());
        let len = end - offset;
        let chunk = MmapChunk::new(mmap.clone(), offset, len);
        let bytes = Bytes::from_owner(chunk);

        tokio::select! {
            result = uni.write_chunk(bytes) => {
                result.map_err(|e| e.to_string())?;
            }
            _ = cancel_rx.changed() => {
                if *cancel_rx.borrow() {
                    tracing::info!("Single-file send cancelled during write at offset {offset}");
                    return Err("transfer cancelled".to_string());
                }
            }
        }

        offset = end;
        transfer
            .bytes_progress
            .store(offset as u64, Ordering::Relaxed);
    }

    uni.finish().map_err(|e| e.to_string())?;
    Ok(())
}

/// Send in-memory bytes as a file.  Opens a dedicated uni stream,
/// sends the file header, writes all data, and sends FIN — single call.
pub async fn quic_send_bytes(
    transfer: &RsQuicSendTransfer,
    data: Vec<u8>,
    file_id: &str,
    token: &str,
) -> Result<(), String> {
    transfer.bytes_progress.store(0, Ordering::Relaxed);

    let mut uni = {
        let guard = transfer.inner.lock().await;
        let t = guard.as_ref().ok_or("transfer already consumed")?;
        t.connection().open_uni().await.map_err(|e| e.to_string())?
    };

    let header = FileHeader {
        file_id: file_id.to_string(),
        token: token.to_string(),
    };
    let header_json = localsend::serde_json::to_vec(&header).map_err(|e| e.to_string())?;
    let len_bytes = (header_json.len() as u32).to_be_bytes();
    uni.write_all(&len_bytes).await.map_err(|e| e.to_string())?;
    uni.write_all(&header_json)
        .await
        .map_err(|e| e.to_string())?;

    let total = data.len() as u64;
    let mut cancel_rx = transfer.cancel_rx.clone();

    tokio::select! {
        result = uni.write_all(&data) => {
            result.map_err(|e| e.to_string())?;
        }
        _ = cancel_rx.changed() => {
            if *cancel_rx.borrow() {
                tracing::info!("Bytes send cancelled for file {file_id}");
                return Err("transfer cancelled".to_string());
            }
        }
    }

    transfer.bytes_progress.store(total, Ordering::Relaxed);
    uni.finish().map_err(|e| e.to_string())?;
    Ok(())
}

/// Cancel the transfer.
///
/// Sends a `Cancel` control frame to the receiver AND signals all
/// in-flight send tasks to abort via the cancel channel.  The Quinn
/// connection is then closed, which resets any remaining streams.
pub async fn quic_cancel(transfer: &RsQuicSendTransfer, session_id: &str) -> Result<(), String> {
    // Signal in-flight tasks to stop.
    let _ = transfer.cancel_tx.send(true);

    // Send the cancel control frame (best-effort — connection may
    // already be closing).
    let cancel_result = {
        let mut guard = transfer.inner.lock().await;
        if let Some(t) = guard.as_mut() {
            t.cancel(session_id).await
        } else {
            Ok(())
        }
    };

    // Close the connection — this resets all in-flight streams,
    // causing any remaining reads/writes to fail immediately.
    {
        let mut guard = transfer.inner.lock().await;
        if let Some(mut t) = guard.take() {
            t.close_connection();
        }
    }

    cancel_result.map_err(|e: anyhow::Error| e.to_string())
}

/// Signal graceful completion.
pub async fn quic_done(transfer: &RsQuicSendTransfer) -> Result<(), String> {
    let mut guard = transfer.inner.lock().await;
    let t = guard.as_mut().ok_or("transfer already consumed")?;
    t.done().await.map_err(|e: anyhow::Error| e.to_string())
}

// ─── Progress tracking ─────────────────────────────────────────────

/// Get the total number of bytes sent so far across all files.
/// This reads an atomic counter — no mutex lock needed.
pub fn quic_get_send_progress(transfer: &RsQuicSendTransfer) -> u64 {
    transfer.bytes_progress.load(Ordering::Relaxed)
}

/// Get the total number of bytes received so far across all files.
/// This reads an atomic counter — no mutex lock needed.
pub fn quic_get_receive_progress(transfer: &RsQuicReceiveTransfer) -> u64 {
    transfer.bytes_progress.load(Ordering::Relaxed)
}

/// Get per-file send progress for a parallel transfer.
/// Returns JSON: `{ "fileId1": 1234, "fileId2": 5678 }`
pub fn quic_get_parallel_send_progress(transfer: &RsQuicSendTransfer) -> String {
    let map = transfer.per_file_progress.lock().unwrap();
    let progress: HashMap<&str, u64> = map
        .iter()
        .map(|(k, v)| (k.as_str(), v.load(Ordering::Relaxed)))
        .collect();
    localsend::serde_json::to_string(&progress).unwrap_or_else(|_| "{}".to_string())
}

/// Get per-file receive progress for a parallel transfer.
/// Returns JSON: `{ "fileId1": 1234, "fileId2": 5678 }`
pub fn quic_get_parallel_receive_progress(transfer: &RsQuicReceiveTransfer) -> String {
    let map = transfer.per_file_progress.lock().unwrap();
    let progress: HashMap<&str, u64> = map
        .iter()
        .map(|(k, v)| (k.as_str(), v.load(Ordering::Relaxed)))
        .collect();
    localsend::serde_json::to_string(&progress).unwrap_or_else(|_| "{}".to_string())
}

// ─── Parallel file transfer ──────────────────────────────────────────

/// Send multiple files in parallel over independent QUIC uni streams.
///
/// Each file gets its own uni stream; Quinn multiplexes them at the
/// transport level (no head-of-line blocking between files).
///
/// `files_json`: `[{"filePath":"…","fileId":"…","token":"…"}, …]`
///
/// For single files, prefer `quic_send_single_file` — no task overhead.
pub async fn quic_send_files_parallel(
    transfer: &RsQuicSendTransfer,
    files_json: String,
) -> Result<(), String> {
    let files: Vec<localsend::serde_json::Value> = localsend::serde_json::from_str(&files_json)
        .map_err(|e| format!("Invalid files_json: {e}"))?;

    if files.is_empty() {
        return Ok(());
    }

    // Reset progress
    transfer.bytes_progress.store(0, Ordering::Relaxed);

    // Initialize per-file progress
    {
        let mut map = transfer.per_file_progress.lock().unwrap();
        map.clear();
        for f in &files {
            let id = f["fileId"].as_str().ok_or("missing fileId")?;
            map.insert(id.to_string(), Arc::new(AtomicU64::new(0)));
        }
    }

    // Get connection (short lock)
    let conn = {
        let guard = transfer.inner.lock().await;
        let t = guard.as_ref().ok_or("transfer already consumed")?;
        t.connection().clone()
    };

    // Clone progress arcs out of the mutex (cheap — just ref count)
    let progress_arcs: HashMap<String, Arc<AtomicU64>> = {
        let map = transfer.per_file_progress.lock().unwrap();
        map.iter().map(|(k, v)| (k.clone(), v.clone())).collect()
    };

    let total_progress = transfer.bytes_progress.clone();
    let mut cancel_rx = transfer.cancel_rx.clone();

    // Limit concurrent file I/O to avoid overwhelming the OS with
    // many simultaneous file opens + mmaps when transferring large
    // file sets (each mmap reserves virtual address space).
    let file_io_semaphore = Arc::new(Semaphore::new(16));

    // Spawn one task per file
    let mut set = JoinSet::new();
    for f in files {
        let file_path = f["filePath"]
            .as_str()
            .ok_or("missing filePath")?
            .to_string();
        let file_id = f["fileId"].as_str().ok_or("missing fileId")?.to_string();
        let token = f["token"].as_str().ok_or("missing token")?.to_string();

        let conn = conn.clone();
        let file_progress = progress_arcs
            .get(&file_id)
            .ok_or("fileId not in progress map")?
            .clone();
        let total_progress = total_progress.clone();
        let mut task_cancel_rx = cancel_rx.clone();
        let file_io = file_io_semaphore.clone();

        set.spawn(async move {
            // Open dedicated uni stream
            let mut uni = conn.open_uni().await.map_err(|e| e.to_string())?;

            // Send FileHeader frame
            let header = FileHeader {
                file_id: file_id.clone(),
                token,
            };
            let header_json = localsend::serde_json::to_vec(&header).map_err(|e| e.to_string())?;
            let len_bytes = (header_json.len() as u32).to_be_bytes();
            uni.write_all(&len_bytes).await.map_err(|e| e.to_string())?;
            uni.write_all(&header_json)
                .await
                .map_err(|e| e.to_string())?;

            // Limit concurrent file I/O — acquire permit before opening
            // the file + mmap to avoid overwhelming the OS with hundreds
            // of simultaneous opens and virtual-memory reservations.
            let _permit = file_io.acquire().await.map_err(|e| e.to_string())?;

            // Open and mmap file (handles content:// on Android)
            let raw_file = open_file_or_uri(&file_path)?;
            let mmap =
                Arc::new(unsafe { memmap2::Mmap::map(&raw_file).map_err(|e| e.to_string())? });
            drop(raw_file); // mmap holds a kernel reference, not the userspace File
            drop(_permit); // release — data transfer below is async

            // Cancel-aware zero-copy send loop.
            let chunk_size = localsend::quic::SEND_CHUNK_SIZE;
            let mut offset = 0;
            while offset < mmap.len() {
                let end = (offset + chunk_size).min(mmap.len());
                let len = end - offset;

                // Check cancel before sending each chunk.
                if *task_cancel_rx.borrow() {
                    tracing::info!("Parallel send cancelled for file {file_id}");
                    return Err("transfer cancelled".to_string());
                }

                let chunk = MmapChunk::new(mmap.clone(), offset, len);
                let bytes = Bytes::from_owner(chunk);
                uni.write_chunk(bytes).await.map_err(|e| e.to_string())?;
                offset = end;
                file_progress.fetch_add(len as u64, Ordering::Relaxed);
                total_progress.fetch_add(len as u64, Ordering::Relaxed);
            }

            uni.finish().map_err(|e| e.to_string())?;
            Ok::<(), String>(())
        });
    }

    // Collect results
    let mut errors = Vec::new();
    while let Some(result) = set.join_next().await {
        match result {
            Ok(Ok(())) => {}
            Ok(Err(e)) => errors.push(e),
            Err(e) => errors.push(e.to_string()),
        }
    }

    if errors.is_empty() {
        Ok(())
    } else {
        Err(format!(
            "{} file(s) failed: {}",
            errors.len(),
            errors.join("; ")
        ))
    }
}

/// Receive multiple files in parallel from independent QUIC uni streams.
///
/// Spawns one Tokio task per expected file. Each task accepts the next
/// available uni stream, reads the `FileHeader`, and writes data to the
/// corresponding output path. ACKs are sent after all tasks complete.
///
/// `files_json`: `[{"fileId":"…","outputPath":"…"}, …]`
///
/// Returns JSON: `{ "succeeded": ["id1", "id2"], "failed": ["id3"] }`
///
/// For single files, prefer `quic_receive_file_start/read_chunk/finish`.
pub async fn quic_receive_files_parallel(
    transfer: &RsQuicReceiveTransfer,
    files_json: String,
) -> Result<String, String> {
    let files: Vec<localsend::serde_json::Value> = localsend::serde_json::from_str(&files_json)
        .map_err(|e| format!("Invalid files_json: {e}"))?;

    if files.is_empty() {
        return Ok(r#"{"succeeded":[],"failed":[]}"#.to_string());
    }

    // Build file_id -> output_path map
    let files_map: HashMap<String, String> = files
        .iter()
        .map(|f| {
            let id = f["fileId"].as_str().ok_or("missing fileId")?;
            let path = f["outputPath"].as_str().ok_or("missing outputPath")?;
            Ok((id.to_string(), path.to_string()))
        })
        .collect::<Result<_, String>>()?;

    let n = files_map.len();

    // Reset progress
    transfer.bytes_progress.store(0, Ordering::Relaxed);
    {
        let mut map = transfer.per_file_progress.lock().unwrap();
        map.clear();
        for id in files_map.keys() {
            map.insert(id.clone(), Arc::new(AtomicU64::new(0)));
        }
    }

    // Get connection (short lock)
    let conn = {
        let guard = transfer.inner.lock().await;
        let t = guard.as_ref().ok_or("transfer already consumed")?;
        t.connection().clone()
    };

    // Clone progress arcs
    let progress_arcs: HashMap<String, Arc<AtomicU64>> = {
        let map = transfer.per_file_progress.lock().unwrap();
        map.iter().map(|(k, v)| (k.clone(), v.clone())).collect()
    };

    let total_progress = transfer.bytes_progress.clone();
    let mut cancel_rx = transfer.cancel_rx.clone();

    // Spawn one task per expected file
    let mut set = JoinSet::new();
    for _ in 0..n {
        let conn = conn.clone();
        let files_map = files_map.clone();
        let progress_arcs = progress_arcs.clone();
        let total_progress = total_progress.clone();
        let mut task_cancel_rx = cancel_rx.clone();

        set.spawn(async move {
            // Accept next available uni stream
            let mut stream = conn
                .accept_uni()
                .await
                .map_err(|e| format!("accept_uni: {e}"))?;

            // Read FileHeader frame: 4-byte BE length + JSON
            let mut len_buf = [0u8; 4];
            stream
                .read_exact(&mut len_buf)
                .await
                .map_err(|e| format!("read header length: {e}"))?;
            let header_len = u32::from_be_bytes(len_buf) as usize;
            let mut header_buf = vec![0u8; header_len];
            stream
                .read_exact(&mut header_buf)
                .await
                .map_err(|e| format!("read header body: {e}"))?;
            let header: FileHeader = localsend::serde_json::from_slice(&header_buf)
                .map_err(|e| format!("parse FileHeader: {e}"))?;

            let file_id = header.file_id;

            // Look up output path
            let output_path = files_map
                .get(&file_id)
                .ok_or_else(|| format!("unknown fileId: {file_id}"))?
                .clone();

            let file_progress = progress_arcs
                .get(&file_id)
                .ok_or_else(|| format!("no progress for fileId: {file_id}"))?
                .clone();

            // Create parent directories
            if let Some(parent) = Path::new(&output_path).parent() {
                std::fs::create_dir_all(parent).map_err(|e| e.to_string())?;
            }

            let file = std::fs::File::create(&output_path).map_err(|e| e.to_string())?;
            let mut writer = std::io::BufWriter::with_capacity(1024 * 1024, file);

            // Cancel-aware zero-copy receive loop.
            let mut cancelled = false;
            loop {
                tokio::select! {
                    chunk_result = stream.read_chunk(usize::MAX, true) => {
                        match chunk_result.map_err(|e| e.to_string())? {
                            Some(chunk) => {
                                let n = chunk.bytes.len() as u64;
                                writer.write_all(&chunk.bytes).map_err(|e| e.to_string())?;
                                file_progress.fetch_add(n, Ordering::Relaxed);
                                total_progress.fetch_add(n, Ordering::Relaxed);
                            }
                            None => break, // stream FIN
                        }
                    }
                    _ = task_cancel_rx.changed() => {
                        if *task_cancel_rx.borrow() {
                            tracing::info!("Parallel receive cancelled for file {file_id}");
                            cancelled = true;
                            break;
                        }
                    }
                }
            }

            writer.flush().map_err(|e| e.to_string())?;

            if cancelled {
                return Err("transfer cancelled".to_string());
            }

            Ok::<String, String>(file_id)
        });
    }

    // Collect results
    let mut succeeded = Vec::new();
    let mut failed = Vec::new();
    while let Some(result) = set.join_next().await {
        match result {
            Ok(Ok(file_id)) => succeeded.push(file_id),
            Ok(Err(e)) => failed.push(e),
            Err(e) => failed.push(e.to_string()),
        }
    }

    // Send ACKs for successful files
    {
        let mut guard = transfer.inner.lock().await;
        if let Some(t) = guard.as_mut() {
            for file_id in &succeeded {
                let ack = FileAck {
                    file_id: file_id.clone(),
                    success: true,
                    error: None,
                };
                if let Err(e) = t.ack_file(ack).await {
                    tracing::warn!("Failed to send ACK for {file_id}: {e}");
                }
            }
        }
    }

    // Send error ACKs for failed files (best-effort)
    if !failed.is_empty() {
        let mut guard = transfer.inner.lock().await;
        if let Some(t) = guard.as_mut() {
            for file_id in files_map.keys() {
                if !succeeded.contains(file_id) {
                    let ack = FileAck {
                        file_id: file_id.clone(),
                        success: false,
                        error: Some("receive failed".to_string()),
                    };
                    let _ = t.ack_file(ack).await;
                }
            }
        }
    }

    let result = localsend::serde_json::json!({
        "succeeded": succeeded,
        "failed": failed,
    });
    Ok(result.to_string())
}
