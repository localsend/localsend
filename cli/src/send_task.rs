use crate::app::AppEvent;
use crate::sanitize;
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
    let alias = sanitize::single_line(&device.device.alias);
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
                        .map(|message| format!(": {}", sanitize::single_line(&message)))
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

    let file_ids = match accepted_file_ids(&response.files, &files) {
        Ok(file_ids) => file_ids,
        Err(_) => {
            log(format!("{alias}: Receiver returned an unexpected file ID")).await;
            let _ = client
                .cancel(protocol, &http.host, http.port, &response.session_id)
                .await;
            return;
        }
    };

    let accepted_bytes: u64 = file_ids.iter().map(|file_id| files[*file_id].size).sum();
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

/// Verifies that the receiver accepted only files offered in the request and
/// returns their IDs in a stable upload order.
fn accepted_file_ids<'a>(
    accepted: &'a HashMap<String, String>,
    offered: &HashMap<String, FileDto>,
) -> Result<Vec<&'a String>, &'a String> {
    let mut file_ids: Vec<&String> = accepted.keys().collect();
    for file_id in &file_ids {
        if !offered.contains_key(*file_id) {
            return Err(*file_id);
        }
    }
    file_ids.sort_by_key(|file_id| &offered[*file_id].file_name);
    Ok(file_ids)
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

#[cfg(test)]
mod tests {
    use super::accepted_file_ids;
    use localsend::model::transfer::FileDto;
    use std::collections::HashMap;

    fn file(id: &str, file_name: &str) -> FileDto {
        FileDto {
            id: id.to_string(),
            file_name: file_name.to_string(),
            size: 1,
            file_type: "application/octet-stream".to_string(),
            sha256: None,
            preview: None,
            metadata: None,
        }
    }

    #[test]
    fn rejects_an_unoffered_file_id() {
        let accepted = HashMap::from([("unexpected".to_string(), "token".to_string())]);
        let offered = HashMap::from([("offered".to_string(), file("offered", "file.txt"))]);

        assert_eq!(
            accepted_file_ids(&accepted, &offered).unwrap_err(),
            "unexpected"
        );
    }

    #[test]
    fn orders_valid_file_ids_by_file_name() {
        let accepted = HashMap::from([
            ("a-id".to_string(), "token-a".to_string()),
            ("z-id".to_string(), "token-z".to_string()),
        ]);
        let offered = HashMap::from([
            ("a-id".to_string(), file("a-id", "zulu.txt")),
            ("z-id".to_string(), file("z-id", "alpha.txt")),
            ("declined".to_string(), file("declined", "ignored.txt")),
        ]);

        let file_ids = accepted_file_ids(&accepted, &offered).unwrap();
        assert_eq!(
            file_ids.into_iter().map(String::as_str).collect::<Vec<_>>(),
            vec!["z-id", "a-id"]
        );
    }
}
