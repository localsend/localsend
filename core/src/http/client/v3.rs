use super::{ClientError, ResponseExt, ResultWithPublicKey};
use crate::http;
use crate::http::client::url::{ApiVersion, TargetUrl};
use crate::http::dto::ProtocolType;
use crate::{crypto, util};
use futures_util::StreamExt;
use lru::LruCache;
use reqwest::{Response, StatusCode};
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

impl LsHttpClientV3 {
    pub fn try_new(private_key: &str, cert: &str) -> Result<Self, ClientError> {
        Ok(Self {
            client: super::create_reqwest_client(private_key, cert)?,
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
        protocol: ProtocolType,
        ip: &str,
        port: u16,
    ) -> Result<String, ClientError> {
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
            return res.into_error().await;
        }

        let remote_key = to_identifier(&res, protocol == ProtocolType::Https, None)?;
        let body = res.json::<http::dto::NonceResponse>().await?;

        // Save the response nonce and our generated nonce
        let response_nonce = util::base64::decode(&body.nonce).map_err(|e| anyhow::anyhow!(e))?;

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
        protocol: ProtocolType,
        ip: &str,
        port: u16,
        payload: http::dto::RegisterDto,
    ) -> Result<ResultWithPublicKey<http::dto::RegisterResponseDto>, ClientError> {
        let res = self
            .client
            .post(
                TargetUrl {
                    version: ApiVersion::V3,
                    protocol: protocol.as_str(),
                    host: ip.to_string(),
                    port,
                    path: "/register",
                    params: &[],
                }
                .to_string(),
            )
            .body(serde_json::to_string(&payload)?)
            .send()
            .await?;

        let public_key = match protocol {
            ProtocolType::Https => Some(super::verify_cert_from_res(&res, None)?),
            _ => None,
        };

        let body = res.json::<http::dto::RegisterResponseDto>().await?;

        Ok(ResultWithPublicKey { public_key, body })
    }

    pub async fn prepare_upload(
        &self,
        protocol: ProtocolType,
        ip: &str,
        port: u16,
        public_key: Option<String>,
        payload: http::dto::PrepareUploadRequestDto,
    ) -> Result<http::dto::PrepareUploadResult, ClientError> {
        let res = self
            .client
            .post(
                TargetUrl {
                    version: ApiVersion::V3,
                    protocol: protocol.as_str(),
                    host: ip.to_string(),
                    port,
                    path: "/prepare-upload",
                    params: &[],
                }
                .to_string(),
            )
            .body(serde_json::to_string(&payload)?)
            .send()
            .await?;

        if protocol == ProtocolType::Https {
            super::verify_cert_from_res(&res, public_key)?;
        }

        let status = res.status();

        if status.as_u16() >= 400 {
            return res.into_error().await;
        }

        let response = res.json::<http::dto::PrepareUploadResponseDto>().await?;

        Ok(http::dto::PrepareUploadResult {
            status_code: status.as_u16(),
            response,
        })
    }

    /// Uploads a file to the server.
    pub async fn upload(
        &self,
        protocol: ProtocolType,
        ip: &str,
        port: u16,
        public_key: Option<String>,
        session_id: &str,
        file_id: &str,
        token: &str,
        binary: mpsc::Receiver<Vec<u8>>,
    ) -> Result<(), ClientError> {
        let res = self
            .client
            .post(
                TargetUrl {
                    version: ApiVersion::V3,
                    protocol: protocol.as_str(),
                    host: ip.to_string(),
                    port,
                    path: "/upload",
                    params: &[
                        ("sessionId", &session_id),
                        ("fileId", &file_id),
                        ("token", &token),
                    ],
                }
                .to_string(),
            )
            .body({
                let stream = ReceiverStream::new(binary).map(Ok::<Vec<u8>, anyhow::Error>);
                reqwest::Body::wrap_stream(stream)
            })
            .send()
            .await?;

        if protocol == ProtocolType::Https {
            super::verify_cert_from_res(&res, public_key)?;
        }

        if res.status() != StatusCode::OK {
            return res.into_error().await;
        }

        Ok(())
    }

    pub async fn cancel(
        &self,
        protocol: ProtocolType,
        ip: &str,
        port: u16,
        session_id: &str,
    ) -> Result<(), ClientError> {
        self.client
            .post(
                TargetUrl {
                    version: ApiVersion::V3,
                    protocol: protocol.as_str(),
                    host: ip.to_string(),
                    port,
                    path: "/cancel",
                    params: &[("sessionId", session_id)],
                }
                .to_string(),
            )
            .send()
            .await?;

        Ok(())
    }
}

fn to_identifier(
    response: &Response,
    require_cert: bool,
    public_key: Option<String>,
) -> Result<String, ClientError> {
    match require_cert {
        true => Ok(super::verify_cert_from_res(response, public_key)?),
        false => response
            .remote_addr()
            .map(|addr| addr.ip().to_string())
            .ok_or_else(|| anyhow::anyhow!("Remote address not found in response"))
            .map_err(ClientError::Other),
    }
}
