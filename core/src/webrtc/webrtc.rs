use crate::model::transfer::FileDto;
use crate::util::base64;
use crate::webrtc::signaling::{ManagedSignalingConnection, WsServerSdpMessage};
use anyhow::Result;
use bytes::{Bytes, BytesMut};
use flate2::read::ZlibDecoder;
use flate2::write::ZlibEncoder;
use serde::{Deserialize, Serialize};
use std::collections::{HashMap, HashSet};
use std::future::Future;
use std::io::{Read, Write};
use std::sync::Arc;
use std::time::Duration;
use tokio::sync::{mpsc, oneshot};
use uuid::Uuid;
use webrtc::api::APIBuilder;
use webrtc::data_channel::data_channel_init::RTCDataChannelInit;
use webrtc::data_channel::data_channel_message::DataChannelMessage;
use webrtc::data_channel::RTCDataChannel;
use webrtc::ice_transport::ice_server::RTCIceServer;
use webrtc::peer_connection::configuration::RTCConfiguration;
use webrtc::peer_connection::peer_connection_state::RTCPeerConnectionState;
use webrtc::peer_connection::sdp::session_description::RTCSessionDescription;
use webrtc::peer_connection::RTCPeerConnection;
use crate::crypto::signature;

/// Nonce message exchanged by both peers
/// starting with the sending peer.
#[derive(Debug, Deserialize, Serialize)]
struct RTCNonceMessage {
    /// Nonce to be used to hash in combination with the public key.
    nonce: String,
}

/// Sending peer sends the token.
#[derive(Debug, Deserialize, Serialize)]
struct RTCTokenRequest {
    /// Token using the received nonce and the public key.
    /// HASH_METHOD.HASH.SIGN_METHOD.SIGN
    token: String,
}

/// Receiving peer sends the token as well but
/// also the status for the next step.
/// After this step, the sending peer may close the connection due to `InvalidSignature`.
#[derive(Debug, Deserialize, Serialize)]
#[serde(tag = "status", rename_all = "camelCase")]
enum RTCTokenResponse {
    Ok { token: String },
    PinRequired { token: String },
    InvalidSignature,
}

/// This struct is used by both sender and receiver.
/// (1) The sender tries to resolve PIN first, waiting for `RTCPinReceivingResponse`.
/// (2) The receiver tries to resolve PIN, waiting for `RTCPinSendingResponse`.
///
/// This step may be skipped by the sending peer if `RTCInitResponse` is `Ok`.
/// In this case, the sending peer sends the `RTCPinSendingResponse` right away.
#[derive(Debug, Deserialize, Serialize)]
struct RTCPinMessage {
    pin: String,
}

/// Response to the PIN message by the receiving peer.
#[derive(Debug, Deserialize, Serialize)]
#[serde(tag = "status", rename_all = "camelCase")]
enum RTCPinReceivingResponse {
    Ok,
    PinRequired,
    TooManyAttempts,
}

/// Response to the PIN message by the sending peer.
#[derive(Debug, Deserialize, Serialize)]
#[serde(tag = "status", rename_all = "camelCase")]
enum RTCPinSendingResponse {
    Ok {
        files: Vec<FileDto>,
    },
    PinRequired,
    TooManyAttempts,
}

/// Sent by receiving peer after receiving `RTCPinSendingResponse::Ok`.
#[derive(Debug, Deserialize, Serialize)]
#[serde(tag = "status", rename_all = "camelCase")]
enum RTCFileResponse {
    Ok {
        files: HashMap<String, String>
    },
    Pair {
        #[serde(rename = "publicKey")]
        public_key: String,
    },
    Declined,
    InvalidSignature,
}

/// Pair response by the sending peer.
#[derive(Debug, Deserialize, Serialize)]
#[serde(tag = "status", rename_all = "camelCase")]
enum RTCPairResponse {
    Ok {
        #[serde(rename = "publicKey")]
        public_key: String,
    },
    PairDeclined,
    InvalidSignature,
}

