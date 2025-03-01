use crate::config::error::AppError;
use crate::config::state::{AppState, ClientState, IpRequestCountMap, TxMap};
use crate::util;
use crate::util::ip::get_ip_group;
use axum::body::Body;
use axum::extract::ws::{Message, WebSocket};
use axum::extract::{ConnectInfo, Query, State, WebSocketUpgrade};
use axum::http::{HeaderMap, StatusCode};
use axum::response::Response;
use futures_util::stream::StreamExt;
use futures_util::SinkExt;
use localsend::webrtc::signaling::{
    ClientInfo, ClientInfoWithoutId, WsClientMessage, WsClientSdpMessage, WsServerMessage,
    WsServerSdpMessage,
};
use serde::Deserialize;
use std::collections::HashMap;
use std::net::{IpAddr, SocketAddr};
use std::str::FromStr;
use std::sync::LazyLock;
use tokio::sync::mpsc;
use uuid::Uuid;

static MAX_CONNECTIONS: LazyLock<usize> = LazyLock::new(|| {
    std::env::var("MAX_CONNECTIONS_PER_IP")
        .unwrap_or_else(|_| "10".to_string())
        .parse::<usize>()
        .unwrap()
});

static MAX_REQUESTS: LazyLock<u32> = LazyLock::new(|| {
    std::env::var("MAX_REQUESTS_PER_IP_PER_HOUR")
        .unwrap_or_else(|_| "1000".to_string())
        .parse::<u32>()
        .unwrap()
});

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
    headers: HeaderMap,
) -> Result<Response<Body>, AppError> {
    let peer_info = {
        let base64_decoded: Vec<u8> = util::base64::decode(&payload.d)
            .map_err(|_| AppError::status(StatusCode::BAD_REQUEST, None))?;

        let base64_decoded: String = String::from_utf8(base64_decoded)
            .map_err(|_| AppError::status(StatusCode::BAD_REQUEST, None))?;

        let register_dto = serde_json::from_str::<ClientInfoWithoutId>(&base64_decoded)
            .map_err(|_| AppError::status(StatusCode::BAD_REQUEST, None))?;

        ClientInfo::from(register_dto.clone(), Uuid::new_v4())
    };

    let ip = {
        // Prefer the forwarded IP if available.
        let raw_forwarded = headers
            .get("x-forwarded-for")
            .and_then(|v| v.to_str().ok())
            .and_then(|v| v.split(',').last()) // Get the last component
            .map(|v| v.trim().to_string())
            .and_then(|v| IpAddr::from_str(&v).ok());

        raw_forwarded.unwrap_or(addr.ip())
    };

    Ok(ws.on_upgrade(move |socket| {
        handle_socket(
            state.tx_map,
            state.request_count_map,
            socket,
            get_ip_group(ip),
            peer_info,
        )
    }))
}

