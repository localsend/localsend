use crate::frb_generated::StreamSink;
use flutter_rust_bridge::frb;
pub use localsend::http::dto_v2::RegisterDtoV2;
use localsend::http::server::ServerConfigV2;
pub use localsend::http::server::TlsConfig;
use localsend::http::server::common::save::FileUploadTarget;
use localsend::http::server::internal::{InternalConfig, InternalEvent};
pub use localsend::http::server::v2::SessionEndReasonV2;
use localsend::http::server::v2::{PrepareUploadDecisionV2, ServerEventV2};
pub use localsend::http::server::web::{WebI18n, WebPages};
use localsend::http::server::web::{WebConfig, WebSendConfig, WebSendEvent};
use localsend::http::state::ClientInfo;
use localsend::model::discovery::DeviceType;
use localsend::model::discovery::ProtocolType;
use localsend::model::transfer::{FileContent, FileDto};
use std::collections::HashMap;
use std::sync::Arc;
use tokio::sync::{Mutex, mpsc, oneshot};

/// Events emitted by the HTTP server that must be handled by the application.
///
/// [RsServerEvent::PrepareUpload] must be answered with [RsHttpServer::respond_prepare_upload]
/// and [RsServerEvent::FileUpload] with [RsHttpServer::respond_file_upload].
///
/// The `ip` of an event renders a link-local IPv6 peer as `fe80::1%3`,
/// including the interface scope, which the Rust HTTP client accepts back as
/// a host.
pub enum RsServerEvent {
    /// A device registered itself via `POST /api/localsend/v2/register`.
    ///
    /// On TLS, this event is only emitted when `info.fingerprint` matches the
    /// fingerprint of the client certificate verified during the mTLS
    /// handshake, so the fingerprint cannot be spoofed.
    Register { ip: String, info: RegisterDtoV2 },

    /// A sender requests to upload files via `POST /api/localsend/v2/prepare-upload`.
    PrepareUpload {
        /// The session ID the upload session will have when the request is accepted.
        session_id: String,
        ip: String,
        info: RegisterDtoV2,
        /// The SHA-256 fingerprint (uppercase hex) of the sender's client
        /// certificate verified during the mTLS handshake. Unlike
        /// `info.fingerprint`, this value cannot be spoofed.
        /// `None` when the server runs without TLS.
        cert_fingerprint: Option<String>,
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

    /// A prepare-upload request was aborted before a session was created,
    /// e.g. the sender disconnected while the application was still deciding.
    /// The [RsServerEvent::PrepareUpload] with the same session ID
    /// no longer needs to be answered.
    PrepareUploadAborted { session_id: String },

    /// `POST /api/localsend/v2/cancel` was received for a session this server
    /// does not manage: the remote device cancels a transfer this application
    /// is currently *sending* to it. The application must verify that [ip]
    /// matches the target of the send session before cancelling it.
    CancelReceived { ip: String, session_id: String },

    /// A web client requests to download the shared files via `POST /api/localsend/v2/prepare-download`.
    ///
    /// Must be answered with [RsHttpServer::respond_prepare_download].
    WebPrepareDownload {
        ip: String,
        session_id: String,
        user_agent: Option<String>,
    },

    /// A web client downloads an offered file via `GET /api/localsend/v2/download`.
    ///
    /// Must be answered with [RsHttpServer::respond_file_download].
    WebFileDownload {
        session_id: String,
        file_id: String,
        file: FileDto,
    },

    /// Another application instance requested the running application to show itself
    /// via `POST /api/localsend/v2/show`.
    Show {
        /// Command-line arguments forwarded by the other application instance.
        args: Vec<String>,
    },

    /// The listening socket failed permanently, e.g. because the OS
    /// invalidated it while the application was suspended (iOS reclaims the
    /// sockets of suspended apps). The server has stopped itself; the
    /// application must restart it to become reachable again.
    ListenerFailed {
        /// Description of the failure.
        error: String,
    },
}

pub struct RsHttpServer {
    instance: Arc<ServerInstance>,
    event_rx: Mutex<Option<mpsc::Receiver<ServerEventV2>>>,
    pending_decision: Mutex<Option<(String, oneshot::Sender<PrepareUploadDecisionV2>)>>,
    pending_uploads: Mutex<HashMap<(String, String), oneshot::Sender<FileUploadTarget>>>,
    web_event_rx: Mutex<Option<mpsc::Receiver<WebSendEvent>>>,
    pending_download_decisions: Mutex<HashMap<String, oneshot::Sender<bool>>>,
    pending_downloads: Mutex<HashMap<(String, String), oneshot::Sender<FileContent>>>,
    internal_event_rx: Mutex<Option<mpsc::Receiver<InternalEvent>>>,
}

/// The stoppable part of a running server, shared between [RsHttpServer] and
/// [RUNNING_SERVER] so that a leftover instance can be stopped without its
/// Dart owner.
struct ServerInstance {
    handle: localsend::http::server::ServerHandle,
    stop_tx: Mutex<Option<oneshot::Sender<()>>>,
}

impl ServerInstance {
    /// Stops the server and waits until the listeners are closed, so the port
    /// can be bound again. Does nothing when already stopped.
    async fn stop(&self) {
        if let Some(stop_tx) = self.stop_tx.lock().await.take() {
            let _ = stop_tx.send(());
            self.handle.wait_stopped().await;
        }
    }
}

/// The most recently started server. A Flutter hot restart kills all Dart
/// isolates without stopping the Rust server task, which would keep the port
/// bound forever; [start_server] stops such a leftover instance before
/// binding again.
static RUNNING_SERVER: Mutex<Option<Arc<ServerInstance>>> = Mutex::const_new(None);

/// Configuration for the web pages served to browsers. When omitted, the web
/// pages respond with 403 and only the v2 endpoints run.
pub struct WebParams {
    /// Enables web send (the download page): files offered for download by web
    /// browsers. `null` disables the download page and the download API.
    pub send: Option<WebSendParams>,

