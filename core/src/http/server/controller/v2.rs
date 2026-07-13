use crate::http::dto_v2::{
    InfoResponseDtoV2, PrepareUploadRequestDtoV2, PrepareUploadResponseDtoV2, RegisterDtoV2,
    RegisterResponseDtoV2, PROTOCOL_VERSION_V2,
};
use crate::http::server::collect_to_json::CollectToJson;
use crate::http::server::controller::check_pin;
use crate::http::server::error::AppError;
use crate::http::server::query::parse_query;
use crate::http::server::response::{empty_body, BoxedBody, JsonResponse};
use crate::http::server::session::{FileStatusV2, SessionFileV2, SessionStateV2, UploadSessionV2};
use crate::http::server::{AppState, RequestClientInfo, V2State};
use crate::model::transfer::FileDto;
use bytes::Bytes;
use http_body_util::BodyExt;
use hyper::body::Incoming;
use hyper::{Request, Response, StatusCode};
use std::collections::{HashMap, HashSet};
use std::future::Future;
use std::net::IpAddr;
use std::path::PathBuf;
use std::sync::Arc;
use tokio::sync::{mpsc, oneshot};
use uuid::Uuid;

/// Events emitted by the v2 HTTP server that must be handled by the application.
#[derive(Debug)]
pub enum ServerEventV2 {
    /// A device registered itself via `POST /api/localsend/v2/register`.
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
        /// The IP address of the sender.
        ip: IpAddr,

        /// The device information of the sender.
        info: RegisterDtoV2,

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
        target_tx: oneshot::Sender<FileUploadTargetV2>,
    },

    /// An upload session ended.
    SessionEnd {
        /// The session ID of the ended session.
        session_id: String,

        /// Why the session ended.
        reason: SessionEndReasonV2,
    },
}

/// Where the content of an uploaded file should go, decided by the application.
#[derive(Debug)]
pub enum FileUploadTargetV2 {
    /// The application consumes the binary chunks itself.
    ///
    /// The server forwards chunks into `binary_tx` and closes it at end of file.
    /// The application should compare the number of received bytes with `file.size`
    /// and report the result on the sender side of `result_rx` which determines
    /// the HTTP response (200 on `Ok`, 500 on `Err` or when the sender is dropped).
    Stream {
        /// Channel the server sends the binary chunks of the file into.
        binary_tx: mpsc::Sender<Bytes>,

        /// Channel on which the application reports whether the file was
        /// processed successfully.
        result_rx: oneshot::Receiver<Result<(), String>>,
    },

    /// The server writes the file to this path (created or truncated)
    /// and reports the result on `result_tx`.
    Path {
        /// The path to write the file to.
        path: PathBuf,

        /// Channel on which the server reports whether the file was saved successfully.
        result_tx: oneshot::Sender<Result<(), String>>,
    },

