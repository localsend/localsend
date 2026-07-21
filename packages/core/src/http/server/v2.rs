use crate::http::dto_v2::{
    InfoResponseDtoV2, PrepareUploadRequestDtoV2, PrepareUploadResponseDtoV2, RegisterDtoV2,
    RegisterResponseDtoV2, PROTOCOL_VERSION_V2,
};
use crate::http::server::common::collect_to_json::CollectToJson;
use crate::http::server::common::error::AppError;
use crate::http::server::common::pin::check_pin;
use crate::http::server::common::query::parse_query;
use crate::http::server::common::response::{empty_body, BoxedBody, JsonResponse};
use crate::http::server::common::save::FileUploadTarget;
use crate::http::server::common::session::{
    FileStatusV2, SessionFileV2, SessionStateV2, UploadSessionV2,
};
use crate::http::server::{common, AppState, RequestClientInfo, V2State};
use crate::model::transfer::FileDto;
use hyper::body::Incoming;
use hyper::{Request, Response, StatusCode};
use std::collections::{HashMap, HashSet};
use std::net::IpAddr;
use std::sync::Arc;
use tokio::sync::oneshot;
use uuid::Uuid;

/// Events emitted by the v2 HTTP server that must be handled by the application.
#[derive(Debug)]
pub enum ServerEventV2 {
    /// A device registered itself via `POST /api/localsend/v2/register`.
    ///
    /// On TLS, this event is only emitted when `info.fingerprint` matches the
    /// SHA-256 fingerprint of the client certificate verified during the mTLS
    /// handshake, so the fingerprint cannot be spoofed.
    Register {
        /// The IP address of the remote device.
        ip: IpAddr,

        /// The device information sent by the remote device.
        info: RegisterDtoV2,
    },

    /// A sender requests to upload files via `POST /api/localsend/v2/prepare-upload`.
    ///
    /// The application must answer on `decision_tx`.
    /// Dropping `decision_tx` results in a 500 response.
    PrepareUpload {
        /// The session ID the upload session will have when the request is
        /// accepted. Pre-generated so the application can track the session
        /// consistently from the start.
        session_id: String,

        /// The IP address of the sender.
        ip: IpAddr,

        /// The device information of the sender.
        info: RegisterDtoV2,

        /// The SHA-256 fingerprint (uppercase hex) of the sender's client
        /// certificate verified during the mTLS handshake. Unlike
        /// `info.fingerprint`, this value cannot be spoofed.
        /// `None` when the server runs without TLS.
        cert_fingerprint: Option<String>,

        /// The offered files, mapped by file ID.
        files: HashMap<String, FileDto>,

        /// Channel to send the decision (accept all, a subset, or decline).
        decision_tx: oneshot::Sender<PrepareUploadDecisionV2>,
    },

    /// An accepted file is being uploaded via `POST /api/localsend/v2/upload`.
    ///
    /// The application must answer on `target_tx` with where the file content
    /// should go (a stream to consume itself, a path, or a file descriptor).
    /// Dropping `target_tx` results in a 500 response.
    FileUpload {
        /// The session ID of the upload session.
        session_id: String,

        /// The ID of the file being uploaded.
        file_id: String,

        /// The metadata of the file being uploaded.
        file: FileDto,

        /// Channel to send the target the file content should be written to.
        target_tx: oneshot::Sender<FileUploadTarget>,
    },

    /// An upload session ended.
    SessionEnd {
        /// The session ID of the ended session.
        session_id: String,

        /// Why the session ended.
        reason: SessionEndReasonV2,
    },

    /// A prepare-upload request was aborted before a session was created,
    /// e.g. the sender disconnected while the application was still deciding.
    /// The `decision_tx` of the [ServerEventV2::PrepareUpload] with the same
    /// session ID is dead; answering it has no effect.
    PrepareUploadAborted {
        /// The session ID of the aborted prepare-upload request.
        session_id: String,
    },

    /// `POST /api/localsend/v2/cancel` was received for a session this server
    /// does not manage. This happens when the remote device cancels a transfer
    /// that this application is currently *sending* to it: the session ID is
    /// the one issued by the remote device during prepare-upload.
    ///
    /// The application must verify that `ip` matches the target of the
    /// send session before cancelling it.
    CancelReceived {
        /// The IP address of the remote device requesting the cancellation.
        ip: IpAddr,

        /// The session ID as known by the remote device.
        session_id: String,
    },
}

