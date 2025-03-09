use thiserror::Error;

pub mod client;
pub mod server;

#[derive(Debug, Error)]
#[error("{status};{message:?}")]
pub(crate) struct StatusCodeError {
    status: u16,
    message: Option<String>,
}
