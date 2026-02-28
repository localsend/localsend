mod url;
pub mod v2;
pub mod v3;

pub use v2::LsHttpClientV2;
pub use v3::LsHttpClientV3;

use crate::crypto;
use crate::http::StatusCodeError;
use reqwest::Response;
use serde::{Deserialize, Serialize};
use thiserror::Error;

pub enum LsHttpClient {
    V2(LsHttpClientV2),
    V3(LsHttpClientV3),
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

pub(super) fn create_reqwest_client(private_key: &str, cert: &str) -> Result<reqwest::Client, ClientError> {
    let _ = rustls::crypto::ring::default_provider().install_default();

    let identity = {
        let pem = &[cert.as_bytes(), "\n".as_bytes(), private_key.as_bytes()].concat();
        reqwest::Identity::from_pem(pem)?
    };

    let client = reqwest::Client::builder()
        .use_rustls_tls()
        .danger_accept_invalid_certs(true)
        .tls_info(true)
        .identity(identity)
        .build()?;

    Ok(client)
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

#[derive(Serialize, Deserialize)]
struct ErrorResponse {
    message: String,
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
            message: if message.is_empty() { None } else { Some(message) },
        }))
    }
}
