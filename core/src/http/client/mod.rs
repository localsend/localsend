use crate::model::discovery::{ProtocolType, RegisterDto, RegisterResponseDto};
use crate::model::transfer::{PrepareUploadRequestDto, PrepareUploadResponseDto};
use futures_util::StreamExt;
use reqwest::{Response, StatusCode};
use serde::{Deserialize, Serialize};
use tokio::sync::mpsc;
use tokio_stream::wrappers::ReceiverStream;
use crate::http::StatusCodeError;

const BASE_PATH: &str = "/api/localsend/v2";

pub struct LsHttpClient {
    client: reqwest::Client,
}

pub struct RegisterResult {
    /// The public key extracted from the certificate.
    /// Encoded in PEM format.
    /// Only available in HTTPS.
    pub public_key: Option<String>,

    /// The response body from the register request.
    pub body: RegisterResponseDto,
}

impl LsHttpClient {
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

        Ok(Self { client })
    }

    pub async fn register(
        &self,
        protocol: &ProtocolType,
        ip: &str,
        port: u16,
        payload: RegisterDto,
    ) -> anyhow::Result<RegisterResult> {
        let res = self
            .client
            .post(format!(
                "{}://{}:{}{}/register",
                protocol.as_str(),
                ip,
                port,
                BASE_PATH
            ))
            .body(serde_json::to_string(&payload)?)
            .send()
            .await?;

        let public_key = match protocol {
            ProtocolType::Https => Some(verify_cert_from_res(&res, None)?),
            _ => None,
        };

        let body = res.json::<RegisterResponseDto>().await?;

        Ok(RegisterResult { public_key, body })
    }

    pub async fn prepare_upload(
        &self,
        protocol: &ProtocolType,
        ip: &str,
        port: u16,
        public_key: Option<String>,
        payload: PrepareUploadRequestDto,
    ) -> anyhow::Result<PrepareUploadResponseDto> {
        let res = self
            .client
            .post(format!(
                "{}://{}:{}{}/prepare-upload",
                protocol.as_str(),
                ip,
                port,
                BASE_PATH
            ))
            .body(serde_json::to_string(&payload)?)
            .send()
            .await?;

        if let Some(public_key) = public_key {
            verify_cert_from_res(&res, Some(public_key))?;
        }

        if res.status() != StatusCode::OK {
            return Err(status_code_error_from_res(res).await?);
        }

        let body = res.json::<PrepareUploadResponseDto>().await?;

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
            .post(format!(
                "{}://{}:{}{}/upload?sessionId={}&fileId={}&token={}",
                protocol.as_str(),
                ip,
                port,
                BASE_PATH,
                session_id,
                file_id,
                token
            ))
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
            .post(format!(
                "{}://{}:{}{}/cancel?sessionId={}",
                protocol.as_str(),
                ip,
                port,
                BASE_PATH,
                session_id
            ))
            .send()
            .await?;

        Ok(())
    }
}

/// Verifies the certificate from the response.
/// Returns the public key extracted from the certificate.
fn verify_cert_from_res(response: &Response, public_key: Option<String>) -> anyhow::Result<String> {
    let tls_info_ext = response
        .extensions()
        .get::<reqwest::tls::TlsInfo>()
        .ok_or_else(|| anyhow::anyhow!("TLS info not found"))?;
    let cert = tls_info_ext
        .peer_certificate()
        .ok_or_else(|| anyhow::anyhow!("Certificate not found"))?;
    let public_key = match public_key {
        Some(public_key) => public_key.to_owned(),
        None => crate::crypto::cert::public_key_from_cert_der(cert)?,
    };
    crate::crypto::cert::verify_cert_from_der(cert, Some(public_key.clone()))?;
    Ok(public_key)
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
