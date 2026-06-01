use crate::frb_generated::StreamSink;
use bytes::Bytes;
use flutter_rust_bridge::{frb, DartFnFuture};
use localsend::crypto::token::SigningTokenKey;
use localsend::model::discovery::DeviceType;
use localsend::model::transfer::FileDto;
pub use localsend::webrtc::signaling::{
    ClientInfo, ClientInfoWithoutId, ManagedSignalingConnection, SignalingConnection,
    WsServerMessage, WsServerSdpMessage,
};
pub use localsend::webrtc::webrtc::{
    PinConfig, RTCFile, RTCFileError, RTCSendFileResponse, RTCStatus,
};
use std::collections::HashSet;
use std::sync::Arc;
use std::time::Duration;
use tokio::sync::{mpsc, oneshot, Mutex};
use tokio::time;
use uuid::Uuid;

pub struct ProposingClientInfo {
    pub alias: String,
    pub version: String,
    pub device_model: Option<String>,
    pub device_type: Option<DeviceType>,
}

impl ProposingClientInfo {
    fn sign(&self, signing_key: &SigningTokenKey) -> anyhow::Result<ClientInfoWithoutId> {
        Ok(ClientInfoWithoutId {
            alias: self.alias.clone(),
            version: self.version.clone(),
            device_model: self.device_model.clone(),
            device_type: self.device_type.clone(),
            token: localsend::crypto::token::generate_token_timestamp(&signing_key)?,
        })
    }
}

pub async fn connect(
    sink: StreamSink<WsServerMessage>,
    uri: String,
    info: ProposingClientInfo,
    private_key: String,
    on_connection: impl Fn(LsSignalingConnection) -> DartFnFuture<()>,
) {
    let Ok(signing_key) = localsend::crypto::token::parse_private_key(&private_key) else {
        let _ = sink.add_error(anyhow::anyhow!("Invalid private key"));
        return;
    };

    let Ok(client_info) = info.sign(&signing_key) else {
        let _ = sink.add_error(anyhow::anyhow!("Invalid client info"));
        return;
    };

    let connection = match SignalingConnection::connect(uri, &client_info).await {
        Ok(connection) => connection,
        Err(e) => {
            let _ = sink.add_error(e.to_string());
            return;
        }
    };

    let (managed_connection, mut rx) = connection.start_listener();
    on_connection(LsSignalingConnection {
        inner: Arc::new(managed_connection),
    })
    .await;

    while let Some(message) = rx.recv().await {
        let _ = sink.add(message.into());
    }
}

pub struct LsSignalingConnection {
    inner: Arc<ManagedSignalingConnection>,
}

impl LsSignalingConnection {
    pub async fn update_info(&self, info: ClientInfoWithoutId) -> anyhow::Result<()> {
        self.inner.send_update(info).await?;
        Ok(())
    }

    pub async fn send_offer(
        &self,
        stun_servers: Vec<String>,
        target: Uuid,
        private_key: &str,
        expecting_public_key: Option<ExpectingPublicKey>,
        pin: Option<PinConfig>,
        files: Vec<FileDto>,
    ) -> anyhow::Result<RTCSendController> {
        let (status_tx, status_rx) = mpsc::channel::<RTCStatus>(1);
        let (selected_tx, selected_rx) = oneshot::channel::<HashSet<String>>();
        let (error_tx, error_rx) = mpsc::channel::<RTCFileError>(1);
        let (pin_tx, mut pin_rx) = mpsc::channel::<oneshot::Sender<String>>(1);
        let (pair_tx, pair_rx) = oneshot::channel::<oneshot::Sender<bool>>();
        let (send_tx, send_rx) = mpsc::channel::<RTCFile>(1);

        let managed_connection = self.inner.clone();

        let signing_key = localsend::crypto::token::parse_private_key(private_key)?;
        let expecting_public_key = match expecting_public_key {
            Some(key) => Some(localsend::crypto::token::parse_public_key(
                &key.public_key,
                &key.kind,
            )?),
            None => None,
        };

        tokio::spawn(async move {
            let result = localsend::webrtc::webrtc::send_offer(
                &managed_connection,
                stun_servers,
                target,
                signing_key,
                expecting_public_key,
                pin,
                files,
                status_tx.clone(),
                selected_tx,
                error_tx,
                pin_tx,
                pair_tx,
                send_rx,
            )
            .await;

            if let Err(e) = result {
                let _ = status_tx.send(RTCStatus::Error(e.to_string())).await;
            }
        });

        tokio::spawn(async move {
            // TODO: support pairing
            let Ok(pair_tx) = pair_rx.await else {
                return;
            };

            let _ = pair_tx.send(false);
        });

        let pin_sender = Arc::new(Mutex::new(None));

        tokio::spawn({
            let pin_sender = Arc::clone(&pin_sender);
            async move {
                while let Some(pin_tx) = pin_rx.recv().await {
                    *pin_sender.lock().await = Some(pin_tx);
                }
            }
        });

        Ok(RTCSendController {
            status_rx,
            selected_rx: Arc::new(Mutex::new(Some(selected_rx))),
            error_rx,
            pin_tx: pin_sender,
            send_tx,
        })
    }