    /// Serves the upload page so web browsers can upload files via the v2
    /// `prepare-upload`/`upload` endpoints. Ignored when [WebParams::send] is
    /// set: the download page takes precedence at `/`.
    pub upload: bool,

    /// Translations for the web pages, served via `/i18n.json`.
    pub i18n: WebI18n,

    /// Custom HTML pages replacing the embedded web pages.
    /// Pages left `null` (or the whole struct being `null`) are served from
    /// the assets embedded at compile time.
    pub pages: Option<WebPages>,
}

/// Configuration for web send: files offered for download by web browsers.
///
/// Web send can be enabled independently of the v2 protocol endpoints.
pub struct WebSendParams {
    /// The metadata of the files offered for download, mapped by file ID.
    /// The content is requested per download via [RsServerEvent::WebFileDownload].
    pub files: HashMap<String, FileDto>,

    /// Optional PIN that web clients must provide via the `pin` query parameter.
    pub pin: Option<String>,
}

/// Starts the HTTP server on the given port (IPv4 and IPv6).
/// The server runs until [RsHttpServer::stop] is called.
///
/// Passing [web] additionally serves the web pages: the download page when
/// [WebParams::send] is set (so web browsers can download the offered files)
/// or the upload page when [WebParams::upload] is enabled.
///
/// Passing [show_token] enables the internal `show` endpoint that lets another
/// application instance request this one to show itself (emitted as
/// [RsServerEvent::Show]). The token guards the endpoint against other clients.
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
    verify_checksums: bool,
    web: Option<WebParams>,
    show_token: Option<String>,
) -> anyhow::Result<RsHttpServer> {
    // Stop a server left over from before a hot restart (its Dart owner died
    // without calling stop)
    let mut running_server = RUNNING_SERVER.lock().await;
    if let Some(previous) = running_server.take() {
        previous.stop().await;
    }

    let (event_tx, event_rx) = mpsc::channel::<ServerEventV2>(16);
    let (stop_tx, stop_rx) = oneshot::channel::<()>();

    let (web_config, web_event_rx) = match web {
        Some(web) => {
            let (send_config, web_event_rx) = match web.send {
                Some(send) => {
                    let (web_event_tx, web_event_rx) = mpsc::channel::<WebSendEvent>(16);
                    let config = WebSendConfig {
                        files: send.files,
                        pin: send.pin,
                        event_tx: web_event_tx,
                    };
                    (Some(config), Some(web_event_rx))
                }
                None => (None, None),
            };
            let config = WebConfig {
                send: send_config,
                upload: web.upload,
                i18n: web.i18n,
                pages: web.pages.unwrap_or_default(),
            };
            (Some(config), web_event_rx)
        }
        None => (None, None),
    };

    let (internal_config, internal_event_rx) = match show_token {
        Some(show_token) => {
            let (internal_event_tx, internal_event_rx) = mpsc::channel::<InternalEvent>(16);
            let config = InternalConfig {
                show_token,
                event_tx: internal_event_tx,
            };
            (Some(config), Some(internal_event_rx))
        }
        None => (None, None),
    };

    let handle = localsend::http::server::start_with_port(
        port,
        tls,
        ClientInfo {
            alias,
            version,
            device_model,
            device_type,
            token: fingerprint,
        },
        internal_config,
        Some(ServerConfigV2 {
            pin,
            verify_checksums,
            event_tx,
        }),
        web_config,
        stop_rx,
    )
    .await?;

    let instance = Arc::new(ServerInstance {
        handle,
        stop_tx: Mutex::new(Some(stop_tx)),
    });
    *running_server = Some(instance.clone());

    Ok(RsHttpServer {
        instance,
        event_rx: Mutex::new(Some(event_rx)),
        pending_decision: Mutex::new(None),
        pending_uploads: Mutex::new(HashMap::new()),
        web_event_rx: Mutex::new(web_event_rx),
        pending_download_decisions: Mutex::new(HashMap::new()),
        pending_downloads: Mutex::new(HashMap::new()),
        internal_event_rx: Mutex::new(internal_event_rx),
    })
}