#[derive(Debug)]
pub struct RTCFile {
    pub file_id: String,
    pub binary_rx: mpsc::Receiver<Bytes>,
}

#[derive(Debug)]
struct RTCFileState {
    file_id: String,
    size: u64,
    binary_tx: mpsc::Sender<Bytes>,
}

#[derive(Debug, Deserialize, Serialize)]
struct RTCSendFileHeaderRequest {
    pub id: String,
    pub token: String,
}

#[derive(Debug, Deserialize, Serialize)]
pub struct RTCSendFileResponse {
    pub id: String,
    pub success: bool,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub error: Option<String>,
}

#[derive(Debug, Eq, PartialEq)]
pub enum RTCStatus {
    /// Received remote SDP offer/answer. Ready to start P2P connection.
    SdpExchanged,

    /// Opened data channel. Ready to further communication.
    Connected,

    /// PIN is required to proceed.
    PinRequired,

    /// Too many attempts. Connection is closed.
    TooManyAttempts,

    /// Declined by the receiving peer.
    Declined,

    /// Files are being sent.
    Sending,

    /// Data channel closed. Connection is closed.
    Finished,

    /// Error occurred. Connection is closed.
    Error(String),
}

#[derive(Debug, Eq, PartialEq)]
pub struct RTCFileError {
    pub file_id: String,
    pub error: String,
}

const CHANNEL_LABEL: &str = "data";

