use crate::config::error::AppError;
use crate::config::state::{AppState, TxMap};
use crate::util;
use crate::util::ip::get_ip_group;
use axum::body::Body;
use axum::extract::ws::{Message, WebSocket};
use axum::extract::{ConnectInfo, Query, State, WebSocketUpgrade};
use axum::http::StatusCode;
use axum::response::Response;
use futures_util::stream::StreamExt;
use futures_util::SinkExt;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::net::SocketAddr;
use std::sync::LazyLock;
use tokio::sync::mpsc;
use uuid::Uuid;

static MAX_CONNECTIONS: LazyLock<usize> = LazyLock::new(|| {
    std::env::var("MAX_CONNECTIONS_PER_IP")
        .unwrap_or_else(|_| "10".to_string())
        .parse::<usize>()
        .unwrap()
});

/// A message sent by the server to the client.
#[derive(Clone, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct WsServerMessage {
    #[serde(rename = "type")]
    pub ws_type: WsMessageType,

    /// The peer that triggered the message.
    /// Available only for `Joined` and `Offer` types.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub peer: Option<PeerInfo>,

    /// The ID of the peer that triggered the message.
    /// Available only for `Left` and `Answer` types.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub peer_id: Option<Uuid>,

    /// The SDP string if the message is an offer or answer.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub sdp: Option<String>,
}

#[derive(Clone, Serialize)]
#[serde(rename_all = "camelCase")]
pub enum WsMessageType {
    /// A new peer has joined the IP room.
    /// Broadcasted to all peers.
    Joined,

    /// A peer has left the IP room.
    /// Broadcasted to all peers.
    Left,

    /// SDP offer from a peer to another peer.
    Offer,

    /// SDP answer from a peer to another peer.
    Answer,
}

#[derive(Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct PeerInfo {
    /// The ID of the peer.
    pub id: Uuid,

    /// The name of the peer.
    pub alias: String,

    /// The device model of the peer.
    /// Windows, macOS, iPhone, Samsung, etc.
    pub device_model: String,

    /// The device type of the peer.
    pub device_type: PeerDeviceType,
}

#[derive(Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub enum PeerDeviceType {
    Mobile,
    Desktop,
    Web,
    Headless,
    Server,
}

/// The data that is encoded as JSON which is again encoded as base64.
/// Sent as query during websocket connection.
#[derive(Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct PeerRegisterDto {
    /// The name of the peer.
    pub alias: String,

    /// The device model of the peer.
    /// Windows, macOS, iPhone, Samsung, etc.
    pub device_model: String,

    /// The device type of the peer.
    pub device_type: PeerDeviceType,
}

#[derive(Deserialize)]
pub struct WsQuery {
    /// `PeerRegisterDto` encoded as base64.
    pub d: String,
}

pub async fn ws_handler(
    State(state): State<AppState>,
    ws: WebSocketUpgrade,
    Query(payload): Query<WsQuery>,
    ConnectInfo(addr): ConnectInfo<SocketAddr>,
) -> Result<Response<Body>, AppError> {
    let peer_info = {
        let base64_decoded: Vec<u8> = util::base64::decode(&payload.d)
            .map_err(|_| AppError::status(StatusCode::BAD_REQUEST, None))?;

        let base64_decoded: String = String::from_utf8(base64_decoded)
            .map_err(|_| AppError::status(StatusCode::BAD_REQUEST, None))?;

        let register_dto = serde_json::from_str::<PeerRegisterDto>(&base64_decoded)
            .map_err(|_| AppError::status(StatusCode::BAD_REQUEST, None))?;

        PeerInfo {
            id: Uuid::new_v4(),
            alias: register_dto.alias,
            device_model: register_dto.device_model,
            device_type: register_dto.device_type,
        }
    };

    let tx_map_clone = state.tx_map.clone();
    let ip_group = get_ip_group(addr.ip());

    Ok(ws.on_upgrade(move |socket| handle_socket(tx_map_clone, socket, ip_group, peer_info)))
}

