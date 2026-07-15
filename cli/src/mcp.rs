use std::fmt;
use std::net::IpAddr;
use std::path::PathBuf;
use std::sync::Arc;
use std::time::Duration;

use rmcp::{
    Json, ServerHandler,
    handler::server::{router::tool::ToolRouter, wrapper::Parameters},
    model::{Implementation, ServerCapabilities, ServerInfo},
    tool, tool_handler, tool_router,
};
use schemars::JsonSchema;
use serde::{Deserialize, Serialize};

use crate::model::{
    InboxItem, LocalIdentityView, PeerProtocol, PeerView, TransferResult, TrustedPeerView,
};
use crate::network::NetworkService;

#[derive(Clone)]
pub struct LocalSendMcp {
    network: Arc<NetworkService>,
    tool_router: ToolRouter<Self>,
}

impl fmt::Debug for LocalSendMcp {
    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
        formatter
            .debug_struct("LocalSendMcp")
            .finish_non_exhaustive()
    }
}

#[derive(Deserialize, JsonSchema)]
pub struct DiscoverDevicesParams {
    /// Time to listen for responses after announcing, in milliseconds (maximum 5000).
    pub wait_ms: Option<u64>,
}

#[derive(Deserialize, JsonSchema)]
pub struct ProbeDeviceParams {
    /// IP address of the LocalSend peer.
    pub ip: String,
    /// LocalSend TCP port on the peer.
    pub port: u16,
    /// Use HTTPS. Defaults to true.
    pub secure: Option<bool>,
}

#[derive(Deserialize, JsonSchema)]
pub struct FingerprintParams {
    /// Full fingerprint returned by discover_devices, probe_device, or get_identity.
    pub fingerprint: String,
}

#[derive(Deserialize, JsonSchema)]
pub struct SendMessageParams {
    /// Fingerprint of a previously paired peer.
    pub target_fingerprint: String,
    /// UTF-8 text to deliver to the peer's inbox.
    pub message: String,
    /// Optional PIN configured by the receiver.
    pub pin: Option<String>,
}

#[derive(Deserialize, JsonSchema)]
pub struct SendFilesParams {
    /// Fingerprint of a previously paired peer.
    pub target_fingerprint: String,
    /// Absolute or relative file paths within the server's allowed roots.
    pub paths: Vec<String>,
    /// Optional PIN configured by the receiver.
    pub pin: Option<String>,
}

#[derive(Deserialize, JsonSchema)]
pub struct ListInboxParams {
    /// Return only items that have not been read.
    pub unread_only: Option<bool>,
    /// Maximum number of newest items to return (maximum 100).
    pub limit: Option<usize>,
}

#[derive(Deserialize, JsonSchema)]
pub struct ReadInboxParams {
    /// Inbox item ID returned by list_inbox.
    pub id: String,
}

#[derive(JsonSchema, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct DeviceList {
    pub devices: Vec<PeerView>,
}

#[derive(JsonSchema, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct TrustedDeviceList {
    pub devices: Vec<TrustedPeerView>,
}

#[derive(JsonSchema, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct UnpairResult {
    pub removed: bool,
}

#[derive(JsonSchema, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct InboxList {
    pub items: Vec<InboxItem>,
}

#[tool_router(router = tool_router)]
impl LocalSendMcp {
    pub fn new(network: Arc<NetworkService>) -> Self {
        Self {
            network,
            tool_router: Self::tool_router(),
        }
    }

    /// Return this peer's identity. Compare this fingerprint out-of-band before pairing it on another PC.
    #[tool]
    pub async fn get_identity(&self) -> Json<LocalIdentityView> {
        Json(LocalIdentityView {
            alias: self.network.alias().to_string(),
            fingerprint: self.network.fingerprint().to_string(),
            port: self.network.port(),
            protocol: PeerProtocol::Https,
        })
    }

    /// Announce on the LocalSend LAN and return discovered GUI apps and MCP peers.
    #[tool]
    pub async fn discover_devices(
        &self,
        Parameters(params): Parameters<DiscoverDevicesParams>,
    ) -> Result<Json<DeviceList>, String> {
        let wait_ms = params.wait_ms.unwrap_or(800).min(5_000);
        self.network
            .discover_devices(Duration::from_millis(wait_ms))
            .await
            .map(|devices| Json(DeviceList { devices }))
            .map_err(display_error)
    }