pub async fn send_offer(
    signaling: &ManagedSignalingConnection,
    stun_servers: Vec<String>,
    target_id: Uuid,
    expecting_public_key: Option<signature::VerifyingKey>,
    files: Vec<FileDto>,
    status_tx: mpsc::Sender<RTCStatus>,
    selected_files_tx: oneshot::Sender<HashSet<String>>,
    pair
    error_tx: mpsc::Sender<RTCFileError>,
    mut pin_rx: mpsc::Receiver<String>,
    mut sending_rx: mpsc::Receiver<RTCFile>,
) -> Result<()> {
    let (peer_connection, mut done_rx) = create_peer_connection(stun_servers).await?;

    let data_channel = peer_connection
        .create_data_channel(
            CHANNEL_LABEL,
            Some(RTCDataChannelInit {
                ordered: Some(true),
                max_packet_life_time: None,
                max_retransmits: None,
                protocol: None,
                negotiated: None,
            }),
        )
        .await?;

    let (connected_tx, mut connected_rx) = mpsc::channel::<()>(1);
    data_channel.on_open(Box::new(move || {
        Box::pin(async move {
            let _ = connected_tx.send(()).await;
        })
    }));

    let mut receive_rx = to_receive_stream(&data_channel, 16);

    let send_task = {
        let data_channel = Arc::clone(&data_channel);
        let status_tx = status_tx.clone();
        tokio::spawn(async move {
            connected_rx
                .recv()
                .await
                .ok_or_else(|| anyhow::anyhow!("Data channel not opened"))?;

            loop {
                let Some(init_status) = receive_rx.recv().await else {
                    return Err(anyhow::anyhow!("Failed to receive initial message"));
                };

                if !init_status.is_string {
                    return Err(anyhow::anyhow!("Expected string message"));
                }

                let init: RTCInitResponse = serde_json::from_slice(&init_status.data)?;

                match init.status {
                    RTCInitStatus::Ok => {
                        status_tx.send(RTCStatus::Connected).await?;
                        break;
                    }
                    RTCInitStatus::PinRequired => {
                        status_tx.send(RTCStatus::PinRequired).await?;
                        let Some(pin) = pin_rx.recv().await else {
                            return Err(anyhow::anyhow!("PIN required but not provided"));
                        };

                        data_channel
                            .send_text(&serde_json::to_string(&RTCPinMessage { pin })?)
                            .await?;
                    }
                    RTCInitStatus::TooManyAttempts => {
                        status_tx.send(RTCStatus::TooManyAttempts).await?;
                        return Err(anyhow::anyhow!("Too many requests"));
                    }
                }
            }

            {
                // send file list message
                let file_list_req = serde_json::to_string(&RTCFileListRequest { files })?;

                let result = process_string_in_chunks(
                    Arc::clone(&data_channel),
                    file_list_req,
                    |data_channel, chunk| async move {
                        data_channel.send(&chunk).await?;
                        Ok(data_channel)
                    },
                )
                .await;

                if let Err(e) = result {
                    let _ = status_tx.try_send(RTCStatus::Error(format!(
                        "Failed to send file list message: {e}"
                    )));
                    return Err(e.into());
                }

                if let Err(e) = send_delimiter(&data_channel).await {
                    let _ = status_tx.try_send(RTCStatus::Error(format!(
                        "Failed to send file list message: {e}"
                    )));
                    return Err(e.into());
                }
            }

            tracing::debug!("Sent file list message. Waiting for file tokens...");

            // Receive file tokens
            let file_list_res = {
                let bytes = receive_string_from_chunks(&mut receive_rx).await;
                let parsed: RTCFileListResponse = serde_json::from_slice(&*bytes).map_err(|e| {
                    anyhow::anyhow!("Failed to deserialize file list response: {e}")
                })?;
                parsed
            };

            if file_list_res.status == RTCFileListStatus::Declined {
                let _ = status_tx.send(RTCStatus::Declined).await;
                return Ok(());
            }

            // Publish selected files
            if selected_files_tx
                .send(file_list_res.files.keys().cloned().collect())
                .is_err()
            {
                let error = "Could not publish selection";
                let _ = status_tx.send(RTCStatus::Error(error.to_owned()));
                return Err(anyhow::anyhow!(error));
            }

            tracing::debug!("Received file tokens. Sending files...");

            while let Some(message) = sending_rx.recv().await {
                let file_token = match file_list_res.files.get(&message.file_id) {
                    Some(file_token) => file_token,
                    None => {
                        let _ = error_tx
                            .send(RTCFileError {
                                file_id: message.file_id,
                                error: "Failed to get file token".to_string(),
                            })
                            .await;

                        continue;
                    }
                };

                let header = RTCSendFileHeaderRequest {
                    id: message.file_id.clone(),
                    token: file_token.clone(),
                };

                if let Err(e) = data_channel
                    .send_text(serde_json::to_string(&header)?)
                    .await
                {
                    let _ = error_tx
                        .send(RTCFileError {
                            file_id: message.file_id,
                            error: e.to_string(),
                        })
                        .await;
                    continue;
                }

                let result = process_in_chunks(
                    Arc::clone(&data_channel),
                    message.binary_rx,
                    |data_channel, chunk| async move {
                        data_channel.send(&chunk).await?;
                        Ok(data_channel)
                    },
                )
                .await;

                if let Err(e) = result {
                    let _ = error_tx
                        .send(RTCFileError {
                            file_id: message.file_id,
                            error: e.to_string(),
                        })
                        .await;
                    continue;
                }
            }

            wait_buffer_empty(&data_channel).await;

            send_delimiter(&data_channel).await?;

            receive_rx.recv().await;

            Ok(())
        })
    };

    let offer = peer_connection.create_offer(None).await?;
    let mut gather_complete = peer_connection.gathering_complete_promise().await;
    peer_connection.set_local_description(offer).await?;
    let _ = gather_complete.recv().await;

    let session_id = Uuid::new_v4().to_string();
    let local_description = peer_connection
        .local_description()
        .await
        .ok_or_else(|| anyhow::anyhow!("Could not generate local_description"))?;

    signaling
        .send_offer(
            session_id.clone(),
            target_id,
            encode_sdp(&local_description.sdp),
        )
        .await?;

    let (tx_answer, rx_answer) = oneshot::channel();

    signaling
        .on_answer(session_id, |message| {
            tx_answer.send(message.sdp).unwrap();
        })
        .await;

    let remote_desc = rx_answer.await?;

    if let Err(e) = status_tx.send(RTCStatus::SdpExchanged).await {
        peer_connection.close().await?;
        return Err(e.into());
    }

    let answer = RTCSessionDescription::answer(decode_sdp(&remote_desc)?)?;

    peer_connection.set_remote_description(answer).await?;

    tokio::select! {
        _ = send_task => {
            tracing::debug!("Sending done.");
        }
        _ = done_rx.recv() => {}
    }

    let _ = status_tx.send(RTCStatus::Finished).await;
    if let Err(e) = data_channel.close().await {
        tracing::error!("Failed to close data channel: {e}");
    }

    peer_connection.close().await?;

    Ok(())
}

