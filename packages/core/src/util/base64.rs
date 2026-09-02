use base64::engine::general_purpose::URL_SAFE_NO_PAD;
use base64::engine::GeneralPurpose;
use base64::{DecodeError, Engine};

#[allow(dead_code)]
const BASE_64_ENGINE: GeneralPurpose = URL_SAFE_NO_PAD;

#[allow(dead_code)]
pub fn encode<T: AsRef<[u8]>>(data: T) -> String {
    BASE_64_ENGINE.encode(data)
}

#[allow(dead_code)]
pub fn decode(data: &str) -> Result<Vec<u8>, DecodeError> {
    BASE_64_ENGINE.decode(data)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_encode_decode_roundtrip() {
        let data = b"hello world";
        let encoded = encode(data);
        let decoded = decode(&encoded).unwrap();
        assert_eq!(decoded, data);
    }

    #[test]
    fn test_encode_empty() {
        assert_eq!(encode(b""), "");
    }

    #[test]
    fn test_decode_empty() {
        let decoded = decode("").unwrap();
        assert!(decoded.is_empty());
    }

    #[test]
    fn test_encode_binary() {
        let data = vec![0x00, 0x01, 0xFF, 0xFE];
        let encoded = encode(&data);
        let decoded = decode(&encoded).unwrap();
        assert_eq!(decoded, data);
    }

    #[test]
    fn test_decode_invalid_input() {
        assert!(decode("!!!invalid!!!").is_err());
    }

    #[test]
    fn test_encode_url_safe() {
        // URL-safe base64 doesn't contain + or /
        let encoded = encode(&[0xFB, 0xFF, 0xFF, 0xFF]);
        assert!(!encoded.contains('+'));
        assert!(!encoded.contains('/'));
        assert!(!encoded.contains('='));
    }
}
