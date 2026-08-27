use crate::app::AppEvent;
use crate::storage::Identity;
use crate::ui::Category;
use crate::util;
use bytes::Bytes;
use futures_util::StreamExt;
use localsend::discovery::StatefulDevice;
use localsend::http::client::ClientError;
use localsend::http::client::v2::LsHttpClientV2;
use localsend::http::dto_v2::PrepareUploadRequestDtoV2;
use localsend::model::discovery::ProtocolType;
use localsend::model::transfer::{FileContent, FileDto};
use localsend::reqwest;
use std::collections::HashMap;
use std::path::PathBuf;
use std::sync::Arc;
use std::sync::atomic::{AtomicBool, AtomicU64, Ordering};
use std::time::Instant;
use tokio::sync::mpsc;
use tokio_stream::wrappers::ReceiverStream;
use tokio_util::sync::CancellationToken;

/// Cancellation state of a send, shared between the app and the send task.
#[derive(Clone)]
pub struct SendCancel {
    pub token: CancellationToken,

    /// Set (before triggering `token`) when the receiver requested the
    /// cancellation; only a local cancellation still has to notify the
    /// receiver.
    pub by_peer: Arc<AtomicBool>,
}

impl SendCancel {
    pub fn new() -> Self {
        Self {
            token: CancellationToken::new(),
            by_peer: Arc::new(AtomicBool::new(false)),
        }
    }
}

/// Sends the given files to a device: prepare-upload, then one upload request
/// per accepted file. Progress is reported through `progress` (cumulative
/// bytes over all files) and log lines through `events`.
///
/// Always ends by emitting [AppEvent::SendEnded] with the transfer result.
pub async fn run_send(
    identity: Arc<Identity>,
    device: StatefulDevice,
    files: HashMap<String, FileDto>,
    paths: HashMap<String, PathBuf>,
    progress: Arc<AtomicU64>,
    cancel: SendCancel,
    events: mpsc::Sender<AppEvent>,
) {
    let success = send_inner(identity, device, files, paths, progress, cancel, &events).await;
    let _ = events.send(AppEvent::SendEnded { success }).await;
}

