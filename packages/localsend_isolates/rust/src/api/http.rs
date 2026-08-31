use crate::api::cancel::RsCancellationToken;
use crate::api::stream;
use crate::frb_generated::StreamSink;
use flutter_rust_bridge::frb;
pub use localsend::http::client::{ClientError, LsHttpClientVersion};
pub use localsend::http::dto::{
    PrepareUploadRequestDto, PrepareUploadResponseDto, PrepareUploadResult,
    RegisterDto, RegisterResponseDto,
};
use localsend::model::discovery::ProtocolType;
use localsend::model::transfer::FileDto;
use localsend::reqwest;
use localsend::util::error::ErrorChain;
use std::collections::HashMap;

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
            .map_err(RsHttpClientError::from)?;

        Ok(response)
    }

    /// Requests the sender's reverse-download manifest.
    pub async fn prepare_download(
        &self,
        protocol: ProtocolType,
        ip: &str,
        port: u16,
        session_id: Option<String>,
        pin: Option<String>,
        cancel_token: &RsCancellationToken,
    ) -> Result<RsPrepareDownloadResponse, RsHttpClientError> {
        let client = match &self.inner {
            localsend::http::client::LsHttpClient::V2(client) => client,
            localsend::http::client::LsHttpClient::V3(_) => {
                return Err(RsHttpClientError::Other(
                    "The Download API is only available in LocalSend protocol v2".into(),
                ));
            }
        };
        let response = client
            .prepare_download_with_cancel(
                protocol,
                ip,
                port,
                session_id.as_deref(),
                pin.as_deref(),
                cancel_token.inner.clone(),
            )
            .await
            .map_err(|error| match error {
                ClientError::Cancelled => {
                    RsHttpClientError::Other("Download preparation cancelled".to_string())
                }
                error => RsHttpClientError::from(error),
            })?;

        Ok(RsPrepareDownloadResponse {
            info: RsDownloadDeviceInfo {
                alias: response.info.alias,
                version: response.info.version,
                device_model: response.info.device_model,
                device_type: response.info.device_type,
                fingerprint: response.info.fingerprint,
                download: response.info.download,
            },
            session_id: response.session_id,
            files: response.files,
        })
    }

    /// Downloads one reverse-transfer file, emitting progress on [sink].
    ///
    /// Failures are stream events for the same reason as [RsHttpClient::upload].
    #[allow(clippy::too_many_arguments)]
    pub async fn download_to_target(
        &self,
        sink: StreamSink<RsDownloadEvent>,
        protocol: ProtocolType,
        ip: &str,
        port: u16,
        session_id: &str,
        file_id: &str,
        path: Option<String>,
        file_descriptor: Option<i32>,
        expected_size: u64,
        cancel_token: &RsCancellationToken,
    ) {
        let result = async {
            let client = match &self.inner {
                localsend::http::client::LsHttpClient::V2(client) => client,
                localsend::http::client::LsHttpClient::V3(_) => {
                    return Err(RsHttpClientError::Other(
                        "The Download API is only available in LocalSend protocol v2".into(),
                    ));
                }
            };
            let target = resolve_download_target(path, file_descriptor)?;
            let (progress_tx, mut progress_rx) = tokio::sync::mpsc::channel::<u64>(16);
            let progress_sink = sink.clone();
            let progress_task = tokio::spawn(async move {
                let mut last_emit = None::<std::time::Instant>;
                while let Some(received) = progress_rx.recv().await {
                    let now = std::time::Instant::now();
                    let is_final = received >= expected_size;
                    if !is_final
                        && last_emit.is_some_and(|last| {
                            now.duration_since(last) < std::time::Duration::from_millis(20)
                        })
                    {
                        continue;
                    }
                    last_emit = Some(now);
                    let progress = if expected_size == 0 {
                        1.0
                    } else {
                        (received as f64 / expected_size as f64).min(1.0)
                    };
                    let _ = progress_sink.add(RsDownloadEvent::Progress { progress });
                }
            });

            let download_result = client
                .download_to_target(
                    protocol,
                    ip,
                    port,
                    session_id,
                    file_id,
                    target,
                    expected_size,
                    Some(progress_tx),
                    cancel_token.inner.clone(),
                )
                .await
                .map_err(|error| match error {
                    ClientError::Cancelled => {
                        RsHttpClientError::Other("Download cancelled".to_string())
                    }
                    error => RsHttpClientError::from(error),
                });
            let _ = progress_task.await;
            download_result
        }
        .await;

        if let Err(error) = result {
            let _ = sink.add(RsDownloadEvent::Failed { error });
        }
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

fn resolve_download_target(
    path: Option<String>,
    file_descriptor: Option<i32>,
) -> Result<localsend::http::client::v2::FileDownloadTarget, RsHttpClientError> {
    match (path, file_descriptor) {
        (Some(path), None) => Ok(localsend::http::client::v2::FileDownloadTarget::Path(
            path.into(),
        )),
        (None, Some(file_descriptor)) => {
            #[cfg(target_os = "android")]
            {
                use std::os::fd::FromRawFd;

                // SAFETY: the Dart caller transfers ownership to this operation.
                // OwnedFd closes it on every success and early-return path.
                let fd = unsafe { std::os::fd::OwnedFd::from_raw_fd(file_descriptor) };
                Ok(localsend::http::client::v2::FileDownloadTarget::Fd(fd))
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
            "Exactly one download destination must be provided".into(),
        )),
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

pub struct RsPrepareDownloadResponse {
    pub info: RsDownloadDeviceInfo,
    pub session_id: String,
    pub files: HashMap<String, FileDto>,
}

pub struct RsDownloadDeviceInfo {
    pub alias: String,
    pub version: String,
    pub device_model: Option<String>,
    pub device_type: Option<localsend::model::discovery::DeviceType>,
    pub fingerprint: String,
    pub download: bool,
}

/// An event emitted while a reverse-transfer file is downloaded.
#[derive(Clone)]
pub enum RsDownloadEvent {
    /// Download progress as a fraction from 0.0 through 1.0. Throttled.
    Progress { progress: f64 },

    /// The download failed. Always the final event.
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
