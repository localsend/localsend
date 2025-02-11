use crate::model::discovery::DeviceType;
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
#[derive(Clone, Deserialize, Eq, Serialize, Debug, PartialEq)]
#[serde(tag = "type", rename_all = "camelCase")]
pub enum WsServerMessage {
    /// The initial message sent to the client that has just connected.
    Hello {
        /// The client that has just connected.
        client: ClientInfo,

        /// The list of members (excluding the client) in the IP room.
        peers: Vec<ClientInfo>,
    },

    /// A new peer has joined the IP room.
    Join {
        /// The peer that triggered the message.
        peer: ClientInfo,
    },

    /// A peer has updated its information.
    Update {
        /// The peer that triggered the message.
        peer: ClientInfo,
    },

    /// A peer has left the IP room.
    Left {
        /// The ID of the peer that triggered the message.
        #[serde(rename = "peerId")]
        peer_id: Uuid,
    },

    /// SDP offer from a peer to another peer.
    Offer(WsServerSdpMessage),

    /// SDP answer from a peer to another peer.
    Answer(WsServerSdpMessage),

    /// Error message.
    Error {
        /// The error code.
        code: u16,
    },
}

#[derive(Clone, Deserialize, Eq, Serialize, Debug, PartialEq)]
#[serde(rename_all = "camelCase")]
pub struct WsServerSdpMessage {
    /// The peer that triggered the message.
    pub peer: ClientInfo,

    /// The session ID of the answer.
    pub session_id: String,

    /// The SDP string for the answer.
    /// Compressed with zlib, then encoded with base64 without padding.
    pub sdp: String,
}

#[derive(Clone, Debug, Deserialize, Eq, Serialize, PartialEq)]
#[serde(rename_all = "camelCase")]
pub struct ClientInfo {
    /// The ID of the peer. Generated by the server.
    pub id: Uuid,

    /// The name of the peer.
    pub alias: String,

    /// Client Protocol Version (major.minor)
    pub version: String,

    /// The device model of the peer.
    /// Windows, macOS, iPhone, Samsung, etc.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_model: Option<String>,

    /// The device type of the peer.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_type: Option<DeviceType>,

    /// A fingerprint generated by the client.
    /// Used to merge the same peers detected on different channels (LAN, WebRTC, etc.).
    pub fingerprint: String,
}

/// The data that is encoded as JSON which is again encoded as base64.
/// Sent as query during websocket connection.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct ClientInfoWithoutId {
    /// The name of the peer.
    pub alias: String,

    /// Client Protocol Version (major.minor)
    pub version: String,

    /// The device model of the peer.
    /// Windows, macOS, iPhone, Samsung, etc.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_model: Option<String>,

    /// The device type of the peer.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_type: Option<DeviceType>,

    /// A fingerprint generated by the client.
    /// Used to merge the same peers detected on different channels (LAN, WebRTC, etc.).
    pub fingerprint: String,
}

/// The HTTP request sent by the client to the server.
#[derive(Clone, Deserialize, Serialize, Debug)]
#[serde(tag = "type", rename_all = "camelCase")]
pub enum WsClientMessage {
    Update(ClientInfoWithoutId),
    Offer(WsClientSdpMessage),
    Answer(WsClientSdpMessage),
}

#[derive(Clone, Deserialize, Serialize, Debug)]
#[serde(tag = "type", rename_all = "camelCase")]
pub struct WsClientSdpMessage {
    /// The session id to correctly associate answers with offers.
    /// Generated by the client (the peer that sends the offer).
    pub session_id: String,

    /// Target peer ID.
    pub target: Uuid,

    /// The SDP offer.
    /// Compressed with zlib, then encoded with base64 without padding.
    pub sdp: String,
}

pub struct SignalingConnection {
    /// The peer info received from the server of the client.
    pub client: ClientInfo,

    /// The sender to send messages to the server.
    pub tx: mpsc::Sender<WsClientMessage>,

    /// The receiver to receive messages from the server.
    pub rx: mpsc::Receiver<WsServerMessage>,
}

