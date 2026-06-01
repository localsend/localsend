use crate::api::stream;
pub use localsend::quic::{ControlMessage, FileAck, FileHeader, OutgoingTransfer};

use localsend::quic::{QuicClient, QuicServer, IncomingTransfer};
use std::collections::HashMap;
use std::io::Write;
use std::net::SocketAddr;
use std::path::Path;

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
/// Returns an RsQuicReceiveTransfer handle.
pub async fn quic_server_accept(server: &RsQuicServer) -> Result<RsQuicReceiveTransfer, String> {
    let (conn, _remote) = server.inner.accept().await.map_err(|e: anyhow::Error| e.to_string())?;
    let transfer = IncomingTransfer::accept(conn)
        .await
        .map_err(|e: anyhow::Error| e.to_string())?;
    Ok(RsQuicReceiveTransfer {
        inner: tokio::sync::Mutex::new(Some(transfer)),
    })
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
pub struct RsQuicReceiveTransfer {
    inner: tokio::sync::Mutex<Option<IncomingTransfer>>,
}

/// Receive the file list from the sender.
/// Returns a JSON-encoded map of file_id -> FileDto.
pub async fn quic_receive_file_list(transfer: &RsQuicReceiveTransfer) -> Result<String, String> {
    let mut guard = transfer.inner.lock().await;
    let t = guard.as_mut().ok_or("transfer already consumed")?;
    let files = t.receive_file_list().await.map_err(|e: anyhow::Error| e.to_string())?;
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

/// Receive the next file and write it to `output_path`.
///
/// Blocks until the sender opens a new unidirectional stream for the next
/// file. Reads the `FileHeader` (file_id, token), then drains all
/// bytes into the file at `output_path`.
///
/// Returns a JSON object: `{ "fileId": "...", "token": "...", "bytesWritten": 1234 }`.
pub async fn quic_receive_file_to_path(
    transfer: &RsQuicReceiveTransfer,
    output_path: String,
) -> Result<String, String> {
    let mut guard = transfer.inner.lock().await;
    let t = guard.as_mut().ok_or("transfer already consumed")?;

    // Wait for the sender to open a uni stream for the next file.
    let (header, mut stream) = t.receive_file().await.map_err(|e: anyhow::Error| e.to_string())?;

    tracing::info!(
        "Receiving file {} -> {}",
        header.file_id,
        output_path,
    );

    // Create parent directories if needed.
    if let Some(parent) = Path::new(&output_path).parent() {
        std::fs::create_dir_all(parent).map_err(|e| e.to_string())?;
    }

    // Drain the stream to the file.
    let file = std::fs::File::create(&output_path).map_err(|e| e.to_string())?;
    let mut writer = std::io::BufWriter::new(file);

    let bytes_written = IncomingTransfer::drain_file_stream(&mut stream, |chunk| {
        writer.write_all(&chunk).map_err(|e| anyhow::anyhow!(e.to_string()))?;
        Ok(())
    })
    .await
    .map_err(|e: anyhow::Error| e.to_string())?;

    writer.flush().map_err(|e: std::io::Error| e.to_string())?;

    tracing::info!("Received {} bytes for file {}", bytes_written, header.file_id);

    let result = localsend::serde_json::json!({
        "fileId": header.file_id,
        "token": header.token,
        "bytesWritten": bytes_written,
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
    t.ack_file(ack).await.map_err(|e: anyhow::Error| e.to_string())
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
pub struct RsQuicSendTransfer {
    inner: tokio::sync::Mutex<Option<OutgoingTransfer>>,
}

/// Connect to a QUIC receiver and perform the Hello handshake.
pub async fn quic_client_connect(
    client: &RsQuicClient,
    addr: String,
    alias: &str,
    fingerprint: &str,
) -> Result<RsQuicSendTransfer, String> {
    let socket_addr: SocketAddr = addr.parse().map_err(|e: std::net::AddrParseError| e.to_string())?;
    let transfer = client
        .inner
        .connect(socket_addr, alias, fingerprint)
        .await
        .map_err(|e: anyhow::Error| e.to_string())?;
    Ok(RsQuicSendTransfer {
        inner: tokio::sync::Mutex::new(Some(transfer)),
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

    match t.prepare_upload(files).await.map_err(|e: anyhow::Error| e.to_string())? {
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

/// Send a file using memory-mapped I/O (high-performance path).
pub async fn quic_send_file_mmap(
    transfer: &RsQuicSendTransfer,
    file_path: String,
    file_id: &str,
    token: &str,
) -> Result<(), String> {
    let guard = transfer.inner.lock().await;
    let t = guard.as_ref().ok_or("transfer already consumed")?;
    t.send_file_mmap(Path::new(&file_path), file_id, token)
        .await
        .map_err(|e: anyhow::Error| e.to_string())
}

/// Send a file from a Dart stream (fallback for Android SAF, etc).
pub async fn quic_send_file_stream(
    transfer: &RsQuicSendTransfer,
    file_id: &str,
    token: &str,
    data: stream::Dart2RustStreamReceiver,
) -> Result<(), String> {
    let guard = transfer.inner.lock().await;
    let t = guard.as_ref().ok_or("transfer already consumed")?;
    t.send_file_stream(file_id, token, data.receiver)
        .await
        .map_err(|e: anyhow::Error| e.to_string())
}

/// Wait for the receiver to acknowledge the last file.
pub async fn quic_wait_file_ack(transfer: &RsQuicSendTransfer) -> Result<String, String> {
    let mut guard = transfer.inner.lock().await;
    let t = guard.as_mut().ok_or("transfer already consumed")?;
    let ack = t.wait_file_ack().await.map_err(|e: anyhow::Error| e.to_string())?;
    localsend::serde_json::to_string(&ack).map_err(|e| e.to_string())
}

/// Cancel the transfer.
pub async fn quic_cancel(transfer: &RsQuicSendTransfer, session_id: &str) -> Result<(), String> {
    let mut guard = transfer.inner.lock().await;
    let t = guard.as_mut().ok_or("transfer already consumed")?;
    t.cancel(session_id).await.map_err(|e: anyhow::Error| e.to_string())
}

/// Signal graceful completion.
pub async fn quic_done(transfer: &RsQuicSendTransfer) -> Result<(), String> {
    let mut guard = transfer.inner.lock().await;
    let t = guard.as_mut().ok_or("transfer already consumed")?;
    t.done().await.map_err(|e: anyhow::Error| e.to_string())
}
