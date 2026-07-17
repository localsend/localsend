use crate::frb_generated::StreamSink;
use flutter_rust_bridge::frb;
pub use localsend::http::dto_v2::{ProtocolTypeV2, RegisterDtoV2};
use localsend::http::server::ServerConfigV2;
pub use localsend::http::server::TlsConfig;
use localsend::http::server::common::save::FileUploadTarget;
pub use localsend::http::server::v2::SessionEndReasonV2;
use localsend::http::server::v2::{PrepareUploadDecisionV2, ServerEventV2};
use localsend::http::state::ClientInfo;
use localsend::model::discovery::DeviceType;
use localsend::model::transfer::FileDto;
use std::collections::HashMap;
use tokio::sync::{Mutex, mpsc, oneshot};

/// Events emitted by the HTTP server that must be handled by the application.
///
/// [RsServerEvent::PrepareUpload] must be answered with [RsHttpServer::respond_prepare_upload]
/// and [RsServerEvent::FileUpload] with [RsHttpServer::respond_file_upload].
pub enum RsServerEvent {
    /// A device registered itself via `POST /api/localsend/v2/register`.
    Register { ip: String, info: RegisterDtoV2 },

    /// A sender requests to upload files via `POST /api/localsend/v2/prepare-upload`.
    PrepareUpload {
        ip: String,
        info: RegisterDtoV2,
        files: HashMap<String, FileDto>,
    },

    /// An accepted file is being uploaded via `POST /api/localsend/v2/upload`.
    FileUpload {
        session_id: String,
        file_id: String,
        file: FileDto,
    },

    /// An upload session ended.
    SessionEnd {
        session_id: String,
        reason: SessionEndReasonV2,
    },
}

pub struct RsHttpServer {
    event_rx: Mutex<Option<mpsc::Receiver<ServerEventV2>>>,
    stop_tx: Mutex<Option<oneshot::Sender<()>>>,
    pending_decision: Mutex<Option<oneshot::Sender<PrepareUploadDecisionV2>>>,
    pending_uploads: Mutex<HashMap<(String, String), oneshot::Sender<FileUploadTarget>>>,
}

/// Starts the HTTP server on the given port (IPv4 and IPv6).
/// The server runs until [RsHttpServer::stop] is called.
///
/// Events are received by listening to [RsHttpServer::listen].
pub async fn start_server(
    port: u16,
    tls: Option<TlsConfig>,
    alias: String,
    version: String,
    device_model: Option<String>,
    device_type: Option<DeviceType>,
    fingerprint: String,
    pin: Option<String>,
) -> anyhow::Result<RsHttpServer> {
    let (event_tx, event_rx) = mpsc::channel::<ServerEventV2>(16);
    let (stop_tx, stop_rx) = oneshot::channel::<()>();

    localsend::http::server::start_with_port(
        port,
        tls,
        ClientInfo {
            alias,
            version,
            device_model,
            device_type,
            token: fingerprint,
        },
        None,
        Some(ServerConfigV2 { pin, event_tx }),
        None,
        stop_rx,
    )
    .await?;

    Ok(RsHttpServer {
        event_rx: Mutex::new(Some(event_rx)),
        stop_tx: Mutex::new(Some(stop_tx)),
        pending_decision: Mutex::new(None),
        pending_uploads: Mutex::new(HashMap::new()),
    })
}

impl RsHttpServer {
    /// Emits server events until the server is stopped.
    /// Can only be listened to once.
    pub async fn listen(&self, sink: StreamSink<RsServerEvent>) {
        let Some(mut event_rx) = self.event_rx.lock().await.take() else {
            let _ = sink.add_error(anyhow::anyhow!("Server events already listened to"));
            return;
        };

        while let Some(event) = event_rx.recv().await {
            match event {
                ServerEventV2::Register { ip, info } => {
                    let _ = sink.add(RsServerEvent::Register {
                        ip: ip.to_string(),
                        info,
                    });
                }
                ServerEventV2::PrepareUpload {
                    ip,
                    info,
                    files,
                    decision_tx,
                } => {
                    *self.pending_decision.lock().await = Some(decision_tx);
                    let _ = sink.add(RsServerEvent::PrepareUpload {
                        ip: ip.to_string(),
                        info,
                        files,
                    });
                }
                ServerEventV2::FileUpload {
                    session_id,
                    file_id,
                    file,
                    target_tx,
                } => {
                    self.pending_uploads
                        .lock()
                        .await
                        .insert((session_id.clone(), file_id.clone()), target_tx);
                    let _ = sink.add(RsServerEvent::FileUpload {
                        session_id,
                        file_id,
                        file,
                    });
                }
                ServerEventV2::SessionEnd { session_id, reason } => {
                    // Drop stale upload responders of this session (their requests already ended).
                    self.pending_uploads
                        .lock()
                        .await
                        .retain(|(sid, _), _| sid != &session_id);
                    let _ = sink.add(RsServerEvent::SessionEnd { session_id, reason });
                }
            }
        }
    }