impl RsHttpServer {
    /// Emits server events until the server is stopped.
    /// Can only be listened to once.
    ///
    /// The v2 protocol, the web send (download API), and the internal endpoint
    /// events are all emitted on the same stream.
    ///
    /// Also returns when the Dart side of the stream is gone (e.g. after a
    /// hot restart), so this call does not keep the server alive forever.
    pub async fn listen(&self, sink: StreamSink<RsServerEvent>) {
        let Some(mut event_rx) = self.event_rx.lock().await.take() else {
            let _ = sink.add_error(anyhow::anyhow!("Server events already listened to"));
            return;
        };
        let mut web_event_rx = self.web_event_rx.lock().await.take();
        let mut internal_event_rx = self.internal_event_rx.lock().await.take();

        let mut v2_open = true;
        loop {
            let sink_open = tokio::select! {
                event = event_rx.recv(), if v2_open => {
                    match event {
                        Some(event) => self.handle_server_event(&sink, event).await,
                        None => {
                            v2_open = false;
                            true
                        }
                    }
                }
                event = recv_opt(&mut web_event_rx) => {
                    match event {
                        Some(event) => self.handle_web_event(&sink, event).await,
                        None => {
                            web_event_rx = None;
                            true
                        }
                    }
                }
                event = recv_opt(&mut internal_event_rx) => {
                    match event {
                        Some(InternalEvent::Show { args }) => {
                            sink.add(RsServerEvent::Show { args }).is_ok()
                        }
                        None => {
                            internal_event_rx = None;
                            true
                        }
                    }
                }
            };

            // The Dart listener is gone; the remaining events have no receiver.
            if !sink_open {
                break;
            }

            if !v2_open && web_event_rx.is_none() && internal_event_rx.is_none() {
                break;
            }
        }
    }

