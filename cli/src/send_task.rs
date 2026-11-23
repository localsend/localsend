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
use localsend::util::error::ErrorChain;
use std::collections::HashMap;
use std::path::PathBuf;
use std::sync::Arc;
use std::sync::atomic::{AtomicBool, AtomicU64, Ordering};
use std::time::Instant;
use tokio::sync::mpsc;
use tokio_util::sync::CancellationToken;

/// Where the content of an outgoing file comes from.
pub enum FileSource {
    Path(PathBuf),
    Bytes(Bytes),
}

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
/// bytes over all files) and log lines through `events`. A message (a single
/// file with a preview) usually ends after prepare-upload, as the receiver
/// has nothing left to download.
///
/// Emits [AppEvent::SendDialed] once the first request shows whether the
/// device can be reached over the dialed channel.
/// Always ends by emitting [AppEvent::SendEnded] with the transfer result.
pub async fn run_send(
    identity: Arc<Identity>,
    device: StatefulDevice,
    files: HashMap<String, FileDto>,
    sources: HashMap<String, FileSource>,
    progress: Arc<AtomicU64>,
    cancel: SendCancel,
    events: mpsc::Sender<AppEvent>,
) {
    let success = send_inner(identity, device, files, sources, progress, cancel, &events).await;
    let _ = events.send(AppEvent::SendEnded { success }).await;
}

