use crate::http::dto::{RegisterDto, RegisterResponseDto};
use crate::http::dto_v2::PrepareUploadRequestDtoV2;
use crate::http::server::collect_to_json::CollectToJson;
use crate::http::server::error::AppError;
use crate::http::server::response::JsonResponse;
use crate::http::server::{AppState, RequestClientInfo};
use http_body_util::BodyExt;
use hyper::body::Incoming;
use hyper::StatusCode;

pub(crate) async fn register(
    body: Incoming,
    state: AppState,
    client_info: RequestClientInfo,
) -> Result<JsonResponse<RegisterResponseDto>, AppError> {
    let _payload = body.collect_to_json::<RegisterDto>().await?;

    let info = state.info.lock().await.clone();
    let has_web_interface = state.web.lock().await.is_some();

    Ok(JsonResponse {
        status: StatusCode::OK,
        body: RegisterResponseDto {
            alias: info.alias,
            version: info.version,
            device_model: info.device_model,
            device_type: info.device_type,
            token: info.token,
            has_web_interface,
        },
    })
}

/// Handles POST /api/localsend/v2/prepare-upload
///
/// Parses the request and validates the structure.
/// Actual session management (accept/reject) is delegated to the app layer.
pub(crate) async fn prepare_upload(
    body: Incoming,
    _state: AppState,
    client_info: RequestClientInfo,
) -> Result<JsonResponse<serde_json::Value>, AppError> {
    let payload = body.collect_to_json::<PrepareUploadRequestDtoV2>().await?;

    if payload.files.is_empty() {
        return Err(AppError::BadRequest(
            "Request must contain at least one file".to_string(),
        ));
    }

    tracing::info!(
        "Prepare upload from {} ({}) with {} files",
        payload.info.alias,
        client_info.ip,
        payload.files.len()
    );

    // TODO: Delegate to app layer via callback channel.
    // For now, return 501 to indicate this endpoint is not yet fully wired.
    Ok(JsonResponse {
        status: StatusCode::NOT_IMPLEMENTED,
        body: serde_json::json!({
            "message": "Rust server prepare-upload handler not yet connected to app layer"
        }),
    })
}

/// Handles POST /api/localsend/v2/upload?sessionId=...&fileId=...&token=...
///
/// Streams the request body (file content) efficiently in Rust,
/// bypassing Dart's slow TLS implementation.
pub(crate) async fn upload(
    body: Incoming,
    _state: AppState,
    client_info: RequestClientInfo,
    session_id: Option<String>,
    file_id: Option<String>,
    token: Option<String>,
) -> Result<JsonResponse<serde_json::Value>, AppError> {
    let file_id = file_id.ok_or_else(|| AppError::BadRequest("Missing fileId".to_string()))?;
    let _token = token.ok_or_else(|| AppError::BadRequest("Missing token".to_string()))?;

    tracing::info!(
        "Upload request from {} for file {} (session: {:?})",
        client_info.ip,
        file_id,
        session_id
    );

    // Efficiently stream the body in Rust — this is where the performance gain comes from.
    // The TLS decryption happens in Rust (tokio-rustls) instead of Dart.
    let bytes = body.collect().await?.to_bytes();
    tracing::info!("Received {} bytes for file {}", bytes.len(), file_id);

    // TODO: Stream bytes to app layer via callback channel for saving to disk.
    // For now, return 501 to indicate this endpoint is not yet fully wired.
    Ok(JsonResponse {
        status: StatusCode::NOT_IMPLEMENTED,
        body: serde_json::json!({
            "message": "Rust server upload handler not yet connected to app layer"
        }),
    })
}

/// Handles POST /api/localsend/v2/cancel?sessionId=...
pub(crate) async fn cancel(
    _body: Incoming,
    _state: AppState,
    client_info: RequestClientInfo,
    session_id: Option<String>,
) -> Result<JsonResponse<serde_json::Value>, AppError> {
    tracing::info!(
        "Cancel request from {} (session: {:?})",
        client_info.ip,
        session_id
    );

    // TODO: Delegate to app layer via callback channel.
    Ok(JsonResponse {
        status: StatusCode::NOT_IMPLEMENTED,
        body: serde_json::json!({
            "message": "Rust server cancel handler not yet connected to app layer"
        }),
    })
}
