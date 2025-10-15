pub fn verify_cert(cert: String, public_key: String) -> anyhow::Result<()> {
    localsend::crypto::cert::verify_cert_from_pem(cert, Some(public_key))
}

pub fn generate_key_pair() -> anyhow::Result<KeyPair> {
    let signing_key = localsend::crypto::token::generate_key();
    let private_key = localsend::crypto::token::export_private_key(&signing_key)?;
    let public_key = localsend::crypto::token::export_public_key(&signing_key)?;

    Ok(
        KeyPair {
            private_key: private_key.to_string(),
            public_key,
        }
    )
}

pub struct KeyPair {
    pub private_key: String,
    pub public_key: String,
}
