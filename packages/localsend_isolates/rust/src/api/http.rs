use crate::api::cancel::RsCancellationToken;
use crate::api::stream;
use crate::frb_generated::StreamSink;
use flutter_rust_bridge::frb;
pub use localsend::http::client::{ClientError, LsHttpClientVersion};
pub use localsend::http::dto::{
    PrepareUploadRequestDto, PrepareUploadResponseDto, PrepareUploadResult, RegisterDto,
    RegisterResponseDto,
};
use localsend::model::discovery::ProtocolType;
use localsend::util::error::ErrorChain;

pub struct RsHttpClient {
    inner: localsend::http::client::LsHttpClient,
}

/// Creates an HTTP client.
///
/// `expected_fingerprint` pins the peer to the certificate with that SHA-256
/// fingerprint (uppercase hex). It is enforced during the TLS handshake, so a
/// peer that does not present the expected certificate never receives the
/// request. Pass `None` only for discovery, where the peer is not known yet.
#[frb(sync)]
pub fn create_client(
    private_key: String,
    cert: String,
    version: LsHttpClientVersion,
    expected_fingerprint: Option<String>,
    timeout_ms: Option<u32>,
) -> Result<RsHttpClient, RsHttpClientError> {
    let inner = localsend::http::client::LsHttpClient::new(
        &private_key,
        &cert,
        version,
        expected_fingerprint,
        timeout_ms.map(|ms| std::time::Duration::from_millis(ms as u64)),
    )
    .map_err(RsHttpClientError::from)?;

    Ok(RsHttpClient { inner })
}

impl RsHttpClient {
    pub async fn register(
        &self,
        protocol: ProtocolType,
        ip: &str,
        port: u16,
        payload: RegisterDto,
    ) -> Result<ResultWithPublicKeyRegisterResponseDto, RsHttpClientError> {
        let response = self
            .inner
            .register(protocol, ip, port, payload)
            .await
            .map_err(RsHttpClientError::from)?;

        Ok(ResultWithPublicKeyRegisterResponseDto {
            public_key: response.public_key,
            body: response.body,
        })
    }

    pub async fn prepare_upload(
        &self,
        protocol: ProtocolType,
        ip: &str,
        port: u16,
        payload: PrepareUploadRequestDto,
        public_key: Option<String>,
        pin: Option<String>,
        cancel_token: &RsCancellationToken,
    ) -> Result<PrepareUploadResult, RsHttpClientError> {
        let response = self
            .inner
            .prepare_upload(
                protocol,
                ip,
                port,
                public_key,
                payload,
                pin.as_deref(),
                cancel_token.inner.clone(),
            )
            .await
            .map_err(prepare_upload_error)?;

        Ok(response)
    }

    /// Uploads a single file, emitting [RsUploadEvent]s on [sink].
    ///
    /// Failures are emitted as [RsUploadEvent::Failed] instead of being
    /// returned: flutter_rust_bridge discards the returned `Result` of
    /// functions taking a [StreamSink], so a returned error would become an
    /// uncaught async error killing the calling isolate.
    pub async fn upload(
        &self,
        sink: StreamSink<RsUploadEvent>,
        protocol: ProtocolType,
        ip: &str,
        port: u16,
        public_key: Option<String>,
        session_id: &str,
        file_id: &str,
        token: &str,
        binary: Option<stream::Dart2RustStreamReceiver>,
        path: Option<String>,
        file_descriptor: Option<i32>,
        content_length: u64,
        cancel_token: &RsCancellationToken,
    ) {
        let result = async {
            let content = resolve_file_content(binary, path, file_descriptor)?;
            let last_emit = std::cell::Cell::new(None::<std::time::Instant>);
            let progress_sink = sink.clone();
            let progress = move |sent| {
                let now = std::time::Instant::now();
                let is_final = sent >= content_length;
                if !is_final {
                    if let Some(last) = last_emit.get() {
                        if now.duration_since(last) < std::time::Duration::from_millis(20) {
                            return;
                        }
                    }
                }
                last_emit.set(Some(now));
                let progress = if content_length == 0 {
                    1.0
                } else {
                    (sent as f64 / content_length as f64).min(1.0)
                };
                let _ = progress_sink.add(RsUploadEvent::Progress { progress });
            };

            self.inner
                .upload(
                    protocol,
                    ip,
                    port,
                    public_key,
                    session_id,
                    file_id,
                    token,
                    content,
                    progress,
                    cancel_token.inner.clone(),
                )
                .await
                .map_err(RsHttpClientError::from)?;

            Ok(())
        }
        .await;

        if let Err(error) = result {
            let _ = sink.add(RsUploadEvent::Failed { error });
        }
    }

