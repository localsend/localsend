use crate::http::dto::ErrorResponse;
use crate::http::server::common::response::{BoxedBody, JsonResponse};
use hyper::{Response, StatusCode};

#[derive(Debug, thiserror::Error)]
pub enum AppError {
    #[error("Hyper error: {0}")]
    Hyper(#[from] hyper::Error),

    #[error("Status Error: {0}")]
    Status(StatusCode),

    #[error("Invalid request: {0}")]
    BadRequest(String),

    #[error("{0}: {1}")]
    Message(StatusCode, String),
}

impl AppError {
    pub(crate) fn to_response(self) -> Response<BoxedBody> {
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
            AppError::Message(status, message) => JsonResponse {
                status,
                body: ErrorResponse { message },
            },
        };

        json.into_response()
    }
}
