use bytes::Bytes;
use http_body_util::Full;
use hyper::{http, Response, StatusCode};
use serde::Serialize;

pub(crate) struct JsonResponse<T: Serialize> {
    pub(crate) status: StatusCode,
    pub(crate) body: T,
}

impl<T: Serialize> JsonResponse<T> {
    pub(crate) fn into_response(self) -> Response<Full<Bytes>> {
        let mut response = Response::new(Full::default());
        *response.status_mut() = self.status;

        response.headers_mut().insert(
            http::header::CONTENT_TYPE,
            http::HeaderValue::from_static("application/json"),
        );

        *response.body_mut() = Full::from(Bytes::from(
            serde_json::to_string(&self.body).unwrap_or_else(|_| "{}".to_string()),
        ));

        response
    }
}