    pub async fn cancel(
        &self,
        protocol: ProtocolType,
        ip: &str,
        port: u16,
        session_id: &str,
    ) -> Result<(), RsHttpClientError> {
        self.inner
            .cancel(protocol, ip, port, session_id)
            .await
            .map_err(RsHttpClientError::from)?;

        Ok(())
    }
}

fn resolve_file_content(
    binary: Option<stream::Dart2RustStreamReceiver>,
    path: Option<String>,
    file_descriptor: Option<i32>,
) -> Result<localsend::model::transfer::FileContent, RsHttpClientError> {
    match (binary, path, file_descriptor) {
        (Some(binary), None, None) => Ok(localsend::model::transfer::FileContent::Stream(
            binary.receiver,
        )),
        (None, Some(path), None) => Ok(localsend::model::transfer::FileContent::Path(path.into())),
        (None, None, Some(file_descriptor)) => {
            #[cfg(target_os = "android")]
            {
                Ok(localsend::model::transfer::FileContent::Fd(file_descriptor))
            }
            #[cfg(not(target_os = "android"))]
            {
                let _ = file_descriptor;
                Err(RsHttpClientError::Other(
                    "File descriptors are only supported on Android".into(),
                ))
            }
        }
        _ => Err(RsHttpClientError::Other(
            "Exactly one upload content source must be provided".into(),
        )),
    }
}

/// An event emitted while a file is being uploaded by [RsHttpClient::upload].
#[derive(Clone)]
pub enum RsUploadEvent {
    /// The upload progress as a fraction (0.0 to 1.0). Throttled.
    Progress { progress: f64 },

    /// The upload failed. Always the last event of the stream.
    Failed { error: RsHttpClientError },
}

#[derive(Clone)]
pub enum RsHttpClientError {
    StatusCode {
        status: u16,
        message: Option<String>,
    },
    Reqwest(String),
    Json(String),
    Io(String),
    Other(String),
    /// Connection setup failed before prepare-upload could be dispatched.
    /// This is the only category safe for trying another prepare endpoint.
    Unreachable(String),
}

impl From<ClientError> for RsHttpClientError {
    fn from(e: ClientError) -> Self {
        match e {
            ClientError::StatusCode(e) => RsHttpClientError::StatusCode {
                status: e.status,
                message: e.message,
            },
            ClientError::Reqwest(e) => RsHttpClientError::Reqwest(ErrorChain(&e).to_string()),
            ClientError::Json(e) => RsHttpClientError::Json(e.to_string()),
            ClientError::Io(e) => RsHttpClientError::Io(e.to_string()),
            ClientError::Other(e) => RsHttpClientError::Other(e.to_string()),
            ClientError::Cancelled => RsHttpClientError::Other("Upload cancelled".to_string()),
        }
    }
}

#[frb(mirror(LsHttpClientVersion))]
pub enum _LsHttpClientVersion {
    V2,
    V3,
}

#[frb(mirror(PrepareUploadResult))]
pub struct _PrepareUploadResult {
    pub status_code: u16,
    pub response: Option<PrepareUploadResponseDto>,
}

pub struct ResultWithPublicKeyRegisterResponseDto {
    pub public_key: Option<String>,
    pub body: RegisterResponseDto,
}

/// For prepare-upload only, classify failures before HTTP dispatch separately.
/// Keep response/read errors out of this branch: retrying an ambiguous POST
/// could create a second session. Keep file IO in its own category.
fn prepare_upload_error(error: ClientError) -> RsHttpClientError {
    match error {
        ClientError::Reqwest(e) => {
            let connecting = e.is_connect();
            // The prepare URL can contain a PIN. Never put it into error UI/logs.
            let e = e.without_url();
            let message = ErrorChain(&e).to_string();
            if connecting {
                RsHttpClientError::Unreachable(message)
            } else {
                RsHttpClientError::Reqwest(message)
            }
        }
        other => RsHttpClientError::from(other),
    }
}

#[cfg(test)]
mod prepare_upload_error_tests {
    use super::*;

    fn client_and_payload() -> (RsHttpClient, PrepareUploadRequestDto) {
        let identity = localsend::crypto::cert::generate_self_signed().unwrap();
        let client = create_client(
            identity.private_key_pem,
            identity.certificate_pem,
            LsHttpClientVersion::V2,
            Some(identity.fingerprint.clone()),
            None,
        )
        .unwrap_or_else(|_| panic!("test client could not be created"));
        let payload = PrepareUploadRequestDto {
            info: RegisterDto {
                alias: "sender".into(),
                version: "2.2".into(),
                device_model: None,
                device_type: None,
                token: identity.fingerprint,
                port: 53317,
                protocol: ProtocolType::Http,
                has_web_interface: false,
            },
            files: Default::default(),
        };
        (client, payload)
    }