    /// The server writes the file to this raw file descriptor (Android only)
    /// and reports the result on `result_tx`.
    #[cfg(target_os = "android")]
    Fd {
        /// The raw file descriptor to write the file to.
        /// Ownership is transferred; the descriptor is closed after writing.
        fd: std::os::fd::RawFd,

        /// Channel on which the server reports whether the file was saved successfully.
        result_tx: oneshot::Sender<Result<(), String>>,
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

/// Channel capacity for file upload chunks (provides backpressure).
const UPLOAD_CHANNEL_CAPACITY: usize = 16;

pub(crate) async fn register(
    body: Incoming,
    state: AppState,
    client_info: RequestClientInfo,
) -> Result<JsonResponse<RegisterResponseDtoV2>, AppError> {
    let payload = body.collect_to_json::<RegisterDtoV2>().await?;

    if let Some(v2) = &state.v2 {
        let _ = v2
            .event_tx
            .send(ServerEventV2::Register {
                ip: client_info.ip,
                info: payload,
            })
            .await;
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

    // Frees the slot again if this request is aborted before a session is created.
    let mut pending_guard = PendingSessionGuard::new(v2.clone());

    let (decision_tx, decision_rx) = oneshot::channel();
    let event = ServerEventV2::PrepareUpload {
        ip: client_info.ip,
        info: payload.info,
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

    let session_id = Uuid::new_v4().to_string();
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
    let (target_tx, target_rx) = oneshot::channel::<FileUploadTargetV2>();

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

    // Resolve the target into a chunk sender and a result receiver.
    let (binary_tx, result_rx) = match target {
        FileUploadTargetV2::Stream {
            binary_tx,
            result_rx,
        } => (binary_tx, result_rx),
        FileUploadTargetV2::Path { path, result_tx } => spawn_file_writer(
            async move {
                tokio::fs::File::create(&path)
                    .await
                    .map_err(|e| format!("Failed to create {}: {e}", path.display()))
            },
            file_size,
            result_tx,
        ),
        #[cfg(target_os = "android")]
        FileUploadTargetV2::Fd { fd, result_tx } => spawn_file_writer(
            async move {
                use std::os::fd::FromRawFd;

                // SAFETY: the descriptor is owned by this transfer; wrapping it in
                // a File transfers that ownership so it is closed once writing finishes.
                let std_file = unsafe { std::fs::File::from_raw_fd(fd) };
                Ok(tokio::fs::File::from_std(std_file))
            },
            file_size,
            result_tx,
        ),
    };

    // Forward the request body to the target.
    let mut body = req.into_body();
    let mut stream_error = false;
    while let Some(frame) = body.frame().await {
        match frame {
            Ok(frame) => {
                let Ok(data) = frame.into_data() else {
                    continue; // ignore non-data frames (e.g. trailers)
                };
                if data.is_empty() {
                    continue;
                }
                if binary_tx.send(data).await.is_err() {
                    // The receiver is gone (dropped by the application or
                    // closed by the file writer after an error).
                    stream_error = true;
                    break;
                }
            }
            Err(err) => {
                tracing::warn!("Error reading upload body of file {file_id}: {err:#}");
                stream_error = true;
                break;
            }
        }
    }

    // Signal end of file to the receiving side.
    drop(binary_tx);

    let success = match stream_error {
        true => false,
        false => match result_rx.await {
            Ok(Ok(())) => true,
            Ok(Err(err)) => {
                tracing::warn!("Failed to process file {file_id}: {err}");
                false
            }
            Err(_) => false,
        },
    };

    upload_guard.finish(success).await;

    match success {
        true => Ok(Response::new(empty_body())),
        false => Err(AppError::Status(StatusCode::INTERNAL_SERVER_ERROR)),
    }
}

/// Spawns a task that writes incoming chunks to a file provided by `open`.
///
/// Returns the sender for the binary chunks and a receiver for the final result.
/// The result is additionally reported to the application on `result_tx`.
fn spawn_file_writer(
    open: impl Future<Output = Result<tokio::fs::File, String>> + Send + 'static,
    expected_size: u64,
    result_tx: oneshot::Sender<Result<(), String>>,
) -> (mpsc::Sender<Bytes>, oneshot::Receiver<Result<(), String>>) {
    let (binary_tx, mut binary_rx) = mpsc::channel::<Bytes>(UPLOAD_CHANNEL_CAPACITY);
    let (internal_tx, internal_rx) = oneshot::channel::<Result<(), String>>();

    tokio::spawn(async move {
        let result = write_file_from_receiver(open, expected_size, &mut binary_rx).await;
        // Unblock the request handler if it is still sending chunks.
        binary_rx.close();
        let _ = result_tx.send(result.clone());
        let _ = internal_tx.send(result);
    });

    (binary_tx, internal_rx)
}

/// Writes all chunks received on `rx` to the file provided by `open`.
///
/// Fails if the total number of written bytes does not match `expected_size`
/// (e.g. the sender disconnected mid-transfer).
async fn write_file_from_receiver(
    open: impl Future<Output = Result<tokio::fs::File, String>>,
    expected_size: u64,
    rx: &mut mpsc::Receiver<Bytes>,
) -> Result<(), String> {
    use tokio::io::AsyncWriteExt;

    let mut file = open.await?;
    let mut written: u64 = 0;
    while let Some(chunk) = rx.recv().await {
        file.write_all(&chunk)
            .await
            .map_err(|e| format!("Failed to write file: {e}"))?;
        written += chunk.len() as u64;
    }
    file.flush()
        .await
        .map_err(|e| format!("Failed to flush file: {e}"))?;

    if written != expected_size {
        return Err(format!(
            "Expected {expected_size} bytes, received {written}"
        ));
    }
    Ok(())
}

pub(crate) async fn cancel(
    req: Request<Incoming>,
    state: AppState,
) -> Result<Response<BoxedBody>, AppError> {
    let v2 = require_v2(&state)?;
    let query = parse_query(req.uri().query());

    if let Some(session_id) = query.get("sessionId") {
        let cancelled = {
            let mut slot = v2.session.lock().await;
            match slot.as_ref() {
                Some(SessionStateV2::Active(session)) if session.session_id == *session_id => {
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
    armed: bool,
}

impl PendingSessionGuard {
    fn new(v2: Arc<V2State>) -> Self {
        Self { v2, armed: true }
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
        tokio::spawn(async move {
            clear_pending_session(&v2).await;
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
