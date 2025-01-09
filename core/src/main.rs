mod util;
mod webrtc;

use anyhow::Result;

#[tokio::main]
#[cfg(feature = "full")]
async fn main() -> Result<()> {
    let info = webrtc::signaling::PeerInfoWithoutId {
        alias: "test".to_string(),
        fingerprint: "test".to_string(),
        device_model: "test".to_string(),
        device_type: webrtc::signaling::PeerDeviceType::Desktop,
    };
    let mut rx =
        webrtc::signaling::connect_and_listen("wss://public.localsend.org/v1/ws", &info).await?;

    // listen for messages
    while let Some(message) = rx.recv().await {
        println!("Received MAIN: {:?}", message);
    }

    Ok(())
}
