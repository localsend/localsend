mod crypto;
mod http;
mod model;
mod util;
mod webrtc;

use crate::crypto::token;
use crate::http::client::LsHttpClient;
use crate::http::server::TlsConfig;
use crate::model::discovery::{DeviceType, ProtocolType, RegisterDto};
use crate::model::transfer::PrepareUploadRequestDto;
use crate::webrtc::signaling::{ClientInfo, WsServerMessage};
use crate::webrtc::webrtc::{PinConfig, RTCFile, RTCFileError, RTCSendFileResponse, RTCStatus};
use anyhow::Result;
use bytes::Bytes;
use std::collections::{HashMap, HashSet};
use std::sync::Arc;
use tokio::fs::File;
use tokio::io;
use tokio::io::{AsyncReadExt, AsyncWriteExt};
use tokio::sync::{mpsc, oneshot};
use tracing::Level;

#[tokio::main]
#[cfg(feature = "full")]
async fn main() -> Result<()> {
    tracing_subscriber::fmt()
        .with_max_level(Level::DEBUG)
        .init();

    let a = tokio::spawn(async move {
        let _ = server_test().await;
    });

    let b = tokio::spawn(async move {
        tokio::time::sleep(std::time::Duration::from_secs(2)).await;
        let _ = client_test().await;
    });

    tokio::select! {
        _ = a => {},
        _ = b => {},
    }

    Ok(())
}

const PRIVATE_KEY: &str = "-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAqeusikjBGJ/mqG+RYPyNaP2M6/YafR5bVcEr0NirDntRaSI8
SBVy6ezqGnpJJpez2rVcLfqPOZNW+yhiWmX/DFGAbKWNUjpAfEgQ0ySS3EKEfTGa
kpbBgVmSgnJKu0cuFHk3LRQXZc9USWRtfZu/HLwrxeTy0ynKBjqctkcJmyEOleSE
tWwx/sFUszI4j3QH7iAg+jJu07qCaBv1iOVoFLwtvtkHP4pIflPi4FR0nUn8VpTR
8j3h1Z/Ea6j2nW/CfatfhOiwrlOgjpd1CFtU5OoUk0OiHYgUTLRvOR0ebmKLJZp9
2x85h3ucuwzcNHXds6IrBsV7dcMeN9+nI2yYHwIDAQABAoIBAAYVzZEKN/gUyeLg
U/mAMeQ/qEtO/fXbH3Q7vcD18XJMUkcMldITCpF8DYozNOlv513+vrVa0sRCFYxb
DuKj4nVjedDqQNxf/60zu36EQconi60cGKgFRBrIxWlshGaejvTmvmYb4RahTShv
s0gbSsXRq1Oj9lo/ld+RO8l/U8W9Y2KlHc14VbAHCxlBd70Ngpw/hKzt7jVwUt2O
QMAgek5Ffbjoqk/GvwdYFtgLHLYKWNdaqt/dGCZcDWPNOv93Lb+XuI3orAcSr5T7
V2fseLMrrQfKr4dK+DSxvB/McAahSY+6sxpm972D1MYBoDM/yCK/jcdV4T83ofIl
tnavOyECgYEA077OpgXt798miVtybRgPv2cEZHnMZStHhNOO/3A2J0mnT5lCGT8M
FnB45LE7NxP5yXLi1/cBSazwF/W2TKu4g42y9X0lPzik6uM4F7AZLCwO6zd4etwa
NwKjCiPBGJkWBODQ2IeK6Gy9gnTAnGhzuPoTYEl2AH5REbM8btsRve8CgYEAzW8U
8sztt1cLWKwAsf66KZOjU03UoAhgofhXeyCDW4tLZ/l7F2cEfRaRkIx40TU1tNSy
R130DsiRmJ/7vSy00qaC7IZgFRnDXM8oWSvE31p3AiZEvMzh3cMl67u/TPFn/Zhr
iDE2fxTmNf9a860IbYeGqbOj11fFsSMNZIYf+NECgYACR/Ht8+5mQR8nJ6cJ6dJx
m2h+tJkxFdBFbAoEUm8i6TY2M050+yrkKv4CaK5cn4h3VReAgBaxdn13pJv8I3Vv
ZV1iK6D1F2Ufaqc2Ch2bTjYy7nwLxsc5hHvBJjV0UGHeV5WoX31tl45LE3rntHBa
s8b1qJTu2G2DJU0nXJDKXQKBgEhxvrpsp/u6d2baqRgb0vxscvEihjO1IJadpAPo
kEoNEhdldBHpozyVY9nMn6JvGDRfuUrPiAxakHV5HWY1yMJsM8lDDckDH9CvwPPJ
KpD1LviUFDNcMN5qPgomWCzDCL/2Kx2I9UXVUeWC2kkKIOm3HDbmAYYkDrQLv2JO
piGxAoGAfbhVHgMhroI64t64NaVpXiHy2bd36q7hLVm2+bTDpPphHwn4kIsFvVr3
uGPVsyoOa68s1eXnOnh5TzhTltsjyAYfiKo/7ZX6mHMctFlgt4njailDWOqHwj0c
Uy/QlsvXsOcN/Y99HULigND8C49F5Sz9Ih9G1DGLvd0BUUI/+qg=
-----END RSA PRIVATE KEY-----";