    pub async fn accept_offer(
        &self,
        stun_servers: Vec<String>,
        offer: WsServerSdpMessage,
        private_key: &str,
        expecting_public_key: Option<ExpectingPublicKey>,
        pin: Option<PinConfig>,
    ) -> anyhow::Result<RTCReceiveController> {
        let (status_tx, status_rx) = mpsc::channel::<RTCStatus>(1);
        let (files_tx, files_rx) = oneshot::channel::<Vec<FileDto>>();
        let (selected_tx, selected_rx) = oneshot::channel::<Option<HashSet<String>>>();
        let (error_tx, error_rx) = mpsc::channel::<RTCFileError>(1);
        let (receiving_tx, receiving_rx) = mpsc::channel::<RTCFile>(1);
        let (pin_tx, mut pin_rx) = mpsc::channel::<oneshot::Sender<String>>(1);
        let (file_status_tx, file_status_rx) = mpsc::channel::<RTCSendFileResponse>(1);

        let managed_connection = self.inner.clone();

        let signing_key = localsend::crypto::token::parse_private_key(private_key)?;
        let expecting_public_key = match expecting_public_key {
            Some(key) => Some(localsend::crypto::token::parse_public_key(
                &key.public_key,
                &key.kind,
            )?),
            None => None,
        };

        tokio::spawn(async move {
            let result = localsend::webrtc::webrtc::accept_offer(
                &managed_connection,
                stun_servers,
                &offer,
                signing_key,
                expecting_public_key,
                pin,
                status_tx.clone(),
                files_tx,
                selected_rx,
                error_tx,
                pin_tx,
                receiving_tx,
                file_status_rx,
            )
            .await;

            if let Err(e) = result {
                let _ = status_tx.send(RTCStatus::Error(e.to_string())).await;
            }
        });

        let pin_sender = Arc::new(Mutex::new(None));

        tokio::spawn({
            let pin_sender = Arc::clone(&pin_sender);
            async move {
                while let Some(pin_tx) = pin_rx.recv().await {
                    *pin_sender.lock().await = Some(pin_tx);
                }
            }
        });

        Ok(RTCReceiveController {
            status_rx: Arc::new(Mutex::new(Some(status_rx))),
            files_rx: Arc::new(Mutex::new(Some(files_rx))),
            selected_tx: Arc::new(Mutex::new(Some(selected_tx))),
            error_rx: Arc::new(Mutex::new(Some(error_rx))),
            pin_tx: pin_sender,
            receiving_rx: Arc::new(Mutex::new(Some(receiving_rx))),
            file_status_tx,
        })
    }
}

pub struct ExpectingPublicKey {
    pub public_key: String,

    /// "ed25519" or "rsa-pss"
    pub kind: String,
}

pub struct RTCSendController {
    status_rx: mpsc::Receiver<RTCStatus>,
    selected_rx: Arc<Mutex<Option<oneshot::Receiver<HashSet<String>>>>>,
    error_rx: mpsc::Receiver<RTCFileError>,
    pin_tx: Arc<Mutex<Option<oneshot::Sender<String>>>>,
    send_tx: mpsc::Sender<RTCFile>,
}

