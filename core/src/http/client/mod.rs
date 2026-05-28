mod url;
pub mod v2;
pub mod v3;

pub use v2::LsHttpClientV2;
pub use v3::LsHttpClientV3;

use crate::http::StatusCodeError;
use crate::{crypto, http};
use reqwest::Response;
use rustls::client::danger::{HandshakeSignatureValid, ServerCertVerified, ServerCertVerifier};
use rustls::pki_types::pem::PemObject;
use rustls::pki_types::{CertificateDer, PrivateKeyDer, ServerName, UnixTime};
use rustls::{DigitallySignedStruct, SignatureScheme};
use serde::{Deserialize, Serialize};
use std::sync::{Arc, Mutex};
use thiserror::Error;

tokio::task_local! {
    static CAPTURED_CERT: Arc<Mutex<Option<Vec<u8>>>>;
}

/// Accepts any peer certificate and stores the leaf cert into the current
/// task-local holder. Replaces reqwest's `TlsInfo` extension, which doesn't
/// populate reliably when combined with rustls + the danger flag.
#[derive(Debug)]
struct CapturingVerifier;

impl ServerCertVerifier for CapturingVerifier {
    fn verify_server_cert(
        &self,
        end_entity: &CertificateDer<'_>,
        _intermediates: &[CertificateDer<'_>],
        _server_name: &ServerName<'_>,
        _ocsp_response: &[u8],
        _now: UnixTime,
    ) -> Result<ServerCertVerified, rustls::Error> {
        if let Ok(holder) = CAPTURED_CERT.try_with(|h| h.clone()) {
            if let Ok(mut g) = holder.lock() {
                *g = Some(end_entity.as_ref().to_vec());
            }
        }
        Ok(ServerCertVerified::assertion())
    }

    fn verify_tls12_signature(
        &self,
        _: &[u8],
        _: &CertificateDer<'_>,
        _: &DigitallySignedStruct,
    ) -> Result<HandshakeSignatureValid, rustls::Error> {
        Ok(HandshakeSignatureValid::assertion())
    }

    fn verify_tls13_signature(
        &self,
        _: &[u8],
        _: &CertificateDer<'_>,
        _: &DigitallySignedStruct,
    ) -> Result<HandshakeSignatureValid, rustls::Error> {
        Ok(HandshakeSignatureValid::assertion())
    }

    fn supported_verify_schemes(&self) -> Vec<SignatureScheme> {
        vec![
            SignatureScheme::RSA_PSS_SHA256,
            SignatureScheme::RSA_PSS_SHA384,
            SignatureScheme::RSA_PSS_SHA512,
            SignatureScheme::RSA_PKCS1_SHA256,
            SignatureScheme::RSA_PKCS1_SHA384,
            SignatureScheme::RSA_PKCS1_SHA512,
            SignatureScheme::ECDSA_NISTP256_SHA256,
            SignatureScheme::ECDSA_NISTP384_SHA384,
            SignatureScheme::ECDSA_NISTP521_SHA512,
            SignatureScheme::ED25519,
        ]
    }
}

/// Runs [f] in a fresh cert-capture scope. The peer leaf certificate observed
/// during any TLS handshake performed inside [f] is captured into a task-local
/// holder, retrievable via [verify_cert_from_res]. HTTP-only requests inside
/// the scope are no-ops for the holder.
pub(super) async fn with_cert_capture<F, T>(f: F) -> T
where
    F: std::future::Future<Output = T>,
{
    CAPTURED_CERT.scope(Arc::new(Mutex::new(None)), f).await
}

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
}

impl LsHttpClient {
    pub fn new(
        private_key: &str,
        cert: &str,
        version: LsHttpClientVersion,
    ) -> Result<LsHttpClient, ClientError> {
        let client = match version {
            LsHttpClientVersion::V2 => {
                LsHttpClient::V2(LsHttpClientV2::try_new(&private_key, &cert)?)
            }
            LsHttpClientVersion::V3 => {
                LsHttpClient::V3(LsHttpClientV3::try_new(&private_key, &cert)?)
            }
        };

        Ok(client)
    }

