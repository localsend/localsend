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
use localsend::reqwest;

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
}

impl From<ClientError> for RsHttpClientError {
    fn from(e: ClientError) -> Self {
        match e {
            ClientError::StatusCode(e) => RsHttpClientError::StatusCode {
                status: e.status,
                message: e.message,
            },
            ClientError::Reqwest(e) => RsHttpClientError::Reqwest(error_chain(&e)),
            ClientError::Json(e) => RsHttpClientError::Json(e.to_string()),
            ClientError::Io(e) => RsHttpClientError::Io(e.to_string()),
            ClientError::Other(e) => RsHttpClientError::Other(e.to_string()),
            ClientError::Cancelled => RsHttpClientError::Other("Upload cancelled".to_string()),
        }
    }
}

/// Renders an error together with everything that caused it.
///
/// [`reqwest::Error`] alone only says "error sending request for url (...)".
pub(crate) fn error_chain(e: &dyn std::error::Error) -> String {
    use std::fmt::Write;

    let mut message = e.to_string();
    let mut source = e.source();
    while let Some(current) = source {
        let _ = write!(message, ": {current}");
        source = current.source();
    }
    message
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
