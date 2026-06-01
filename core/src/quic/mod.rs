mod codec;
mod server;
mod client;

pub use server::{QuicServer, IncomingTransfer};
pub use client::{QuicClient, OutgoingTransfer};
pub use codec::{ControlMessage, FileHeader, FileAck};

use anyhow::Result;
use quinn::rustls::pki_types::pem::PemObject;
use quinn::rustls::pki_types::{CertificateDer, PrivateKeyDer};
use std::sync::Arc;

/// ALPN protocol identifier for LocalSend QUIC.
const ALPN_LOCALSEND: &[&[u8]] = &[b"localsend"];

/// Default QUIC port. Same as HTTP port so both can coexist
/// (different protocol -- UDP vs TCP).
pub const DEFAULT_QUIC_PORT: u16 = 53317;

/// Maximum number of simultaneous file streams per connection.
const MAX_STREAMS: u32 = 100;

// -- TLS configuration ------------------------------------------------

/// Build a Quinn server config from the existing PEM cert/key format.
fn build_server_config(
    cert_pem: &str,
    key_pem: &str,
) -> Result<quinn::ServerConfig> {
    let certs = CertificateDer::pem_slice_iter(cert_pem.as_bytes())
        .collect::<Result<Vec<_>, _>>()?;
    let key = PrivateKeyDer::from_pem_slice(key_pem.as_bytes())?;

    let mut tls_config = quinn::rustls::ServerConfig::builder()
        .with_no_client_auth()
        .with_single_cert(certs, key)?;

    tls_config.alpn_protocols = ALPN_LOCALSEND.iter().map(|p| p.to_vec()).collect();

    let quic_server_config = quinn::crypto::rustls::QuicServerConfig::try_from(tls_config)?;
    let mut quic_config = quinn::ServerConfig::with_crypto(Arc::new(quic_server_config));
    let mut transport = quinn::TransportConfig::default();
    transport.max_concurrent_uni_streams(MAX_STREAMS.into());
    transport.max_concurrent_bidi_streams(1u32.into());
    quic_config.transport_config(Arc::new(transport));

    Ok(quic_config)
}

fn build_client_config(
    server_cert_pem: Option<&str>,
) -> Result<quinn::ClientConfig> {
    let mut roots = quinn::rustls::RootCertStore::empty();

    if let Some(cert_pem) = server_cert_pem {
        // Trust the specific self-signed cert (same trust model as HTTP fingerprint).
        for cert in CertificateDer::pem_slice_iter(cert_pem.as_bytes()) {
            roots.add(cert?)?;
        }
    }

    // If no cert provided, accept any self-signed cert (like the HTTP
    // client's danger_accept_invalid_certs behavior).
    let tls_config = if roots.is_empty() {
        quinn::rustls::ClientConfig::builder()
            .dangerous()
            .with_custom_certificate_verifier(Arc::new(danger::NoCertificateVerification))
            .with_no_client_auth()
    } else {
        quinn::rustls::ClientConfig::builder()
            .with_root_certificates(roots)
            .with_no_client_auth()
    };

    let mut tls_config = tls_config;
    tls_config.alpn_protocols = ALPN_LOCALSEND.iter().map(|p| p.to_vec()).collect();

    let quic_client_config = quinn::crypto::rustls::QuicClientConfig::try_from(tls_config)?;
    Ok(quinn::ClientConfig::new(Arc::new(quic_client_config)))
}

mod danger {
    use quinn::rustls::client::danger::{HandshakeSignatureValid, ServerCertVerified};
    use quinn::rustls::pki_types::{CertificateDer, ServerName, UnixTime};
    use quinn::rustls::DigitallySignedStruct;

    /// Insecure certificate verifier that accepts any certificate.
    /// This mirrors the HTTP client's `danger_accept_invalid_certs` behavior
    /// for first-time connections where the server cert fingerprint is not yet known.
    #[derive(Debug)]
    pub struct NoCertificateVerification;

    impl quinn::rustls::client::danger::ServerCertVerifier for NoCertificateVerification {
        fn verify_server_cert(
            &self,
            _end_entity: &CertificateDer<'_>,
            _intermediates: &[CertificateDer<'_>],
            _server_name: &ServerName<'_>,
            _ocsp_response: &[u8],
            _now: UnixTime,
        ) -> Result<ServerCertVerified, quinn::rustls::Error> {
            Ok(ServerCertVerified::assertion())
        }

        fn verify_tls12_signature(
            &self,
            _message: &[u8],
            _cert: &CertificateDer<'_>,
            _dss: &DigitallySignedStruct,
        ) -> Result<HandshakeSignatureValid, quinn::rustls::Error> {
            Ok(HandshakeSignatureValid::assertion())
        }

        fn verify_tls13_signature(
            &self,
            _message: &[u8],
            _cert: &CertificateDer<'_>,
            _dss: &DigitallySignedStruct,
        ) -> Result<HandshakeSignatureValid, quinn::rustls::Error> {
            Ok(HandshakeSignatureValid::assertion())
        }

        fn supported_verify_schemes(&self) -> Vec<quinn::rustls::SignatureScheme> {
            quinn::rustls::crypto::ring::default_provider()
                .signature_verification_algorithms
                .supported_schemes()
        }
    }
}
