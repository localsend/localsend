use rand::Rng;

pub fn generate_nonce() -> Vec<u8> {
    let mut nonce = vec![0; 32];
    rand::rng().fill_bytes(&mut nonce);
    nonce
}

pub fn validate_nonce(nonce: &[u8]) -> bool {
    nonce.len() >= 16 && nonce.len() <= 128
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_generate_nonce_has_correct_length() {
        let nonce = generate_nonce();
        assert_eq!(nonce.len(), 32);
    }

    #[test]
    fn test_generate_nonce_is_random() {
        let a = generate_nonce();
        let b = generate_nonce();
        assert_ne!(a, b);
    }

    #[test]
    fn test_validate_nonce_accepts_32_bytes() {
        assert!(validate_nonce(&[0u8; 32]));
    }

    #[test]
    fn test_validate_nonce_accepts_minimum() {
        assert!(validate_nonce(&[0u8; 16]));
    }

    #[test]
    fn test_validate_nonce_accepts_maximum() {
        assert!(validate_nonce(&[0u8; 128]));
    }

    #[test]
    fn test_validate_nonce_rejects_too_short() {
        assert!(!validate_nonce(&[0u8; 15]));
    }

    #[test]
    fn test_validate_nonce_rejects_too_long() {
        assert!(!validate_nonce(&[0u8; 129]));
    }

    #[test]
    fn test_validate_nonce_rejects_empty() {
        assert!(!validate_nonce(&[]));
    }
}
