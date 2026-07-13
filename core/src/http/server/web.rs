use crate::http::dto_v2::{InfoResponseDtoV2, PrepareDownloadResponseDtoV2, PROTOCOL_VERSION_V2};
use crate::http::server::common::error::AppError;
use crate::http::server::common::pin::check_pin;
use crate::http::server::common::query::parse_query;
use crate::http::server::common::response::{full_body, BoxedBody, JsonResponse};
use crate::http::server::{AppState, RequestClientInfo};
use crate::model::transfer::{FileContent, FileDto};
use bytes::Bytes;
use http_body_util::{BodyExt, StreamBody};
use hyper::body::{Frame, Incoming};
use hyper::{http, Request, Response, StatusCode};
use lru::LruCache;
use percent_encoding::{utf8_percent_encode, AsciiSet, NON_ALPHANUMERIC};
use serde::Serialize;
use std::collections::HashMap;
use std::net::IpAddr;
use std::num::NonZeroUsize;
use std::sync::Arc;
use tokio::sync::{mpsc, oneshot, Mutex};
use tokio_stream::wrappers::ReceiverStream;
use tokio_stream::StreamExt;

/// Events emitted by the web send (download API) endpoints that must be handled
/// by the application. Web send can be enabled independently of the v2 endpoints.
#[derive(Debug)]
pub enum WebSendEvent {
    /// A web client requests to download the shared files
    /// via `POST /api/localsend/v2/prepare-download`.
    ///
    /// The application must answer on `decision_tx`.
    /// Dropping `decision_tx` results in a 500 response.
    PrepareDownload {
        /// The IP address of the web client.
        ip: IpAddr,

        /// The ID of the download session that is created when accepted.
        session_id: String,

        /// The `User-Agent` header of the web client.
        user_agent: Option<String>,

        /// Channel to send the decision (`true` to accept, `false` to decline).
        decision_tx: oneshot::Sender<bool>,
    },

    /// An accepted web client downloads a file via `GET /api/localsend/v2/download`.
    ///
    /// The application must respond on `content_tx` with the file content. The
    /// response body advertises `file.size` bytes, so the application should
    /// provide exactly that many bytes before closing the stream (closing it
    /// earlier aborts the download).
    /// Dropping `content_tx` results in a 500 response.
    FileDownload {
        /// The ID of the download session.
        session_id: String,

        /// The ID of the file being downloaded.
        file_id: String,

        /// The metadata of the file being downloaded.
        file: FileDto,

        /// Channel to provide the content of the file being downloaded.
        content_tx: oneshot::Sender<FileContent>,
    },
}

const INDEX_HTML: &str = include_str!("../../../assets/web/index.html");
const MAIN_JS: &str = include_str!("../../../assets/web/main.js");
const ERROR_403_HTML: &str = include_str!("../../../assets/web/error-403.html");

/// Characters that are percent-encoded in the content-disposition file name.
/// Matches the component encoding of RFC 2396 (letters, digits and marks are kept).
const FILE_NAME_ENCODE_SET: &AsciiSet = &NON_ALPHANUMERIC
    .remove(b'-')
    .remove(b'_')
    .remove(b'.')
    .remove(b'!')
    .remove(b'~')
    .remove(b'*')
    .remove(b'\'')
    .remove(b'(')
    .remove(b')');

/// Configuration for web send (download API): files offered for download by web browsers.
///
/// Web send can be enabled independently of the v2/v3 protocol endpoints.
pub struct WebSendConfig {
    /// The metadata of the files offered for download, mapped by file ID.
    ///
    /// The content is requested from the application per download
    /// via [`WebSendEvent::FileDownload`].
    pub files: HashMap<String, FileDto>,

    /// Optional PIN that web clients must provide via the `pin` query parameter.
    pub pin: Option<String>,

    /// Translations for the web page, served via `/i18n.json`.
    pub i18n: WebSendI18n,

    /// Channel on which the server emits events that must be handled by the application.
    pub event_tx: mpsc::Sender<WebSendEvent>,
}

/// Translations for the web page, served via `/i18n.json`.
#[derive(Clone, Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct WebSendI18n {
    pub waiting: String,
    pub enter_pin: String,
    pub invalid_pin: String,
    pub too_many_attempts: String,
    pub rejected: String,
    pub files: String,
    pub file_name: String,
    pub size: String,
}

impl Default for WebSendI18n {
    fn default() -> Self {
        Self {
            waiting: "Waiting for response…".to_string(),
            enter_pin: "Enter PIN".to_string(),
            invalid_pin: "Invalid PIN".to_string(),
            too_many_attempts: "Too many attempts".to_string(),
            rejected: "Rejected".to_string(),
            files: "Files".to_string(),
            file_name: "File name".to_string(),
            size: "Size".to_string(),
        }
    }
}

/// Runtime state of the web send (download API) endpoints.
pub(crate) struct WebPageState {
    /// The metadata of the files offered for download, mapped by file ID.
    pub(crate) files: HashMap<String, FileDto>,

