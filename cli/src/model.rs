use std::collections::HashMap;
use std::net::IpAddr;
use std::path::PathBuf;
use std::time::{SystemTime, UNIX_EPOCH};

use localsend::http::dto_v2::ProtocolTypeV2;
use schemars::JsonSchema;
use serde::{Deserialize, Serialize};

#[derive(Clone, Copy, Debug, Deserialize, Eq, JsonSchema, PartialEq, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum PeerProtocol {
    Http,
    Https,
}

impl PeerProtocol {
    pub fn is_secure(self) -> bool {
        self == Self::Https
    }
}

impl From<ProtocolTypeV2> for PeerProtocol {
    fn from(value: ProtocolTypeV2) -> Self {
        match value {
            ProtocolTypeV2::Http => Self::Http,
            ProtocolTypeV2::Https => Self::Https,
        }
    }
}

#[derive(Clone)]
pub struct Peer {
    pub fingerprint: String,
    pub alias: String,
    pub ip: IpAddr,
    pub port: u16,
    pub protocol: PeerProtocol,
    pub device_model: Option<String>,
    pub device_type: Option<String>,
    pub public_key: Option<String>,
    pub last_seen_at: u64,
}

#[derive(Clone, Debug, JsonSchema, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct PeerView {
    pub fingerprint: String,
    pub alias: String,
    pub ip: String,
    pub port: u16,
    pub protocol: PeerProtocol,
    pub secure: bool,
    pub paired: bool,
    pub device_model: Option<String>,
    pub device_type: Option<String>,
    pub last_seen_at: u64,
}

impl Peer {
    pub fn view(&self, paired: bool) -> PeerView {
        PeerView {
            fingerprint: self.fingerprint.clone(),
            alias: self.alias.clone(),
            ip: self.ip.to_string(),
            port: self.port,
            protocol: self.protocol,
            secure: self.protocol.is_secure(),
            paired,
            device_model: self.device_model.clone(),
            device_type: self.device_type.clone(),
            last_seen_at: self.last_seen_at,
        }
    }
}

#[derive(Clone, Debug, Deserialize, JsonSchema, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct TrustedPeer {
    pub fingerprint: String,
    pub alias: String,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub public_key: Option<String>,
    pub paired_at: u64,
}

#[derive(Clone, Debug, JsonSchema, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct TrustedPeerView {
    pub fingerprint: String,
    pub alias: String,
    pub paired_at: u64,
}

impl From<TrustedPeer> for TrustedPeerView {
    fn from(value: TrustedPeer) -> Self {
        Self {
            fingerprint: value.fingerprint,
            alias: value.alias,
            paired_at: value.paired_at,
        }
    }
}

#[derive(Clone, Debug, JsonSchema, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct LocalIdentityView {
    pub alias: String,
    pub fingerprint: String,
    pub port: u16,
    pub protocol: PeerProtocol,
}

#[derive(Clone, Copy, Debug, Deserialize, Eq, JsonSchema, PartialEq, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum InboxStatus {
    Pending,
    Complete,
    Failed,
}

#[derive(Clone, Copy, Debug, Deserialize, Eq, JsonSchema, PartialEq, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum InboxFileStatus {
    Pending,
    Complete,
    Failed,
}

#[derive(Clone, Debug, Deserialize, JsonSchema, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct InboxFile {
    pub id: String,
    pub name: String,
    pub size: u64,
    pub mime_type: String,
    pub path: String,
    pub status: InboxFileStatus,
}

#[derive(Clone, Debug, Deserialize, JsonSchema, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct InboxItem {
    pub id: String,
    pub received_at: u64,
    pub sender_alias: String,
    pub sender_fingerprint: String,
    pub sender_ip: String,
    pub message: Option<String>,
    pub files: Vec<InboxFile>,
    pub status: InboxStatus,
    pub read: bool,
}

#[derive(Clone, Debug, JsonSchema, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct TransferResult {
    pub target_fingerprint: String,
    pub target_alias: String,
    pub session_id: Option<String>,
    pub accepted_files: Vec<String>,
    pub skipped_files: Vec<String>,
}

pub struct PendingTransfer {
    pub inbox_id: String,
    pub destinations: HashMap<String, PathBuf>,
}

pub fn unix_timestamp() -> u64 {
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap_or_default()
        .as_secs()
}
