use hyper::body::Incoming;
use hyper::StatusCode;
use http_body_util::BodyExt;
use serde::de::DeserializeOwned;
use crate::http::server::error::AppError;

pub(crate) trait CollectToJson {
    async fn collect_to_json<T: DeserializeOwned>(self) -> Result<T, AppError>;
}

impl CollectToJson for Incoming {
    async fn collect_to_json<T: DeserializeOwned>(self) -> Result<T, AppError> {
        let bytes = self.collect().await?.to_bytes();
        let request = match serde_json::from_slice::<T>(&bytes) {
            Ok(json) => json,
            Err(err) => {
                tracing::warn!("Failed to parse JSON body: {err:#}");
                return Err(AppError::status(
                    StatusCode::BAD_REQUEST,
                    Some("Invalid JSON body".to_string()),
                ));
            }
        };

        Ok(request)
    }
}
