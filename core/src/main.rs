mod model;
mod util;
mod webrtc;

use crate::webrtc::signaling::WsServerMessage;
use crate::webrtc::webrtc::{RTCFile, RTCFileError, RTCStatus};
use anyhow::Result;
use std::collections::HashSet;
use tokio::sync::{mpsc, oneshot};
use tracing::Level;

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
    let connection =
        webrtc::signaling::SignalingConnection::connect("wss://public.localsend.org/v1/ws", &info)
            .await?;

    let (managed_connection, mut rx) = connection.start_listener();

    while let Some(message) = rx.recv().await {
        match message {
            WsServerMessage::Joined { peer } => {
                tracing::debug!("Joined: {peer:?}");
                let (status_tx, status_rx) = mpsc::channel::<RTCStatus>(16);
                let (selected_tx, selected_rx) = mpsc::channel::<HashSet<String>>(16);
                let (error_tx, error_rx) = mpsc::channel::<RTCFileError>(16);
                let (send_tx, send_rx) = mpsc::channel::<RTCFile>(16);
                webrtc::webrtc::send_offer(
                    &managed_connection,
                    peer.id,
                    vec![],
                    status_tx,
                    selected_tx,
                    error_tx,
                    send_rx,
                )
                .await
                .expect("Failed to send offer");
            }
            WsServerMessage::Offer(offer) => {
                tracing::debug!("Offer: {offer:?}");
                let (status_tx, status_rx) = mpsc::channel::<RTCStatus>(16);
                let (files_tx, files_rx) = oneshot::channel::<Vec<model::file::FileDto>>();
                let (selected_tx, selected_rx) = oneshot::channel::<HashSet<String>>();
                let (error_tx, error_rx) = mpsc::channel::<RTCFileError>(16);
                let (receiving_tx, receiving_rx) = mpsc::channel::<RTCFile>(16);
                webrtc::webrtc::accept_offer(&managed_connection, &offer, status_tx, files_tx, selected_rx, error_tx, receiving_tx)
                    .await
                    .expect("Failed to accept offer");
            }
            _ => {}
        }
    }

    Ok(())
}
