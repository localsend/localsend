use bytes::Bytes;
use http_body_util::combinators::BoxBody;
use http_body_util::{BodyExt, Full};
use hyper::{http, Response, StatusCode};
use serde::Serialize;

/// Response body that is either fully buffered or streamed (e.g. file downloads).
pub(crate) type BoxedBody = BoxBody<Bytes, std::io::Error>;

/// Creates a fully buffered response body.
pub(crate) fn full_body(bytes: impl Into<Bytes>) -> BoxedBody {
    Full::new(bytes.into())
        .map_err(std::io::Error::other)
        .boxed()
}

/// Creates an empty response body.
pub(crate) fn empty_body() -> BoxedBody {
    full_body(Bytes::new())
}

pub(crate) struct JsonResponse<T: Serialize> {
    pub(crate) status: StatusCode,
    pub(crate) body: T,
}

impl<T: Serialize> JsonResponse<T> {
    pub(crate) fn into_response(self) -> Response<BoxedBody> {
        let mut response = Response::new(empty_body());
        *response.status_mut() = self.status;

        response.headers_mut().insert(
            http::header::CONTENT_TYPE,
            http::HeaderValue::from_static("application/json"),
        );

        *response.body_mut() =
            full_body(serde_json::to_string(&self.body).unwrap_or_else(|_| "{}".to_string()));

        response
    }
}