#[derive(Debug, Eq, PartialEq)]
pub struct PinConfig {
    pub pin: String,
    pub max_tries: u8,
}

pub async fn accept_offer(
    signaling: &ManagedSignalingConnection,
    stun_servers: Vec<String>,
    offer: &WsServerSdpMessage,
    pin: Option<PinConfig>,
    status_tx: mpsc::Sender<RTCStatus>,
    files_tx: oneshot::Sender<Vec<FileDto>>,
    selected_files_rx: oneshot::Receiver<Option<HashSet<String>>>,
    error_tx: mpsc::Sender<RTCFileError>,
    receiving_tx: mpsc::Sender<RTCFile>,
    mut user_error_tx: mpsc::Receiver<RTCSendFileResponse>,
) -> Result<()> {
    let (peer_connection, mut done_rx) = create_peer_connection(stun_servers).await?;

    let (data_channel_tx, mut data_channel_rx) = mpsc::channel::<Arc<RTCDataChannel>>(1);

    peer_connection.on_data_channel(Box::new(move |d: Arc<RTCDataChannel>| {
        if d.label() != CHANNEL_LABEL {
            return Box::pin(async {});
        }

        let data_channel_tx = data_channel_tx.clone();
        Box::pin(async move {
            let d_clone = Arc::clone(&d);
            d.on_open(Box::new(move || {
                let _ = data_channel_tx.try_send(d_clone);

                Box::pin(async {})
            }));
        })
    }));

    let receive_task = {
        let status_tx = status_tx.clone();
        tokio::spawn(async move {
            let Some(data_channel) = data_channel_rx.recv().await else {
                return Err::<(), anyhow::Error>(anyhow::anyhow!("Data channel not found"));
            };

            // We convert on_message to a stream of messages
            // to improve readability using a sequential implementation
            let mut receive_rx = to_receive_stream(&data_channel, 16);

            wait_buffer_empty(&data_channel).await;

            if let Some(pin_config) = &pin {
                status_tx.send(RTCStatus::PinRequired).await?;

                let mut remote_pin = "".to_string();
                let mut pin_try = 0u8;

                loop {
                    if remote_pin == pin_config.pin {
                        break;
                    }

                    if pin_try >= pin_config.max_tries {
                        let _ = tokio::time::timeout(Duration::from_secs(5), async {
                            let _ = data_channel
                                .send_text(
                                    serde_json::to_string(&RTCInitResponse {
                                        status: RTCInitStatus::TooManyAttempts,
                                    })
                                    .expect("Failed to serialize"),
                                )
                                .await;

                            wait_buffer_empty(&data_channel).await;
                        })
                        .await;

                        status_tx.send(RTCStatus::TooManyAttempts).await?;

                        return Ok(());
                    }

                    data_channel
                        .send_text(serde_json::to_string(&RTCInitResponse {
                            status: RTCInitStatus::PinRequired,
                        })?)
                        .await?;

                    remote_pin = match receive_rx.recv().await {
                        Some(msg) => {
                            let pin_req: RTCPinMessage = serde_json::from_slice(&msg.data)?;
                            pin_req.pin
                        }
                        None => {
                            return Err(anyhow::anyhow!("Failed to receive pin"));
                        }
                    };

                    pin_try += 1;
                }
            }

            status_tx.send(RTCStatus::Connected).await?;

            data_channel
                .send_text(serde_json::to_string(&RTCInitResponse {
                    status: RTCInitStatus::Ok,
                })?)
                .await?;

            tracing::debug!("Sent OK. Waiting for file list...");

            // Init: Receive binary
            let file_list_bytes = receive_string_from_chunks(&mut receive_rx).await;
            let file_list_req: RTCFileListRequest = serde_json::from_slice(&*file_list_bytes)
                .map_err(|e| anyhow::anyhow!("Failed to deserialize initial message: {e}"))?;
            files_tx
                .send(file_list_req.files.clone())
                .map_err(|_| anyhow::anyhow!("Failed to send file list"))?;

            // Init: Receive user selection
            let Ok(selected_files) = selected_files_rx.await else {
                return Ok(());
            };

            let Some(selected_files) = selected_files else {
                // Declined by the user
                process_string_in_chunks(
                    Arc::clone(&data_channel),
                    serde_json::to_string(&RTCFileListResponse {
                        status: RTCFileListStatus::Declined,
                        files: HashMap::new(),
                    })?,
                    |data_channel, chunk| async move {
                        data_channel.send(&chunk).await?;
                        Ok(data_channel)
                    },
                )
                .await?;

                send_delimiter(&data_channel).await?;

                return Ok(());
            };

            let file_tokens = selected_files
                .into_iter()
                .map(|file_id| {
                    let token = Uuid::new_v4().to_string();
                    (file_id, token)
                })
                .collect::<HashMap<String, String>>();

            let file_list_response = RTCFileListResponse {
                status: RTCFileListStatus::Ok,
                files: file_tokens,
            };
            if let Err(e) = process_string_in_chunks(
                Arc::clone(&data_channel),
                serde_json::to_string(&file_list_response)?,
                |data_channel, chunk| async move {
                    data_channel.send(&chunk).await?;
                    Ok(data_channel)
                },
            )
            .await
            {
                return Err(e);
            }

            send_delimiter(&data_channel).await?;

            // Receive files
            let mut file_state: Option<RTCFileState> = None;
            while let Some(msg) = receive_rx.recv().await {
                if msg.is_string {
                    // End of last file
                    let last_file_id = file_state.as_ref().map(|s| s.file_id.clone());
                    file_state = None;

                    if let Some(last_file_id) = last_file_id {
                        let error = match user_error_tx.recv().await {
                            Some(result) => {
                                if result.success {
                                    None
                                } else {
                                    Some(result.error.map_or("Unknown error".to_string(), |e| e))
                                }
                            }
                            None => Some("Failed to receive file result".to_string()),
                        };

                        data_channel
                            .send_text(serde_json::to_string(&RTCSendFileResponse {
                                id: last_file_id,
                                success: error.is_none(),
                                error,
                            })?)
                            .await?;

                        if is_delimiter(&msg) {
                            // End of all files

                            // Wait for the last status to be sent
                            let _ = tokio::time::timeout(Duration::from_secs(5), async {
                                wait_buffer_empty(&data_channel).await;
                            })
                            .await;

                            break;
                        }
                    }

                    let header: RTCSendFileHeaderRequest = serde_json::from_slice(&msg.data)?;
                    match file_list_response.files.get(&header.id) {
                        Some(entry) => {
                            if header.token != *entry {
                                let _ = error_tx
                                    .send(RTCFileError {
                                        file_id: header.id,
                                        error: "Invalid token".to_string(),
                                    })
                                    .await;
                                continue;
                            }
                        }
                        None => {
                            let _ = error_tx
                                .send(RTCFileError {
                                    file_id: header.id,
                                    error: "File not found".to_string(),
                                })
                                .await;
                            continue;
                        }
                    }

                    let (tx, rx) = mpsc::channel::<Bytes>(4);

                    let size = {
                        let entry = file_list_req.files.iter().find(|f| f.id == header.id);
                        match entry {
                            Some(file) => file.size,
                            None => {
                                let _ = error_tx
                                    .send(RTCFileError {
                                        file_id: header.id,
                                        error: "Expected size to be available".to_string(),
                                    })
                                    .await;
                                continue;
                            }
                        }
                    };

                    file_state = Some(RTCFileState {
                        file_id: header.id.clone(),
                        size,
                        binary_tx: tx,
                    });

                    let _ = receiving_tx
                        .send(RTCFile {
                            file_id: header.id.clone(),
                            binary_rx: rx,
                        })
                        .await;
                } else {
                    // publish binary data
                    match &mut file_state {
                        Some(state) => {
                            state.binary_tx.send(msg.data).await?;
                        }
                        None => {
                            let _ = error_tx
                                .send(RTCFileError {
                                    file_id: "unknown".to_string(),
                                    error: "Received binary data without a header".to_string(),
                                })
                                .await;
                        }
                    }
                }
            }

            Ok(())
        })
    };

    let remote_desc_sdp = decode_sdp(&offer.sdp)?;
    let remote_desc = RTCSessionDescription::offer(remote_desc_sdp)?;
    peer_connection.set_remote_description(remote_desc).await?;

    let answer = peer_connection.create_answer(None).await?;

    let mut gather_complete = peer_connection.gathering_complete_promise().await;
    peer_connection.set_local_description(answer).await?;
    let _ = gather_complete.recv().await;

    let local_description = peer_connection
        .local_description()
        .await
        .ok_or_else(|| anyhow::anyhow!("generate local_description failed!"))?;

    signaling
        .send_answer(
            offer.session_id.clone(),
            offer.peer.id,
            encode_sdp(&local_description.sdp),
        )
        .await?;

    if let Err(e) = status_tx.send(RTCStatus::SdpExchanged).await {
        peer_connection.close().await?;
        return Err(e.into());
    }

    tokio::select! {
        result = receive_task => {
            match result {
                Ok(_) => tracing::debug!("Receiving done."),
                Err(e) => tracing::error!("Receiving error: {e}")
            }
        }
        _ = done_rx.recv() => {
            tracing::debug!("Peer connection remotely closed.");
        }
    }

    let _ = status_tx.send(RTCStatus::Finished).await;
    peer_connection.close().await?;

    Ok(())
}