impl RTCSendController {
    pub async fn listen_status(&mut self, sink: StreamSink<RTCStatus>) {
        while let Some(status) = self.status_rx.recv().await {
            let _ = sink.add(status);
        }
    }

    pub async fn listen_selected_files(&self) -> anyhow::Result<HashSet<String>> {
        let Some(selected_rx) = self.selected_rx.lock().await.take() else {
            return Err(anyhow::anyhow!("Selected files already received"));
        };

        let Ok(selected) = selected_rx.await else {
            return Err(anyhow::anyhow!("Selected files channel closed"));
        };

        Ok(selected)
    }

    pub async fn listen_error(&mut self, sink: StreamSink<RTCFileError>) {
        while let Some(error) = self.error_rx.recv().await {
            let _ = sink.add(error);
        }
    }

    pub async fn send_pin(&self, pin: String) -> anyhow::Result<()> {
        let Some(pin_tx) = self.pin_tx.lock().await.take() else {
            return Err(anyhow::anyhow!("Pin already sent"));
        };

        pin_tx
            .send(pin)
            .map_err(|_| anyhow::anyhow!("Pin channel closed"))?;

        Ok(())
    }

    pub async fn send_file(&self, file_id: String) -> anyhow::Result<RTCFileSender> {
        let (tx, rx) = mpsc::channel::<Bytes>(1);
        self.send_tx
            .send(RTCFile {
                file_id,
                binary_rx: rx,
            })
            .await?;

        Ok(RTCFileSender { binary_tx: tx })
    }
}

pub struct RTCFileSender {
    binary_tx: mpsc::Sender<Bytes>,
}

impl RTCFileSender {
    pub async fn send(&self, data: Vec<u8>) -> anyhow::Result<()> {
        self.binary_tx.send(Bytes::from(data)).await?;
        Ok(())
    }
}

pub struct RTCReceiveController {
    status_rx: Arc<Mutex<Option<mpsc::Receiver<RTCStatus>>>>,
    files_rx: Arc<Mutex<Option<oneshot::Receiver<Vec<FileDto>>>>>,
    selected_tx: Arc<Mutex<Option<oneshot::Sender<Option<HashSet<String>>>>>>,
    error_rx: Arc<Mutex<Option<mpsc::Receiver<RTCFileError>>>>,
    pin_tx: Arc<Mutex<Option<oneshot::Sender<String>>>>,
    receiving_rx: Arc<Mutex<Option<mpsc::Receiver<RTCFile>>>>,
    file_status_tx: mpsc::Sender<RTCSendFileResponse>,
}

impl RTCReceiveController {
    pub async fn listen_status(&self, sink: StreamSink<RTCStatus>) {
        let Some(mut status_rx) = self.status_rx.lock().await.take() else {
            let _ = sink.add_error(anyhow::anyhow!("Status stream already listened to"));
            return;
        };
        while let Some(status) = status_rx.recv().await {
            let _ = sink.add(status);
        }
    }

    pub async fn listen_files(&self) -> anyhow::Result<Vec<FileDto>> {
        let Some(files_rx) = self.files_rx.lock().await.take() else {
            return Err(anyhow::anyhow!("Files already received"));
        };

        let Ok(files) = files_rx.await else {
            return Err(anyhow::anyhow!("Files channel closed"));
        };

        Ok(files)
    }

    pub async fn send_pin(&self, pin: String) -> anyhow::Result<()> {
        let Some(pin_tx) = self.pin_tx.lock().await.take() else {
            return Err(anyhow::anyhow!("Pin already sent"));
        };

        pin_tx
            .send(pin)
            .map_err(|_| anyhow::anyhow!("Pin channel closed"))?;

        Ok(())
    }

    pub async fn send_selection(&self, selection: HashSet<String>) -> anyhow::Result<()> {
        let Some(selected_tx) = self.selected_tx.lock().await.take() else {
            return Err(anyhow::anyhow!("Selected files already sent"));
        };

        selected_tx
            .send(Some(selection))
            .map_err(|_| anyhow::anyhow!("Selected files channel closed"))?;

        Ok(())
    }