    /// Answers the pending [RsServerEvent::PrepareUpload] event.
    ///
    /// Passing the accepted file IDs (a subset of the offered files) accepts the request.
    /// Passing `None` declines the request.
    pub async fn respond_prepare_upload(
        &self,
        accepted_file_ids: Option<Vec<String>>,
    ) -> anyhow::Result<()> {
        let Some(decision_tx) = self.pending_decision.lock().await.take() else {
            return Err(anyhow::anyhow!("No pending prepare-upload request"));
        };

        let decision = match accepted_file_ids {
            Some(ids) => PrepareUploadDecisionV2::Accept(ids.into_iter().collect()),
            None => PrepareUploadDecisionV2::Decline,
        };

        decision_tx
            .send(decision)
            .map_err(|_| anyhow::anyhow!("Prepare-upload request already ended"))?;

        Ok(())
    }

    /// Answers the pending [RsServerEvent::FileUpload] event with the target
    /// the file should be saved to (either a path or a file descriptor)
    /// and waits until the file has been received completely.
    pub async fn respond_file_upload(
        &self,
        session_id: String,
        file_id: String,
        path: Option<String>,
        file_descriptor: Option<i32>,
    ) -> anyhow::Result<()> {
        let Some(target_tx) = self
            .pending_uploads
            .lock()
            .await
            .remove(&(session_id, file_id))
        else {
            return Err(anyhow::anyhow!("No pending file upload for this file"));
        };

        let (result_tx, result_rx) = oneshot::channel::<Result<(), String>>();
        let target = resolve_upload_target(path, file_descriptor, result_tx)?;

        target_tx
            .send(target)
            .map_err(|_| anyhow::anyhow!("Upload request already ended"))?;

        match result_rx.await {
            Ok(Ok(())) => Ok(()),
            Ok(Err(err)) => Err(anyhow::anyhow!(err)),
            Err(_) => Err(anyhow::anyhow!("Upload request aborted")),
        }
    }

    /// Stops the server.
    pub async fn stop(&self) {
        if let Some(stop_tx) = self.stop_tx.lock().await.take() {
            let _ = stop_tx.send(());
        }
    }
}

fn resolve_upload_target(
    path: Option<String>,
    file_descriptor: Option<i32>,
    result_tx: oneshot::Sender<Result<(), String>>,
) -> anyhow::Result<FileUploadTarget> {
    match (path, file_descriptor) {
        (Some(path), None) => Ok(FileUploadTarget::Path {
            path: path.into(),
            result_tx,
        }),
        (None, Some(file_descriptor)) => {
            #[cfg(target_os = "android")]
            {
                Ok(FileUploadTarget::Fd {
                    fd: file_descriptor,
                    result_tx,
                })
            }
            #[cfg(not(target_os = "android"))]
            {
                let _ = (file_descriptor, result_tx);
                Err(anyhow::anyhow!(
                    "File descriptors are only supported on Android"
                ))
            }
        }
        _ => Err(anyhow::anyhow!(
            "Exactly one upload target must be provided"
        )),
    }
}

#[frb(mirror(TlsConfig))]
pub struct _TlsConfig {
    pub cert: String,
    pub private_key: String,
}

#[frb(mirror(ProtocolTypeV2))]
pub enum _ProtocolTypeV2 {
    Http,
    Https,
}

#[frb(mirror(RegisterDtoV2))]
pub struct _RegisterDtoV2 {
    pub alias: String,
    pub version: String,
    pub device_model: Option<String>,
    pub device_type: Option<DeviceType>,
    pub fingerprint: String,
    pub port: u16,
    pub protocol: ProtocolTypeV2,
    pub download: bool,
}

#[frb(mirror(SessionEndReasonV2))]
pub enum _SessionEndReasonV2 {
    Finished,
    Cancelled,
}