    /// Returns whether the sink is still open.
    async fn handle_server_event(
        &self,
        sink: &StreamSink<RsServerEvent>,
        event: ServerEventV2,
    ) -> bool {
        match event {
            ServerEventV2::Register { ip, info } => sink
                .add(RsServerEvent::Register {
                    ip: ip.to_string(),
                    info,
                })
                .is_ok(),
            ServerEventV2::PrepareUpload {
                session_id,
                ip,
                info,
                cert_fingerprint,
                files,
                decision_tx,
            } => {
                *self.pending_decision.lock().await = Some((session_id.clone(), decision_tx));
                sink.add(RsServerEvent::PrepareUpload {
                    session_id,
                    ip: ip.to_string(),
                    info,
                    cert_fingerprint,
                    files,
                })
                .is_ok()
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
                sink.add(RsServerEvent::FileUpload {
                    session_id,
                    file_id,
                    file,
                })
                .is_ok()
            }
            ServerEventV2::SessionEnd { session_id, reason } => {
                // Drop stale upload responders of this session (their requests already ended).
                self.pending_uploads
                    .lock()
                    .await
                    .retain(|(sid, _), _| sid != &session_id);
                sink.add(RsServerEvent::SessionEnd { session_id, reason })
                    .is_ok()
            }
            ServerEventV2::PrepareUploadAborted { session_id } => {
                // Drop the stale decision responder (the request already ended).
                // A newer prepare-upload request may already hold the slot;
                // only clear it if it still belongs to the aborted request.
                {
                    let mut pending = self.pending_decision.lock().await;
                    if pending.as_ref().is_some_and(|(sid, _)| sid == &session_id) {
                        *pending = None;
                    }
                }
                sink.add(RsServerEvent::PrepareUploadAborted { session_id })
                    .is_ok()
            }
            ServerEventV2::CancelReceived { ip, session_id } => sink
                .add(RsServerEvent::CancelReceived {
                    ip: ip.to_string(),
                    session_id,
                })
                .is_ok(),
            ServerEventV2::ListenerFailed { error } => {
                sink.add(RsServerEvent::ListenerFailed { error }).is_ok()
            }
        }
    }

