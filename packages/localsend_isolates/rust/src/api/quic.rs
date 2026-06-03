pub use localsend::quic::{ControlMessage, FileAck, FileHeader, OutgoingTransfer};

use localsend::quic::{IncomingTransfer, QuicClient, QuicServer, RecvStream, SendStream, memmap2};
use std::collections::HashMap;
use std::io::Write;
use std::net::SocketAddr;
use std::path::Path;
use std::sync::atomic::{AtomicU64, Ordering};

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

    Ok((
        RsQuicReceiveTransfer {
            inner: tokio::sync::Mutex::new(Some(transfer)),
            file_receiver: tokio::sync::Mutex::new(None),
            bytes_progress: AtomicU64::new(0),
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

/// State held open between receive_file_start / read_chunk / finish calls.
struct FileReceiverState {
    stream: RecvStream,
    writer: std::io::BufWriter<std::fs::File>,
    file_id: String,
    token: String,
    output_path: String,
}

/// Thread-safe wrapper for the incoming transfer state machine.
/// `bytes_progress` tracks bytes received for the current file (readable
/// from Dart without locking the mutex).
pub struct RsQuicReceiveTransfer {
    inner: tokio::sync::Mutex<Option<IncomingTransfer>>,
    file_receiver: tokio::sync::Mutex<Option<FileReceiverState>>,
    bytes_progress: AtomicU64,
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

/// Step 1 of chunked receive: accept the next uni stream, read the file
/// header, and open the output file.  Returns JSON:
/// `{ "fileId": "...", "token": "..." }`.
///
/// The stream + writer are stashed inside the transfer struct so that
/// subsequent `quic_receive_file_read_chunk` calls can pull data
/// without re-acquiring the transfer mutex.
pub async fn quic_receive_file_start(
    transfer: &RsQuicReceiveTransfer,
    output_path: String,
) -> Result<String, String> {
    // Reset progress counter for this file.
    transfer.bytes_progress.store(0, Ordering::Relaxed);

    // Accept the uni stream and read the header (needs transfer mutex).
    let (header, stream) = {
        let mut guard = transfer.inner.lock().await;
        let t = guard.as_mut().ok_or("transfer already consumed")?;
        let (header, stream) = t
            .receive_file()
            .await
            .map_err(|e: anyhow::Error| e.to_string())?;
        (header, stream)
    };
    // Transfer mutex released here — sender can keep sending data
    // while we stash the receiver state.

    tracing::info!("Receiving file {} -> {}", header.file_id, output_path);

    // Create parent directories if needed.
    if let Some(parent) = Path::new(&output_path).parent() {
        std::fs::create_dir_all(parent).map_err(|e| e.to_string())?;
    }

    let file = std::fs::File::create(&output_path).map_err(|e| e.to_string())?;
    let writer = std::io::BufWriter::new(file);

    let file_id = header.file_id.clone();
    let token = header.token.clone();

    // Stash the stream + writer for subsequent chunk reads.
    *transfer.file_receiver.lock().await = Some(FileReceiverState {
        stream,
        writer,
        file_id: header.file_id,
        token: header.token,
        output_path,
    });

    let result = localsend::serde_json::json!({
        "fileId": file_id,
        "token": token,
    });
    Ok(result.to_string())
}

/// Step 2 of chunked receive: read up to `max_bytes` from the QUIC stream
/// and write to the output file.  Returns JSON:
/// `{ "bytesRead": 1234, "totalSoFar": 5678, "eof": false }`.
///
/// Each call is short (bounded by `max_bytes`), so FRB never times out.
pub async fn quic_receive_file_read_chunk(
    transfer: &RsQuicReceiveTransfer,
    max_bytes: u64,
) -> Result<String, String> {
    let mut guard = transfer.file_receiver.lock().await;
    let state = guard.as_mut().ok_or("no file receiver active")?;

    let mut buf = vec![0u8; max_bytes as usize];
    let n: usize = match state
        .stream
        .read(&mut buf)
        .await
        .map_err(|e| e.to_string())?
    {
        Some(n) => n,
        None => 0,
    };

    if n > 0 {
        state
            .writer
            .write_all(&buf[..n])
            .map_err(|e| e.to_string())?;
        transfer
            .bytes_progress
            .fetch_add(n as u64, Ordering::Relaxed);
    }

    let total = transfer.bytes_progress.load(Ordering::Relaxed);
    let eof = n == 0; // stream FIN received

    let result = localsend::serde_json::json!({
        "bytesRead": n,
        "totalSoFar": total,
        "eof": eof,
    });
    Ok(result.to_string())
}

/// Step 3 of chunked receive: flush the writer, send ACK, and clean up.
/// Returns JSON: `{ "fileId": "...", "bytesWritten": 1234, "ackSent": true }`.
pub async fn quic_receive_file_finish(transfer: &RsQuicReceiveTransfer) -> Result<String, String> {
    // Take the file receiver state.
    let mut file_guard = transfer.file_receiver.lock().await;
    let mut state = file_guard.take().ok_or("no file receiver active")?;

    // Flush the writer.
    state
        .writer
        .flush()
        .map_err(|e: std::io::Error| e.to_string())?;
    drop(state.writer);

    let bytes_written = transfer.bytes_progress.load(Ordering::Relaxed);
    let file_id = state.file_id.clone();

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
        "bytesWritten": bytes_written,
        "ackSent": true,
    });
    Ok(result.to_string())
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

/// State held open between send_file_start / write_chunk / finish calls.
struct FileSenderState {
    stream: SendStream,
    kind: FileSenderKind,
}

/// What kind of data source the sender is reading from.
enum FileSenderKind {
    /// Dart pushes chunks via FFI (content:// URIs, in-memory bytes).
    Stream,
    /// Rust reads from an mmap'd file.
    Mmap {
        mmap: memmap2::Mmap,
        offset: usize,
        _file: std::fs::File,
    },
}

/// Wrapper for the outgoing transfer state machine.
/// `bytes_progress` tracks bytes sent for the current file (readable
/// from Dart without locking the mutex).
pub struct RsQuicSendTransfer {
    inner: tokio::sync::Mutex<Option<OutgoingTransfer>>,
    file_sender: tokio::sync::Mutex<Option<FileSenderState>>,
    bytes_progress: AtomicU64,
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
    Ok(RsQuicSendTransfer {
        inner: tokio::sync::Mutex::new(Some(transfer)),
        file_sender: tokio::sync::Mutex::new(None),
        bytes_progress: AtomicU64::new(0),
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
pub async fn quic_send_file_mmap(
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
    let mmap = unsafe { memmap2::Mmap::map(&file).map_err(|e| e.to_string())? };

    let chunk_size = localsend::quic::SEND_CHUNK_SIZE;
    let mut offset = 0;
    while offset < mmap.len() {
        let end = (offset + chunk_size).min(mmap.len());
        uni.write_all(&mmap[offset..end])
            .await
            .map_err(|e| e.to_string())?;
        offset = end;
        transfer
            .bytes_progress
            .store(offset as u64, Ordering::Relaxed);
    }

    uni.finish().map_err(|e| e.to_string())?;
    Ok(())
}

/// Step 1 (mmap): Open uni stream, send header, mmap the file.
/// Returns JSON: { "fileSize": 1234 }.
pub async fn quic_send_file_mmap_start(
    transfer: &RsQuicSendTransfer,
    file_path: String,
    file_id: &str,
    token: &str,
) -> Result<String, String> {
    transfer.bytes_progress.store(0, Ordering::Relaxed);

    let mut uni = {
        let guard = transfer.inner.lock().await;
        let t = guard.as_ref().ok_or("transfer already consumed")?;
        let conn = t.connection().clone();
        conn.open_uni().await.map_err(|e| e.to_string())?
    };
    // Transfer mutex released here — short lock.

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

    let file = std::fs::File::open(Path::new(&file_path)).map_err(|e| e.to_string())?;
    let metadata = file.metadata().map_err(|e| e.to_string())?;
    let mmap = unsafe { memmap2::Mmap::map(&file).map_err(|e| e.to_string())? };

    let file_size = metadata.len();
    *transfer.file_sender.lock().await = Some(FileSenderState {
        stream: uni,
        kind: FileSenderKind::Mmap {
            mmap,
            offset: 0,
            _file: file,
        },
    });

    let result = localsend::serde_json::json!({ "fileSize": file_size });
    Ok(result.to_string())
}

/// Step 2 (mmap): Write the next chunk from the mmap to the QUIC stream.
/// Returns JSON: { "bytesSent": 1234, "totalSoFar": 5678, "eof": false }.
pub async fn quic_send_file_mmap_chunk(transfer: &RsQuicSendTransfer) -> Result<String, String> {
    let mut guard = transfer.file_sender.lock().await;
    let state = guard.as_mut().ok_or("no file sender active")?;

    let (_, mmap_len, chunk_size) = match &mut state.kind {
        FileSenderKind::Mmap { mmap, offset, .. } => {
            let cs = localsend::quic::SEND_CHUNK_SIZE.min(mmap.len().saturating_sub(*offset));
            (*offset, mmap.len(), cs)
        }
        _ => return Err("expected mmap sender".to_string()),
    };

    let (start, end) = match &mut state.kind {
        FileSenderKind::Mmap { mmap, offset, .. } => {
            let s = *offset;
            let e = (s + chunk_size).min(mmap.len());
            *offset = e;
            (s, e)
        }
        _ => unreachable!(),
    };

    let data = match &state.kind {
        FileSenderKind::Mmap { mmap, .. } => &mmap[start..end],
        _ => unreachable!(),
    };

    state
        .stream
        .write_all(data)
        .await
        .map_err(|e| e.to_string())?;
    transfer.bytes_progress.store(end as u64, Ordering::Relaxed);

    let eof = end >= mmap_len;
    let result = localsend::serde_json::json!({
        "bytesSent": end - start,
        "totalSoFar": end,
        "eof": eof,
    });
    Ok(result.to_string())
}

/// Step 1 (stream): Open uni stream, send header.
/// Dart will push chunks via `quic_send_file_write_chunk`.
pub async fn quic_send_file_start(
    transfer: &RsQuicSendTransfer,
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

    *transfer.file_sender.lock().await = Some(FileSenderState {
        stream: uni,
        kind: FileSenderKind::Stream,
    });
    Ok(())
}

/// Step 2 (stream): Write a chunk of data from Dart to the QUIC stream.
pub async fn quic_send_file_write_chunk(
    transfer: &RsQuicSendTransfer,
    data: Vec<u8>,
) -> Result<(), String> {
    let mut guard = transfer.file_sender.lock().await;
    let state = guard.as_mut().ok_or("no file sender active")?;
    state
        .stream
        .write_all(&data)
        .await
        .map_err(|e| e.to_string())?;
    transfer
        .bytes_progress
        .fetch_add(data.len() as u64, Ordering::Relaxed);
    Ok(())
}

/// Step 3 (both): Finish the uni stream (send FIN).
pub async fn quic_send_file_finish(transfer: &RsQuicSendTransfer) -> Result<(), String> {
    let mut guard = transfer.file_sender.lock().await;
    let mut state = guard.take().ok_or("no file sender active")?;
    state.stream.finish().map_err(|e| e.to_string())?;
    Ok(())
}

/// Cancel the transfer.
pub async fn quic_cancel(transfer: &RsQuicSendTransfer, session_id: &str) -> Result<(), String> {
    let mut guard = transfer.inner.lock().await;
    let t = guard.as_mut().ok_or("transfer already consumed")?;
    t.cancel(session_id)
        .await
        .map_err(|e: anyhow::Error| e.to_string())
}

/// Signal graceful completion.
pub async fn quic_done(transfer: &RsQuicSendTransfer) -> Result<(), String> {
    let mut guard = transfer.inner.lock().await;
    let t = guard.as_mut().ok_or("transfer already consumed")?;
    t.done().await.map_err(|e: anyhow::Error| e.to_string())
}

// ─── Progress tracking ─────────────────────────────────────────────

/// Get the number of bytes sent so far for the current file.
/// This reads an atomic counter — no mutex lock needed.
pub fn quic_get_send_progress(transfer: &RsQuicSendTransfer) -> u64 {
    transfer.bytes_progress.load(Ordering::Relaxed)
}

/// Get the number of bytes received so far for the current file.
/// This reads an atomic counter — no mutex lock needed.
pub fn quic_get_receive_progress(transfer: &RsQuicReceiveTransfer) -> u64 {
    transfer.bytes_progress.load(Ordering::Relaxed)
}
