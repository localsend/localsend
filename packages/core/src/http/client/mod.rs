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
use tokio_stream::wrappers::ReceiverStream;

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
pub(super) fn upload_body(
    content: model::transfer::FileContent,
    progress: impl Fn(u64) + Send + 'static,
) -> reqwest::Body {
    let mut sent = 0_u64;
    let stream = ReceiverStream::new(content.into_receiver()).map(move |chunk| {
        sent += chunk.len() as u64;
        progress(sent);
        Ok::<Bytes, anyhow::Error>(chunk)
    });
    reqwest::Body::wrap_stream(stream)
}

/// Builds the reqwest client used for all outgoing requests.
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

    // Must be set explicitly, see the doc comment above.
    tls_config.alpn_protocols = vec![b"h2".to_vec(), b"http/1.1".to_vec()];

    let mut builder = reqwest::Client::builder()
        .tls_backend_preconfigured(tls_config)
        .tls_info(true)
        .dns_resolver(Arc::new(ScopedHostResolver));

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