    /// Optional PIN required for prepare-download requests.
    pub(crate) pin: Option<String>,

    /// Translations served via `/i18n.json`.
    pub(crate) i18n: WebSendI18n,

    /// Channel on which server events are emitted to the application.
    pub(crate) event_tx: mpsc::Sender<WebSendEvent>,

    /// Download sessions, keyed by session ID (the client's IP address).
    pub(crate) sessions: Mutex<HashMap<String, WebSendSession>>,

    /// Maps client IPs to the number of failed PIN attempts.
    pub(crate) pin_attempts: Mutex<LruCache<IpAddr, u32>>,
}

impl WebPageState {
    pub(crate) fn new(config: WebSendConfig) -> Self {
        Self {
            files: config.files,
            pin: config.pin,
            i18n: config.i18n,
            event_tx: config.event_tx,
            sessions: Mutex::new(HashMap::new()),
            pin_attempts: Mutex::new(LruCache::new(NonZeroUsize::new(200).unwrap())),
        }
    }
}

/// A download session of a single web client.
pub(crate) struct WebSendSession {
    /// The IP address of the web client. Downloads are only allowed from this address.
    ip: IpAddr,

    /// `false` while the prepare-download request is waiting for the application's decision.
    accepted: bool,
}

pub(crate) fn index(state: &AppState) -> Response<BoxedBody> {
    match &state.web {
        Some(_) => html_response(StatusCode::OK, INDEX_HTML, "text/html; charset=utf-8"),
        None => error_403_page(),
    }
}

pub(crate) fn main_js(state: &AppState) -> Response<BoxedBody> {
    match &state.web {
        Some(_) => html_response(StatusCode::OK, MAIN_JS, "text/javascript; charset=utf-8"),
        None => error_403_page(),
    }
}

pub(crate) fn i18n(state: &AppState) -> Result<Response<BoxedBody>, AppError> {
    let web = require_web(state)?;

    Ok(JsonResponse {
        status: StatusCode::OK,
        body: &web.i18n,
    }
    .into_response())
}

pub(crate) async fn prepare_download(
    req: Request<Incoming>,
    state: AppState,
    client_info: RequestClientInfo,
) -> Result<Response<BoxedBody>, AppError> {
    let web = require_web(&state)?;
    let query = parse_query(req.uri().query());

    // An accepted client can re-fetch the file list (e.g. page reload).
    if let Some(session_id) = query.get("sessionId") {
        let sessions = web.sessions.lock().await;
        let valid = sessions
            .get(session_id)
            .is_some_and(|session| session.accepted && session.ip == client_info.ip);
        if valid {
            drop(sessions);
            return Ok(file_list_response(&state, &web, session_id.clone()).await);
        }
    }

    check_pin(
        web.pin.as_deref(),
        &web.pin_attempts,
        &query,
        client_info.ip,
    )
    .await?;

    let user_agent = req
        .headers()
        .get(http::header::USER_AGENT)
        .and_then(|value| value.to_str().ok())
        .map(str::to_string);

    // One session per IP; a new request replaces any previous session of this client.
    let session_id = client_info.ip.to_string();
    {
        let mut sessions = web.sessions.lock().await;
        sessions.insert(
            session_id.clone(),
            WebSendSession {
                ip: client_info.ip,
                accepted: false,
            },
        );
    }

    // Removes the pending session again if this request is declined or aborted
    // before the application accepted it.
    let mut pending_guard = PendingWebSessionGuard::new(web.clone(), session_id.clone());

    let (decision_tx, decision_rx) = oneshot::channel();
    let event = WebSendEvent::PrepareDownload {
        ip: client_info.ip,
        session_id: session_id.clone(),
        user_agent,
        decision_tx,
    };
    if web.event_tx.send(event).await.is_err() {
        return Err(AppError::Status(StatusCode::INTERNAL_SERVER_ERROR));
    }

    let accepted = decision_rx
        .await
        .map_err(|_| AppError::Status(StatusCode::INTERNAL_SERVER_ERROR))?;

    if !accepted {
        pending_guard.clear().await;
        return Err(AppError::Message(
            StatusCode::FORBIDDEN,
            "File transfer rejected.".to_string(),
        ));
    }

    {
        let mut sessions = web.sessions.lock().await;
        if let Some(session) = sessions.get_mut(&session_id) {
            session.accepted = true;
        }
    }
    pending_guard.disarm();

    tracing::info!("Download session created: {session_id}");

    Ok(file_list_response(&state, &web, session_id).await)
}

