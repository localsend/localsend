use crate::frb_generated::StreamSink;
use flutter_rust_bridge::frb;
use localsend::http::server::TlsConfig;
use localsend::http::state::ClientInfo;
use localsend::model::discovery::DeviceType;
use std::collections::HashMap;
use std::sync::Arc;
use tokio::sync::{oneshot, Mutex};

/// Opaque handle to a running Rust HTTP server.
/// Dart holds this and calls `stop()` when done.
pub struct RsHttpServer {
    stop_tx: Mutex<Option<oneshot::Sender<()>>>,
}

impl RsHttpServer {
    /// Gracefully stops the server.
    pub async fn stop(&self) {
        if let Some(tx) = self.stop_tx.lock().await.take() {
            let _ = tx.send(());
        }
    }

    /// Returns true if the server is still running.
    #[frb(sync)]
    pub fn is_running(&self) -> bool {
        // If stop_tx is Some, the server hasn't been stopped yet
        // We can't check the mutex synchronously in a clean way,
        // so we use try_lock as a best-effort check.
        self.stop_tx
            .try_lock()
            .map(|guard| guard.is_some())
            .unwrap_or(true)
    }
}

/// Events sent from the Rust HTTP server to Dart via StreamSink.
/// Dart processes these and calls back to respond.
pub enum RsServerEvent {
    /// Server successfully started.
    Started { port: u16 },

    /// An info request was received (GET /api/localsend/v2/info).
    InfoRequest {
        request_id: String,
        ip: String,
        fingerprint: Option<String>,
    },

    /// A register request was received (POST /api/localsend/v2/register).
    RegisterRequest {
        request_id: String,
        ip: String,
        alias: String,
        version: String,
        device_model: Option<String>,
        device_type: Option<DeviceType>,
        fingerprint: String,
    },

    /// A prepare-upload request was received (POST /api/localsend/v2/prepare-upload).
    PrepareUploadRequest {
        request_id: String,
        ip: String,
        payload: String,
    },

    /// An upload chunk was received (POST /api/localsend/v2/upload).
    UploadRequest {
        request_id: String,
        ip: String,
        session_id: Option<String>,
        file_id: String,
        token: String,
    },

    /// Upload body chunk.
    UploadChunk {
        request_id: String,
        data: Vec<u8>,
    },

    /// Upload body stream completed.
    UploadComplete { request_id: String },

    /// A cancel request was received (POST /api/localsend/v2/cancel).
    CancelRequest {
        request_id: String,
        ip: String,
        session_id: Option<String>,
    },

    /// Server encountered an error.
    Error { message: String },
}

/// Response from Dart back to the Rust server for a pending request.
pub struct RsServerResponse {
    pub status_code: u16,
    pub body: Option<String>,
}

/// Pending response channels, keyed by request_id.
type PendingResponses = Arc<Mutex<HashMap<String, oneshot::Sender<RsServerResponse>>>>;

/// Starts a Rust-based HTTP server that handles TLS efficiently.
///
/// Events are streamed to Dart via [sink]. Dart processes them and responds
/// by calling [respond] on the returned server handle.
///
/// This server uses Hyper + tokio-rustls for significantly better TLS
/// throughput compared to Dart's HttpServer implementation.
pub async fn start_server(
    sink: StreamSink<RsServerEvent>,
    port: u16,
    alias: String,
    version: String,
    device_model: Option<String>,
    device_type: Option<DeviceType>,
    token: String,
    cert: Option<String>,
    private_key: Option<String>,
    legacy_enabled: bool,
) -> Result<RsHttpServer, RsHttpServerError> {
    let tls_config = match (cert, private_key) {
        (Some(cert), Some(key)) => Some(TlsConfig {
            cert,
            private_key: key,
        }),
        _ => None,
    };

    let info = ClientInfo {
        alias,
        version,
        device_model,
        device_type,
        token,
    };

    let (stop_tx, stop_rx) = oneshot::channel();

    localsend::http::server::start_with_port(port, tls_config, info, legacy_enabled, stop_rx)
        .await
        .map_err(|e| RsHttpServerError::StartFailed(e.to_string()))?;

    let _ = sink.add(RsServerEvent::Started { port });

    Ok(RsHttpServer {
        stop_tx: Mutex::new(Some(stop_tx)),
    })
}

pub enum RsHttpServerError {
    StartFailed(String),
    AlreadyStopped,
}
