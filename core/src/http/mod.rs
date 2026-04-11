use thiserror::Error;

pub mod client;
pub mod dto;
pub mod dto_v2;
pub mod server;
pub mod state;

#[derive(Debug, Error)]
#[error("{status};{message:?}")]
pub struct StatusCodeError {
    pub status: u16,
    pub message: Option<String>,
}
