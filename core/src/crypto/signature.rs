use crate::crypto::hash;
use crate::util;
use ed25519_dalek::ed25519::signature::rand_core::OsRng;
use ed25519_dalek::pkcs8::spki::der::pem::LineEnding;
use ed25519_dalek::pkcs8::spki::der::zeroize::Zeroizing;
use ed25519_dalek::pkcs8::{DecodePrivateKey, DecodePublicKey, EncodePrivateKey, EncodePublicKey};
use ed25519_dalek::{Signer, Verifier};

pub struct SigningKey {
    inner: ed25519_dalek::SigningKey,
}

impl SigningKey {
    pub fn as_verifying_key(&self) -> VerifyingKey {
        VerifyingKey {
            inner: self.inner.verifying_key(),
        }
    }
}

pub struct VerifyingKey {
    inner: ed25519_dalek::VerifyingKey,
}

pub fn generate_key() -> SigningKey {
    let mut csprng = OsRng;
    SigningKey {
        inner: ed25519_dalek::SigningKey::generate(&mut csprng),
    }
}

pub fn export_private_key(key: &SigningKey) -> anyhow::Result<Zeroizing<String>> {
    let pem = key.inner.to_pkcs8_pem(LineEnding::LF)?;
    Ok(pem)
}

pub fn parse_private_key(private_key: &str) -> anyhow::Result<SigningKey> {
    let parsed = ed25519_dalek::SigningKey::from_pkcs8_pem(private_key)?;
    Ok(SigningKey { inner: parsed })
}

pub fn export_public_key(key: &SigningKey) -> anyhow::Result<String> {
    let pem = key
        .inner
        .verifying_key()
        .to_public_key_pem(LineEnding::LF)?;
    Ok(pem)
}

pub fn parse_public_key(public_key: &str) -> anyhow::Result<VerifyingKey> {
    let parsed = ed25519_dalek::VerifyingKey::from_public_key_pem(public_key)?;
    Ok(VerifyingKey { inner: parsed })
}

pub fn verify_signature(key: &VerifyingKey, data: &[u8], signature: &[u8]) -> bool {
    match ed25519_dalek::Signature::from_slice(signature) {
        Ok(signature) => key.inner.verify(data, &signature).is_ok(),
        Err(_) => false,
    }
}

pub fn generate_token_timestamp(key: &SigningKey) -> anyhow::Result<String> {
    let salt = util::time::unix_timestamp_u64()?.to_le_bytes();
    let result = generate_token_nonce(key, &salt)?;
    Ok(result)
}

pub fn generate_token_nonce(key: &SigningKey, salt: &[u8]) -> anyhow::Result<String> {
    let digest = {
        let public_key = key.inner.verifying_key().to_public_key_der()?;
        let hash_input = [public_key.as_bytes(), &salt].concat();
        hash::sha256(&hash_input)
    };
    let signature = key.inner.sign(&digest);

    let hash_method = "sha256";
    let hash_base64 = util::base64::encode(&digest);
    let salt_base64 = util::base64::encode(&salt);
    let sign_method = "ed25519";
    let signature_base64 = util::base64::encode(signature.to_bytes());

    let result =
        format!("{hash_method}.{hash_base64}.{salt_base64}.{sign_method}.{signature_base64}");

    Ok(result)
}

pub fn verify_token_timestamp(public_key: &VerifyingKey, token: &str) -> bool {
    verify_token_with_result(public_key, token, |salt| {
        let salt = {
            if salt.len() != 8 {
                return Err(anyhow::anyhow!("Invalid salt length"));
            }
            u64::from_le_bytes(
                salt.try_into()
                    .map_err(|_| anyhow::anyhow!("Invalid salt"))?,
            )
        };

        let now_seconds = util::time::unix_timestamp_u64()?;
        if now_seconds - salt > 60 * 60 {
            // Fingerprint is older than 1h, reject
            return Err(anyhow::anyhow!("Fingerprint timestamp expired"));
        }

        Ok(())
    })
    .is_ok()
}

pub fn verify_token_nonce(public_key: &VerifyingKey, token: &str, nonce: &[u8]) -> bool {
    verify_token_with_result(public_key, token, |salt| {
        if salt != nonce {
            return Err(anyhow::anyhow!("Invalid nonce"));
        }

        Ok(())
    })
    .is_ok()
}

pub fn verify_token_with_result(
    public_key: &VerifyingKey,
    token: &str,
    verify_salt: impl Fn(&[u8]) -> anyhow::Result<()>,
) -> anyhow::Result<()> {
    let parts: Vec<&str> = token.split('.').collect();
    let [hash_method, hash_base64, salt_base64, sign_method, signature_base64] = parts[0..5] else {
        return Err(anyhow::anyhow!("Invalid structure"));
    };

    if hash_method != "sha256" {
        return Err(anyhow::anyhow!("Invalid hash method"));
    }

    if sign_method != "ed25519" {
        return Err(anyhow::anyhow!("Invalid sign method"));
    }

    let salt = {
        let salt_bytes = util::base64::decode(salt_base64)?;
        verify_salt(&salt_bytes)?;
        salt_bytes
    };

    let digest = {
        let public_key_der = public_key.inner.to_public_key_der()?;
        let hash_input = [public_key_der.as_bytes(), &salt].concat();
        hash::sha256(&hash_input)
    };

    if util::base64::encode(&digest) != hash_base64 {
        return Err(anyhow::anyhow!("Hash mismatch"));
    }

    let Ok(signature) = util::base64::decode(signature_base64) else {
        return Err(anyhow::anyhow!("Invalid signature base64 encoding"));
    };

    match verify_signature(&public_key, &digest, &signature) {
        true => Ok(()),
        _ => Err(anyhow::anyhow!("Invalid signature")),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_generate_key() {
        let key = generate_key();
        let pem = export_private_key(&key).unwrap();

        let parsed = parse_private_key(&pem).unwrap();
        assert_eq!(parsed.inner.as_bytes(), key.inner.as_bytes());
    }

    #[test]
    fn test_sign_verify() {
        let key = generate_key();
        let data = b"hello world";
        let signature = key.inner.sign(data);
        let verified = verify_signature(&key.as_verifying_key(), data, &signature.to_vec());
        assert!(verified);
    }

    #[test]
    fn test_fingerprint() {
        let key = generate_key();
        let fingerprint = generate_token_timestamp(&key).unwrap();
        let verified = verify_token_timestamp(&key.as_verifying_key(), &fingerprint);
        assert!(verified);
    }
}