    async fn response_peer(
        response: &'static [u8],
        keep_open: bool,
    ) -> (
        u16,
        tokio::sync::oneshot::Receiver<()>,
        tokio::task::JoinHandle<()>,
    ) {
        use tokio::io::{AsyncReadExt, AsyncWriteExt};
        let listener = tokio::net::TcpListener::bind("127.0.0.1:0").await.unwrap();
        let port = listener.local_addr().unwrap().port();
        let (ready_tx, ready_rx) = tokio::sync::oneshot::channel();
        let task = tokio::spawn(async move {
            let (mut stream, _) = listener.accept().await.unwrap();
            let mut request = Vec::new();
            loop {
                let mut chunk = [0u8; 4096];
                let read = stream.read(&mut chunk).await.unwrap();
                assert_ne!(read, 0, "peer closed before sending the request");
                request.extend_from_slice(&chunk[..read]);
                if let Some(end) = request.windows(4).position(|s| s == b"\r\n\r\n") {
                    let headers = std::str::from_utf8(&request[..end]).unwrap();
                    assert!(headers.starts_with("POST /api/localsend/"));
                    assert!(headers.lines().next().unwrap().contains("/prepare-upload"));
                    let length = headers
                        .lines()
                        .find_map(|line| {
                            let (name, value) = line.split_once(':')?;
                            name.eq_ignore_ascii_case("content-length")
                                .then(|| value.trim().parse::<usize>().unwrap())
                        })
                        .unwrap();
                    if request.len() >= end + 4 + length {
                        break;
                    }
                }
            }
            stream.write_all(response).await.unwrap();
            let _ = ready_tx.send(());
            if keep_open {
                std::future::pending::<()>().await;
            }
        });
        (port, ready_rx, task)
    }

    #[tokio::test]
    async fn prepare_upload_hides_pin_in_connection_error() {
        let (client, payload) = client_and_payload();
        let listener = tokio::net::TcpListener::bind("127.0.0.1:0").await.unwrap();
        let port = listener.local_addr().unwrap().port();
        drop(listener);
        let error = client
            .prepare_upload(
                ProtocolType::Http,
                "127.0.0.1",
                port,
                payload,
                None,
                Some("test-pin-112233".into()),
                &crate::api::cancel::create_cancellation_token(),
            )
            .await
            .err()
            .unwrap();
        let RsHttpClientError::Unreachable(message) = error else {
            panic!("connection error must be Unreachable");
        };
        assert!(
            !message.contains("test-pin-112233"),
            "PIN must not appear in error text"
        );
        assert!(!message.contains("pin="));
    }

    #[tokio::test]
    async fn prepare_upload_tls_connect_timeout_is_retryable() {
        let (client, payload) = client_and_payload();
        let listener = tokio::net::TcpListener::bind("127.0.0.1:0").await.unwrap();
        let port = listener.local_addr().unwrap().port();
        let server = tokio::spawn(async move {
            let (stream, _) = listener.accept().await.unwrap();
            let _keep_open = stream;
            std::future::pending::<()>().await;
        });
        let cancel = crate::api::cancel::create_cancellation_token();
        let started = std::time::Instant::now();
        let result = tokio::time::timeout(
            std::time::Duration::from_secs(6),
            client.prepare_upload(
                ProtocolType::Https,
                "127.0.0.1",
                port,
                payload,
                None,
                None,
                &cancel,
            ),
        )
        .await;
        server.abort();
        let result = result.expect("TLS connection setup must be bounded");
        assert!(matches!(result, Err(RsHttpClientError::Unreachable(_))));
        assert!(started.elapsed() >= std::time::Duration::from_secs(2));
    }

    #[tokio::test]
    async fn prepare_upload_ipv6_connect_failure_is_retryable() {
        let (client, payload) = client_and_payload();
        let cancel = crate::api::cancel::create_cancellation_token();
        // Documentation-only destination: the test checks classification, not
        // a platform-specific errno or the two reported Android devices.
        let result = client
            .prepare_upload(
                ProtocolType::Http,
                "2001:db8::1",
                9,
                payload,
                None,
                None,
                &cancel,
            )
            .await;
        let Err(RsHttpClientError::Unreachable(message)) = result else {
            panic!("IPv6 connection failure must be retryable");
        };
        eprintln!("IPv6 connection failure: {message}");
    }

