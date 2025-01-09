use base64::engine::general_purpose::URL_SAFE_NO_PAD;
use base64::engine::GeneralPurpose;
use base64::Engine;

const BASE_64_ENGINE: GeneralPurpose = URL_SAFE_NO_PAD;

pub(crate) fn encode(data: &str) -> String {
    BASE_64_ENGINE.encode(data)
}
