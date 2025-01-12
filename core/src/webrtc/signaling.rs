use crate::util::base64;
use anyhow::Result;
use futures_util::stream::StreamExt;
use futures_util::SinkExt;
use serde::{Deserialize, Serialize};
use std::cmp::PartialEq;
use std::collections::HashMap;
use std::sync::Arc;
use tokio::sync::{mpsc, Mutex};
use tokio::time::Duration;
#[cfg(feature = "webrtc-signaling")]
use tokio_tungstenite::connect_async;
#[cfg(feature = "webrtc-signaling")]
use tungstenite::{Bytes, Message};
use uuid::Uuid;

/// A message sent by the server to the client.
#[derive(Clone, Deserialize, Serialize, Debug)]
#[serde(rename_all = "camelCase")]
pub struct WsServerMessage {
    #[serde(rename = "type")]
    pub ws_type: WsMessageType,

    /// The list of members (excluding the client) in the IP room.
    /// Available only for `Hello`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub members: Option<Vec<PeerInfo>>,

    /// The client that has just connected.
    /// Only available for `Hello`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub client: Option<PeerInfo>,

    /// The peer that triggered the message.
    /// Available only for `Joined`, `Offer`, and `Answer`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub peer: Option<PeerInfo>,

    /// The ID of the peer that triggered the message.
    /// Available only for `Left`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub peer_id: Option<Uuid>,

    /// The session ID of the offer or answer.
    /// Available only for `Offer` and `Answer`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub session_id: Option<String>,

    /// The SDP string if the message is an offer or answer.
    /// Compressed with Brotli, then encoded with base64 without padding.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub sdp: Option<String>,

    /// The error code if the message is an error.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub code: Option<u16>,
}

#[derive(Clone, Debug, Deserialize, Eq, Serialize, PartialEq)]
#[serde(rename_all = "camelCase")]
pub enum WsMessageType {
    /// The initial message sent to the client that has just connected.
    /// Contains the list of peers in the IP room.
    Hello,

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

    /// Error.
    Error,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct PeerInfo {
    /// The ID of the peer. Generated by the server.
    pub id: Uuid,

    /// A fingerprint generated by the client.
    /// Used to merge the same peers detected on different channels (LAN, WebRTC, etc.).
    pub fingerprint: String,

    /// The name of the peer.
    pub alias: String,

    /// The device model of the peer.
    /// Windows, macOS, iPhone, Samsung, etc.
    pub device_model: String,

    /// The device type of the peer.
    pub device_type: PeerDeviceType,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
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
#[derive(Clone, Deserialize, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct PeerInfoWithoutId {
    /// The name of the peer.
    pub alias: String,

    /// A fingerprint generated by the client.
    /// Used to merge the same peers detected on different channels (LAN, WebRTC, etc.).
    pub fingerprint: String,

    /// The device model of the peer.
    /// Windows, macOS, iPhone, Samsung, etc.
    pub device_model: String,

    /// The device type of the peer.
    pub device_type: PeerDeviceType,
}

/// The HTTP request sent by the client to the server.
#[derive(Clone, Deserialize, Serialize, Debug)]
#[serde(rename_all = "camelCase")]
pub struct WsClientMessage {
    #[serde(rename = "type")]
    pub ws_type: WsClientMessageType,

    /// The session id to correctly associate answers with offers.
    /// Generated by the client (the peer that sends the offer).
    pub session_id: String,

    /// Target peer ID.
    pub target: Uuid,

    /// The SDP offer.
    /// Compressed with Brotli, then encoded with base64 without padding.
    pub sdp: String,
}

#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(rename_all = "camelCase")]
pub enum WsClientMessageType {
    /// SDP offer from a peer to another peer.
    Offer,

    /// SDP answer from a peer to another peer.
    Answer,
}

pub struct SignalingConnection {
    /// The peer info received from the server of the client.
    pub client: PeerInfo,

    /// The sender to send messages to the server.
    pub tx: mpsc::Sender<WsClientMessage>,

