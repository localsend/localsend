use crate::http::server::error::AppError;
use http_body_util::BodyExt;
use hyper::body::Incoming;
use serde::de::DeserializeOwned;

pub(crate) trait CollectToJson {
    async fn collect_to_json<T: DeserializeOwned>(self) -> Result<T, AppError>;
}

impl CollectToJson for Incoming {
    async fn collect_to_json<T: DeserializeOwned>(self) -> Result<T, AppError> {
        let bytes = self.collect().await?.to_bytes();
        serde_json::from_slice::<T>(&bytes).map_err(|err| {
            tracing::warn!("Failed to parse JSON body: {err:#}");
            AppError::BadRequest("Invalid JSON body".to_string())
        })
    }
}
