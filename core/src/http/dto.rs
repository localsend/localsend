use crate::model::discovery::{RegisterDto, RegisterResponseDto};
use serde::{Deserialize, Serialize};

#[derive(Clone, Debug, PartialEq, Eq, Deserialize, Serialize)]
pub struct NonceRequest {
    /// The nonce string.
    pub nonce: String,
}

#[derive(Clone, Debug, PartialEq, Eq, Deserialize, Serialize)]
pub struct NonceResponse {
    /// The nonce string.
    pub nonce: String,
}

pub type RegisterRequest = RegisterDto;

pub type RegisterResponse = RegisterResponseDto;

#[derive(Clone, Debug, PartialEq, Eq, Deserialize, Serialize)]
pub struct ErrorResponse {
    /// The error message.
    pub message: String,
}
