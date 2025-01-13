mod model;
mod util;
mod webrtc;

use anyhow::Result;
use tracing::Level;
use crate::webrtc::signaling::WsServerMessage;

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
                webrtc::webrtc::send_offer(&managed_connection, peer.id, vec![])
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