pub(crate) async fn download(
    req: Request<Incoming>,
    state: AppState,
    client_info: RequestClientInfo,
) -> Result<Response<BoxedBody>, AppError> {
    let web = require_web(&state)?;
    let query = parse_query(req.uri().query());

    let Some(session_id) = query.get("sessionId") else {
        return Err(AppError::BadRequest("Missing sessionId.".to_string()));
    };

    {
        let sessions = web.sessions.lock().await;
        let valid = sessions
            .get(session_id)
            .is_some_and(|session| session.accepted && session.ip == client_info.ip);
        if !valid {
            return Err(AppError::Message(
                StatusCode::FORBIDDEN,
                "Invalid sessionId.".to_string(),
            ));
        }
    }

    let Some(file_id) = query.get("fileId") else {
        return Err(AppError::BadRequest("Missing fileId.".to_string()));
    };

    let Some(file) = web.files.get(file_id) else {
        return Err(AppError::Message(
            StatusCode::FORBIDDEN,
            "Invalid fileId.".to_string(),
        ));
    };

    // The application provides the file content as a stream of bytes.
    let (content_tx, content_rx) = oneshot::channel::<FileContent>();
    let event = WebSendEvent::FileDownload {
        session_id: session_id.clone(),
        file_id: file_id.clone(),
        file: file.clone(),
        content_tx,
    };
    if web.event_tx.send(event).await.is_err() {
        return Err(AppError::Status(StatusCode::INTERNAL_SERVER_ERROR));
    }

    let content = content_rx
        .await
        .map_err(|_| AppError::Status(StatusCode::INTERNAL_SERVER_ERROR))?;

    let size = file.size;
    let body = receiver_stream_body(content.into_receiver());

    // The file name may be inside directories.
    let file_name = file.file_name.replace('/', "-");
    let encoded_file_name = utf8_percent_encode(&file_name, FILE_NAME_ENCODE_SET);

    let mut response = Response::new(body);
    let headers = response.headers_mut();
    headers.insert(
        http::header::CONTENT_TYPE,
        http::HeaderValue::from_static("application/octet-stream"),
    );
    headers.insert(
        http::header::CONTENT_DISPOSITION,
        http::HeaderValue::from_str(&format!("attachment; filename=\"{encoded_file_name}\""))
            .map_err(|_| AppError::Status(StatusCode::INTERNAL_SERVER_ERROR))?,
    );
    headers.insert(http::header::CONTENT_LENGTH, http::HeaderValue::from(size));

    Ok(response)
}

fn require_web(state: &AppState) -> Result<Arc<WebPageState>, AppError> {
    state.web.clone().ok_or(AppError::Message(
        StatusCode::FORBIDDEN,
        "Web send not initialized.".to_string(),
    ))
}

fn html_response(
    status: StatusCode,
    content: &'static str,
    content_type: &'static str,
) -> Response<BoxedBody> {
    let mut response = Response::new(full_body(content));
    *response.status_mut() = status;
    response.headers_mut().insert(
        http::header::CONTENT_TYPE,
        http::HeaderValue::from_static(content_type),
    );
    response
}

fn error_403_page() -> Response<BoxedBody> {
    html_response(
        StatusCode::FORBIDDEN,
        ERROR_403_HTML,
        "text/html; charset=utf-8",
    )
}

async fn file_list_response(
    state: &AppState,
    web: &WebPageState,
    session_id: String,
) -> Response<BoxedBody> {
    let info = state.info.lock().await.clone();

    JsonResponse {
        status: StatusCode::OK,
        body: PrepareDownloadResponseDtoV2 {
            info: InfoResponseDtoV2 {
                alias: info.alias,
                version: PROTOCOL_VERSION_V2.to_string(),
                device_model: info.device_model,
                device_type: info.device_type,
                fingerprint: info.token,
                download: true,
            },
            session_id,
            files: web.files.clone(),
        },
    }
    .into_response()
}

/// Streams application-provided chunks as a response body.
fn receiver_stream_body(binary_rx: mpsc::Receiver<Bytes>) -> BoxedBody {
    let stream = ReceiverStream::new(binary_rx)
        .map(|chunk| Ok::<_, std::io::Error>(Frame::data(Bytes::from(chunk))));
    StreamBody::new(stream).boxed()
}

/// Removes a pending download session unless it was accepted.
///
/// The cleanup also runs on drop so the session is not leaked
/// when the request future is cancelled (e.g. the web client disconnected
/// while the application was still deciding).
struct PendingWebSessionGuard {
    web: Arc<WebPageState>,
    session_id: String,
    armed: bool,
}

impl PendingWebSessionGuard {
    fn new(web: Arc<WebPageState>, session_id: String) -> Self {
        Self {
            web,
            session_id,
            armed: true,
        }
    }

    /// Disarms the guard after the session was accepted.
    fn disarm(&mut self) {
        self.armed = false;
    }

    /// Removes the pending session immediately.
    async fn clear(&mut self) {
        self.armed = false;
        clear_pending_session(&self.web, &self.session_id).await;
    }
}

impl Drop for PendingWebSessionGuard {
    fn drop(&mut self) {
        if !self.armed {
            return;
        }
        let web = self.web.clone();
        let session_id = std::mem::take(&mut self.session_id);
        tokio::spawn(async move {
            clear_pending_session(&web, &session_id).await;
        });
    }
}

async fn clear_pending_session(web: &WebPageState, session_id: &str) {
    let mut sessions = web.sessions.lock().await;
    if sessions
        .get(session_id)
        .is_some_and(|session| !session.accepted)
    {
        sessions.remove(session_id);
    }
}