const CERT: &str = "-----BEGIN CERTIFICATE-----
MIIDGTCCAgGgAwIBAgIBATANBgkqhkiG9w0BAQsFADBQMRcwFQYDVQQDEw5Mb2Nh
bFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQLEwAxCTAHBgNVBAcTADEJMAcG
A1UECBMAMQkwBwYDVQQGEwAwHhcNMjUwMjEwMDE1ODM3WhcNMzUwMjA4MDE1ODM3
WjBQMRcwFQYDVQQDEw5Mb2NhbFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQL
EwAxCTAHBgNVBAcTADEJMAcGA1UECBMAMQkwBwYDVQQGEwAwggEiMA0GCSqGSIb3
DQEBAQUAA4IBDwAwggEKAoIBAQCp66yKSMEYn+aob5Fg/I1o/Yzr9hp9HltVwSvQ
2KsOe1FpIjxIFXLp7Ooaekkml7PatVwt+o85k1b7KGJaZf8MUYBspY1SOkB8SBDT
JJLcQoR9MZqSlsGBWZKCckq7Ry4UeTctFBdlz1RJZG19m78cvCvF5PLTKcoGOpy2
RwmbIQ6V5IS1bDH+wVSzMjiPdAfuICD6Mm7TuoJoG/WI5WgUvC2+2Qc/ikh+U+Lg
VHSdSfxWlNHyPeHVn8RrqPadb8J9q1+E6LCuU6COl3UIW1Tk6hSTQ6IdiBRMtG85
HR5uYoslmn3bHzmHe5y7DNw0dd2zoisGxXt1wx4336cjbJgfAgMBAAEwDQYJKoZI
hvcNAQELBQADggEBAJ/bopM5NjK/Roi1bS+qAQ7EHeVNfLyPgAReyJESHsg3mBEE
FhP729KlHcNCvaAnmxEaUH2XZTmP3s0m9IVabHhdFEyIibMQ/Qpid/JIDsG2IRw7
oNJj8z0C7eDjC9eWR+wZ2d0nnyNpWghcqAqqZSBuNpJ9jDqmg4LzdNXZUvh9e1Cq
qizxa3CQEHRYqdL/hA1N6eq7GkeiIeP+cbvWGmcSf8SS/ORMKvvDGzkGs2mFZnY/
DZmiOOqkzvgZOgOVQ2vFuJIXyZ/tY0ez35dtQYLhKRljlXjckA/PFuTJDa2kq1Rv
qqsPsY3pRq93zkKNx1xRtURBiJEvA/Js2+hHWrU=
-----END CERTIFICATE-----";

async fn crypto_test() -> Result<()> {
    let key = token::generate_key();

    let pem = token::export_private_key(&key)?;

    println!("Pem: {}", pem.as_str());

    let public_key = token::export_public_key(&key)?;

    println!("Public Key: {}", public_key);

    let fingerprint = token::generate_token_timestamp(&key)?;

    println!("Fingerprint: {}", fingerprint);

    let parsed_key = token::parse_public_key(
        "-----BEGIN PUBLIC KEY-----
MCowBQYDK2VwAyEAZmdXP230oqK92o65ra3XaF2F8r3+fK5DEBK4c40qVts=
-----END PUBLIC KEY-----",
        "ed25519",
    )?;

    let signature = token::verify_token_with_result(
        &*parsed_key,
        "sha256.RikOdJlAUTdMVFZjEk7Bft5G9cxnNBBLfgttPpyS2FY.hJCuZwAAAAA.ed25519.iNgHrRzX2Iel-Ozj47yn5o5v0cGY_BswK6JYqwY65j7Krpr43KanAaCrjUng7gHtc2pCcylUrKswR_rxyswhDA",
        |_| Ok(()),
    );

    println!("Signature Verification: {:?}", signature);

    Ok(())
}

async fn server_test() -> Result<()> {
    let server = http::server::LsHttpServer::start_with_port(
        53317,
        Some(TlsConfig {
            cert: CERT.to_string(),
            private_key: PRIVATE_KEY.to_string(),
        }),
    )
    .await?;
    tokio::time::sleep(std::time::Duration::from_secs(u64::MAX)).await;
    server.stop().await?;
    Ok(())
}

