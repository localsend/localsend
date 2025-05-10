use localsend::webrtc::signaling::{ClientInfoWithoutId, WsServerMessage};
use std::collections::HashMap;
use std::sync::Arc;
use tokio::sync::{mpsc, Mutex};
use uuid::Uuid;

/// IP -> Peer ID -> PeerInfo + WebSocket message sender.
pub type TxMap = Arc<Mutex<HashMap<String, HashMap<Uuid, ClientState>>>>;

pub struct ClientState {
    pub client: ClientInfoWithoutId,
    pub tx: mpsc::Sender<WsServerMessage>,
}

pub type IpRequestCountMap = Arc<Mutex<HashMap<String, u32>>>;

#[derive(Clone)]
pub struct AppState {
    /// Map of peer IDs to WebSocket message senders.
    pub tx_map: TxMap,

    /// Map of IP addresses to the number of requests.
    pub request_count_map: IpRequestCountMap,
}

impl AppState {
    pub fn new() -> Self {
        Self {
            tx_map: Arc::new(Mutex::new(HashMap::new())),
            request_count_map: Arc::new(Mutex::new(HashMap::new())),
        }
    }
}
