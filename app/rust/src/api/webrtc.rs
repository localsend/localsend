use crate::frb_generated::StreamSink;
use bytes::Bytes;
use flutter_rust_bridge::{frb, DartFnFuture};
pub use localsend::model::file::FileDto;
pub use localsend::webrtc::signaling::{
    ClientInfo, ClientInfoWithoutId, ManagedSignalingConnection, PeerDeviceType,
    SignalingConnection, WsServerMessage, WsServerSdpMessage,
};
pub use localsend::webrtc::webrtc::{
    PinConfig, RTCFile, RTCFileError, RTCSendFileResponse, RTCStatus,
};
use std::collections::HashSet;
use std::sync::Arc;
use tokio::sync::{mpsc, oneshot, Mutex};
use uuid::Uuid;

pub async fn connect(
    sink: StreamSink<WsServerMessage>,
    uri: String,
    info: ClientInfoWithoutId,
    on_connection: impl Fn(LsSignalingConnection) -> DartFnFuture<()>,
) {
    let connection = match SignalingConnection::connect(uri, &info.into()).await {
        Ok(connection) => connection,
        Err(e) => {
            let _ = sink.add_error(e.to_string());
            return;
        }
    };

    let (managed_connection, mut rx) = connection.start_listener();
    on_connection(LsSignalingConnection {
        inner: managed_connection,
    })
    .await;

    while let Some(message) = rx.recv().await {
        let _ = sink.add(message.into());
    }
}

pub struct LsSignalingConnection {
    inner: ManagedSignalingConnection,
}

impl LsSignalingConnection {
    pub async fn send_offer(
        &self,
        stun_servers: Vec<String>,
        target: Uuid,
        files: Vec<FileDto>,
    ) -> anyhow::Result<RTCSendState> {
        let (status_tx, status_rx) = mpsc::channel::<RTCStatus>(1);
        let (selected_tx, selected_rx) = oneshot::channel::<HashSet<String>>();
        let (error_tx, error_rx) = mpsc::channel::<RTCFileError>(1);
        let (pin_tx, pin_rx) = mpsc::channel::<String>(1);
        let (send_tx, send_rx) = mpsc::channel::<RTCFile>(1);

        localsend::webrtc::webrtc::send_offer(
            &self.inner,
            stun_servers,
            target,
            files,
            status_tx,
            selected_tx,
            error_tx,
            pin_rx,
            send_rx,
        )
        .await?;

        Ok(RTCSendState {
            status_rx,
            selected_rx: Arc::new(Mutex::new(Some(selected_rx))),
            error_rx,
            pin_tx,
            send_tx,
        })
    }

    pub async fn accept_offer(
        &self,
        stun_servers: Vec<String>,
        offer: WsServerSdpMessage,
        pin: Option<PinConfig>,
    ) -> anyhow::Result<RTCReceiveState> {
        let (status_tx, status_rx) = mpsc::channel::<RTCStatus>(1);
        let (files_tx, files_rx) = oneshot::channel::<Vec<FileDto>>();
        let (selected_tx, selected_rx) = oneshot::channel::<HashSet<String>>();
        let (error_tx, error_rx) = mpsc::channel::<RTCFileError>(1);
        let (receiving_tx, receiving_rx) = mpsc::channel::<RTCFile>(1);
        let (file_status_tx, file_status_rx) = mpsc::channel::<RTCSendFileResponse>(1);

        localsend::webrtc::webrtc::accept_offer(
            &self.inner,
            stun_servers,
            &offer,
            pin,
            status_tx,
            files_tx,
            selected_rx,
            error_tx,
            receiving_tx,
            file_status_rx,
        )
        .await?;

        Ok(RTCReceiveState {
            status_rx,
            files_rx: Arc::new(Mutex::new(Some(files_rx))),
            selected_tx: Arc::new(Mutex::new(Some(selected_tx))),
            error_rx,
            receiving_rx,
            file_status_tx,
        })
    }
}

pub struct RTCSendState {
    status_rx: mpsc::Receiver<RTCStatus>,
    selected_rx: Arc<Mutex<Option<oneshot::Receiver<HashSet<String>>>>>,
    error_rx: mpsc::Receiver<RTCFileError>,
    pin_tx: mpsc::Sender<String>,
    send_tx: mpsc::Sender<RTCFile>,
}

impl RTCSendState {
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
        self.pin_tx.send(pin).await?;
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

pub struct RTCReceiveState {
    status_rx: mpsc::Receiver<RTCStatus>,
    files_rx: Arc<Mutex<Option<oneshot::Receiver<Vec<FileDto>>>>>,
    selected_tx: Arc<Mutex<Option<oneshot::Sender<HashSet<String>>>>>,
    error_rx: mpsc::Receiver<RTCFileError>,
    receiving_rx: mpsc::Receiver<RTCFile>,
    file_status_tx: mpsc::Sender<RTCSendFileResponse>,
}

impl RTCReceiveState {
    pub async fn listen_status(&mut self, sink: StreamSink<RTCStatus>) {
        while let Some(status) = self.status_rx.recv().await {
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

    pub async fn send_selection(&self, selection: HashSet<String>) -> anyhow::Result<()> {
        let Some(selected_tx) = self.selected_tx.lock().await.take() else {
            return Err(anyhow::anyhow!("Selected files already sent"));
        };

        if selected_tx.send(selection).is_err() {
            return Err(anyhow::anyhow!("Selected files channel closed"));
        };

        Ok(())
    }

    pub async fn listen_error(&mut self, sink: StreamSink<RTCFileError>) {
        while let Some(error) = self.error_rx.recv().await {
            let _ = sink.add(error);
        }
    }

    pub async fn listen_receiving(&mut self, sink: StreamSink<RTCFileReceiver>) {
        while let Some(file) = self.receiving_rx.recv().await {
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
    Joined {
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
    pub device_type: Option<PeerDeviceType>,
    pub fingerprint: String,
}

#[frb(mirror(ClientInfoWithoutId))]
pub struct _ClientInfoWithoutId {
    pub alias: String,
    pub version: String,
    pub device_model: Option<String>,
    pub device_type: Option<PeerDeviceType>,
    pub fingerprint: String,
}

#[frb(mirror(PeerDeviceType))]
pub enum _PeerDeviceType {
    Mobile,
    Desktop,
    Web,
    Headless,
    Server,
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
    TooManyRequests,
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
