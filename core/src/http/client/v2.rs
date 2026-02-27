use crate::http::client::url::{ApiVersion, TargetUrl};
use crate::http::dto_v2::{
    InfoResponseDtoV2, PrepareDownloadResponseDtoV2, PrepareUploadRequestDtoV2,
    PrepareUploadResponseDtoV2, ProtocolTypeV2, RegisterDtoV2, RegisterResponseDtoV2,
};
use crate::http::StatusCodeError;
use futures_util::StreamExt;
use reqwest::{Response, StatusCode};
use serde::{Deserialize, Serialize};
use tokio::io::AsyncWriteExt;
use tokio::sync::mpsc;
use tokio_stream::wrappers::ReceiverStream;

/// Result of a successful register request.
pub struct RegisterResultV2 {
    /// The public key extracted from the certificate.
    /// Encoded in PEM format.
    /// Only available in HTTPS mode.
    pub public_key: Option<String>,

    /// The response body from the register request.
    pub body: RegisterResponseDtoV2,
}

/// HTTP client for LocalSend Protocol v2.1.
pub struct LsHttpClientV2 {
    client: reqwest::Client,
}

impl LsHttpClientV2 {
    /// Creates a new HTTP client for v2.1 protocol.
    ///
    /// # Arguments
    /// * `private_key` - PEM-encoded private key for client certificate
    /// * `cert` - PEM-encoded certificate for client authentication
    ///
    /// # Returns
    /// A new client instance or an error if TLS setup fails.
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
        })
    }

    /// Creates a new HTTP client without TLS client certificate.
    ///
    /// Use this for HTTP-only connections or when client authentication is not needed.
    pub fn try_new_without_cert() -> anyhow::Result<Self> {
        let _ = rustls::crypto::ring::default_provider().install_default();

        let client = reqwest::Client::builder()
            .use_rustls_tls()
            .danger_accept_invalid_certs(true)
            .tls_info(true)
            .build()?;

        Ok(Self {
            client,
        })
    }

    fn url(&self, protocol: &ProtocolTypeV2, ip: &str, port: u16, path: &'static str) -> String {
        TargetUrl {
            version: ApiVersion::V2,
            protocol: protocol.as_str(),
            host: ip.to_string(),
            port,
            path,
            params: &[],
        }
        .to_string()
    }

    /// Registers with another device for discovery.
    ///
    /// POST /api/localsend/v2/register
    ///
    /// # Arguments
    /// * `protocol` - HTTP or HTTPS
    /// * `ip` - Target device IP address
    /// * `port` - Target device port
    /// * `payload` - Device information to register
    ///
    /// # Returns
    /// Registration result containing the remote device info and optional public key.
    pub async fn register(
        &self,
        protocol: &ProtocolTypeV2,
        ip: &str,
        port: u16,
        payload: RegisterDtoV2,
    ) -> anyhow::Result<RegisterResultV2> {
        let url = self.url(protocol, ip, port, "/register");

        let res = self
            .client
            .post(&url)
            .header("Content-Type", "application/json")
            .body(serde_json::to_string(&payload)?)
            .send()
            .await?;

        if res.status() != StatusCode::OK {
            return Err(status_code_error_from_res(res).await?);
        }

        let public_key = match protocol {
            ProtocolTypeV2::Https => Some(super::verify_cert_from_res(&res, None)?),
            _ => None,
        };

        let body = res.json::<RegisterResponseDtoV2>().await?;

        Ok(RegisterResultV2 { public_key, body })
    }

    /// Prepares a file upload session with the receiver.
    ///
    /// POST /api/localsend/v2/prepare-upload
    ///
    /// The receiver will decide if this request gets accepted, partially accepted, or rejected.
    ///
    /// # Arguments
    /// * `protocol` - HTTP or HTTPS
    /// * `ip` - Receiver's IP address
    /// * `port` - Receiver's port
    /// * `public_key` - Expected public key for verification (HTTPS only)
    /// * `payload` - Upload request with device info and file metadata
    /// * `pin` - Optional PIN if required by receiver
    ///
    /// # Returns
    /// Session ID and accepted file tokens, or an error.
    ///
    /// # Errors
    /// * 204 - No file transfer needed (all files already exist)
    /// * 400 - Invalid body
    /// * 401 - PIN required or invalid
    /// * 403 - Rejected by user
    /// * 409 - Blocked by another session
    /// * 429 - Too many requests
    /// * 500 - Unknown error
    pub async fn prepare_upload(
        &self,
        protocol: &ProtocolTypeV2,
        ip: &str,
        port: u16,
        public_key: Option<String>,
        payload: PrepareUploadRequestDtoV2,
        pin: Option<&str>,
    ) -> anyhow::Result<PrepareUploadResponseDtoV2> {
        let pin_params: &[(&'static str, &str)] = match &pin {
            Some(pin) => &[("pin", pin)],
            None => &[],
        };
        let url = TargetUrl {
            version: ApiVersion::V2,
            protocol: protocol.as_str(),
            host: ip.to_string(),
            port,
            path: "/prepare-upload",
            params: pin_params,
        }
        .to_string();

        let res = self
            .client
            .post(&url)
            .header("Content-Type", "application/json")
            .body(serde_json::to_string(&payload)?)
            .send()
            .await?;

        if let Some(public_key) = public_key {
            super::verify_cert_from_res(&res, Some(public_key))?;
        }

        if res.status() == StatusCode::NO_CONTENT {
            // 204 - No file transfer needed
            return Ok(PrepareUploadResponseDtoV2 {
                session_id: String::new(),
                files: std::collections::HashMap::new(),
            });
        }

        if res.status() != StatusCode::OK {
            return Err(status_code_error_from_res(res).await?);
        }

        let body = res.json::<PrepareUploadResponseDtoV2>().await?;

        Ok(body)
    }

    /// Uploads a file to the receiver.
    ///
    /// POST /api/localsend/v2/upload?sessionId=...&fileId=...&token=...
    ///
    /// Use the session_id, file_id, and token from prepare_upload response.
    /// This method can be called in parallel for multiple files.
    ///
    /// # Arguments
    /// * `protocol` - HTTP or HTTPS
    /// * `ip` - Receiver's IP address
    /// * `port` - Receiver's port
    /// * `session_id` - Session ID from prepare_upload
    /// * `file_id` - File ID to upload
    /// * `token` - File-specific token from prepare_upload
    /// * `binary` - Channel receiving file chunks
    ///
    /// # Errors
    /// * 400 - Missing parameters
    /// * 403 - Invalid token or IP address
    /// * 409 - Blocked by another session
    /// * 500 - Unknown error
    pub async fn upload(
        &self,
        protocol: &ProtocolTypeV2,
        ip: &str,
        port: u16,
        session_id: &str,
        file_id: &str,
        token: &str,
        binary: mpsc::Receiver<Vec<u8>>,
    ) -> anyhow::Result<()> {
        let url = TargetUrl {
            version: ApiVersion::V2,
            protocol: protocol.as_str(),
            host: ip.to_string(),
            port,
            path: "/upload",
            params: &[("sessionId", session_id), ("fileId", file_id), ("token", token)],
        }
        .to_string();

        let stream = ReceiverStream::new(binary).map(Ok::<Vec<u8>, anyhow::Error>);
        let body = reqwest::Body::wrap_stream(stream);

        let res = self.client.post(&url).body(body).send().await?;

        if res.status() != StatusCode::OK {
            return Err(status_code_error_from_res(res).await?);
        }

        Ok(())
    }

    /// Uploads a file from bytes.
    ///
    /// Convenience method that wraps upload() for simple byte array uploads.
    pub async fn upload_bytes(
        &self,
        protocol: &ProtocolTypeV2,
        ip: &str,
        port: u16,
        session_id: &str,
        file_id: &str,
        token: &str,
        data: Vec<u8>,
    ) -> anyhow::Result<()> {
        let url = TargetUrl {
            version: ApiVersion::V2,
            protocol: protocol.as_str(),
            host: ip.to_string(),
            port,
            path: "/upload",
            params: &[("sessionId", session_id), ("fileId", file_id), ("token", token)],
        }
        .to_string();

        let res = self.client.post(&url).body(data).send().await?;

        if res.status() != StatusCode::OK {
            return Err(status_code_error_from_res(res).await?);
        }

        Ok(())
    }

    /// Cancels an ongoing file transfer session.
    ///
    /// POST /api/localsend/v2/cancel?sessionId=...
    ///
    /// # Arguments
    /// * `protocol` - HTTP or HTTPS
    /// * `ip` - Receiver's IP address
    /// * `port` - Receiver's port
    /// * `session_id` - Session ID to cancel
    pub async fn cancel(
        &self,
        protocol: &ProtocolTypeV2,
        ip: &str,
        port: u16,
        session_id: &str,
    ) -> anyhow::Result<()> {
        let url = TargetUrl {
            version: ApiVersion::V2,
            protocol: protocol.as_str(),
            host: ip.to_string(),
            port,
            path: "/cancel",
            params: &[("sessionId", session_id)],
        }
        .to_string();

        self.client.post(&url).send().await?;

        Ok(())
    }

    /// Gets device info from a remote device.
    ///
    /// GET /api/localsend/v2/info
    ///
    /// This is primarily for debugging purposes.
    ///
    /// # Arguments
    /// * `protocol` - HTTP or HTTPS
    /// * `ip` - Target device IP address
    /// * `port` - Target device port
    ///
    /// # Returns
    /// Device information including alias, version, device type, fingerprint, etc.
    pub async fn info(
        &self,
        protocol: &ProtocolTypeV2,
        ip: &str,
        port: u16,
    ) -> anyhow::Result<InfoResponseDtoV2> {
        let url = self.url(protocol, ip, port, "/info");

        let res = self.client.get(&url).send().await?;

        if res.status() != StatusCode::OK {
            return Err(status_code_error_from_res(res).await?);
        }

        let body = res.json::<InfoResponseDtoV2>().await?;

        Ok(body)
    }

    /// Prepares to download files from a sender (Download API).
    ///
    /// POST /api/localsend/v2/prepare-download
    ///
    /// This is used in reverse file transfer mode where the sender hosts the files
    /// and receivers download them.
    ///
    /// # Arguments
    /// * `protocol` - HTTP or HTTPS
    /// * `ip` - Sender's IP address
    /// * `port` - Sender's port
    /// * `session_id` - Optional existing session ID (for browser refresh scenarios)
    /// * `pin` - Optional PIN if required by sender
    ///
    /// # Returns
    /// Sender info, session ID, and available files.
    ///
    /// # Errors
    /// * 401 - PIN required or invalid
    /// * 403 - Rejected
    /// * 429 - Too many requests
    /// * 500 - Unknown error
    pub async fn prepare_download(
        &self,
        protocol: &ProtocolTypeV2,
        ip: &str,
        port: u16,
        session_id: Option<&str>,
        pin: Option<&str>,
    ) -> anyhow::Result<PrepareDownloadResponseDtoV2> {
        let mut params: Vec<(&'static str, &str)> = Vec::new();
        if let Some(session_id) = session_id {
            params.push(("sessionId", session_id));
        }
        if let Some(pin) = pin {
            params.push(("pin", pin));
        }
        let url = TargetUrl {
            version: ApiVersion::V2,
            protocol: protocol.as_str(),
            host: ip.to_string(),
            port,
            path: "/prepare-download",
            params: &params,
        }
        .to_string();

        let res = self.client.post(&url).send().await?;

        if res.status() != StatusCode::OK {
            return Err(status_code_error_from_res(res).await?);
        }

        let body = res.json::<PrepareDownloadResponseDtoV2>().await?;

        Ok(body)
    }

    /// Downloads a file from a sender (Download API).
    ///
    /// GET /api/localsend/v2/download?sessionId=...&fileId=...
    ///
    /// This method can be called in parallel for multiple files.
    ///
    /// # Arguments
    /// * `protocol` - HTTP or HTTPS
    /// * `ip` - Sender's IP address
    /// * `port` - Sender's port
    /// * `session_id` - Session ID from prepare_download
    /// * `file_id` - File ID to download
    ///
    /// # Returns
    /// Response containing the file data stream.
    pub async fn download(
        &self,
        protocol: &ProtocolTypeV2,
        ip: &str,
        port: u16,
        session_id: &str,
        file_id: &str,
    ) -> anyhow::Result<Response> {
        let url = TargetUrl {
            version: ApiVersion::V2,
            protocol: protocol.as_str(),
            host: ip.to_string(),
            port,
            path: "/download",
            params: &[("sessionId", session_id), ("fileId", file_id)],
        }
        .to_string();

        let res = self.client.get(&url).send().await?;

        if res.status() != StatusCode::OK {
            return Err(status_code_error_from_res(res).await?);
        }

        Ok(res)
    }

    /// Downloads a file to a writer (convenience method).
    ///
    /// # Arguments
    /// * `protocol` - HTTP or HTTPS
    /// * `ip` - Sender's IP address
    /// * `port` - Sender's port
    /// * `session_id` - Session ID from prepare_download
    /// * `file_id` - File ID to download
    /// * `writer` - AsyncWrite destination for file data
    ///
    /// # Returns
    /// Total bytes written.
    pub async fn download_to_writer<W: tokio::io::AsyncWrite + Unpin>(
        &self,
        protocol: &ProtocolTypeV2,
        ip: &str,
        port: u16,
        session_id: &str,
        file_id: &str,
        writer: &mut W,
    ) -> anyhow::Result<u64> {
        let response = self.download(protocol, ip, port, session_id, file_id).await?;

        let mut stream = response.bytes_stream();
        let mut total_bytes = 0u64;

        while let Some(chunk) = stream.next().await {
            let chunk = chunk?;
            writer.write_all(&chunk).await?;
            total_bytes += chunk.len() as u64;
        }

        writer.flush().await?;

        Ok(total_bytes)
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


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_build_url_ipv4() {
        let client = LsHttpClientV2::try_new_without_cert().unwrap();
        let url = client.url(&ProtocolTypeV2::Https, "192.168.1.1", 53317, "/register");
        assert_eq!(url, "https://192.168.1.1:53317/api/localsend/v2/register");
    }

    #[test]
    fn test_build_url_ipv6() {
        let client = LsHttpClientV2::try_new_without_cert().unwrap();
        let url = client.url(&ProtocolTypeV2::Https, "::1", 53317, "/register");
        assert_eq!(url, "https://[::1]:53317/api/localsend/v2/register");
    }

    #[test]
    fn test_build_url_http() {
        let client = LsHttpClientV2::try_new_without_cert().unwrap();
        let url = client.url(&ProtocolTypeV2::Http, "192.168.1.1", 53317, "/info");
        assert_eq!(url, "http://192.168.1.1:53317/api/localsend/v2/info");
    }
}