    /// The receiver to receive messages from the server.
    pub rx: mpsc::Receiver<WsServerMessage>,
}

#[cfg(feature = "webrtc-signaling")]
impl SignalingConnection {
    pub async fn connect<S: Into<String>>(
        uri: S,
        info: &PeerInfoWithoutId,
    ) -> Result<SignalingConnection> {
        let encoded_info = base64::encode(&serde_json::to_string(info)?);
        let uri = format!("{}?d={}", uri.into(), encoded_info);

        tracing::debug!("Connecting to the signaling server at {uri}");

        let (ws_stream, _) = connect_async(&uri).await?;

        tracing::debug!("Connected to the signaling server. Waiting for the hello message...");

        let (mut write, read) = ws_stream.split();

        let (send_tx, mut send_rx) = mpsc::channel(1);

        tokio::spawn(async move {
            let timeout = Duration::from_secs(120);
            loop {
                let send_result = tokio::time::timeout(timeout, async {
                    if let Some(message) = send_rx.recv().await {
                        let message =
                            serde_json::to_string(&message).expect("Failed to serialize message");
                        if write.send(Message::Text(message.into())).await.is_ok() {
                            return true;
                        }
                    }

                    false
                })
                .await;

                match send_result {
                    Ok(success) => {
                        if !success {
                            return;
                        }
                    }
                    Err(_) => {
                        // Timeout: send a ping message to keep the connection alive
                        if write.send(Message::Ping(Bytes::new())).await.is_err() {
                            return;
                        }
                    }
                }
            }
        });

        let (receive_tx, receive_rx) = mpsc::channel(1);
        let (client_tx, mut client_rx) = mpsc::channel::<PeerInfo>(1);

        tokio::spawn(async move {
            read.for_each(|message| async {
                if let Ok(Message::Text(message)) = message {
                    match serde_json::from_str::<WsServerMessage>(&message) {
                        Ok(message) => {
                            if message.ws_type == WsMessageType::Hello {
                                if let Some(client) = message.client.clone() {
                                    if client_tx.send(client).await.is_err() {
                                        return;
                                    }
                                }
                            }
                            match receive_tx.send(message).await {
                                Ok(_) => {}
                                Err(e) => tracing::error!("{e:?}"),
                            }
                        }
                        Err(_) => tracing::error!("Server: {message}"),
                    }
                }
            })
            .await;
        });

        let client = client_rx.recv().await.unwrap();

        tracing::debug!("Received hello message from the server: {client:?}");

        Ok(SignalingConnection {
            client,
            tx: send_tx,
            rx: receive_rx,
        })
    }

    /// Listen for incoming messages from the server.
    /// Upgrades the API to a higher-level API.
    pub fn start_listener(
        mut self,
    ) -> (ManagedSignalingConnection, mpsc::Receiver<WsServerMessage>) {
        let (tx, rx) = mpsc::channel::<WsServerMessage>(16);
        let on_answer: Arc<Mutex<HashMap<String, AnswerCallback>>> =
            Arc::new(Mutex::new(HashMap::new()));

        {
            let on_answer = on_answer.clone();
            tokio::spawn(async move {
                while let Some(message) = self.rx.recv().await {
                    if message.ws_type == WsMessageType::Answer {
                        if let Some(callback) = on_answer
                            .lock()
                            .await
                            .remove(&message.session_id.as_ref().unwrap().clone())
                        {
                            callback(message.clone());
                        }
                    }
                    tx.send(message).await.unwrap();
                }
            });
        }

        (
            ManagedSignalingConnection {
                client: self.client,
                tx: self.tx,
                on_answer,
            },
            rx,
        )
    }

    pub async fn send_offer(&self, session_id: String, target: Uuid, sdp: String) -> Result<()> {
        send_offer(&self.tx, session_id, target, sdp).await?;

        Ok(())
    }

    pub async fn send_answer(&self, session_id: String, target: Uuid, sdp: String) -> Result<()> {
        send_answer(&self.tx, session_id, target, sdp).await?;

        Ok(())
    }
}

type AnswerCallback = Box<dyn FnOnce(WsServerMessage) + Send + Sync>;

pub struct ManagedSignalingConnection {
    /// The peer info received from the server of the client.
    pub client: PeerInfo,
    tx: mpsc::Sender<WsClientMessage>,
    on_answer: Arc<Mutex<HashMap<String, AnswerCallback>>>,
}

#[cfg(feature = "webrtc-signaling")]
impl ManagedSignalingConnection {
    pub async fn send_offer(&self, session_id: String, target: Uuid, sdp: String) -> Result<()> {
        send_offer(&self.tx, session_id, target, sdp).await?;

        Ok(())
    }

    pub async fn send_answer(&self, session_id: String, target: Uuid, sdp: String) -> Result<()> {
        send_answer(&self.tx, session_id, target, sdp).await?;

        Ok(())
    }

    /// Adds a callback to be called when an answer having a specific `session_id` is received.
    pub async fn on_answer<F>(&self, session_id: String, callback: F)
    where
        F: FnOnce(WsServerMessage) + Send + Sync + 'static,
    {
        let mut callbacks = self.on_answer.lock().await;
        callbacks.insert(session_id, Box::new(callback));
    }
}

async fn send_offer(
    tx: &mpsc::Sender<WsClientMessage>,
    session_id: String,
    target: Uuid,
    sdp: String,
) -> Result<()> {
    tx.send(WsClientMessage {
        ws_type: WsClientMessageType::Offer,
        session_id: session_id.clone(),
        target,
        sdp,
    })
    .await?;

    tracing::debug!("Sent offer to {target} with session ID {session_id}");

    Ok(())
}

async fn send_answer(
    tx: &mpsc::Sender<WsClientMessage>,
    session_id: String,
    target: Uuid,
    sdp: String,
) -> Result<()> {
    tx.send(WsClientMessage {
        ws_type: WsClientMessageType::Answer,
        session_id: session_id.clone(),
        target,
        sdp,
    })
    .await?;

    tracing::debug!("Sent answer to {target} with session ID {session_id}");

    Ok(())
}
