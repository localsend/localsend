use crate::frb_generated::StreamSink;
use flutter_rust_bridge::DartFnFuture;
use localsend::webrtc::signaling;
use localsend::webrtc::signaling::SignalingConnection;
use std::str::FromStr;
use uuid::Uuid;

pub async fn connect(
    sink: StreamSink<WsServerMessage>,
    uri: String,
    info: PeerInfoWithoutId,
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

pub enum WsServerMessage {
    Hello(WsServerHelloMessage),
    Joined(WsServerJoinedMessage),
    Left(WsServerLeftMessage),
    Offer(WsServerOfferMessage),
    Answer(WsServerAnswerMessage),
    Error(WsServerErrorMessage),
}

pub struct WsServerHelloMessage {
    pub client: PeerInfo,
    pub members: Vec<PeerInfo>,
}

pub struct WsServerJoinedMessage {
    pub peer: PeerInfo,
}

pub struct WsServerLeftMessage {
    pub peer_id: String,
}

pub struct WsServerOfferMessage {
    pub peer: PeerInfo,
    pub session_id: String,
    pub sdp: String,
}

pub struct WsServerAnswerMessage {
    pub peer: PeerInfo,
    pub session_id: String,
    pub sdp: String,
}

pub struct WsServerErrorMessage {
    pub code: u16,
}

pub struct PeerInfo {
    pub id: String,
    pub fingerprint: String,
    pub alias: String,
    pub device_model: String,
    pub device_type: PeerDeviceType,
}

pub struct PeerInfoWithoutId {
    pub fingerprint: String,
    pub alias: String,
    pub device_model: String,
    pub device_type: PeerDeviceType,
}

pub enum PeerDeviceType {
    Mobile,
    Desktop,
    Web,
    Headless,
    Server,
}

impl Into<PeerDeviceType> for signaling::PeerDeviceType {
    fn into(self) -> PeerDeviceType {
        match self {
            signaling::PeerDeviceType::Mobile => PeerDeviceType::Mobile,
            signaling::PeerDeviceType::Desktop => PeerDeviceType::Desktop,
            signaling::PeerDeviceType::Web => PeerDeviceType::Web,
            signaling::PeerDeviceType::Headless => PeerDeviceType::Headless,
            signaling::PeerDeviceType::Server => PeerDeviceType::Server,
        }
    }
}

impl Into<PeerInfo> for signaling::PeerInfo {
    fn into(self) -> PeerInfo {
        PeerInfo {
            id: self.id.to_string(),
            fingerprint: self.fingerprint,
            alias: self.alias,
            device_model: self.device_model,
            device_type: self.device_type.into(),
        }
    }
}

impl Into<signaling::PeerInfo> for PeerInfo {
    fn into(self) -> signaling::PeerInfo {
        signaling::PeerInfo {
            id: Uuid::from_str(&self.id).unwrap(),
            fingerprint: self.fingerprint,
            alias: self.alias,
            device_model: self.device_model,
            device_type: self.device_type.into(),
        }
    }
}

impl Into<signaling::PeerInfoWithoutId> for PeerInfoWithoutId {
    fn into(self) -> signaling::PeerInfoWithoutId {
        signaling::PeerInfoWithoutId {
            fingerprint: self.fingerprint,
            alias: self.alias,
            device_model: self.device_model,
            device_type: self.device_type.into(),
        }
    }
}

impl Into<signaling::PeerDeviceType> for PeerDeviceType {
    fn into(self) -> signaling::PeerDeviceType {
        match self {
            PeerDeviceType::Mobile => signaling::PeerDeviceType::Mobile,
            PeerDeviceType::Desktop => signaling::PeerDeviceType::Desktop,
            PeerDeviceType::Web => signaling::PeerDeviceType::Web,
            PeerDeviceType::Headless => signaling::PeerDeviceType::Headless,
            PeerDeviceType::Server => signaling::PeerDeviceType::Server,
        }
    }
}

impl Into<WsServerMessage> for signaling::WsServerMessage {
    fn into(self) -> WsServerMessage {
        match self.ws_type {
            signaling::WsMessageType::Hello => WsServerMessage::Hello(WsServerHelloMessage {
                client: self.client.unwrap().into(),
                members: self
                    .members
                    .unwrap()
                    .into_iter()
                    .map(|p| p.into())
                    .collect(),
            }),
            signaling::WsMessageType::Joined => WsServerMessage::Joined(WsServerJoinedMessage {
                peer: self.peer.unwrap().into(),
            }),
            signaling::WsMessageType::Left => WsServerMessage::Left(WsServerLeftMessage {
                peer_id: self.peer_id.unwrap().to_string(),
            }),
            signaling::WsMessageType::Offer => WsServerMessage::Offer(WsServerOfferMessage {
                peer: self.peer.unwrap().into(),
                session_id: self.session_id.unwrap(),
                sdp: self.sdp.unwrap(),
            }),
            signaling::WsMessageType::Answer => WsServerMessage::Answer(WsServerAnswerMessage {
                peer: self.peer.unwrap().into(),
                session_id: self.session_id.unwrap(),
                sdp: self.sdp.unwrap(),
            }),
            signaling::WsMessageType::Error => WsServerMessage::Error(WsServerErrorMessage {
                code: self.code.unwrap(),
            }),
        }
    }
}

pub struct LsSignalingConnection {
    inner: signaling::ManagedSignalingConnection,
}

impl LsSignalingConnection {
    pub async fn send_offer(
        &self,
        target: String,
    ) -> flutter_rust_bridge::for_generated::anyhow::Result<()> {
        localsend::webrtc::webrtc::send_offer(
            &self.inner,
            Uuid::from_str(&target).unwrap(),
            &vec![],
        )
        .await?;

        Ok(())
    }

    pub async fn accept_offer(
        &self,
        offer: WsServerOfferMessage,
    ) -> flutter_rust_bridge::for_generated::anyhow::Result<()> {
        let offer = offer.into();
        localsend::webrtc::webrtc::accept_offer(&self.inner, &offer).await?;

        Ok(())
    }
}

impl Into<signaling::WsServerMessage> for WsServerOfferMessage {
    fn into(self) -> signaling::WsServerMessage {
        signaling::WsServerMessage {
            ws_type: signaling::WsMessageType::Offer,
            members: None,
            client: None,
            peer: Some(self.peer.into()),
            peer_id: None,
            session_id: Some(self.session_id),
            sdp: Some(self.sdp),
            code: None,
        }
    }
}