    pub async fn register(
        &self,
        protocol: http::dto::ProtocolType,
        ip: &str,
        port: u16,
        payload: http::dto::RegisterDto,
    ) -> Result<ResultWithPublicKey<http::dto::RegisterResponseDto>, ClientError> {
        match self {
            LsHttpClient::V2(client) => {
                let result = client.register(protocol, ip, port, payload.into()).await?;
                Ok(ResultWithPublicKey {
                    public_key: result.public_key,
                    body: result.body.into(),
                })
            }
            LsHttpClient::V3(client) => client.register(protocol, ip, port, payload).await,
        }
    }

    pub async fn prepare_upload(
        &self,
        protocol: http::dto::ProtocolType,
        ip: &str,
        port: u16,
        public_key: Option<String>,
        payload: http::dto::PrepareUploadRequestDto,
        pin: Option<&str>,
    ) -> Result<http::dto::PrepareUploadResult, ClientError> {
        match self {
            LsHttpClient::V2(client) => {
                let result = client
                    .prepare_upload(protocol, ip, port, public_key, payload.into(), pin)
                    .await?;
                Ok(result.into())
            }
            LsHttpClient::V3(client) => {
                client
                    .prepare_upload(protocol, ip, port, public_key, payload)
                    .await
            }
        }
    }

    pub async fn upload(
        &self,
        protocol: http::dto::ProtocolType,
        ip: &str,
        port: u16,
        public_key: Option<String>,
        session_id: &str,
        file_id: &str,
        token: &str,
        binary: tokio::sync::mpsc::Receiver<Vec<u8>>,
    ) -> Result<(), ClientError> {
        match self {
            LsHttpClient::V2(client) => {
                client
                    .upload(
                        protocol, ip, port, public_key, session_id, file_id, token, binary,
                    )
                    .await
            }
            LsHttpClient::V3(client) => {
                client
                    .upload(
                        protocol, ip, port, public_key, session_id, file_id, token, binary,
                    )
                    .await
            }
        }
    }

    pub async fn cancel(
        &self,
        protocol: http::dto::ProtocolType,
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

pub(super) fn create_reqwest_client(
    private_key: &str,
    cert: &str,
) -> Result<reqwest::Client, ClientError> {
    let _ = rustls::crypto::ring::default_provider().install_default();

    let cert_der = CertificateDer::from_pem_slice(cert.as_bytes())
        .map_err(|e| ClientError::Other(anyhow::anyhow!("Failed to parse certificate PEM: {e}")))?;
    let key = PrivateKeyDer::from_pem_slice(private_key.as_bytes())
        .map_err(|e| ClientError::Other(anyhow::anyhow!("Failed to parse private key PEM: {e}")))?;

    let mut config = rustls::ClientConfig::builder()
        .dangerous()
        .with_custom_certificate_verifier(Arc::new(CapturingVerifier))
        .with_client_auth_cert(vec![cert_der], key)
        .map_err(|e| ClientError::Other(anyhow::anyhow!("Failed to build TLS config: {e}")))?;
    config.alpn_protocols = vec![b"h2".to_vec(), b"http/1.1".to_vec()];
    // Force a fresh TLS handshake per request so [CapturingVerifier] always runs
    // and the leaf cert is observable. Without this, both reqwest's connection
    // pool and rustls session tickets can short-circuit the Certificate message.
    config.resumption = rustls::client::Resumption::disabled();

    let client = reqwest::Client::builder()
        .use_preconfigured_tls(config)
        .pool_max_idle_per_host(0)
        .build()?;

    Ok(client)
}

/// Verifies the certificate captured during the most recent TLS handshake in
/// the current [with_cert_capture] scope, and returns the public key extracted
/// from it. The [_response] argument is kept for API symmetry but unused; the
/// cert comes from the task-local holder populated by [CapturingVerifier].
pub(super) fn verify_cert_from_res(
    _response: &Response,
    public_key: Option<String>,
) -> anyhow::Result<String> {
    let cert = CAPTURED_CERT
        .try_with(|h| h.lock().ok().and_then(|g| g.clone()))
        .map_err(|_| {
            anyhow::anyhow!("No cert-capture scope (caller must wrap the request in with_cert_capture)")
        })?
        .ok_or_else(|| anyhow::anyhow!("Certificate not captured during TLS handshake"))?;
    crypto::cert::verify_cert_from_der(&cert, public_key.as_deref())?;
    let public_key = match public_key {
        Some(public_key) => public_key,
        None => crypto::cert::public_key_from_cert_der(&cert)?,
    };
    Ok(public_key)
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
