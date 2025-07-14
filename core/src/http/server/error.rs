use hyper::StatusCode;

#[derive(Debug)]
pub struct AppError {
    pub status: StatusCode,
    pub message: Option<String>,
    pub error: Option<anyhow::Error>,
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
