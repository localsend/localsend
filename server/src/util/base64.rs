use base64::{DecodeError, Engine};
use base64::engine::general_purpose::STANDARD;
use base64::engine::GeneralPurpose;

const BASE_64_ENGINE: GeneralPurpose = STANDARD;

pub(crate) fn decode(data: &str) -> Result<Vec<u8>, DecodeError> {
    BASE_64_ENGINE.decode(data)
}
