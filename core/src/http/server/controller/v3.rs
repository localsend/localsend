use crate::http::dto::{NonceRequest, NonceResponse, RegisterDto, RegisterResponseDto};
use crate::http::server::collect_to_json::CollectToJson;
use crate::http::server::error::AppError;
use crate::http::server::response::JsonResponse;
use crate::http::server::{AppState, RequestClientInfo};
use crate::{crypto, util};
use hyper::body::Incoming;
use hyper::StatusCode;

pub(crate) async fn nonce_exchange(
    body: Incoming,
    state: AppState,
    client_info: RequestClientInfo,
) -> Result<JsonResponse<NonceResponse>, AppError> {
    let payload = body.collect_to_json::<NonceRequest>().await?;

    let nonce = util::base64::decode(&payload.nonce).map_err(|_| {
        tracing::warn!("Failed to decode nonce from base64");
        AppError::BadRequest("Invalid nonce format".to_string())
    })?;

    if !crypto::nonce::validate_nonce(&nonce) {
        tracing::warn!("Invalid nonce received");
        return Err(AppError::BadRequest("Invalid nonce".to_string()));
    }

    // Save the nonce
    let remote_key = client_info.identifier();
    let mut received_nonce_map = state.received_nonce_map.lock().await;
    received_nonce_map.put(remote_key.clone(), nonce);

    // Generate new nonce for the client
    let new_nonce = crypto::nonce::generate_nonce();
    let new_nonce_base64 = util::base64::encode(&new_nonce);
    let mut generated_nonce_map = state.generated_nonce_map.lock().await;
    generated_nonce_map.put(remote_key.clone(), new_nonce);

    tracing::info!(
        "Nonce exchange successful for client: {} (ID: {})",
        client_info.ip,
        remote_key
    );

    Ok(JsonResponse {
        status: StatusCode::OK,
        body: NonceResponse {
            nonce: new_nonce_base64,
        },
    })
}

pub(crate) async fn register(
    body: Incoming,
    state: AppState,
    client_info: RequestClientInfo,
) -> Result<JsonResponse<RegisterResponseDto>, AppError> {
    let payload = body.collect_to_json::<RegisterDto>().await?;

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
