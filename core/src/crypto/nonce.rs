use rand::RngCore;

pub fn generate_nonce() -> Vec<u8> {
    let mut nonce = vec![0; 32];
    rand::rng().fill_bytes(&mut nonce);
    nonce
}

pub fn validate_nonce(nonce: &[u8]) -> bool {
    nonce.len() >= 16 && nonce.len() <= 128
}