/// The application's decision for a prepare-upload request.
#[derive(Debug)]
pub enum PrepareUploadDecisionV2 {
    /// Accept the given file IDs (a subset of the offered files).
    /// An empty set responds with 204 (no file transfer needed).
    Accept(HashSet<String>),

    /// Decline the request (403).
    Decline,
}

/// Why an upload session ended.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum SessionEndReasonV2 {
    /// All accepted files reached a final state (finished or failed).
    Finished,

    /// The sender cancelled the session via `POST /api/localsend/v2/cancel`.
    Cancelled,
}

pub(crate) async fn register(
    body: Incoming,
    state: AppState,
    client_info: RequestClientInfo,
) -> Result<JsonResponse<RegisterResponseDtoV2>, AppError> {
    let payload = body.collect_to_json::<RegisterDtoV2>().await?;

    // On TLS, only trust registrations whose claimed fingerprint is proven
    // by the client certificate of the mTLS handshake.
    let fingerprint_valid = match client_info.cert_fingerprint() {
        Some(cert_fingerprint) => payload.fingerprint.to_ascii_uppercase() == cert_fingerprint,
        None => true,
    };

    if let Some(v2) = &state.v2 {
        if fingerprint_valid {
            let _ = v2
                .event_tx
                .send(ServerEventV2::Register {
                    ip: client_info.ip,
                    info: payload,
                })
                .await;
        } else {
            tracing::warn!(
                "Ignoring register from {}: claimed fingerprint does not match the client certificate",
                client_info.ip
            );
        }
    }

    let info = state.info.lock().await.clone();
    let download = state.web.is_some();

    Ok(JsonResponse {
        status: StatusCode::OK,
        body: RegisterResponseDtoV2 {
            alias: info.alias,
            version: PROTOCOL_VERSION_V2.to_string(),
            device_model: info.device_model,
            device_type: info.device_type,
            fingerprint: info.token,
            download,
        },
    })
}

pub(crate) async fn info(state: AppState) -> Result<JsonResponse<InfoResponseDtoV2>, AppError> {
    let info = state.info.lock().await.clone();
    let download = state.web.is_some();

    Ok(JsonResponse {
        status: StatusCode::OK,
        body: InfoResponseDtoV2 {
            alias: info.alias,
            version: PROTOCOL_VERSION_V2.to_string(),
            device_model: info.device_model,
            device_type: info.device_type,
            fingerprint: info.token,
            download,
        },
    })
}

pub(crate) async fn prepare_upload(
    req: Request<Incoming>,
    state: AppState,
    client_info: RequestClientInfo,
) -> Result<Response<BoxedBody>, AppError> {
    let v2 = require_v2(&state)?;
    let query = parse_query(req.uri().query());

    check_pin(v2.pin.as_deref(), &v2.pin_attempts, &query, client_info.ip).await?;

    let payload = req
        .into_body()
        .collect_to_json::<PrepareUploadRequestDtoV2>()
        .await?;

    if payload.files.is_empty() {
        return Err(AppError::BadRequest("No files provided".to_string()));
    }

    // Claim the single session slot.
    {
        let mut slot = v2.session.lock().await;
        if slot.is_some() {
            return Err(AppError::Message(
                StatusCode::CONFLICT,
                "Blocked by another session".to_string(),
            ));
        }
        *slot = Some(SessionStateV2::Pending);
    }

    let session_id = Uuid::new_v4().to_string();

    // Frees the slot again if this request is aborted before a session is created.
    let mut pending_guard = PendingSessionGuard::new(v2.clone(), session_id.clone());

    let (decision_tx, decision_rx) = oneshot::channel();
    let event = ServerEventV2::PrepareUpload {
        session_id: session_id.clone(),
        ip: client_info.ip,
        info: payload.info,
        cert_fingerprint: client_info.cert_fingerprint(),
        files: payload.files.clone(),
        decision_tx,
    };
    if v2.event_tx.send(event).await.is_err() {
        return Err(AppError::Status(StatusCode::INTERNAL_SERVER_ERROR));
    }

    let decision = decision_rx
        .await
        .map_err(|_| AppError::Status(StatusCode::INTERNAL_SERVER_ERROR))?;

    let accepted_ids = match decision {
        PrepareUploadDecisionV2::Decline => {
            pending_guard.clear().await;
            return Err(AppError::Message(
                StatusCode::FORBIDDEN,
                "Rejected".to_string(),
            ));
        }
        PrepareUploadDecisionV2::Accept(ids) => ids,
    };

    let files: HashMap<String, SessionFileV2> = payload
        .files
        .into_iter()
        .filter(|(id, _)| accepted_ids.contains(id))
        .map(|(id, dto)| {
            let file = SessionFileV2 {
                dto,
                token: Uuid::new_v4().to_string(),
                status: FileStatusV2::Pending,
            };
            (id, file)
        })
        .collect();

    if files.is_empty() {
        // Nothing to transfer.
        pending_guard.clear().await;
        let mut res = Response::new(empty_body());
        *res.status_mut() = StatusCode::NO_CONTENT;
        return Ok(res);
    }

    let tokens: HashMap<String, String> = files
        .iter()
        .map(|(id, file)| (id.clone(), file.token.clone()))
        .collect();

    {
        let mut slot = v2.session.lock().await;
        *slot = Some(SessionStateV2::Active(UploadSessionV2 {
            session_id: session_id.clone(),
            sender_ip: client_info.ip,
            files,
        }));
    }
    pending_guard.disarm();

    tracing::info!("Upload session created: {session_id}");

    Ok(JsonResponse {
        status: StatusCode::OK,
        body: PrepareUploadResponseDtoV2 {
            session_id,
            files: tokens,
        },
    }
    .into_response())
}