    #[tokio::test]
    async fn prepare_upload_cancels_while_reading_response_body() {
        for version in [LsHttpClientVersion::V2, LsHttpClientVersion::V3] {
            for response in [
                b"HTTP/1.1 200 OK\r\nContent-Length: 1000\r\n\r\n{".as_slice(),
                b"HTTP/1.1 403 Forbidden\r\nContent-Length: 1000\r\n\r\n{".as_slice(),
            ] {
                let (mut client, payload) = client_and_payload();
                if matches!(version, LsHttpClientVersion::V3) {
                    let identity = localsend::crypto::cert::generate_self_signed().unwrap();
                    client = create_client(
                        identity.private_key_pem,
                        identity.certificate_pem,
                        LsHttpClientVersion::V3,
                        Some(identity.fingerprint),
                        None,
                    )
                    .unwrap_or_else(|_| panic!("test client could not be created"));
                }
                let (port, ready, server) = response_peer(response, true).await;
                let cancel = crate::api::cancel::create_cancellation_token();
                let request = client.prepare_upload(
                    ProtocolType::Http,
                    "127.0.0.1",
                    port,
                    payload,
                    None,
                    None,
                    &cancel,
                );
                tokio::pin!(request);
                tokio::select! {
                    _ = ready => {},
                    _ = &mut request => panic!("incomplete body must still be pending"),
                }
                // Let the client consume the headers and enter response parsing.
                tokio::select! {
                    _ = tokio::time::sleep(std::time::Duration::from_millis(50)) => {},
                    _ = &mut request => panic!("incomplete body must still be pending"),
                }
                cancel.cancel();
                let result =
                    tokio::time::timeout(std::time::Duration::from_millis(500), request).await;
                server.abort();
                let result = result.expect("cancellation must cover response body reading");
                assert!(matches!(result, Err(RsHttpClientError::Other(_))));
            }
        }
    }

    #[tokio::test]
    async fn prepare_upload_connection_failure_has_a_distinct_retry_error() {
        let (client, payload) = client_and_payload();
        let listener = tokio::net::TcpListener::bind("127.0.0.1:0").await.unwrap();
        let port = listener.local_addr().unwrap().port();
        drop(listener);
        let error = client
            .prepare_upload(
                ProtocolType::Http,
                "127.0.0.1",
                port,
                payload,
                None,
                None,
                &crate::api::cancel::create_cancellation_token(),
            )
            .await
            .err()
            .expect("a closed port must fail");
        assert!(matches!(error, RsHttpClientError::Unreachable(_)));
    }

    #[tokio::test]
    async fn only_connection_errors_enter_the_retry_branch() {
        use localsend::http::client::{LsHttpClient, LsHttpClientVersion};
        use localsend::http::dto::RegisterDto;
        use tokio::io::{AsyncReadExt, AsyncWriteExt};

        let identity = localsend::crypto::cert::generate_self_signed().unwrap();
        let client = LsHttpClient::new(
            &identity.private_key_pem,
            &identity.certificate_pem,
            LsHttpClientVersion::V2,
            Some(identity.fingerprint),
            None,
        )
        .unwrap();
        let payload = RegisterDto {
            alias: "test".into(),
            version: "2.2".into(),
            device_model: None,
            device_type: None,
            token: "test".into(),
            port: 53317,
            protocol: ProtocolType::Http,
            has_web_interface: false,
        };
        let listener = tokio::net::TcpListener::bind("127.0.0.1:0").await.unwrap();
        let port = listener.local_addr().unwrap().port();
        let server = tokio::spawn(async move {
            let (mut stream, _) = listener.accept().await.unwrap();
            let mut buffer = [0; 4096];
            stream.read(&mut buffer).await.unwrap();
            stream
                .write_all(b"HTTP/1.1 200 OK\r\nContent-Length: 1\r\nConnection: close\r\n\r\nx")
                .await
                .unwrap();
        });
        let error = client
            .register(ProtocolType::Http, "127.0.0.1", port, payload.clone())
            .await
            .err()
            .unwrap();
        assert!(matches!(
            prepare_upload_error(error),
            RsHttpClientError::Reqwest(_)
        ));
        server.await.unwrap();
        // The listener is now dropped. A failed new connection is retryable.
        let error = client
            .register(ProtocolType::Http, "127.0.0.1", port, payload)
            .await
            .err()
            .unwrap();
        assert!(matches!(
            prepare_upload_error(error),
            RsHttpClientError::Unreachable(_)
        ));
    }

    #[test]
    fn cancellation_and_file_io_have_separate_categories() {
        assert!(matches!(
            prepare_upload_error(ClientError::Cancelled),
            RsHttpClientError::Other(_)
        ));
        assert!(matches!(
            prepare_upload_error(ClientError::Io(std::io::Error::other("ambiguous"))),
            RsHttpClientError::Io(_)
        ));
    }
}