    /// Returns whether the sink is still open.
    async fn handle_web_event(
        &self,
        sink: &StreamSink<RsServerEvent>,
        event: WebSendEvent,
    ) -> bool {
        match event {
            WebSendEvent::PrepareDownload {
                ip,
                session_id,
                user_agent,
                decision_tx,
            } => {
                self.pending_download_decisions
                    .lock()
                    .await
                    .insert(session_id.clone(), decision_tx);
                sink.add(RsServerEvent::WebPrepareDownload {
                    ip: ip.to_string(),
                    session_id,
                    user_agent,
                })
                .is_ok()
            }
            WebSendEvent::FileDownload {
                session_id,
                file_id,
                file,
                content_tx,
            } => {
                self.pending_downloads
                    .lock()
                    .await
                    .insert((session_id.clone(), file_id.clone()), content_tx);
                sink.add(RsServerEvent::WebFileDownload {
                    session_id,
                    file_id,
                    file,
                })
                .is_ok()
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
        let Some((_, decision_tx)) = self.pending_decision.lock().await.take() else {
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
    ///
    /// The progress (fraction of [file_size]) is emitted on [sink]
    /// while the file is being received. Failures are emitted on [sink] as
    /// well: flutter_rust_bridge discards the returned `Result` of functions
    /// taking a [StreamSink], so a returned error would become an uncaught
    /// async error killing the calling isolate.
    ///
    /// Timestamps provided in the sender's file metadata are applied to the
    /// written file by the server.
    pub async fn respond_file_upload(
        &self,
        sink: StreamSink<f64>,
        session_id: String,
        file_id: String,
        path: Option<String>,
        file_descriptor: Option<i32>,
        file_size: u64,
    ) {
        let result = async {
            let Some(target_tx) = self
                .pending_uploads
                .lock()
                .await
                .remove(&(session_id, file_id))
            else {
                return Err(anyhow::anyhow!("No pending file upload for this file"));
            };

            let (progress_tx, mut progress_rx) = mpsc::channel::<u64>(16);
            let progress_sink = sink.clone();
            tokio::spawn(async move {
                let mut last_emit = None::<std::time::Instant>;
                while let Some(written) = progress_rx.recv().await {
                    let now = std::time::Instant::now();
                    let is_final = written >= file_size;
                    if !is_final {
                        if let Some(last) = last_emit {
                            if now.duration_since(last) < std::time::Duration::from_millis(20) {
                                continue;
                            }
                        }
                    }
                    last_emit = Some(now);
                    let progress = if file_size == 0 {
                        1.0
                    } else {
                        (written as f64 / file_size as f64).min(1.0)
                    };
                    let _ = progress_sink.add(progress);
                }
            });

            let (result_tx, result_rx) = oneshot::channel::<Result<(), String>>();
            let target = resolve_upload_target(path, file_descriptor, result_tx, progress_tx)?;

            target_tx
                .send(target)
                .map_err(|_| anyhow::anyhow!("Upload request already ended"))?;

            match result_rx.await {
                Ok(Ok(())) => Ok(()),
                Ok(Err(err)) => Err(anyhow::anyhow!(err)),
                Err(_) => Err(anyhow::anyhow!("Upload request aborted")),
            }
        }
        .await;

        if let Err(err) = result {
            let _ = sink.add_error(err);
        }
    }

    /// Fails the pending [RsServerEvent::FileUpload] event, e.g. because
    /// the application failed to prepare a save target for the file.
    ///
    /// The upload request fails with an error response and the file is marked
    /// as failed. Does nothing if the upload was already answered.
    pub async fn fail_file_upload(&self, session_id: String, file_id: String) {
        // Dropping the responder fails the request waiting for the target.
        self.pending_uploads
            .lock()
            .await
            .remove(&(session_id, file_id));
    }

    /// Answers the pending [RsServerEvent::WebPrepareDownload] event.
    ///
    /// Passing `true` accepts the download request, `false` declines it.
    pub async fn respond_prepare_download(
        &self,
        session_id: String,
        accept: bool,
    ) -> anyhow::Result<()> {
        let Some(decision_tx) = self
            .pending_download_decisions
            .lock()
            .await
            .remove(&session_id)
        else {
            return Err(anyhow::anyhow!("No pending prepare-download request"));
        };

        decision_tx
            .send(accept)
            .map_err(|_| anyhow::anyhow!("Prepare-download request already ended"))?;

        Ok(())
    }

    /// Answers the pending [RsServerEvent::WebFileDownload] event with the source
    /// the file content should be read from (either a path or a file descriptor).
    ///
    /// The server reads the content and streams it to the web client.
    pub async fn respond_file_download(
        &self,
        session_id: String,
        file_id: String,
        path: Option<String>,
        file_descriptor: Option<i32>,
    ) -> anyhow::Result<()> {
        let Some(content_tx) = self
            .pending_downloads
            .lock()
            .await
            .remove(&(session_id, file_id))
        else {
            return Err(anyhow::anyhow!("No pending file download for this file"));
        };

        let content = resolve_file_content(path, file_descriptor)?;

        content_tx
            .send(content)
            .map_err(|_| anyhow::anyhow!("Download request already ended"))?;

        Ok(())
    }

    /// Fails the pending [RsServerEvent::WebFileDownload] event, e.g. because
    /// the application failed to resolve a source for the file content.
    ///
    /// The download request fails with an error response.
    /// Does nothing if the download was already answered.
    pub async fn fail_file_download(&self, session_id: String, file_id: String) {
        // Dropping the responder fails the request waiting for the content.
        self.pending_downloads
            .lock()
            .await
            .remove(&(session_id, file_id));
    }

    /// Cancels the active upload session, e.g. because the user aborted the
    /// transfer on the receiving side.
    ///
    /// Uploads that are already in progress still run to completion, but new
    /// upload requests fail and a new session can be created.
    /// No [RsServerEvent::SessionEnd] is emitted: the application initiated
    /// the cancellation itself.
    pub async fn cancel_session(&self, session_id: String) {
        self.instance.handle.cancel_v2_session(&session_id).await;

        // Drop unanswered upload responders of this session so their requests
        // fail instead of waiting for a target forever.
        self.pending_uploads
            .lock()
            .await
            .retain(|(sid, _), _| sid != &session_id);
    }

    /// Stops the server.
    /// Returns after the listeners are closed, so the port can be bound again.
    pub async fn stop(&self) {
        self.instance.stop().await;

        let mut running_server = RUNNING_SERVER.lock().await;
        if running_server
            .as_ref()
            .is_some_and(|running| Arc::ptr_eq(running, &self.instance))
        {
            *running_server = None;
        }
    }
}

/// Receives the next event from an optional channel, or pends forever when the
/// channel is absent (i.e. that feature is disabled).
async fn recv_opt<T>(rx: &mut Option<mpsc::Receiver<T>>) -> Option<T> {
    match rx {
        Some(rx) => rx.recv().await,
        None => std::future::pending::<Option<T>>().await,
    }
}

fn resolve_upload_target(
    path: Option<String>,
    file_descriptor: Option<i32>,
    result_tx: oneshot::Sender<Result<(), String>>,
    progress_tx: mpsc::Sender<u64>,
) -> anyhow::Result<FileUploadTarget> {
    match (path, file_descriptor) {
        (Some(path), None) => Ok(FileUploadTarget::Path {
            path: path.into(),
            result_tx,
            progress_tx: Some(progress_tx),
        }),
        (None, Some(file_descriptor)) => {
            #[cfg(target_os = "android")]
            {
                Ok(FileUploadTarget::Fd {
                    fd: file_descriptor,
                    result_tx,
                    progress_tx: Some(progress_tx),
                })
            }
            #[cfg(not(target_os = "android"))]
            {
                let _ = (file_descriptor, result_tx, progress_tx);
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

fn resolve_file_content(
    path: Option<String>,
    file_descriptor: Option<i32>,
) -> anyhow::Result<FileContent> {
    match (path, file_descriptor) {
        (Some(path), None) => Ok(FileContent::Path(path.into())),
        (None, Some(file_descriptor)) => {
            #[cfg(target_os = "android")]
            {
                Ok(FileContent::Fd(file_descriptor))
            }
            #[cfg(not(target_os = "android"))]
            {
                let _ = file_descriptor;
                Err(anyhow::anyhow!(
                    "File descriptors are only supported on Android"
                ))
            }
        }
        _ => Err(anyhow::anyhow!(
            "Exactly one download source must be provided"
        )),
    }
}

#[frb(mirror(WebI18n))]
pub struct _WebI18n {
    pub waiting: String,
    pub enter_pin: String,
    pub invalid_pin: String,
    pub too_many_attempts: String,
    pub rejected: String,
    pub upload_rejected: String,
    pub busy: String,
    pub files: String,
    pub file_name: String,
    pub size: String,
    pub drop_hint: String,
}

#[frb(mirror(WebPages))]
pub struct _WebPages {
    pub download_html: Option<String>,
    pub upload_html: Option<String>,
    pub error_403_html: Option<String>,
}

#[frb(mirror(TlsConfig))]
pub struct _TlsConfig {
    pub cert: String,
    pub private_key: String,
}

#[frb(mirror(RegisterDtoV2))]
pub struct _RegisterDtoV2 {
    pub alias: String,
    pub version: String,
    pub device_model: Option<String>,
    pub device_type: Option<DeviceType>,
    pub fingerprint: String,
    pub port: u16,
    pub protocol: ProtocolType,
    pub download: bool,
}

#[frb(mirror(SessionEndReasonV2))]
pub enum _SessionEndReasonV2 {
    Finished,
    Cancelled,
}
