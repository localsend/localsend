mod scoped_host;
mod server_cert_verifier;
mod url;
pub mod v2;
pub mod v3;

pub use v2::LsHttpClientV2;
pub use v3::LsHttpClientV3;

use crate::http::StatusCodeError;
use crate::{crypto, http, model};
use bytes::Bytes;
use futures_util::StreamExt;
use reqwest::Response;
use rustls::pki_types::pem::PemObject;
use rustls::pki_types::{CertificateDer, PrivateKeyDer};
use serde::{Deserialize, Serialize};
use std::sync::Arc;
use thiserror::Error;

pub enum LsHttpClient {
    V2(LsHttpClientV2),
    V3(LsHttpClientV3),
}

pub enum LsHttpClientVersion {
    V2,
    V3,
}

#[derive(Debug, Error)]
pub enum ClientError {
    #[error(transparent)]
    StatusCode(StatusCodeError),

    #[error(transparent)]
    Reqwest(#[from] reqwest::Error),

    #[error(transparent)]
    Json(#[from] serde_json::Error),

    #[error(transparent)]
    Io(#[from] std::io::Error),

    #[error(transparent)]
    Other(#[from] anyhow::Error),

    #[error("Upload cancelled")]
    Cancelled,
}

impl ClientError {
    /// Whether the request got no response: the connection could not be
    /// established (refused, timed out, failed TLS handshake) or broke
    /// before the peer answered.
    ///
    /// `false` for every error that leaves open whether the peer was
    /// reached, and for a peer that answered with an error status or with a
    /// body that could not be read: it was reached just as well as one that
    /// answered properly.
    pub fn is_unreachable(&self) -> bool {
        matches!(self, ClientError::Reqwest(err) if !err.is_body() && !err.is_decode())
    }
}

impl LsHttpClient {
    /// Creates a client for the given protocol version.
    ///
    /// `expected_fingerprint` pins the peer to the certificate with that
    /// SHA-256 fingerprint (uppercase hex). It is checked during the TLS
    /// handshake, so a mismatching peer never receives the request. Pass
    /// [`None`] only when the peer is not known yet, i.e. for discovery.
    pub fn new(
        private_key: &str,
        cert: &str,
        version: LsHttpClientVersion,
        expected_fingerprint: Option<String>,
        timeout: Option<std::time::Duration>,
    ) -> Result<LsHttpClient, ClientError> {
        let client = match version {
            LsHttpClientVersion::V2 => LsHttpClient::V2(LsHttpClientV2::try_new(
                private_key,
                cert,
                expected_fingerprint,
                timeout,
            )?),
            LsHttpClientVersion::V3 => LsHttpClient::V3(LsHttpClientV3::try_new(
                private_key,
                cert,
                expected_fingerprint,
                timeout,
            )?),
        };

        Ok(client)
    }

    pub async fn register(
        &self,
        protocol: model::discovery::ProtocolType,
        ip: &str,
        port: u16,
        payload: http::dto::RegisterDto,
    ) -> Result<ResultWithPublicKey<http::dto::RegisterResponseDto>, ClientError> {
        match self {
            LsHttpClient::V2(client) => {
                let result = client.register(protocol, ip, port, payload.into()).await?;
                Ok(ResultWithPublicKey {
                    public_key: result.public_key,
                    cert_fingerprint: result.cert_fingerprint,
                    body: result.body.into(),
                })
            }
            LsHttpClient::V3(client) => client.register(protocol, ip, port, payload).await,
        }
    }

    pub async fn prepare_upload(
        &self,
        protocol: model::discovery::ProtocolType,
        ip: &str,
        port: u16,
        public_key: Option<String>,
        payload: http::dto::PrepareUploadRequestDto,
        pin: Option<&str>,
        cancel: tokio_util::sync::CancellationToken,
    ) -> Result<http::dto::PrepareUploadResult, ClientError> {
        match self {
            LsHttpClient::V2(client) => {
                let result = client
                    .prepare_upload(protocol, ip, port, public_key, payload.into(), pin, cancel)
                    .await?;
                Ok(result.into())
            }
            LsHttpClient::V3(client) => {
                client
                    .prepare_upload(protocol, ip, port, public_key, payload, cancel)
                    .await
            }
        }
    }

    pub async fn upload(
        &self,
        protocol: model::discovery::ProtocolType,
        ip: &str,
        port: u16,
        public_key: Option<String>,
        session_id: &str,
        file_id: &str,
        token: &str,
        content: model::transfer::FileContent,
        progress: impl Fn(u64) + Send + 'static,
        cancel: tokio_util::sync::CancellationToken,
    ) -> Result<(), ClientError> {
        let body = upload_body(content, progress);
        match self {
            LsHttpClient::V2(client) => {
                client
                    .upload(
                        protocol, ip, port, public_key, session_id, file_id, token, body, cancel,
                    )
                    .await
            }
            LsHttpClient::V3(client) => {
                client
                    .upload(
                        protocol, ip, port, public_key, session_id, file_id, token, body, cancel,
                    )
                    .await
            }
        }
    }

    pub async fn cancel(
        &self,
        protocol: model::discovery::ProtocolType,
        ip: &str,
        port: u16,
        session_id: &str,
    ) -> Result<(), ClientError> {
        match self {
            LsHttpClient::V2(client) => client.cancel(protocol, ip, port, session_id).await,
            LsHttpClient::V3(client) => client.cancel(protocol, ip, port, session_id).await,
        }
    }
}

/// Builds a streaming request body from the file content, invoking `progress`
/// with the cumulative number of bytes read as each chunk is sent.
///
/// An I/O error while reading the file fails the body, which aborts the
/// request. Ending the body early instead would send a complete but truncated
/// upload that the receiver stores as a short (often empty) file.
pub(super) fn upload_body(
    content: model::transfer::FileContent,
    progress: impl Fn(u64) + Send + 'static,
) -> reqwest::Body {
    let mut sent = 0_u64;
    let stream = content.into_stream().map(move |chunk| {
        let chunk = chunk?;
        sent += chunk.len() as u64;
        progress(sent);
        Ok::<Bytes, anyhow::Error>(chunk)
    });
    reqwest::Body::wrap_stream(stream)
}

/// Connect timeout of pinned clients, i.e. clients talking to a device the
/// user has picked. It bounds connection setup only (TCP connect plus TLS
/// handshake), so a dead address fails fast. Waiting for the receiver to
/// accept and the upload itself are not limited by it.
const PINNED_CONNECT_TIMEOUT: std::time::Duration = std::time::Duration::from_secs(5);

/// Builds the reqwest client used for all outgoing requests.
///
/// Pinned clients (`expected_fingerprint` is set) get
/// [`PINNED_CONNECT_TIMEOUT`]; unpinned ones keep reqwest's default.
///
/// The TLS config is assembled by hand instead of using reqwest's own TLS
/// options, because only a preconfigured [`rustls::ClientConfig`] can carry a
/// custom certificate verifier. reqwest passes such a config straight through,
/// which means the client certificate and ALPN have to be set here as well:
/// `identity()` and the HTTP version preference of the builder no longer apply.
pub(super) fn create_reqwest_client(
    private_key: &str,
    cert: &str,
    expected_fingerprint: Option<String>,
    timeout: Option<std::time::Duration>,
) -> Result<reqwest::Client, ClientError> {
    let connect_timeout = expected_fingerprint
        .is_some()
        .then_some(PINNED_CONNECT_TIMEOUT);
    build_reqwest_client(
        private_key,
        cert,
        expected_fingerprint,
        timeout,
        connect_timeout,
    )
}

/// [`create_reqwest_client`] with an explicit connect timeout, so tests do not
/// have to wait out [`PINNED_CONNECT_TIMEOUT`].
fn build_reqwest_client(
    private_key: &str,
    cert: &str,
    expected_fingerprint: Option<String>,
    timeout: Option<std::time::Duration>,
    connect_timeout: Option<std::time::Duration>,
) -> Result<reqwest::Client, ClientError> {
    let _ = rustls::crypto::ring::default_provider().install_default();

    let mut tls_config = {
        let certs =
            vec![CertificateDer::from_pem_slice(cert.as_bytes()).map_err(anyhow::Error::from)?];
        let key =
            PrivateKeyDer::from_pem_slice(private_key.as_bytes()).map_err(anyhow::Error::from)?;

        rustls::ClientConfig::builder()
            .dangerous()
            .with_custom_certificate_verifier(Arc::new(
                server_cert_verifier::PinnedServerCertVerifier::try_new(
                    cert,
                    expected_fingerprint,
                )?,
            ))
            .with_client_auth_cert(certs, key)
            .map_err(anyhow::Error::from)?
    };

    // Must be set explicitly, see the doc comment of `create_reqwest_client`.
    // HTTP/1.1 only: HTTP/2's flow-control window caps bulk upload throughput.
    tls_config.alpn_protocols = vec![b"http/1.1".to_vec()];

    let mut builder = reqwest::Client::builder()
        .tls_backend_preconfigured(tls_config)
        .tls_info(true)
        // Peers are on the local network: never dial them through a system or
        // environment proxy. Proxied connections also lose the `TlsInfo`
        // response extension that the certificate checks below rely on (#3299).
        .no_proxy()
        // Peers never redirect; following one would talk to a different host
        // than the one whose certificate is being verified.
        .redirect(reqwest::redirect::Policy::none())
        .dns_resolver(Arc::new(ScopedHostResolver));

    if let Some(connect_timeout) = connect_timeout {
        builder = builder.connect_timeout(connect_timeout);
    }

    if let Some(timeout) = timeout {
        builder = builder.timeout(timeout);
    }

    let client = builder.build()?;

    Ok(client)
}

/// DNS resolver that turns the synthetic host names produced by
/// [`scoped_host::encode`] back into their scoped IPv6 socket address.
/// Every other name is resolved by the system resolver, like by default.
struct ScopedHostResolver;

impl reqwest::dns::Resolve for ScopedHostResolver {
    fn resolve(&self, name: reqwest::dns::Name) -> reqwest::dns::Resolving {
        Box::pin(async move {
            if let Some(addr) = scoped_host::decode(name.as_str()) {
                return Ok(Box::new(std::iter::once(addr)) as reqwest::dns::Addrs);
            }

            // The port is a placeholder, reqwest replaces it with the URL's.
            let addrs = tokio::net::lookup_host((name.as_str(), 0))
                .await?
                .collect::<Vec<_>>();
            Ok(Box::new(addrs.into_iter()) as reqwest::dns::Addrs)
        })
    }
}

/// Verifies the certificate from the response.
/// Returns the public key extracted from the certificate.
pub(super) fn verify_cert_from_res(
    response: &Response,
    public_key: Option<String>,
) -> anyhow::Result<String> {
    let tls_info_ext = response
        .extensions()
        .get::<reqwest::tls::TlsInfo>()
        .ok_or_else(|| anyhow::anyhow!("TLS info not found"))?;
    let cert = tls_info_ext
        .peer_certificate()
        .ok_or_else(|| anyhow::anyhow!("Certificate not found"))?;
    crypto::cert::verify_cert_from_der(cert, public_key.as_deref())?;
    let public_key = match public_key {
        Some(public_key) => public_key,
        None => crypto::cert::public_key_from_cert_der(cert)?,
    };
    Ok(public_key)
}

/// The SHA-256 fingerprint (uppercase hex) of the peer certificate the
/// response was received over. This — not any fingerprint claimed in the
/// body — is the peer's identity in HTTPS mode.
pub(super) fn cert_fingerprint_from_res(response: &Response) -> anyhow::Result<String> {
    let tls_info_ext = response
        .extensions()
        .get::<reqwest::tls::TlsInfo>()
        .ok_or_else(|| anyhow::anyhow!("TLS info not found"))?;
    let cert = tls_info_ext
        .peer_certificate()
        .ok_or_else(|| anyhow::anyhow!("Certificate not found"))?;
    Ok(crypto::cert::fingerprint_from_cert_der(cert))
}

#[derive(Serialize, Deserialize)]
struct ErrorResponse {
    message: String,
}

pub struct ResultWithPublicKey<T> {
    /// The public key extracted from the certificate.
    /// Encoded in PEM format.
    /// Only available in HTTPS mode.
    pub public_key: Option<String>,

    /// The SHA-256 fingerprint (uppercase hex) of the peer certificate.
    /// Only available in HTTPS mode, where it is the peer's identity and
    /// overrules any fingerprint claimed in the body.
    pub cert_fingerprint: Option<String>,

    /// The response body.
    pub body: T,
}

pub(super) trait ResponseExt {
    async fn into_error<T>(self) -> Result<T, ClientError>;
}

impl ResponseExt for Response {
    async fn into_error<T>(self) -> Result<T, ClientError> {
        let status = self.status().as_u16();
        let body = self.text().await.unwrap_or_default();
        let message = match serde_json::from_str::<ErrorResponse>(&body) {
            Ok(error) => error.message,
            Err(_) => body,
        };
        Err(ClientError::StatusCode(StatusCodeError {
            status,
            message: if message.is_empty() {
                None
            } else {
                Some(message)
            },
        }))
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::model::discovery::ProtocolType;
    use std::time::Duration;
    use tokio::io::{AsyncReadExt, AsyncWriteExt};
    use tokio::sync::oneshot;
    use tokio::task::JoinHandle;
    use tokio_util::sync::CancellationToken;

    fn prepare_upload_payload() -> http::dto::PrepareUploadRequestDto {
        http::dto::PrepareUploadRequestDto {
            info: http::dto::RegisterDto {
                alias: "Sender".to_string(),
                version: "2.1".to_string(),
                device_model: None,
                device_type: None,
                token: "FINGERPRINT".to_string(),
                port: 53317,
                protocol: ProtocolType::Http,
                has_web_interface: false,
            },
            files: Default::default(),
        }
    }

    /// Accepts one connection, reads the whole request to `path` (with a
    /// `Content-Length` or chunked body) and answers with `response`. The
    /// connection is never closed, so a body shorter than its `Content-Length`
    /// keeps the client reading forever. The returned receiver fires once the
    /// response has been written.
    async fn stalling_peer(
        path: &'static str,
        response: &'static [u8],
    ) -> (u16, oneshot::Receiver<()>, JoinHandle<()>) {
        let listener = tokio::net::TcpListener::bind("127.0.0.1:0").await.unwrap();
        let port = listener.local_addr().unwrap().port();
        let (written_tx, written_rx) = oneshot::channel();
        let task = tokio::spawn(async move {
            let (mut stream, _) = listener.accept().await.unwrap();
            let mut request = Vec::new();
            loop {
                let mut chunk = [0u8; 4096];
                let read = stream.read(&mut chunk).await.unwrap();
                assert_ne!(read, 0, "client closed before sending the request");
                request.extend_from_slice(&chunk[..read]);
                let Some(end) = request.windows(4).position(|w| w == b"\r\n\r\n") else {
                    continue;
                };
                let head = std::str::from_utf8(&request[..end]).unwrap();
                assert!(head.lines().next().unwrap().contains(path));
                let length = head.lines().find_map(|line| {
                    let (name, value) = line.split_once(':')?;
                    name.eq_ignore_ascii_case("content-length")
                        .then(|| value.trim().parse::<usize>().unwrap())
                });
                let complete = match length {
                    Some(length) => request.len() >= end + 4 + length,
                    None => request.ends_with(b"0\r\n\r\n"),
                };
                if complete {
                    break;
                }
            }
            stream.write_all(response).await.unwrap();
            let _ = written_tx.send(());
            std::future::pending::<()>().await;
        });
        (port, written_rx, task)
    }

    /// Cancelling must abort `prepare_upload` even after the response headers
    /// arrived, while the (success or error) body is still being read.
    #[tokio::test]
    async fn prepare_upload_cancels_while_reading_response_body() {
        let identity = crypto::cert::generate_self_signed().unwrap();
        for version in [LsHttpClientVersion::V2, LsHttpClientVersion::V3] {
            let client = LsHttpClient::new(
                &identity.private_key_pem,
                &identity.certificate_pem,
                version,
                None,
                None,
            )
            .unwrap();
            for response in [
                b"HTTP/1.1 200 OK\r\nContent-Length: 1000\r\n\r\n{".as_slice(),
                b"HTTP/1.1 403 Forbidden\r\nContent-Length: 1000\r\n\r\n{".as_slice(),
            ] {
                let (port, written, peer) = stalling_peer("/prepare-upload", response).await;
                let cancel = CancellationToken::new();
                let request = client.prepare_upload(
                    ProtocolType::Http,
                    "127.0.0.1",
                    port,
                    None,
                    prepare_upload_payload(),
                    None,
                    cancel.clone(),
                );
                tokio::pin!(request);

                tokio::select! {
                    res = written => res.expect("peer failed before writing the response"),
                    _ = &mut request => panic!("request finished before the response was written"),
                    _ = tokio::time::sleep(Duration::from_secs(2)) => {
                        peer.abort();
                        panic!("the peer did not receive the whole request in time");
                    }
                }
                // Give the client time to parse the headers and start reading the body.
                tokio::select! {
                    _ = tokio::time::sleep(Duration::from_millis(50)) => {}
                    _ = &mut request => panic!("request finished despite the incomplete body"),
                }

                cancel.cancel();
                let result = tokio::time::timeout(Duration::from_secs(2), request).await;
                peer.abort();
                let result = result.expect("cancellation must interrupt reading the response body");
                assert!(
                    matches!(result, Err(ClientError::Cancelled)),
                    "unexpected result: {:?}",
                    result.err()
                );
            }
        }
    }

    /// Cancelling must abort `upload` even after the error response headers
    /// arrived, while the error body is still being read.
    #[tokio::test]
    async fn upload_cancels_while_reading_error_body() {
        let identity = crypto::cert::generate_self_signed().unwrap();
        for version in [LsHttpClientVersion::V2, LsHttpClientVersion::V3] {
            let client = LsHttpClient::new(
                &identity.private_key_pem,
                &identity.certificate_pem,
                version,
                None,
                None,
            )
            .unwrap();
            let (port, written, peer) = stalling_peer(
                "/upload",
                b"HTTP/1.1 403 Forbidden\r\nContent-Length: 1000\r\n\r\n{",
            )
            .await;
            let (content_tx, content_rx) = tokio::sync::mpsc::channel(1);
            content_tx
                .send(bytes::Bytes::from_static(b"data"))
                .await
                .unwrap();
            drop(content_tx);
            let cancel = CancellationToken::new();
            let request = client.upload(
                ProtocolType::Http,
                "127.0.0.1",
                port,
                None,
                "session",
                "file",
                "token",
                model::transfer::FileContent::Stream(content_rx),
                |_| {},
                cancel.clone(),
            );
            tokio::pin!(request);

            tokio::select! {
                res = written => res.expect("peer failed before writing the response"),
                _ = &mut request => panic!("request finished before the response was written"),
                _ = tokio::time::sleep(Duration::from_secs(2)) => {
                    peer.abort();
                    panic!("the peer did not receive the whole request in time");
                }
            }
            // Give the client time to parse the headers and start reading the body.
            tokio::select! {
                _ = tokio::time::sleep(Duration::from_millis(50)) => {}
                _ = &mut request => panic!("request finished despite the incomplete body"),
            }

            cancel.cancel();
            let result = tokio::time::timeout(Duration::from_secs(2), request).await;
            peer.abort();
            let result = result.expect("cancellation must interrupt reading the error body");
            assert!(
                matches!(result, Err(ClientError::Cancelled)),
                "unexpected result: {:?}",
                result.err()
            );
        }
    }

    /// Short stand-in for [`PINNED_CONNECT_TIMEOUT`], so the tests stay fast.
    const TEST_CONNECT_TIMEOUT: Duration = Duration::from_millis(300);

    fn pinned_test_client() -> reqwest::Client {
        let identity = crypto::cert::generate_self_signed().unwrap();
        build_reqwest_client(
            &identity.private_key_pem,
            &identity.certificate_pem,
            Some(identity.fingerprint),
            None,
            Some(TEST_CONNECT_TIMEOUT),
        )
        .unwrap()
    }

    /// The connect timeout includes the TLS handshake: a peer that accepts
    /// the TCP connection but never answers the ClientHello must not keep a
    /// pinned client waiting.
    #[tokio::test]
    async fn pinned_connect_timeout_covers_tls_handshake() {
        let client = pinned_test_client();
        let listener = tokio::net::TcpListener::bind("127.0.0.1:0").await.unwrap();
        let port = listener.local_addr().unwrap().port();
        let peer = tokio::spawn(async move {
            let (_stream, _) = listener.accept().await.unwrap();
            std::future::pending::<()>().await;
        });

        let started = std::time::Instant::now();
        let result = tokio::time::timeout(
            Duration::from_secs(5),
            client.get(format!("https://127.0.0.1:{port}/")).send(),
        )
        .await;
        peer.abort();

        let err = result
            .expect("the TLS handshake must be bounded by the connect timeout")
            .expect_err("the peer never completes the handshake");
        assert!(
            err.is_connect() && err.is_timeout(),
            "unexpected error: {err:?}"
        );
        assert!(started.elapsed() >= TEST_CONNECT_TIMEOUT);
    }

    /// The connect timeout does not limit waiting for the response, e.g. for
    /// the receiver to accept a prepare-upload.
    #[tokio::test]
    async fn pinned_connect_timeout_does_not_limit_response_wait() {
        let client = pinned_test_client();
        let listener = tokio::net::TcpListener::bind("127.0.0.1:0").await.unwrap();
        let port = listener.local_addr().unwrap().port();
        let peer = tokio::spawn(async move {
            let (mut stream, _) = listener.accept().await.unwrap();
            let mut request = Vec::new();
            while !request.windows(4).any(|w| w == b"\r\n\r\n") {
                let mut chunk = [0u8; 4096];
                let read = stream.read(&mut chunk).await.unwrap();
                assert_ne!(read, 0, "client closed before sending the request");
                request.extend_from_slice(&chunk[..read]);
            }
            tokio::time::sleep(TEST_CONNECT_TIMEOUT * 3).await;
            stream
                .write_all(b"HTTP/1.1 204 No Content\r\nConnection: close\r\n\r\n")
                .await
                .unwrap();
        });

        let result = tokio::time::timeout(
            Duration::from_secs(5),
            client.get(format!("http://127.0.0.1:{port}/")).send(),
        )
        .await;
        peer.abort();

        let response = result
            .expect("the request must not hang")
            .expect("waiting for the response must not hit the connect timeout");
        assert_eq!(response.status(), reqwest::StatusCode::NO_CONTENT);
    }
}