async fn create_peer_connection(
    stun: Vec<String>,
) -> Result<(Arc<RTCPeerConnection>, mpsc::Receiver<()>)> {
    let api = APIBuilder::new().build();

    let config = RTCConfiguration {
        ice_servers: vec![RTCIceServer {
            urls: stun,
            ..Default::default()
        }],
        ..Default::default()
    };

    let peer_connection = api.new_peer_connection(config).await?;

    let (done_tx, done_rx) = mpsc::channel::<()>(1);

    peer_connection.on_peer_connection_state_change(Box::new(move |s: RTCPeerConnectionState| {
        if s == RTCPeerConnectionState::Disconnected {
            let _ = done_tx.try_send(());
        }
        Box::pin(async {})
    }));

    Ok((Arc::new(peer_connection), done_rx))
}

fn encode_sdp(s: &str) -> String {
    let mut e = ZlibEncoder::new(Vec::new(), flate2::Compression::best());
    e.write_all(s.as_bytes())
        .map_err(|e| anyhow::anyhow!("Failed to compress SDP: {e}"))
        .unwrap();
    let compressed = e
        .finish()
        .map_err(|e| anyhow::anyhow!("Failed to finish compression of SDP: {e}"))
        .unwrap();
    base64::encode(&compressed)
}

fn decode_sdp(s: &str) -> Result<String> {
    let decoded_data =
        base64::decode(s).map_err(|e| anyhow::anyhow!("Base64 decode of SDP failed: {e}"))?;
    let mut d = ZlibDecoder::new(&*decoded_data);
    let mut result = String::new();
    d.read_to_string(&mut result)
        .map_err(|e| anyhow::anyhow!("Failed to decompress SDP: {e}"))?;
    Ok(result)
}

