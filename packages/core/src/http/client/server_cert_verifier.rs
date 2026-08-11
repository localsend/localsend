use crate::crypto::cert::fingerprint_from_cert_der;
use rustls::client::danger::{HandshakeSignatureValid, ServerCertVerified, ServerCertVerifier};
use rustls::client::WebPkiServerVerifier;
use rustls::pki_types::pem::PemObject;
use rustls::pki_types::{CertificateDer, ServerName, UnixTime};
use rustls::{
    CertificateError, DigitallySignedStruct, Error, OtherError, RootCertStore, SignatureScheme,
};
use std::fmt::{Debug, Display, Formatter};
use std::sync::Arc;
use x509_parser::nom::AsBytes;

/// The reason a peer certificate was rejected, as an error that rustls carries
/// along.
///
/// Without this, every check in this file collapses into rustls'
/// [`CertificateError::ApplicationVerificationFailure`], which surfaces in the
/// app as a bare "error sending request for url (...)" with no hint that the
/// certificate was the problem.
struct RejectedCert(String);

impl Display for RejectedCert {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        f.write_str(&self.0)
    }
}

/// rustls renders `InvalidCertificate` with `Debug`, so the derived
/// `RejectedCert("…")` would end up in the message.
impl Debug for RejectedCert {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        f.write_str(&self.0)
    }
}

impl std::error::Error for RejectedCert {}

fn rejected(reason: String) -> Error {
    tracing::warn!("{reason}");
    Error::InvalidCertificate(CertificateError::Other(OtherError(Arc::new(RejectedCert(
        reason,
    )))))
}

/// Verifies the certificate of the remote peer during the TLS handshake.
///
/// LocalSend peers use self-signed certificates, so there is no authority to
/// chain to. The peer identity is the uppercase-hex SHA-256 of the certificate
/// in DER format, the same identity the server side enforces for client
/// certificates in [`crate::http::server`].
///
/// Running the check here instead of on the response is what makes it useful:
/// the handshake fails before any request bytes are written, so a mismatching
/// peer never receives the request metadata or the file content.
pub(crate) struct PinnedServerCertVerifier {
    inner: Arc<dyn ServerCertVerifier>,

    /// The SHA-256 fingerprint (uppercase hex) the peer certificate must have.
    ///
    /// [`None`] accepts any valid certificate. This is trust on first use and
    /// is only appropriate for discovery, where the fingerprint of the peer is
    /// not known yet and is read from the response instead.
    expected_fingerprint: Option<String>,
}

impl PinnedServerCertVerifier {
    pub(crate) fn try_new(
        cert: &str,
        expected_fingerprint: Option<String>,
    ) -> anyhow::Result<Self> {
        // The root store must not be empty, so we add our own certificate.
        // It is never used as an authority: `verify_server_cert` below does not
        // delegate. We only need the inner verifier for the signature methods.
        let mut root_cert_store = RootCertStore::empty();
        root_cert_store.add(PemObject::from_pem_slice(cert.as_bytes())?)?;

        Ok(Self {
            inner: WebPkiServerVerifier::builder(Arc::new(root_cert_store)).build()?,
            expected_fingerprint: expected_fingerprint.map(|f| f.to_ascii_uppercase()),
        })
    }
}

impl Debug for PinnedServerCertVerifier {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        self.inner.fmt(f)
    }
}