async fn client_test() -> Result<()> {
    let client = LsHttpClient::try_new(PRIVATE_KEY, CERT)?;

    let nonce = client.nonce(
        &ProtocolType::Https,
        "localhost",
        53317,
    ).await?;

    println!("Received Nonce: {}", nonce);

    let register_dto = RegisterDto {
        alias: "test 2".to_string(),
        version: "2.3".to_string(),
        device_model: Some("test".to_string()),
        device_type: Some(DeviceType::Headless),
        fingerprint: "test".to_string(),
        port: 53317,
        protocol: ProtocolType::Https,
        download: false,
    };

    let response = client
        .register(
            &ProtocolType::Https,
            "localhost",
            53317,
            register_dto.clone(),
        )
        .await?;

    println!("Public Key: {:?}", response.public_key);
    println!("Body: {:?}", response.body);

    let prepare_upload_dto = PrepareUploadRequestDto {
        info: register_dto,
        files: {
            let mut map = HashMap::new();
            let id = "test-123-id".to_string();
            let file = crate::model::transfer::FileDto {
                id: id.clone(),
                file_name: "test.mp4".to_string(),
                size: 1000,
                file_type: "video/mp4".to_string(),
                sha256: None,
                preview: None,
                metadata: None,
            };
            map.insert(id, file);
            map
        },
    };

    let prepare_upload_response = client
        .prepare_upload(
            &ProtocolType::Https,
            "localhost",
            53317,
            response.public_key,
            prepare_upload_dto,
        )
        .await?;

    println!("Prepare Upload Response: {:?}", prepare_upload_response);

    Ok(())
}

async fn webrtc_test() -> Result<()> {
    let info = webrtc::signaling::ClientInfoWithoutId {
        alias: "test".to_string(),
        version: "2.3".to_string(),
        device_model: Some("test".to_string()),
        device_type: Some(DeviceType::Desktop),
        token: "test".to_string(),
    };
    let connection =
        webrtc::signaling::SignalingConnection::connect("wss://public.localsend.org/v1/ws", &info)
            .await?;

    let (managed_connection, mut rx) = connection.start_listener();
    let managed_connection = Arc::new(managed_connection);

    while let Some(message) = rx.recv().await {
        let stun_servers = vec!["stun:stun.l.google.com:19302".to_string()];
        match message {
            WsServerMessage::Join { peer } => {
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
    let (pin_tx, mut pin_rx) = mpsc::channel::<oneshot::Sender<String>>(1);
    let (pair_tx, mut pair_rx) = oneshot::channel::<oneshot::Sender<bool>>();
    let (send_tx, send_rx) = mpsc::channel::<RTCFile>(1);

    let files = vec![model::transfer::FileDto {
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
                token::generate_key(),
                None,
                Some(PinConfig {
                    pin: "456".to_string(),
                    max_tries: 3,
                }),
                files,
                status_tx,
                selected_tx,
                error_tx,
                pin_tx,
                pair_tx,
                send_rx,
            )
            .await
            .expect("Failed to send offer");

            tracing::info!("Send offer completed");
        }
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
        let mut pin_tries = vec!["1".to_string(), "2".to_string(), "123".to_string()].into_iter();
        while let Some(send_pin) = pin_rx.recv().await {
            let pin = pin_tries.next().expect("Failed to get pin");

            tracing::info!("Sending pin: {pin}");
            send_pin.send(pin).expect("Failed to send pin");
        }
        tracing::info!("Closed channel: status");
    });

    tokio::spawn(async move {
        let Ok(send_pair) = pair_rx.await else {
            return;
        };

        tracing::info!("Declining Pair");
        send_pair.send(false).expect("Failed to send pair");
        tracing::info!("Closed channel: status");
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
    let (files_tx, files_rx) = oneshot::channel::<Vec<model::transfer::FileDto>>();
    let (selected_tx, selected_rx) = oneshot::channel::<Option<HashSet<String>>>();
    let (error_tx, mut error_rx) = mpsc::channel::<RTCFileError>(1);
    let (pin_tx, mut pin_rx) = mpsc::channel::<oneshot::Sender<String>>(1);
    let (receiving_tx, mut receiving_rx) = mpsc::channel::<RTCFile>(1);
    let (user_error_tx, user_error_rx) = mpsc::channel::<RTCSendFileResponse>(1);

    let receive_task = tokio::spawn(async move {
        webrtc::webrtc::accept_offer(
            &connection,
            stun_servers,
            &offer,
            token::generate_key(),
            None,
            Some(PinConfig {
                pin: "123".to_string(),
                max_tries: 3,
            }),
            status_tx,
            files_tx,
            selected_rx,
            error_tx,
            pin_tx,
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
        let mut pin_tries = vec!["1".to_string(), "2".to_string(), "456".to_string()].into_iter();
        while let Some(send_pin) = pin_rx.recv().await {
            let pin = pin_tries.next().expect("Failed to get pin");

            tracing::info!("Sending pin: {pin}");
            send_pin.send(pin).expect("Failed to send pin");
        }
        tracing::info!("Closed channel: status");
    });

    tokio::spawn(async move {
        let Ok(files) = files_rx.await else {
            return;
        };

        tracing::info!("Files: {files:?}");

        selected_tx
            .send(Some(files.iter().map(|file| file.id.clone()).collect()))
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
