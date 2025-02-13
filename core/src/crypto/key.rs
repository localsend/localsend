use ed25519_dalek::ed25519::signature::rand_core::OsRng;
use ed25519_dalek::pkcs8::spki::der::pem::LineEnding;
use ed25519_dalek::pkcs8::spki::der::zeroize::Zeroizing;
use ed25519_dalek::pkcs8::DecodePrivateKey;
use ed25519_dalek::pkcs8::EncodePrivateKey;
use ed25519_dalek::{Signer, Verifier};

pub fn generate_key() -> ed25519_dalek::SigningKey {
    let mut csprng = OsRng;
    ed25519_dalek::SigningKey::generate(&mut csprng)
}

pub fn export_private_key(key: &ed25519_dalek::SigningKey) -> anyhow::Result<Zeroizing<String>> {
    let pem = key.to_pkcs8_pem(LineEnding::LF)?;
    Ok(pem)
}

pub fn parse_key(private_key: &str) -> anyhow::Result<ed25519_dalek::SigningKey> {
    let parsed = ed25519_dalek::SigningKey::from_pkcs8_pem(private_key)?;
    Ok(parsed)
}

pub fn sign(key: ed25519_dalek::SigningKey, data: &[u8]) -> ed25519_dalek::Signature {
    key.sign(data)
}

pub fn verify(key: ed25519_dalek::VerifyingKey, data: &[u8], signature: &[u8]) -> bool {
    match ed25519_dalek::Signature::from_slice(signature) {
        Ok(signature) => key.verify(data, &signature).is_ok(),
        Err(_) => false,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_generate_key() {
        let key = generate_key();
        assert_eq!(key.to_bytes().len(), 32);

        let pem = export_private_key(&key).unwrap();

        let parsed = parse_key(&pem).unwrap();
        assert_eq!(parsed.as_bytes(), key.as_bytes());
    }
}
