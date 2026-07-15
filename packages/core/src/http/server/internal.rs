use crate::http::server::common::error::AppError;
use crate::http::server::common::query::parse_query;
use crate::http::server::common::response::{empty_body, BoxedBody};
use crate::http::server::AppState;
use http_body_util::BodyExt;
use hyper::body::Incoming;
use hyper::{Request, Response, StatusCode};
use serde::Deserialize;
use tokio::sync::mpsc;

/// Configuration for application-internal endpoints.
pub struct InternalConfig {
    /// Token required by the show route.
    pub show_token: String,

    /// Channel on which the server emits internal events to the application.
    pub event_tx: mpsc::Sender<InternalEvent>,
}

/// Events emitted by application-internal endpoints.
#[derive(Debug)]
pub enum InternalEvent {
    /// Another application instance requested the running application to show itself.
    Show {
        /// Command-line arguments forwarded by the other application instance.
        args: Vec<String>,
    },
}

pub(crate) struct InternalState {
    show_token: String,
    event_tx: mpsc::Sender<InternalEvent>,
}

impl InternalState {
    pub(crate) fn new(config: InternalConfig) -> Self {
        Self {
            show_token: config.show_token,
            event_tx: config.event_tx,
        }
    }
}

#[derive(Default, Deserialize)]
struct ShowRequest {
    #[serde(default)]
    args: Vec<String>,
}

pub(crate) async fn show(
    req: Request<Incoming>,
    state: AppState,
) -> Result<Response<BoxedBody>, AppError> {
    let Some(internal) = &state.internal else {
        return Err(AppError::Status(StatusCode::NOT_FOUND));
    };

    let query = parse_query(req.uri().query());
    if query.get("token") != Some(&internal.show_token) {
        return Err(AppError::Message(
            StatusCode::FORBIDDEN,
            "Invalid token".to_string(),
        ));
    }

    let body = req.into_body().collect().await?.to_bytes();
    let payload = if body.is_empty() {
        ShowRequest::default()
    } else {
        serde_json::from_slice::<ShowRequest>(&body).map_err(|err| {
            tracing::warn!("Failed to parse show request body: {err:#}");
            AppError::BadRequest("Invalid JSON body".to_string())
        })?
    };

    let _ = internal
        .event_tx
        .send(InternalEvent::Show { args: payload.args })
        .await;

    let mut response = Response::new(empty_body());
    *response.status_mut() = StatusCode::OK;
    Ok(response)
}