    /// Register directly with a peer, useful when multicast discovery is unavailable (for example over a VPN).
    #[tool]
    pub async fn probe_device(
        &self,
        Parameters(params): Parameters<ProbeDeviceParams>,
    ) -> Result<Json<PeerView>, String> {
        let ip = params
            .ip
            .parse::<IpAddr>()
            .map_err(|error| format!("invalid IP address: {error}"))?;
        let protocol = if params.secure.unwrap_or(true) {
            PeerProtocol::Https
        } else {
            PeerProtocol::Http
        };
        self.network
            .probe_device(ip, params.port, protocol)
            .await
            .map(Json)
            .map_err(display_error)
    }

    /// Trust a discovered peer after its fingerprint has been verified out-of-band.
    #[tool]
    pub async fn pair_device(
        &self,
        Parameters(params): Parameters<FingerprintParams>,
    ) -> Result<Json<TrustedPeerView>, String> {
        self.network
            .pair_device(&params.fingerprint)
            .await
            .map(TrustedPeerView::from)
            .map(Json)
            .map_err(display_error)
    }

    /// Remove a peer from the trust store.
    #[tool]
    pub async fn unpair_device(
        &self,
        Parameters(params): Parameters<FingerprintParams>,
    ) -> Result<Json<UnpairResult>, String> {
        self.network
            .unpair_device(&params.fingerprint)
            .await
            .map(|removed| Json(UnpairResult { removed }))
            .map_err(display_error)
    }

    /// List identities currently trusted by this peer.
    #[tool]
    pub async fn list_trusted_devices(&self) -> Json<TrustedDeviceList> {
        Json(TrustedDeviceList {
            devices: self
                .network
                .trusted_devices()
                .await
                .into_iter()
                .map(TrustedPeerView::from)
                .collect(),
        })
    }

    /// Send a text message to a paired peer. The recipient reads it with list_inbox or read_inbox.
    #[tool]
    pub async fn send_message(
        &self,
        Parameters(params): Parameters<SendMessageParams>,
    ) -> Result<Json<TransferResult>, String> {
        self.network
            .send_message(
                &params.target_fingerprint,
                &params.message,
                params.pin.as_deref(),
            )
            .await
            .map(Json)
            .map_err(display_error)
    }

    /// Send files to a paired peer. Files must be within roots allowed when this MCP server started.
    #[tool]
    pub async fn send_files(
        &self,
        Parameters(params): Parameters<SendFilesParams>,
    ) -> Result<Json<TransferResult>, String> {
        self.network
            .send_files(
                &params.target_fingerprint,
                params.paths.into_iter().map(PathBuf::from).collect(),
                params.pin.as_deref(),
            )
            .await
            .map(Json)
            .map_err(display_error)
    }

    /// List durable messages and received files, newest first. This does not mark items as read.
    #[tool]
    pub async fn list_inbox(
        &self,
        Parameters(params): Parameters<ListInboxParams>,
    ) -> Json<InboxList> {
        Json(InboxList {
            items: self
                .network
                .list_inbox(
                    params.unread_only.unwrap_or(false),
                    params.limit.unwrap_or(20).min(100),
                )
                .await,
        })
    }

    /// Return one inbox item and mark it as read.
    #[tool]
    pub async fn read_inbox(
        &self,
        Parameters(params): Parameters<ReadInboxParams>,
    ) -> Result<Json<InboxItem>, String> {
        self.network
            .read_inbox(&params.id)
            .await
            .map_err(display_error)?
            .map(Json)
            .ok_or_else(|| format!("inbox item not found: {}", params.id))
    }
}

#[tool_handler(router = self.tool_router)]
impl ServerHandler for LocalSendMcp {
    fn get_info(&self) -> ServerInfo {
        ServerInfo::new(ServerCapabilities::builder().enable_tools().build())
            .with_server_info(Implementation::new(
                "localsend-mcp",
                env!("CARGO_PKG_VERSION"),
            ))
            .with_instructions(
                "Send data between agents through LocalSend. Discover or probe a peer, compare both fingerprints out-of-band, and pair each direction before sending. Poll list_inbox for incoming data. LAN multicast works automatically; probe_device supports reachable peers over a VPN or routed network.",
            )
    }
}

fn display_error(error: anyhow::Error) -> String {
    format!("{error:#}")
}
