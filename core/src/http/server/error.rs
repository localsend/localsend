use crate::http::dto::ErrorResponse;
use crate::http::server::response::JsonResponse;
use bytes::Bytes;
use http_body_util::Full;
use hyper::{Response, StatusCode};

#[derive(Debug, thiserror::Error)]
pub enum AppError {
    #[error("Hyper error: {0}")]
    Hyper(#[from] hyper::Error),

    #[error("Status Error: {0}")]
    Status(StatusCode),

    #[error("Invalid request: {0}")]
    BadRequest(String),
}

impl AppError {
    pub(crate) fn to_response(self) -> Response<Full<Bytes>> {
        let json = match self {
            AppError::Hyper(_) => JsonResponse {
                status: StatusCode::INTERNAL_SERVER_ERROR,
                body: ErrorResponse {
                    message: "Internal server error".to_string(),
                },
            },
            AppError::Status(code) => JsonResponse {
                status: code,
                body: ErrorResponse {
                    message: format!("Status code: {code}"),
                },
            },
            AppError::BadRequest(message) => JsonResponse {
                status: StatusCode::BAD_REQUEST,
                body: ErrorResponse { message },
            },
        };

        json.into_response()
    }
}