async fn send_delimiter(data_channel: &Arc<RTCDataChannel>) -> Result<()> {
    // Somehow, empty messages are not received by the other peer, so we send a non-empty message
    data_channel.send_text("0".to_string()).await?;
    Ok(())
}

fn is_delimiter(msg: &DataChannelMessage) -> bool {
    msg.is_string && msg.data.len() <= 1
}

async fn wait_buffer_empty(data_channel: &Arc<RTCDataChannel>) {
    while data_channel.buffered_amount().await != 0 {
        tokio::time::sleep(Duration::from_millis(100)).await;
    }
}

const CHUNK_SIZE: usize = 16 * 1024; // 16 KiB

/// Process incoming data in chunks of CHUNK_SIZE
/// The callback returns the same data_channel to avoid re-creating or lifetime issues.
pub async fn process_in_chunks<T, F, Fut>(
    mut data_channel: T,
    mut rx: mpsc::Receiver<Bytes>,
    mut callback: F,
) -> Result<()>
where
    F: FnMut(T, Bytes) -> Fut,
    Fut: Future<Output = Result<T>>,
{
    let mut buffer = BytesMut::with_capacity(CHUNK_SIZE);

    while let Some(data) = rx.recv().await {
        buffer.extend_from_slice(&data);

        while buffer.len() >= CHUNK_SIZE {
            let chunk = buffer.split_to(CHUNK_SIZE).freeze();

            // Process the chunk, reuse the data_channel
            data_channel = callback(data_channel, chunk).await?;
        }
    }

    // After the channel is closed, if there's leftover data, handle it as needed:
    if !buffer.is_empty() {
        callback(data_channel, buffer.freeze()).await?;
    }

    Ok(())
}

