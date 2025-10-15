use std::fmt::{Debug, Formatter};
use std::sync::Arc;
use rustls::pki_types::pem::PemObject;
use rustls::{DigitallySignedStruct, DistinguishedName, Error, RootCertStore, SignatureScheme};
use rustls::client::danger::HandshakeSignatureValid;
use rustls::pki_types::{CertificateDer, UnixTime};
use rustls::server::danger::{ClientCertVerified, ClientCertVerifier};
use rustls::server::WebPkiClientVerifier;
use x509_parser::nom::AsBytes;

/// Enables client certificate verification.
pub(crate) struct CustomClientCertVerifier {
    inner: Arc<dyn ClientCertVerifier>,
}

impl CustomClientCertVerifier {
    pub(crate) fn try_new(cert: &str) -> anyhow::Result<Self> {
        // We add the certificate of the server itself just so that no "empty" error is returned.
        // We don't care about the authority of the certificate, just that it is valid.
        let mut root_cert_store = RootCertStore::empty();
        root_cert_store.add(PemObject::from_pem_slice(cert.as_bytes())?)?;

        Ok(Self {
            inner: WebPkiClientVerifier::builder(Arc::new(root_cert_store)).build()?,
        })
    }
}

impl Debug for CustomClientCertVerifier {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        self.inner.fmt(f)
    }
}

impl ClientCertVerifier for CustomClientCertVerifier {
    fn offer_client_auth(&self) -> bool {
        true
    }

    fn client_auth_mandatory(&self) -> bool {
        true
    }

    fn root_hint_subjects(&self) -> &[DistinguishedName] {
        self.inner.root_hint_subjects()
    }

    fn verify_client_cert(
        &self,
        cert: &CertificateDer<'_>,
        _: &[CertificateDer<'_>],
        _: UnixTime,
    ) -> Result<ClientCertVerified, Error> {
        // We trust any certificate that is valid.
        crate::crypto::cert::verify_cert_from_der(cert.as_bytes(), None).map_err(|e| {
            tracing::warn!("Client certificate verification failed: {e:#}");
            Error::InvalidCertificate(rustls::CertificateError::ApplicationVerificationFailure)
        })?;
        Ok(ClientCertVerified::assertion())
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
