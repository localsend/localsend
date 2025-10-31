use thiserror::Error;

pub mod client;
pub mod dto;
pub mod server;
pub mod state;

#[derive(Debug, Error)]
#[error("{status};{message:?}")]
pub(crate) struct StatusCodeError {
    status: u16,
    message: Option<String>,
}
