use crate::http;
use crate::http::client::url::{ApiVersion, TargetUrl};
use crate::http::dto::ProtocolType;
use crate::http::StatusCodeError;
use crate::{crypto, util};
use futures_util::StreamExt;
use lru::LruCache;
use reqwest::{Response, StatusCode};
use serde::{Deserialize, Serialize};
use std::num::NonZeroUsize;
use std::sync::Arc;
use tokio::sync::{mpsc, Mutex};
use tokio_stream::wrappers::ReceiverStream;

pub struct LsHttpClientV3 {
    client: reqwest::Client,

    /// Maps client identifiers to nonces that have been received from remote.
    received_nonce_map: Arc<Mutex<LruCache<String, Vec<u8>>>>,

    /// Maps client identifiers to nonces that are expected to be received from remote.
    generated_nonce_map: Arc<Mutex<LruCache<String, Vec<u8>>>>,
}

pub struct RegisterResult {
    /// The public key extracted from the certificate.
    /// Encoded in PEM format.
    /// Only available in HTTPS.
    pub public_key: Option<String>,

    /// The response body from the register request.
    pub body: http::dto::RegisterResponseDto,
}

impl LsHttpClientV3 {
    pub fn try_new(private_key: &str, cert: &str) -> anyhow::Result<Self> {
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

        Ok(Self {
            client,
            received_nonce_map: Arc::new(Mutex::new(LruCache::new(
                NonZeroUsize::new(200).unwrap(),
            ))),
            generated_nonce_map: Arc::new(Mutex::new(LruCache::new(
                NonZeroUsize::new(200).unwrap(),
            ))),
        })
    }

    pub async fn nonce(
        &self,
        protocol: &ProtocolType,
        ip: &str,
        port: u16,
    ) -> anyhow::Result<String> {
        // Generate nonce to send to server
        let generated_nonce = crypto::nonce::generate_nonce();
        let generated_nonce_base64 = util::base64::encode(&generated_nonce);

        let request_body = http::dto::NonceRequest {
            nonce: generated_nonce_base64,
        };

        let res = self
            .client
            .post(
                TargetUrl {
                    version: ApiVersion::V3,
                    protocol: protocol.as_str(),
                    host: ip.to_string(),
                    port,
                    path: "/nonce",
                    params: &[],
                }
                .to_string(),
            )
            .body(serde_json::to_string(&request_body)?)
            .send()
            .await?;

        if res.status() != StatusCode::OK {
            return Err(status_code_error_from_res(res).await?);
        }

        let remote_key = to_identifier(&res, protocol == &ProtocolType::Https, None)?;
        let body = res.json::<http::dto::NonceResponse>().await?;

        // Save the response nonce and our generated nonce
        let response_nonce = util::base64::decode(&body.nonce)?;

        let mut received_nonce_map = self.received_nonce_map.lock().await;
        received_nonce_map.put(remote_key.clone(), response_nonce);

        let mut generated_nonce_map = self.generated_nonce_map.lock().await;
        generated_nonce_map.put(remote_key.clone(), generated_nonce);

        tracing::info!("Nonce exchange successful for server: {ip} (ID: {remote_key})");

        tracing::debug!(
            "Received map: {:?}",
            received_nonce_map.get(&remote_key).unwrap()
        );
        tracing::debug!(
            "Generated map: {:?}",
            generated_nonce_map.get(&remote_key).unwrap()
        );

        Ok(body.nonce)
    }

    pub async fn register(
        &self,
        protocol: &ProtocolType,
        ip: &str,
        port: u16,
        payload: http::dto::RegisterDto,
    ) -> anyhow::Result<RegisterResult> {
        let res = self
            .client
            .post(TargetUrl {
                version: ApiVersion::V3,
                protocol: protocol.as_str(),
                host: ip.to_string(),
                port,
                path: "/register",
                params: &[],
            }.to_string())
            .body(serde_json::to_string(&payload)?)
            .send()
            .await?;

        let public_key = match protocol {
            ProtocolType::Https => Some(super::verify_cert_from_res(&res, None)?),
            _ => None,
        };

        let body = res.json::<http::dto::RegisterResponseDto>().await?;

        Ok(RegisterResult { public_key, body })
    }

    pub async fn prepare_upload(
        &self,
        protocol: &ProtocolType,
        ip: &str,
        port: u16,
        public_key: Option<String>,
        payload: http::dto::PrepareUploadRequestDto,
    ) -> anyhow::Result<http::dto::PrepareUploadResponseDto> {
        let res = self
            .client
            .post(TargetUrl {
                version: ApiVersion::V3,
                protocol: protocol.as_str(),
                host: ip.to_string(),
                port,
                path: "/prepare-upload",
                params: &[],
            }.to_string())
            .body(serde_json::to_string(&payload)?)
            .send()
            .await?;

        if let Some(public_key) = public_key {
            super::verify_cert_from_res(&res, Some(public_key))?;
        }

        if res.status() != StatusCode::OK {
            return Err(status_code_error_from_res(res).await?);
        }

        let body = res.json::<http::dto::PrepareUploadResponseDto>().await?;

        Ok(body)
    }

    /// Uploads a file to the server.
    pub async fn upload(
        &self,
        protocol: &ProtocolType,
        ip: &str,
        port: u16,
        session_id: String,
        file_id: String,
        token: String,
        binary: mpsc::Receiver<Vec<u8>>,
    ) -> anyhow::Result<()> {
        let res = self
            .client
            .post(TargetUrl {
                version: ApiVersion::V3,
                protocol: protocol.as_str(),
                host: ip.to_string(),
                port,
                path: "/upload",
                params: &[("sessionId", &session_id), ("fileId", &file_id), ("token", &token)],
            }.to_string())
            .body({
                let stream = ReceiverStream::new(binary).map(Ok::<Vec<u8>, anyhow::Error>);
                reqwest::Body::wrap_stream(stream)
            })
            .send()
            .await?;

        if res.status() != StatusCode::OK {
            return Err(status_code_error_from_res(res).await?);
        }

        Ok(())
    }

    pub async fn cancel(
        &self,
        protocol: &ProtocolType,
        ip: &str,
        port: u16,
        session_id: String,
    ) -> anyhow::Result<()> {
        self.client
            .post(TargetUrl {
                version: ApiVersion::V3,
                protocol: protocol.as_str(),
                host: ip.to_string(),
                port,
                path: "/cancel",
                params: &[("sessionId", &session_id)],
            }.to_string())
            .send()
            .await?;

        Ok(())
    }
}

#[derive(Serialize, Deserialize)]
struct ErrorResponse {
    message: String,
}

async fn status_code_error_from_res(response: Response) -> anyhow::Result<anyhow::Error> {
    let status = response.status().as_u16();
    let body = response.text().await?;
    let body = match serde_json::from_str::<ErrorResponse>(&body) {
        Ok(error) => error.message,
        Err(_) => body,
    };

    Ok(anyhow::Error::new(StatusCodeError {
        status,
        message: match body {
            _ if body.is_empty() => None,
            _ => Some(body),
        },
    }))
}

fn to_identifier(
    response: &Response,
    require_cert: bool,
    public_key: Option<String>,
) -> anyhow::Result<String> {
    match require_cert {
        true => super::verify_cert_from_res(response, public_key),
        false => response
            .remote_addr()
            .map(|addr| addr.ip().to_string())
            .ok_or_else(|| anyhow::anyhow!("Remote address not found in response")),
    }
}