pub(crate) async fn upload(
    req: Request<Incoming>,
    state: AppState,
    client_info: RequestClientInfo,
) -> Result<Response<BoxedBody>, AppError> {
    let v2 = require_v2(&state)?;
    let query = parse_query(req.uri().query());

    let (Some(session_id), Some(file_id), Some(token)) = (
        query.get("sessionId"),
        query.get("fileId"),
        query.get("token"),
    ) else {
        return Err(AppError::Message(
            StatusCode::BAD_REQUEST,
            "Missing parameters".to_string(),
        ));
    };

    // Validate the request and mark the file as in progress.
    let file_dto = {
        let mut slot = v2.session.lock().await;
        let Some(SessionStateV2::Active(session)) = slot.as_mut() else {
            return Err(invalid_token_error());
        };
        if session.session_id != *session_id || session.sender_ip != client_info.ip {
            return Err(invalid_token_error());
        }
        let Some(file) = session.files.get_mut(file_id) else {
            return Err(invalid_token_error());
        };
        if file.token != *token || file.status != FileStatusV2::Pending {
            return Err(invalid_token_error());
        }
        file.status = FileStatusV2::InProgress;
        file.dto.clone()
    };

    // Marks the file as failed if this request is aborted mid-transfer.
    let mut upload_guard = UploadGuard::new(v2.clone(), session_id.clone(), file_id.clone());

    let file_size = file_dto.size;
    let (target_tx, target_rx) = oneshot::channel::<FileUploadTarget>();

    let event = ServerEventV2::FileUpload {
        session_id: session_id.clone(),
        file_id: file_id.clone(),
        file: file_dto,
        target_tx,
    };
    if v2.event_tx.send(event).await.is_err() {
        upload_guard.finish(false).await;
        return Err(AppError::Status(StatusCode::INTERNAL_SERVER_ERROR));
    }

    let Ok(target) = target_rx.await else {
        upload_guard.finish(false).await;
        return Err(AppError::Status(StatusCode::INTERNAL_SERVER_ERROR));
    };

    let success = common::save::save_req_to_target(req, target, file_size).await;

    upload_guard.finish(success).await;

    match success {
        true => Ok(Response::new(empty_body())),
        false => Err(AppError::Status(StatusCode::INTERNAL_SERVER_ERROR)),
    }
}

pub(crate) async fn cancel(
    req: Request<Incoming>,
    state: AppState,
    client_info: RequestClientInfo,
) -> Result<Response<BoxedBody>, AppError> {
    let v2 = require_v2(&state)?;
    let query = parse_query(req.uri().query());

    if let Some(session_id) = query.get("sessionId") {
        let cancelled = {
            let mut slot = v2.session.lock().await;
            match slot.as_ref() {
                Some(SessionStateV2::Active(session))
                    if session.session_id == *session_id && session.sender_ip == client_info.ip =>
                {
                    *slot = None;
                    true
                }
                _ => false,
            }
        };

        if cancelled {
            tracing::info!("Upload session cancelled by sender: {session_id}");
            let _ = v2
                .event_tx
                .send(ServerEventV2::SessionEnd {
                    session_id: session_id.clone(),
                    reason: SessionEndReasonV2::Cancelled,
                })
                .await;
        } else {
            // Not one of our upload sessions: the remote device may be
            // cancelling a transfer this application is sending to it.
            let _ = v2
                .event_tx
                .send(ServerEventV2::CancelReceived {
                    ip: client_info.ip,
                    session_id: session_id.clone(),
                })
                .await;
        }
    }

    Ok(Response::new(empty_body()))
}

