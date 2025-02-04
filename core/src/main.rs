mod model;
mod util;
mod webrtc;

use crate::webrtc::signaling::{ClientInfo, WsServerMessage};
use crate::webrtc::webrtc::{PinConfig, RTCFile, RTCFileError, RTCSendFileResponse, RTCStatus};
use anyhow::Result;
use bytes::Bytes;
use std::collections::HashSet;
use std::sync::Arc;
use tokio::fs::File;
use tokio::io;
use tokio::io::{AsyncReadExt, AsyncWriteExt};
use tokio::sync::{mpsc, oneshot};
use tracing::Level;

#[tokio::main]
#[cfg(feature = "full")]
async fn main() -> Result<()> {
    tracing_subscriber::fmt().with_max_level(Level::INFO).init();

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
    let managed_connection = Arc::new(managed_connection);

    while let Some(message) = rx.recv().await {
        let stun_servers = vec!["stun:stun.l.google.com:19302".to_string()];
        match message {
            WsServerMessage::Joined { peer } => {
                send_handler(managed_connection.clone(), stun_servers, peer).await;
                return Ok(());
            }
            WsServerMessage::Offer(offer) => {
                receive_handler(managed_connection.clone(), stun_servers, offer).await;
            }
            _ => {}
        }
    }

    Ok(())
}

async fn send_handler(
    connection: Arc<webrtc::signaling::ManagedSignalingConnection>,
    stun_servers: Vec<String>,
    peer: ClientInfo,
) {
    tracing::info!("Joined: {peer:?}");
    let (status_tx, mut status_rx) = mpsc::channel::<RTCStatus>(1);
    let (selected_tx, mut selected_rx) = oneshot::channel::<HashSet<String>>();
    let (error_tx, mut error_rx) = mpsc::channel::<RTCFileError>(1);
    let (pin_tx, pin_rx) = mpsc::channel::<String>(1);
    let (send_tx, send_rx) = mpsc::channel::<RTCFile>(1);

    let files = vec![model::file::FileDto {
        id: "test-123-id".to_string(),
        file_name: "test.mp4".to_string(),
        size: 100,
        file_type: "video/mp4".to_string(),
        sha256: None,
        preview: None,
        metadata: None,
    }];

    let send_task = tokio::spawn({
        let files = files.clone();
        async move {
            webrtc::webrtc::send_offer(
                &connection,
                stun_servers,
                peer.id,
                files,
                status_tx,
                selected_tx,
                error_tx,
                pin_rx,
                send_rx,
            )
            .await
            .expect("Failed to send offer");

            tracing::info!("Send offer completed");
        }
    });

    tokio::spawn(async move {
        let mut pin_tries = vec!["1".to_string(), "2".to_string(), "123".to_string()].into_iter();
        while let Some(status) = status_rx.recv().await {
            tracing::info!("Status: {status:?}");

            if status == RTCStatus::PinRequired {
                let pin = pin_tries.next().expect("Failed to get pin");

                tracing::info!("Sending pin: {pin}");
                pin_tx.send(pin).await.expect("Failed to send pin");
            }
        }
        tracing::info!("Closed channel: status");
    });

    tokio::spawn(async move {
        while let Some(error) = error_rx.recv().await {
            tracing::info!("Error: {error:?}");
        }
        tracing::info!("Closed channel: error");
    });

    tokio::spawn(async move {
        let Ok(selected) = selected_rx.await else {
            return;
        };

        tracing::info!("Selected: {selected:?}");

        let file = files.first().unwrap();
        let (tx, mut rx) = mpsc::channel::<Bytes>(16);
        send_tx
            .try_send(RTCFile {
                file_id: file.id.clone(),
                binary_rx: rx,
            })
            .expect("Failed to send file");

        let file_path = "/Users/user/Downloads/test/send/test.mp4";
        let start_time = std::time::Instant::now();
        read_file_to_sender(file_path, tx)
            .await
            .expect("Failed to read file");

        let file_size = std::fs::metadata(file_path).unwrap().len();
        tracing::info!(
            "Sending file completed in {:?}, speed: {} MB/s",
            start_time.elapsed(),
            file_size as f64 / 1024.0 / 1024.0 / start_time.elapsed().as_secs_f64()
        );
    });

    let result = send_task.await;
    tracing::info!("Send task finished with result: {:?}", result);
}

