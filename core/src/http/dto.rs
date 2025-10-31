use crate::model::discovery::DeviceType;
use crate::model::transfer::FileDto;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;

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

#[derive(Clone, Debug, PartialEq, Eq, Deserialize, Serialize)]
pub struct ErrorResponse {
    /// The error message.
    pub message: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct RegisterDto {
    pub alias: String,

    pub version: String,

    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_model: Option<String>,

    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_type: Option<DeviceType>,

    pub token: String,

    pub port: u16,

    pub protocol: ProtocolType,

    #[serde(default, skip_serializing_if = "is_default")]
    pub has_web_interface: bool,
}

#[derive(Clone, Debug, Deserialize, Eq, Serialize, PartialEq)]
#[serde(rename_all = "SCREAMING_SNAKE_CASE")]
pub enum ProtocolType {
    Http,
    Https,
}

impl ProtocolType {
    pub fn as_str(&self) -> &str {
        match self {
            ProtocolType::Http => "http",
            ProtocolType::Https => "https",
        }
    }
}

/// Similar to `RegisterDto`, but without `port` and `protocol` (those are already known).
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct RegisterResponseDto {
    pub alias: String,

    pub version: String,

    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_model: Option<String>,

    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_type: Option<DeviceType>,

    pub token: String,

    #[serde(default, skip_serializing_if = "is_default")]
    pub has_web_interface: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct PrepareUploadRequestDto {
    pub info: RegisterDto,
    pub files: HashMap<String, FileDto>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct PrepareUploadResponseDto {
    pub session_id: String,
    pub files: HashMap<String, String>,
}

fn is_default<T: Default + PartialEq>(t: &T) -> bool {
    t == &T::default()
}
