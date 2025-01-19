mod model;
mod util;
mod webrtc;

use std::collections::HashSet;
use anyhow::Result;
use tokio::sync::mpsc;
use tracing::Level;
use crate::webrtc::signaling::WsServerMessage;
use crate::webrtc::webrtc::{RTCFileError, RTCFile, RTCStatus};

#[tokio::main]
#[cfg(feature = "full")]
async fn main() -> Result<()> {
    tracing_subscriber::fmt()
        .with_max_level(Level::DEBUG)
        .init();

    let info = webrtc::signaling::ClientInfoWithoutId {
        alias: "test".to_string(),
        version: "2.3".to_string(),
        device_model: Some("test".to_string()),
        device_type: Some(webrtc::signaling::PeerDeviceType::Desktop),
        fingerprint: "test".to_string(),
    };
    let mut connection =
        webrtc::signaling::SignalingConnection::connect("wss://public.localsend.org/v1/ws", &info)
            .await?;

    let (managed_connection, mut rx) = connection.start_listener();


    while let Some(message) = rx.recv().await {
        match message {
            WsServerMessage::Joined { peer } => {
                println!("Joined: {:?}", peer);
                let (status_tx, status_rx) = mpsc::channel::<RTCStatus>(16);
                let (selected_tx, selected_rx) = mpsc::channel::<HashSet<String>>(16);
                let (error_tx, error_rx) = mpsc::channel::<RTCFileError>(16);
                let (send_tx, send_rx) = mpsc::channel::<RTCFile>(16);
                webrtc::webrtc::send_offer(&managed_connection, peer.id, vec![], status_tx, selected_tx, error_tx, send_rx)
                    .await
                    .expect("Failed to send offer");
            }
            WsServerMessage::Offer(offer) => {
                println!("Offer: {:?}", offer);
                webrtc::webrtc::accept_offer(&managed_connection, &offer)
                    .await
                    .expect("Failed to accept offer");
            }
            _ => {}
        }
    }

    Ok(())
}
