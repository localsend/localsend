mod url;
pub mod v2;
pub mod v3;

pub use v2::LsHttpClientV2;
pub use v3::LsHttpClientV3;

pub enum LsHttpClient {
    V2(LsHttpClientV2),
    V3(LsHttpClientV3),
}