/// The websocket context (one per connected device) is handled here.
async fn handle_socket(
    tx_map: TxMap,
    request_count_map: IpRequestCountMap,
    socket: WebSocket,
    ip_group: String,
    peer: ClientInfo,
) {
    let peer_id = peer.id;
    let (tx, mut rx) = mpsc::channel(4);
    {
        // Tx of other peers in the IP group.
        let mut peers_tx: Vec<mpsc::Sender<WsServerMessage>> = Vec::new();

        // Peers in the IP group including the current user.
        let mut peers: Vec<ClientInfo> = Vec::new();

        // If the limit of connections is reached.
        // Used to break out of the lock as early as possible.
        let mut limit_reached = false;

        'lock: {
            let mut tx_map = tx_map.lock().await;

            let tx_local_map = tx_map.entry(ip_group.clone()).or_insert_with(HashMap::new);
            if tx_local_map.len() >= *MAX_CONNECTIONS {
                limit_reached = true;
                break 'lock;
            }

            if protect_ddos_request_count(&request_count_map, &ip_group)
                .await
                .is_err()
            {
                limit_reached = true;
                break 'lock;
            }

            peers_tx = tx_local_map.values().map(|p| p.tx.clone()).collect();

            peers = tx_local_map
                .iter()
                .map(|(k, v)| ClientInfo::from(v.client.clone(), *k))
                .collect();

            tx_local_map.insert(
                peer_id,
                ClientState {
                    client: ClientInfoWithoutId::from(peer.clone()),
                    tx: tx.clone(),
                },
            );

            let debug_active_connections = tx_map.len();
            let debug_total_active_connections: usize = tx_map.values().map(|m| m.len()).sum();
            tracing::info!("Connect: {ip_group} / {peer_id} (active: {debug_active_connections}, total active: {debug_total_active_connections})");
        }

        if limit_reached {
            let (mut sender, _) = socket.split();
            let _ = sender.send(Message::Text("Limit reached".into())).await;
            let _ = sender.close().await;
            return;
        }

        for peer_tx in peers_tx {
            let _ = peer_tx
                .send(WsServerMessage::Join { peer: peer.clone() })
                .await;
        }

        let _ = tx
            .send(WsServerMessage::Hello {
                client: peer.clone(),
                peers,
            })
            .await;
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

    let tx_map_clone = tx_map.clone();
    let ip_group_clone = ip_group.clone();
    let mut recv_task = tokio::spawn(async move {
        while let Some(Ok(msg)) = receiver.next().await {
            if let Message::Text(text) = msg {
                if let Ok(msg) = serde_json::from_str::<WsClientMessage>(&text) {
                    if protect_ddos_request_count(&request_count_map, &ip_group_clone)
                        .await
                        .is_err()
                    {
                        let _ = tx
                            .send(WsServerMessage::Error {
                                code: StatusCode::TOO_MANY_REQUESTS.as_u16(),
                            })
                            .await;
                        return;
                    }

                    match msg {
                        WsClientMessage::Update { info } => {
                            send_update_to_other_peers_with_lock(
                                &tx_map_clone,
                                &ip_group_clone,
                                peer_id,
                                info,
                            )
                            .await
                        }
                        WsClientMessage::Offer(sdp) => {
                            send_to_peer_with_lock(
                                &tx_map_clone,
                                &ip_group_clone,
                                peer.clone(),
                                WsClientSdpMessageWrapper::Offer(sdp),
                            )
                            .await
                        }
                        WsClientMessage::Answer(sdp) => {
                            send_to_peer_with_lock(
                                &tx_map_clone,
                                &ip_group_clone,
                                peer.clone(),
                                WsClientSdpMessageWrapper::Answer(sdp),
                            )
                            .await
                        }
                    }
                }
            }
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

    let mut remaining_tx: Vec<mpsc::Sender<WsServerMessage>> = Vec::new();

    {
        let mut tx_map = tx_map.lock().await;
        let final_active_connections = match tx_map.get_mut(&ip_group) {
            Some(tx_local_map) => {
                tx_local_map.remove(&peer_id);
                if tx_local_map.is_empty() {
                    tx_map.remove(&ip_group);
                    0
                } else {
                    remaining_tx = tx_local_map.values().map(|p| p.tx.clone()).collect();
                    tx_local_map.len()
                }
            }
            None => 0,
        };

        tracing::info!("Disconnect: {peer_id} (active: {final_active_connections})");
    }

    for tx in remaining_tx {
        let _ = tx.send(WsServerMessage::Left { peer_id }).await;
    }
}

async fn send_update_to_other_peers_with_lock(
    tx_map: &TxMap,
    ip_group: &str,
    peer_id: Uuid,
    info: ClientInfoWithoutId,
) {
    // Tx of other peers in the IP group.
    let mut peers_tx: Vec<mpsc::Sender<WsServerMessage>> = Vec::new();
    let response_info = ClientInfo::from(info.clone(), peer_id);
    {
        let mut tx_map = tx_map.lock().await;
        if let Some(tx_local_map) = tx_map.get_mut(ip_group) {
            if let Some(peer_state) = tx_local_map.get_mut(&peer_id) {
                peer_state.client = info;

                peers_tx = tx_local_map
                    .iter()
                    .filter(|(k, _)| *k != &peer_id)
                    .map(|(_, v)| v.tx.clone())
                    .collect();
            }
        }
    }

    for peer_tx in peers_tx {
        let _ = peer_tx
            .send(WsServerMessage::Update {
                peer: response_info.clone(),
            })
            .await;
    }
}

enum WsClientSdpMessageWrapper {
    Offer(WsClientSdpMessage),
    Answer(WsClientSdpMessage),
}

async fn send_to_peer_with_lock(
    tx_map: &TxMap,
    ip_group: &str,
    origin_peer: ClientInfo,
    message: WsClientSdpMessageWrapper,
) {
    let target = match &message {
        WsClientSdpMessageWrapper::Offer(inner) => inner.target,
        WsClientSdpMessageWrapper::Answer(inner) => inner.target,
    };

    let mut target_peer_tx: Option<mpsc::Sender<WsServerMessage>> = None;
    {
        let tx_map = tx_map.lock().await;
        if let Some(tx_local_map) = tx_map.get(ip_group) {
            if let Some(peer_state) = tx_local_map.get(&target) {
                target_peer_tx = Some(peer_state.tx.clone());
            }
        }
    }

    if let Some(tx) = target_peer_tx {
        let server_message = match message {
            WsClientSdpMessageWrapper::Offer(inner) => {
                let sdp_message = WsServerSdpMessage {
                    peer: origin_peer,
                    session_id: inner.session_id,
                    sdp: inner.sdp,
                };
                WsServerMessage::Offer(sdp_message)
            }
            WsClientSdpMessageWrapper::Answer(inner) => {
                let sdp_message = WsServerSdpMessage {
                    peer: origin_peer,
                    session_id: inner.session_id,
                    sdp: inner.sdp,
                };
                WsServerMessage::Answer(sdp_message)
            }
        };

        let _ = tx.send(server_message).await;
    }
}

async fn protect_ddos_request_count(
    request_count_map: &IpRequestCountMap,
    ip_group: &str,
) -> Result<(), AppError> {
    let mut request_count_map = request_count_map.lock().await;
    let count = request_count_map.entry(ip_group.to_string()).or_insert(0);
    if *count >= *MAX_REQUESTS {
        return Err(AppError::status(StatusCode::TOO_MANY_REQUESTS, None));
    }
    *count += 1;
    Ok(())
}