#[cfg(feature = "webrtc-signaling")]
impl SignalingConnection {
    pub async fn connect<S: Into<String>>(
        uri: S,
        info: &ClientInfoWithoutId,
    ) -> Result<SignalingConnection> {
        let encoded_info = base64::encode(&serde_json::to_string(info)?);
        let uri = format!("{}?d={}", uri.into(), encoded_info);

        tracing::debug!("Connecting to the signaling server at {uri}");

        let (ws_stream, _) = connect_async(&uri).await?;

        tracing::debug!("Connected to the signaling server. Waiting for hello...");

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
        let (client_tx, mut client_rx) = mpsc::channel::<ClientInfo>(1);

        tokio::spawn(async move {
            read.for_each(|message| async {
                if let Ok(Message::Text(message)) = message {
                    match serde_json::from_str::<WsServerMessage>(&message) {
                        Ok(message) => {
                            if let WsServerMessage::Hello {
                                client,
                                peers: _peers,
                            } = &message
                            {
                                if client_tx.send(client.clone()).await.is_err() {
                                    return;
                                }
                            }

                            match receive_tx.send(message).await {
                                Ok(_) => {}
                                Err(e) => tracing::error!("{e:?}"),
                            }
                        }
                        Err(e) => tracing::error!("Error: {e}, Server: {message}"),
                    }
                }
            })
            .await;
        });

        let client = client_rx.recv().await.unwrap();

        tracing::debug!("Received hello from server: {client:?}");

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
                    // send answer
                    if let WsServerMessage::Answer(sdp) = message.clone() {
                        if let Some(callback) = on_answer.lock().await.remove(&sdp.session_id) {
                            callback(sdp);
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

    pub async fn send_update(&self, info: ClientInfoWithoutId) -> Result<()> {
        send_update(&self.tx, info).await?;

        Ok(())
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

type AnswerCallback = Box<dyn FnOnce(WsServerSdpMessage) + Send + Sync>;

pub struct ManagedSignalingConnection {
    /// The peer info received from the server of the client.
    pub client: ClientInfo,
    tx: mpsc::Sender<WsClientMessage>,
    on_answer: Arc<Mutex<HashMap<String, AnswerCallback>>>,
}

#[cfg(feature = "webrtc-signaling")]
impl ManagedSignalingConnection {
    pub async fn send_update(&self, info: ClientInfoWithoutId) -> Result<()> {
        send_update(&self.tx, info).await?;

        Ok(())
    }

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
        F: FnOnce(WsServerSdpMessage) + Send + Sync + 'static,
    {
        let mut callbacks = self.on_answer.lock().await;
        callbacks.insert(session_id, Box::new(callback));
    }
}

async fn send_update(
    tx: &mpsc::Sender<WsClientMessage>,
    info: ClientInfoWithoutId,
) -> Result<()> {
    tx.send(WsClientMessage::Update(info))
        .await?;

    tracing::debug!("Sent update to the server");

    Ok(())
}

async fn send_offer(
    tx: &mpsc::Sender<WsClientMessage>,
    session_id: String,
    target: Uuid,
    sdp: String,
) -> Result<()> {
    tx.send(WsClientMessage::Offer(WsClientSdpMessage {
        session_id: session_id.clone(),
        target,
        sdp,
    }))
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
    tx.send(WsClientMessage::Answer(WsClientSdpMessage {
        session_id: session_id.clone(),
        target,
        sdp,
    }))
    .await?;

    tracing::debug!("Sent answer to {target} with session ID {session_id}");

    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn ws_server_hello_message_encoding() {
        let message = WsServerMessage::Hello {
            client: ClientInfo {
                id: Uuid::nil(),
                alias: "Cute Apple".to_string(),
                version: "2.3".to_string(),
                device_model: Some("Dell".to_string()),
                device_type: Some(DeviceType::Desktop),
                fingerprint: "123".to_string(),
            },
            peers: vec![],
        };

        let encoded = serde_json::to_string_pretty(&message).unwrap();

        assert_eq!(
            encoded,
            r#"{
  "type": "hello",
  "client": {
    "id": "00000000-0000-0000-0000-000000000000",
    "alias": "Cute Apple",
    "version": "2.3",
    "deviceModel": "Dell",
    "deviceType": "desktop",
    "fingerprint": "123"
  },
  "peers": []
}"#
        );

        let decoded: WsServerMessage = serde_json::from_str(&encoded).unwrap();

        assert_eq!(message, decoded);
    }

    #[test]
    fn ws_server_offer_message_encoding() {
        let message = WsServerMessage::Offer(WsServerSdpMessage {
            peer: ClientInfo {
                id: Uuid::nil(),
                alias: "Cute Apple".to_string(),
                version: "2.3".to_string(),
                device_model: None,
                device_type: Some(DeviceType::Desktop),
                fingerprint: "123".to_string(),
            },
            session_id: "456".to_string(),
            sdp: "my-sdp".to_string(),
        });

        let encoded = serde_json::to_string_pretty(&message).unwrap();

        assert_eq!(
            encoded,
            r#"{
  "type": "offer",
  "peer": {
    "id": "00000000-0000-0000-0000-000000000000",
    "alias": "Cute Apple",
    "version": "2.3",
    "deviceType": "desktop",
    "fingerprint": "123"
  },
  "sessionId": "456",
  "sdp": "my-sdp"
}"#
        );

        let decoded: WsServerMessage = serde_json::from_str(&encoded).unwrap();

        assert_eq!(message, decoded);
    }
}
