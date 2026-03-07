use crate::http::dto::{RegisterDto, RegisterResponseDto};
use crate::http::server::collect_to_json::CollectToJson;
use crate::http::server::error::AppError;
use crate::http::server::response::JsonResponse;
use crate::http::server::{AppState, RequestClientInfo};
use hyper::body::Incoming;
use hyper::StatusCode;

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