impl ServerCertVerifier for PinnedServerCertVerifier {
    fn verify_server_cert(
        &self,
        end_entity: &CertificateDer<'_>,
        _: &[CertificateDer<'_>],
        _: &ServerName<'_>,
        _: &[u8],
        _: UnixTime,
    ) -> Result<ServerCertVerified, Error> {
        // The hostname is deliberately ignored: peers are addressed by IP and
        // their certificates carry no matching SAN. The fingerprint below is
        // what identifies the peer.
        crate::crypto::cert::verify_cert_from_der(end_entity.as_bytes(), None)
            .map_err(|e| rejected(format!("server certificate is not valid: {e:#}")))?;

        if let Some(expected) = &self.expected_fingerprint {
            let actual = fingerprint_from_cert_der(end_entity.as_bytes());
            if &actual != expected {
                return Err(rejected(format!(
                    "server certificate fingerprint mismatch: expected {expected}, got {actual}"
                )));
            }
        }

        Ok(ServerCertVerified::assertion())
    }

    fn verify_tls12_signature(
        &self,
        message: &[u8],
        cert: &CertificateDer<'_>,
        dss: &DigitallySignedStruct,
    ) -> Result<HandshakeSignatureValid, Error> {
        self.inner.verify_tls12_signature(message, cert, dss)
    }

    fn verify_tls13_signature(
        &self,
        message: &[u8],
        cert: &CertificateDer<'_>,
        dss: &DigitallySignedStruct,
    ) -> Result<HandshakeSignatureValid, Error> {
        self.inner.verify_tls13_signature(message, cert, dss)
    }

    fn supported_verify_schemes(&self) -> Vec<SignatureScheme> {
        self.inner.supported_verify_schemes()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use rustls::pki_types::pem::PemObject;

    /// Valid until 2035, so the time validity check passes.
    static CERT: &str = "-----BEGIN CERTIFICATE-----
MIIDGTCCAgGgAwIBAgIBATANBgkqhkiG9w0BAQsFADBQMRcwFQYDVQQDEw5Mb2Nh
bFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQLEwAxCTAHBgNVBAcTADEJMAcG
A1UECBMAMQkwBwYDVQQGEwAwHhcNMjUwMjA5MDAwMzE0WhcNMzUwMjA3MDAwMzE0
WjBQMRcwFQYDVQQDEw5Mb2NhbFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQL
EwAxCTAHBgNVBAcTADEJMAcGA1UECBMAMQkwBwYDVQQGEwAwggEiMA0GCSqGSIb3
DQEBAQUAA4IBDwAwggEKAoIBAQCL24MxhGfrdJm0Q8ZGiBkZ27ldcEChB4w7rSbJ
yiKeosoNbJl2kyj5dZjfBhWGgDLGDMM5w+Mh/5SrWgTL/QrhbB+lsrxILLznWqBi
R8wJP0P2YW9fBahQskJQcUXt/3jsCsMTWea4rWc3HZGh03bAkJfLM+PDSOfTpvAZ
6DQSp9QLzC9bgVNnq3W0SvOZGpF0xRa4InCyTUgxsNsV4+GIrmN5w4EbRFVVYu7D
5OS5fxNSCukiS0fb6oQzUp0vIAycvvWHHbAy8T6UMoUor2nfvNcryiaOX5WBMLyh
yMZ5gMOyXjdm1bT1XSlvtXPYUzxvsGAzTqS8mXjw8h7mm5htAgMBAAEwDQYJKoZI
hvcNAQELBQADggEBABZ+I7D6wkeSrsi1NBLP2zoZ5oGh+INNcGTravfOQHs4Fbas
/CysaUYjsD3fmaDh4MxgWEqAmWnnBiojfpGX2SGuFqRBKyT9DgitBt0L7Ezg1k3h
bfSiFW4hXWp75grVO8xfML7ZcWMlhKrOsOMUGiy1qs3qsyJ3w7B2Tz78HhXGO5dd
jyPmZarhixKO92UpEvKGxjO0E/3UUNUzxKTAAgFfhKpuwHUgIijM/EppZtA8OcSh
fEztiV0xKfcPVx4d6dqRt/NMElK1Ivw2vUuxTymphZkkFOzht9m73/kyKaeFp8Ij
VRus1zGVD8IVpIdPMyz01WJyS7M0fWaHXKWo+Bo=
-----END CERTIFICATE-----";

    static FINGERPRINT: &str = "4BADDE53A7F7CDEEED93189FD898E02BF6B4806CA4C05DE0ACE08319B86552FA";

    fn verify(expected_fingerprint: Option<&str>) -> Result<(), Error> {
        let _ = rustls::crypto::ring::default_provider().install_default();

        let verifier =
            PinnedServerCertVerifier::try_new(CERT, expected_fingerprint.map(|f| f.to_string()))
                .unwrap();

        verifier
            .verify_server_cert(
                &CertificateDer::from_pem_slice(CERT.as_bytes()).unwrap(),
                &[],
                &ServerName::try_from("192.168.1.1").unwrap(),
                &[],
                UnixTime::now(),
            )
            .map(|_| ())
    }

    #[test]
    fn accepts_matching_fingerprint() {
        assert!(verify(Some(FINGERPRINT)).is_ok());
    }

    #[test]
    fn accepts_lowercase_fingerprint() {
        assert!(verify(Some(&FINGERPRINT.to_ascii_lowercase())).is_ok());
    }

    #[test]
    fn rejects_mismatching_fingerprint() {
        let other = "0".repeat(64);
        let error = verify(Some(&other)).unwrap_err();
        let message = error.to_string();
        assert!(message.contains("fingerprint mismatch"), "{message}");
        assert!(message.contains(&other), "{message}");
        assert!(message.contains(FINGERPRINT), "{message}");
    }

    #[test]
    fn accepts_any_certificate_without_pin() {
        assert!(verify(None).is_ok());
    }
}