fn require_v2(state: &AppState) -> Result<Arc<V2State>, AppError> {
    state
        .v2
        .clone()
        .ok_or(AppError::Status(StatusCode::NOT_FOUND))
}

fn invalid_token_error() -> AppError {
    AppError::Message(
        StatusCode::FORBIDDEN,
        "Invalid token or IP address".to_string(),
    )
}

/// Frees a claimed `Pending` session slot unless a session was created.
///
/// The cleanup also runs on drop so the slot is not leaked
/// when the request future is cancelled (e.g. the sender disconnected
/// while the application was still deciding).
struct PendingSessionGuard {
    v2: Arc<V2State>,
    session_id: String,
    armed: bool,
}

impl PendingSessionGuard {
    fn new(v2: Arc<V2State>, session_id: String) -> Self {
        Self {
            v2,
            session_id,
            armed: true,
        }
    }

    /// Disarms the guard after the pending slot was replaced by an active session.
    fn disarm(&mut self) {
        self.armed = false;
    }

    /// Frees the pending slot immediately.
    async fn clear(&mut self) {
        self.armed = false;
        clear_pending_session(&self.v2).await;
    }
}

impl Drop for PendingSessionGuard {
    fn drop(&mut self) {
        if !self.armed {
            return;
        }
        let v2 = self.v2.clone();
        let session_id = std::mem::take(&mut self.session_id);
        tokio::spawn(async move {
            clear_pending_session(&v2).await;
            // The application may still be waiting for a decision; tell it
            // that answering is pointless now.
            let _ = v2
                .event_tx
                .send(ServerEventV2::PrepareUploadAborted { session_id })
                .await;
        });
    }
}

async fn clear_pending_session(v2: &V2State) {
    let mut slot = v2.session.lock().await;
    if matches!(*slot, Some(SessionStateV2::Pending)) {
        *slot = None;
    }
}

/// Sets the final status of a file after an upload attempt.
///
/// The cleanup also runs on drop (as a failure) so the file is not stuck
/// in progress when the request future is cancelled mid-transfer.
struct UploadGuard {
    v2: Arc<V2State>,
    session_id: String,
    file_id: String,
    armed: bool,
}

impl UploadGuard {
    fn new(v2: Arc<V2State>, session_id: String, file_id: String) -> Self {
        Self {
            v2,
            session_id,
            file_id,
            armed: true,
        }
    }

    async fn finish(&mut self, success: bool) {
        self.armed = false;
        finalize_file(&self.v2, &self.session_id, &self.file_id, success).await;
    }
}

impl Drop for UploadGuard {
    fn drop(&mut self) {
        if !self.armed {
            return;
        }
        let v2 = self.v2.clone();
        let session_id = std::mem::take(&mut self.session_id);
        let file_id = std::mem::take(&mut self.file_id);
        tokio::spawn(async move {
            finalize_file(&v2, &session_id, &file_id, false).await;
        });
    }
}

/// Sets the final status of a file and ends the session once all files are done.
async fn finalize_file(v2: &V2State, session_id: &str, file_id: &str, success: bool) {
    let session_ended = {
        let mut slot = v2.session.lock().await;
        let Some(SessionStateV2::Active(session)) = slot.as_mut() else {
            return;
        };
        if session.session_id != session_id {
            return;
        }
        if let Some(file) = session.files.get_mut(file_id) {
            if file.status == FileStatusV2::InProgress {
                file.status = match success {
                    true => FileStatusV2::Finished,
                    false => FileStatusV2::Failed,
                };
            }
        }
        match session.is_complete() {
            true => {
                *slot = None;
                true
            }
            false => false,
        }
    };

    if session_ended {
        tracing::info!("Upload session finished: {session_id}");
        let _ = v2
            .event_tx
            .send(ServerEventV2::SessionEnd {
                session_id: session_id.to_string(),
                reason: SessionEndReasonV2::Finished,
            })
            .await;
    }
}
