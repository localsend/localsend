mod model;
mod util;
mod webrtc;

use crate::webrtc::signaling::WsMessageType;
use anyhow::Result;
use tracing::Level;

#[tokio::main]
#[cfg(feature = "full")]
async fn main() -> Result<()> {
    tracing_subscriber::fmt()
        .with_max_level(Level::DEBUG)
        .init();

    let info = webrtc::signaling::PeerInfoWithoutId {
        alias: "test".to_string(),
        fingerprint: "test".to_string(),
        device_model: "test".to_string(),
        device_type: webrtc::signaling::PeerDeviceType::Desktop,
    };
    let mut connection =
        webrtc::signaling::SignalingConnection::connect("wss://public.localsend.org/v1/ws", &info)
            .await?;

    let (managed_connection, mut rx) = connection.start_listener();

    while let Some(message) = rx.recv().await {
        match message.ws_type {
            WsMessageType::Joined => {
                println!("Joined: {:?}", message);
                webrtc::webrtc::send_offer(&managed_connection, message.peer.unwrap().id, &*vec![])
                    .await
                    .expect("Failed to send offer");
            }
            WsMessageType::Offer => {
                println!("Offer: {:?}", message);
                webrtc::webrtc::accept_offer(&managed_connection, &message)
                    .await
                    .expect("Failed to accept offer");
            }
            _ => {}
        }
    }

    Ok(())
}