/// Convenience function for `process_in_chunks` that processes a string in chunks.
pub async fn process_string_in_chunks<T, F, Fut>(
    data_channel: T,
    string: String,
    callback: F,
) -> Result<()>
where
    F: FnMut(T, Bytes) -> Fut,
    Fut: Future<Output = Result<T>>,
{
    let (tx, rx) = mpsc::channel(1);

    tokio::spawn(async move {
        let _ = tx.send(Bytes::from(string)).await;
    });

    process_in_chunks(data_channel, rx, callback).await
}

async fn receive_string_from_chunks(receive_rx: &mut mpsc::Receiver<DataChannelMessage>) -> Bytes {
    let mut buffer = BytesMut::new();
    while let Some(msg) = receive_rx.recv().await {
        if msg.is_string {
            break;
        }

        buffer.extend_from_slice(&msg.data);
    }

    buffer.freeze()
}

fn to_receive_stream(
    data_channel: &Arc<RTCDataChannel>,
    buffer: usize,
) -> mpsc::Receiver<DataChannelMessage> {
    let (tx, rx) = mpsc::channel(buffer);

    data_channel.on_message(Box::new(move |msg: DataChannelMessage| {
        let tx = tx.clone();
        Box::pin(async move {
            let _ = tx.send(msg).await;
        })
    }));

    rx
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_process_in_chunks() {
        let (tx, rx) = mpsc::channel(16);

        tokio::spawn(async move {
            let mut test_vec = vec![0; CHUNK_SIZE * 2 + 5];
            test_vec[CHUNK_SIZE..CHUNK_SIZE * 2]
                .iter_mut()
                .for_each(|x| *x = 1);
            test_vec[CHUNK_SIZE * 2..].iter_mut().for_each(|x| *x = 2);
            tx.send(Bytes::from(test_vec)).await.unwrap();
        });

        let mut chunks = Vec::new();

        let result = process_in_chunks(0, rx, |_, chunk| {
            chunks.push(chunk);
            async { Ok(0) }
        })
        .await;

        assert!(result.is_ok());
        assert_eq!(chunks.len(), 3);
        assert_eq!(chunks[0].len(), CHUNK_SIZE);
        assert_eq!(chunks[1].len(), CHUNK_SIZE);
        assert_eq!(chunks[2].len(), 5);

        assert_eq!(chunks[0].iter().all(|x| *x == 0), true);
        assert_eq!(chunks[1].iter().all(|x| *x == 1), true);
        assert_eq!(chunks[2].iter().all(|x| *x == 2), true);
    }
}
