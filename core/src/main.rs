mod model;
mod util;
mod webrtc;

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

    let mut managed_connection = connection.start_listener();
    let cloneable_connection = managed_connection.cloneable();

    let on_joined_task = tokio::spawn({
        let cloneable_connection = cloneable_connection.clone();
        async move {
            while let Some(message) = managed_connection.on_joined_peer.recv().await {
                println!("Joined: {:?}", message);
                webrtc::webrtc::send_offer(&cloneable_connection, message.id, &*vec![])
                    .await
                    .expect("Failed to send offer");
            }
        }
    });

    let on_left_task = tokio::spawn(async move {
        while let Some(message) = managed_connection.on_left_peer.recv().await {
            println!("Left: {:?}", message);
        }
    });

    let on_offer_task = tokio::spawn({
        let cloneable_connection = cloneable_connection.clone();
        async move {
            while let Some(message) = managed_connection.on_offer.recv().await {
                println!("Offer: {:?}", message);
                webrtc::webrtc::accept_offer(&cloneable_connection, &message)
                    .await
                    .expect("Failed to accept offer");
            }
        }
    });

    on_joined_task.await?;
    on_left_task.await?;
    on_offer_task.await?;

    Ok(())
}