    pub async fn decline(&self) -> anyhow::Result<()> {
        let Some(selected_tx) = self.selected_tx.lock().await.take() else {
            return Err(anyhow::anyhow!("Selected files already sent"));
        };

        selected_tx
            .send(None)
            .map_err(|_| anyhow::anyhow!("Selected files channel closed"))?;

        Ok(())
    }

    pub async fn listen_error(&self, sink: StreamSink<RTCFileError>) {
        let Some(mut error_rx) = self.error_rx.lock().await.take() else {
            let _ = sink.add_error(anyhow::anyhow!("Error stream already listened to"));
            return;
        };
        while let Some(error) = error_rx.recv().await {
            let _ = sink.add(error);
        }
    }

    pub async fn listen_receiving(&self, sink: StreamSink<RTCFileReceiver>) {
        let Some(mut receiving_rx) = self.receiving_rx.lock().await.take() else {
            let _ = sink.add_error(anyhow::anyhow!("Receiving stream already listened to"));
            return;
        };
        while let Some(file) = receiving_rx.recv().await {
            let _ = sink.add(RTCFileReceiver {
                file_id: file.file_id,
                binary_rx: Arc::new(Mutex::new(Some(file.binary_rx))),
            });
        }
    }

    pub async fn send_file_status(&self, status: RTCSendFileResponse) -> anyhow::Result<()> {
        self.file_status_tx.send(status).await?;
        Ok(())
    }
}

pub struct RTCFileReceiver {
    file_id: String,
    binary_rx: Arc<Mutex<Option<mpsc::Receiver<Bytes>>>>,
}

impl RTCFileReceiver {
    pub fn get_file_id(&self) -> String {
        self.file_id.to_owned()
    }

    pub async fn receive(&self, sink: StreamSink<Vec<u8>>) -> anyhow::Result<()> {
        let Some(rx) = self.binary_rx.lock().await.take() else {
            return Err(anyhow::anyhow!("File receiver listened to"));
        };

        let mut rx = crate::util::bytes::buffer_receiver(rx).await;

        while let Some(data) = rx.recv().await {
            let _ = sink.add(data);
        }

        Ok(())
    }
}

#[frb(mirror(PinConfig))]
pub struct _PinConfig {
    pub pin: String,
    pub max_tries: u8,
}

#[frb(mirror(WsServerMessage))]
pub enum _WsServerMessage {
    Hello {
        client: ClientInfo,
        peers: Vec<ClientInfo>,
    },
    Join {
        peer: ClientInfo,
    },
    Update {
        peer: ClientInfo,
    },
    Left {
        peer_id: Uuid,
    },
    Offer(WsServerSdpMessage),
    Answer(WsServerSdpMessage),
    Error {
        code: u16,
    },
}

#[frb(mirror(ClientInfo))]
pub struct _ClientInfo {
    pub id: Uuid,
    pub alias: String,
    pub version: String,
    pub device_model: Option<String>,
    pub device_type: Option<DeviceType>,
    pub token: String,
}

#[frb(mirror(ClientInfoWithoutId))]
pub struct _ClientInfoWithoutId {
    pub alias: String,
    pub version: String,
    pub device_model: Option<String>,
    pub device_type: Option<DeviceType>,
    pub token: String,
}

#[frb(mirror(WsServerSdpMessage))]
pub struct _WsServerSdpMessage {
    pub peer: ClientInfo,
    pub session_id: String,
    pub sdp: String,
}

#[frb(mirror(RTCStatus))]
pub enum _RTCStatus {
    SdpExchanged,
    Connected,
    PinRequired,
    TooManyAttempts,
    Declined,
    Sending,
    Finished,
    Error(String),
}

#[frb(mirror(RTCFileError))]
pub struct _RTCFileError {
    pub file_id: String,
    pub error: String,
}

#[frb(mirror(RTCSendFileResponse))]
pub struct _RTCSendFileResponse {
    pub id: String,
    pub success: bool,
    pub error: Option<String>,
}