/// The websocket context (one per connected device) is handled here.
async fn handle_socket(tx_map: TxMap, socket: WebSocket, ip_group: String, peer: PeerInfo) {
    let peer_id = peer.id;
    let (tx, mut rx) = mpsc::channel(4);
    {
        let mut tx_map = tx_map.lock().await;

        let tx_local_map = tx_map.entry(ip_group.clone()).or_insert_with(HashMap::new);
        if tx_local_map.len() >= *MAX_CONNECTIONS {
            let (mut sender, _) = socket.split();
            let _ = sender
                .send(Message::Text("Max connections reached".into()))
                .await;
            let _ = sender.close().await;
            return;
        }

        broadcast_to_group(
            &WsServerMessage {
                ws_type: WsMessageType::Joined,
                peer: Some(peer),
                peer_id: None,
                sdp: None,
            },
            &tx_local_map,
        )
        .await;

        tx_local_map.insert(peer_id, tx);

        let debug_active_connections = tx_map.len();
        let debug_total_active_connections: usize = tx_map.values().map(|m| m.len()).sum();
        drop(tx_map);
        tracing::info!("Connect: {peer_id} (active: {debug_active_connections}, total active: {debug_total_active_connections})");
    }

    let (mut sender, mut receiver) = socket.split();

    let mut send_task = tokio::spawn(async move {
        while let Some(msg) = rx.recv().await {
            let serialized = serde_json::to_string(&msg).unwrap();
            drop(msg);

            if sender.send(Message::Text(serialized.into())).await.is_err() {
                break;
            }
        }
    });

    let mut recv_task = tokio::spawn(async move {
        while let Some(Ok(_)) = receiver.next().await {
            // We do not expect any messages from the client.
        }
    });

    // If any one of the tasks exit, abort the other.
    tokio::select! {
        rv_a = &mut send_task => {
            match rv_a {
                Ok(_) => (),
                Err(e) => tracing::warn!("Error sending messages {e:?}")
            }
            recv_task.abort();
        },
        rv_b = &mut recv_task => {
            match rv_b {
                Ok(_) => (),
                Err(e) => tracing::warn!("Error receiving messages {e:?}")
            }
            send_task.abort();
        }
    }

    // Wait for "rx" to be dropped (ensured by the select! macro)
    // When the "rx" is dropped, the corresponding "tx" will be closed as well.
    let _ = send_task.await;

    {
        let mut tx_map = tx_map.lock().await;
        let final_active_connections = match tx_map.get_mut(&ip_group) {
            Some(tx_local_map) => {
                tx_local_map.remove(&peer_id);
                if tx_local_map.is_empty() {
                    tx_map.remove(&ip_group);
                    0
                } else {
                    broadcast_to_group(
                        &WsServerMessage {
                            ws_type: WsMessageType::Left,
                            peer: None,
                            peer_id: Some(peer_id),
                            sdp: None,
                        },
                        &tx_local_map,
                    )
                    .await;
                    tx_local_map.len()
                }
            }
            None => 0,
        };

        tracing::info!("Disconnect: {peer_id} (active: {final_active_connections})");
    }
}

pub(crate) async fn broadcast_to_group(
    message: &WsServerMessage,
    tx_local_map: &HashMap<Uuid, mpsc::Sender<WsServerMessage>>,
) {
    for (_, tx) in tx_local_map.iter() {
        let _ = tx.send(message.clone()).await;
    }
}

pub(crate) async fn send_to_peer_with_lock(
    ip_group: String,
    peer_id: Uuid,
    message: &WsServerMessage,
    tx_map: &TxMap,
) {
    if let Some(tx_local_map) = tx_map.lock().await.get(&ip_group) {
        if let Some(tx) = tx_local_map.get(&peer_id) {
            let _ = tx.send(message.clone()).await;
        }
    }
}
