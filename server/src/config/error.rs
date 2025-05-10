use axum::http::StatusCode;
use axum::response::{IntoResponse, Response};

// https://github.com/tokio-rs/axum/blob/main/examples/oauth/src/main.rs

#[derive(Debug)]
pub struct AppError {
    status: StatusCode,
    message: Option<String>,
    error: Option<anyhow::Error>,
}

impl AppError {
    pub fn status(status: StatusCode, message: Option<String>) -> Self {
        Self {
            status,
            message,
            error: None,
        }
    }
}

impl IntoResponse for AppError {
    fn into_response(self) -> Response {
        if self.status >= StatusCode::INTERNAL_SERVER_ERROR {
            tracing::error!(
                "{:?}; {:?}",
                match &self.message {
                    Some(message) => message,
                    None => "(no message)",
                },
                match &self.error {
                    Some(error) => error.to_string(),
                    None => "(no error)".to_string(),
                }
            );
        }

        // return status code with message
        if let Some(message) = self.message {
            (self.status, message).into_response()
        } else {
            self.status.into_response()
        }
    }
}

impl<E> From<E> for AppError
where
    E: Into<anyhow::Error>,
{
    fn from(err: E) -> Self {
        Self {
            status: StatusCode::INTERNAL_SERVER_ERROR,
            message: None,
            error: Some(err.into()),
        }
    }
}
