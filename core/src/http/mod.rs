use thiserror::Error;

pub mod client;
pub mod dto;
pub mod dto_v2;
pub mod server;
pub mod state;

#[derive(Debug, Error)]
#[error("{status};{message:?}")]
pub struct StatusCodeError {
    status: u16,
    message: Option<String>,
}
