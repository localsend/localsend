use base64::engine::general_purpose::URL_SAFE_NO_PAD;
use base64::engine::GeneralPurpose;
use base64::{DecodeError, Engine};

const BASE_64_ENGINE: GeneralPurpose = URL_SAFE_NO_PAD;

pub(crate) fn decode(data: &str) -> Result<Vec<u8>, DecodeError> {
    BASE_64_ENGINE.decode(data)
}
