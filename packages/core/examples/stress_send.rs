//! Stress test for the receiving side: sends many files over plain HTTP.
//!
//! The receiver must have encryption disabled so that plain HTTP is accepted.
//!
//! Usage:
//!   cargo run --release --example stress_send --features full -- [host] [port] [pin]

use localsend::http::client::LsHttpClientV2;
use localsend::http::dto_v2::PrepareUploadRequestDtoV2;
use localsend::http::dto_v2::RegisterDtoV2;
use localsend::model::discovery::{DeviceType, ProtocolType, PROTOCOL_VERSION_V2};
use localsend::model::transfer::FileDto;
use rand::{Rng, RngExt};
use std::collections::HashMap;
use tokio_util::sync::CancellationToken;

const FILE_COUNT: usize = 1000;
const FILE_SIZE: usize = 1024 * 1024;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    let mut args = std::env::args().skip(1);
    let host = args.next().unwrap_or_else(|| "127.0.0.1".to_string());
    let port: u16 = args.next().map(|arg| arg.parse()).transpose()?.unwrap_or(53317);
    let pin = args.next();

    let mut rng = rand::rng();

    // Random fingerprint in the SHA-256 uppercase hex format.
    // A fresh one per run, so the receiver treats every run as a new device.
    let fingerprint: String = (0..32).map(|_| format!("{:02X}", rng.random::<u8>())).collect();

    let files: HashMap<String, FileDto> = (0..FILE_COUNT)
        .map(|i| {
            let id = format!("file-{i}");
            let file = FileDto {
                id: id.clone(),
                file_name: format!("stress/dir{:02}/sub{}/file{i:04}.bin", i % 20, i % 3),
                size: FILE_SIZE as u64,
                file_type: "application/octet-stream".to_string(),
                sha256: None,
                preview: None,
                metadata: None,
            };
            (id, file)
        })
        .collect();

    let payload = PrepareUploadRequestDtoV2 {
        info: RegisterDtoV2 {
            alias: "Stress Sender".to_string(),
            version: PROTOCOL_VERSION_V2.to_string(),
            device_model: Some("Stress".to_string()),
            device_type: Some(DeviceType::Headless),
            fingerprint,
            port,
            protocol: ProtocolType::Http,
            download: false,
        },
        files,
    };

    let client = LsHttpClientV2::try_new_without_cert()?;

    println!(
        "Preparing upload of {FILE_COUNT} files ({} MiB total) to {host}:{port}...",
        FILE_COUNT * FILE_SIZE / (1024 * 1024)
    );
    let prepared = client
        .prepare_upload(
            ProtocolType::Http,
            &host,
            port,
            None,
            payload,
            pin.as_deref(),
            CancellationToken::new(),
        )
        .await?;

    let Some(response) = prepared.response else {
        println!("Receiver accepted no files (status {})", prepared.status_code);
        return Ok(());
    };
    println!(
        "Session {}: {} of {FILE_COUNT} files accepted",
        response.session_id,
        response.files.len()
    );

    let started = std::time::Instant::now();
    let mut sent = 0_usize;
    for i in 0..FILE_COUNT {
        let id = format!("file-{i}");
        let Some(token) = response.files.get(&id) else {
            continue;
        };

        let mut bytes = vec![0_u8; FILE_SIZE];
        rng.fill_bytes(&mut bytes);

        client
            .upload(
                ProtocolType::Http,
                &host,
                port,
                None,
                &response.session_id,
                &id,
                token,
                localsend::reqwest::Body::from(bytes),
                CancellationToken::new(),
            )
            .await
            .map_err(|err| anyhow::anyhow!("Upload of {id} failed: {err}"))?;

        sent += 1;
        if sent.is_multiple_of(100) {
            println!("{sent} files sent...");
        }
    }

    println!("Done: {sent} files in {:.1?}", started.elapsed());
    Ok(())
}