async fn send_inner(
    identity: Arc<Identity>,
    device: StatefulDevice,
    files: HashMap<String, FileDto>,
    mut sources: HashMap<String, FileSource>,
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

    let dialed = device
        .get_best_channel()
        .and_then(|channel| Some((channel, channel.http()?)));
    let Some((channel, http)) = dialed else {
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
    let is_message = offered == 1 && files.values().all(|file| file.preview.is_some());
    let payload = PrepareUploadRequestDtoV2 {
        info: identity.register_dto(),
        files: files.clone(),
    };
    let prepared = client
        .prepare_upload(
            protocol.clone(),
            &http.host,
            http.port,
            None,
            payload,
            None,
            cancel.token.clone(),
        )
        .await;

    // The first request tells whether the device can be dialed on the
    // channel; the discovery store ranks the device's channels by it.
    if let Some(result) = channel_outcome(&prepared) {
        let _ = events
            .send(AppEvent::SendDialed {
                fingerprint: device.device.fingerprint.clone(),
                channel: channel.clone(),
                result,
            })
            .await;
    }

    let prepared = match prepared {
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
        if is_message {
            log(format!("{alias}: Message sent")).await;
            return true;
        }
        log(format!("{alias}: all files were declined")).await;
        return false;
    };
    if prepared.status_code != 200
        || response.session_id.is_empty()
        || response.files.is_empty()
        || response
            .files
            .iter()
            .any(|(id, token)| !files.contains_key(id) || token.is_empty())
    {
        log(format!("{alias}: Invalid prepare-upload response")).await;
        return false;
    }

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
        let content = match sources.remove(file_id.as_str()) {
            Some(FileSource::Path(path)) => FileContent::Path(path),
            Some(FileSource::Bytes(bytes)) => {
                let (tx, rx) = mpsc::channel(1);
                let _ = tx.try_send(bytes);
                FileContent::Stream(rx)
            }
            None => unreachable!("every offered file has a source"),
        };

        let body = {
            let progress = progress.clone();
            let base = sent_bytes;
            upload_body(content, move |bytes_of_file| {
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

    if is_message && sent_files == 1 {
        log(format!("{alias}: Message sent")).await;
        return true;
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

/// What the outcome of a request tells about the channel it was sent over:
/// `Ok` when the device answered, `Err` — with the reason, for display —
/// when it could not be reached. `None` when the outcome says nothing about
/// the channel.
///
/// A device that answers with an error status (declined, busy, PIN required)
/// was reached just as well as one that accepts.
fn channel_outcome<T>(result: &Result<T, ClientError>) -> Option<Result<(), String>> {
    match result {
        // The request got no response: the connection could not be
        // established (refused, timed out, failed TLS handshake) or broke.
        Err(err) if err.is_unreachable() => Some(Err(ErrorChain(err).to_string())),

        // Any other transport error means the response arrived, only its
        // body could not be read or parsed.
        Ok(_) | Err(ClientError::StatusCode(_) | ClientError::Reqwest(_)) => Some(Ok(())),

        // The user gave up waiting, which is not a failure of the channel;
        // the other errors are not errors of the transport. Whether the
        // device was reached cannot be told from them, so nothing is claimed
        // in either direction.
        Err(
            ClientError::Cancelled
            | ClientError::Json(_)
            | ClientError::Io(_)
            | ClientError::Other(_),
        ) => None,
    }
}

/// Builds a streaming request body from the file content, invoking `progress`
/// with the cumulative number of bytes of this file as chunks are sent.
fn upload_body(content: FileContent, progress: impl Fn(u64) + Send + 'static) -> reqwest::Body {
    let mut sent = 0u64;
    let stream = content.into_stream().map(move |chunk| {
        let chunk = chunk?;
        sent += chunk.len() as u64;
        progress(sent);
        Ok::<Bytes, anyhow::Error>(chunk)
    });
    reqwest::Body::wrap_stream(stream)
}

#[cfg(test)]
mod tests {
    use super::channel_outcome;
    use localsend::http::client::ClientError;
    use localsend::http::client::v2::LsHttpClientV2;
    use localsend::http::dto_v2::{
        PrepareUploadRequestDtoV2, PrepareUploadResultV2, RegisterDtoV2,
    };
    use localsend::model::discovery::ProtocolType;
    use std::collections::HashMap;
    use tokio::io::{AsyncReadExt, AsyncWriteExt};
    use tokio::net::TcpListener;
    use tokio_util::sync::CancellationToken;

    /// A device on a loopback port that reads one request and answers it
    /// with `response`, or closes the connection without an answer.
    async fn peer(response: Option<String>) -> u16 {
        let listener = TcpListener::bind("127.0.0.1:0").await.unwrap();
        let port = listener.local_addr().unwrap().port();
        tokio::spawn(async move {
            let (mut stream, _) = listener.accept().await.unwrap();
            let mut request = Vec::new();
            let mut buffer = [0u8; 1024];
            while !request.windows(4).any(|window| window == b"\r\n\r\n") {
                match stream.read(&mut buffer).await {
                    Ok(0) | Err(_) => return,
                    Ok(read) => request.extend_from_slice(&buffer[..read]),
                }
            }
            let Some(response) = response else {
                return;
            };
            let _ = stream.write_all(response.as_bytes()).await;
            let _ = stream.shutdown().await;

            // Closing with unread request bytes would reset the connection
            // before the client has read the response.
            while matches!(stream.read(&mut buffer).await, Ok(read) if read > 0) {}
        });
        port
    }

    /// A loopback port nobody listens on.
    async fn closed_port() -> u16 {
        let listener = TcpListener::bind("127.0.0.1:0").await.unwrap();
        listener.local_addr().unwrap().port()
    }

    /// The first request of a send, to the device on the loopback port.
    async fn prepare_upload(port: u16) -> Result<PrepareUploadResultV2, ClientError> {
        let payload = PrepareUploadRequestDtoV2 {
            info: RegisterDtoV2 {
                alias: "Cute Tomato".to_string(),
                version: "2.2".to_string(),
                device_model: None,
                device_type: None,
                fingerprint: "tomato".to_string(),
                port: 53317,
                protocol: ProtocolType::Http,
                download: false,
            },
            files: HashMap::new(),
        };
        LsHttpClientV2::try_new_without_cert()
            .unwrap()
            .prepare_upload(
                ProtocolType::Http,
                "127.0.0.1",
                port,
                None,
                payload,
                None,
                CancellationToken::new(),
            )
            .await
    }

    #[tokio::test]
    async fn an_accepting_device_was_reached() {
        let response = "HTTP/1.1 204 No Content\r\nconnection: close\r\n\r\n";
        let port = peer(Some(response.to_string())).await;

        let result = prepare_upload(port).await;

        assert!(result.is_ok());
        assert_eq!(channel_outcome(&result), Some(Ok(())));
    }

    #[tokio::test]
    async fn a_refusing_device_was_reached() {
        for status in ["401 Unauthorized", "403 Forbidden", "409 Conflict"] {
            let response =
                format!("HTTP/1.1 {status}\r\nconnection: close\r\ncontent-length: 0\r\n\r\n");
            let port = peer(Some(response)).await;

            let result = prepare_upload(port).await;

            assert!(
                matches!(result, Err(ClientError::StatusCode(_))),
                "{status} must be an error status"
            );
            assert_eq!(
                channel_outcome(&result),
                Some(Ok(())),
                "{status} must count as an answer"
            );
        }
    }

    #[tokio::test]
    async fn a_device_answering_garbage_was_reached() {
        let response = "HTTP/1.1 200 OK\r\nconnection: close\r\ncontent-length: 8\r\n\r\nnot json";
        let port = peer(Some(response.to_string())).await;

        let result = prepare_upload(port).await;

        assert!(matches!(result, Err(ClientError::Reqwest(_))));
        assert_eq!(channel_outcome(&result), Some(Ok(())));
    }

    #[tokio::test]
    async fn a_refused_connection_fails_the_channel_with_the_cause() {
        let result = prepare_upload(closed_port().await).await;

        let outermost = result.as_ref().err().unwrap().to_string();
        match channel_outcome(&result) {
            Some(Err(reason)) => assert!(
                reason.starts_with(&outermost) && reason.len() > outermost.len(),
                "the reason must carry the whole error chain, got: {reason}"
            ),
            outcome => panic!("expected a failure, got {outcome:?}"),
        }
    }

    #[tokio::test]
    async fn a_connection_closed_without_an_answer_fails_the_channel() {
        let port = peer(None).await;

        let result = prepare_upload(port).await;

        assert!(matches!(channel_outcome(&result), Some(Err(_))));
    }

    #[test]
    fn a_cancellation_says_nothing_about_the_channel() {
        let result: Result<(), ClientError> = Err(ClientError::Cancelled);

        assert_eq!(channel_outcome(&result), None);
    }

    #[test]
    fn an_error_outside_of_the_transport_says_nothing_about_the_channel() {
        let result: Result<(), ClientError> =
            Err(ClientError::Other(anyhow::anyhow!("Certificate not found")));
        assert_eq!(channel_outcome(&result), None);

        let result: Result<(), ClientError> =
            Err(ClientError::Io(std::io::ErrorKind::PermissionDenied.into()));
        assert_eq!(channel_outcome(&result), None);
    }
}