async fn receive_handler(
    connection: Arc<webrtc::signaling::ManagedSignalingConnection>,
    stun_servers: Vec<String>,
    offer: webrtc::signaling::WsServerSdpMessage,
) {
    tracing::info!("Offer: {offer:?}");
    let (status_tx, mut status_rx) = mpsc::channel::<RTCStatus>(1);
    let (files_tx, files_rx) = oneshot::channel::<Vec<model::file::FileDto>>();
    let (selected_tx, selected_rx) = oneshot::channel::<HashSet<String>>();
    let (error_tx, mut error_rx) = mpsc::channel::<RTCFileError>(1);
    let (receiving_tx, mut receiving_rx) = mpsc::channel::<RTCFile>(1);
    let (user_error_tx, user_error_rx) = mpsc::channel::<RTCSendFileResponse>(1);

    let receive_task = tokio::spawn(async move {
        webrtc::webrtc::accept_offer(
            &connection,
            stun_servers,
            &offer,
            Some(PinConfig {
                pin: "123".to_string(),
                max_tries: 3,
            }),
            status_tx,
            files_tx,
            selected_rx,
            error_tx,
            receiving_tx,
            user_error_rx,
        )
        .await
        .expect("Failed to accept offer");

        tracing::info!("Accept offer completed");
    });

    tokio::spawn(async move {
        while let Some(status) = status_rx.recv().await {
            tracing::info!("Status: {status:?}");
        }
        tracing::info!("Closed channel: status");
    });

    tokio::spawn(async move {
        while let Some(error) = error_rx.recv().await {
            tracing::info!("Error: {error:?}");
        }
        tracing::info!("Closed channel: error");
    });

    tokio::spawn(async move {
        let Ok(files) = files_rx.await else {
            return;
        };

        tracing::info!("Files: {files:?}");

        selected_tx
            .send(files.iter().map(|file| file.id.clone()).collect())
            .expect("Failed to send selected");

        while let Some(file) = receiving_rx.recv().await {
            tracing::info!("Receiving file: {file:?}");

            let file_dto = files.iter().find(|f| f.id == file.file_id).unwrap();

            let file_path = format!("/Users/user/Downloads/test/{}", file_dto.file_name);
            write_file_from_receiver(file_path.as_ref(), file.binary_rx)
                .await
                .expect("Failed to write file");

            user_error_tx
                .send(RTCSendFileResponse {
                    id: file.file_id,
                    success: true,
                    error: None,
                })
                .await
                .expect("Failed to send response");
        }

        tracing::info!("Receiving files completed");
    });

    let result = receive_task.await;
    tracing::info!("Receive task finished with result: {:?}", result);
}

async fn read_file_to_sender(file_path: &str, sender: mpsc::Sender<Bytes>) -> io::Result<()> {
    let mut file = File::open(file_path).await?;

    let mut buffer = [0u8; 1024];

    loop {
        // Read a chunk of the file
        let bytes_read = file.read(&mut buffer).await?;

        if bytes_read == 0 {
            break; // EOF
        }

        // Send the chunk through the channel
        let chunk = Bytes::copy_from_slice(&buffer[..bytes_read]);
        if sender.send(chunk).await.is_err() {
            tracing::error!("Receiver dropped, stopping.");
            break;
        }
    }

    Ok(())
}

async fn write_file_from_receiver(
    file_path: &str,
    mut receiver: mpsc::Receiver<Bytes>,
) -> io::Result<()> {
    let mut file = File::create(file_path).await?;

    while let Some(chunk) = receiver.recv().await {
        file.write_all(&chunk).await?;
    }

    Ok(())
}
