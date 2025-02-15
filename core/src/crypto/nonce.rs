use ed25519_dalek::ed25519::signature::rand_core::RngCore;
use webrtc::ice::rand;

pub fn generate_nonce() -> Vec<u8> {
    let mut nonce = vec![0; 32];
    rand::thread_rng().fill_bytes(&mut nonce);
    nonce
}

pub fn verify_nonce(nonce: &[u8]) -> bool {
    nonce.len() >= 16 && nonce.len() <= 128
}