async fn send_inner(
    identity: Arc<Identity>,
    device: StatefulDevice,
    files: HashMap<String, FileDto>,
    paths: HashMap<String, PathBuf>,
    progress: Arc<AtomicU64>,
    cancel: SendCancel,
    events: &mpsc::Sender<AppEvent>,
) -> bool {
    let alias = device.device.alias.clone();
    let log = |text: String| {
        let events = events.clone();
        async move {
            let _ = events
                .send(AppEvent::Log {
                    category: Category::Send,
                    text,
                })
                .await;
        }
    };

    let Some(http) = device.get_best_channel().and_then(|channel| channel.http()) else {
        log(format!("{alias}: No dialable address")).await;
        return false;
    };
    let protocol = match http.protocol {
        ProtocolType::Http => ProtocolType::Http,
        ProtocolType::Https => ProtocolType::Https,
    };
    let expected_fingerprint = match http.protocol {
        ProtocolType::Https => Some(device.device.fingerprint.clone()),
        ProtocolType::Http => None,
    };
    let client = match LsHttpClientV2::try_new(
        &identity.key_pem,
        &identity.cert_pem,
        expected_fingerprint,
        None,
    ) {
        Ok(client) => client,
        Err(err) => {
            log(format!("{alias}: Failed to create HTTP client: {err}")).await;
            return false;
        }
    };

    let offered = files.len();
    let payload = PrepareUploadRequestDtoV2 {
        info: identity.register_dto(),
        files: files.clone(),
    };
    let prepared = match client
        .prepare_upload(
            protocol.clone(),
            &http.host,
            http.port,
            None,
            payload,
            None,
            cancel.token.clone(),
        )
        .await
    {
        Ok(prepared) => prepared,
        Err(ClientError::Cancelled) => {
            log(format!("{alias}: Cancelled")).await;
            return false;
        }
        Err(ClientError::StatusCode(err)) => {
            let reason = match err.status {
                401 => "PIN required (not supported by the CLI)".to_string(),
                403 => "Declined".to_string(),
                409 => "Blocked by another session".to_string(),
                429 => "Too many requests".to_string(),
                status => format!(
                    "Request failed with status {status}{}",
                    err.message
                        .map(|message| format!(": {message}"))
                        .unwrap_or_default()
                ),
            };
            log(format!("{alias}: {reason}")).await;
            return false;
        }
        Err(err) => {
            log(format!("{alias}: {err}")).await;
            return false;
        }
    };

    let Some(response) = prepared.response else {
        log(format!("{alias}: all files were declined")).await;
        return false;
    };

    let accepted_bytes: u64 = response
        .files
        .keys()
        .filter_map(|file_id| files.get(file_id))
        .map(|file| file.size)
        .sum();
    let _ = events
        .send(AppEvent::SendSessionStarted {
            session_id: response.session_id.clone(),
            accepted_bytes,
        })
        .await;
    if response.files.len() < offered {
        log(format!(
            "{alias}: receiver accepted {} of {offered} files",
            response.files.len()
        ))
        .await;
    }

    // Upload sequentially in a stable order.
    let mut file_ids: Vec<&String> = response.files.keys().collect();
    file_ids.sort_by_key(|file_id| &files[*file_id].file_name);

    let started = Instant::now();
    let mut sent_files = 0usize;
    let mut sent_bytes = 0u64;
    for file_id in file_ids {
        let token = &response.files[file_id];
        let file = &files[file_id];
        let path = paths[file_id].clone();

        let body = {
            let progress = progress.clone();
            let base = sent_bytes;
            upload_body(FileContent::Path(path), move |bytes_of_file| {
                progress.store(base + bytes_of_file, Ordering::Relaxed);
            })
        };

        match client
            .upload(
                protocol.clone(),
                &http.host,
                http.port,
                None,
                &response.session_id,
                file_id,
                token,
                body,
                cancel.token.clone(),
            )
            .await
        {
            Ok(()) => {
                sent_files += 1;
                sent_bytes += file.size;
                progress.store(sent_bytes, Ordering::Relaxed);
            }
            Err(ClientError::Cancelled) => {
                if cancel.by_peer.load(Ordering::Relaxed) {
                    log(format!(
                        "{alias}: Cancelled by receiver ({sent_files} file(s) sent)"
                    ))
                    .await;
                } else {
                    // Cancelled locally: the receiver does not know yet.
                    let _ = client
                        .cancel(
                            protocol.clone(),
                            &http.host,
                            http.port,
                            &response.session_id,
                        )
                        .await;
                    log(format!("{alias}: Cancelled ({sent_files} file(s) sent)")).await;
                }
                return false;
            }
            Err(err) => {
                log(format!(
                    "{alias}: Failed to upload {}: {err}",
                    file.file_name
                ))
                .await;
                let _ = client
                    .cancel(
                        protocol.clone(),
                        &http.host,
                        http.port,
                        &response.session_id,
                    )
                    .await;
                return false;
            }
        }
    }

    log(format!(
        "{alias}: Sent {sent_files} file{} ({}, took {})",
        if sent_files == 1 { "" } else { "s" },
        util::format_bytes(sent_bytes),
        util::format_duration(started.elapsed()),
    ))
    .await;
    true
}

/// Builds a streaming request body from the file content, invoking `progress`
/// with the cumulative number of bytes of this file as chunks are sent.
fn upload_body(content: FileContent, progress: impl Fn(u64) + Send + 'static) -> reqwest::Body {
    let mut sent = 0u64;
    let stream = ReceiverStream::new(content.into_receiver()).map(move |chunk| {
        sent += chunk.len() as u64;
        progress(sent);
        Ok::<Bytes, anyhow::Error>(chunk)
    });
    reqwest::Body::wrap_stream(stream)
}
