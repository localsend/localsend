pub fn verify_cert(cert: String, public_key: String) -> anyhow::Result<()> {
    localsend::crypto::cert::verify_cert_from_pem(cert, Some(public_key))
}
