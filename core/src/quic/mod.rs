mod codec;
mod server;
mod client;

pub use server::{QuicServer, IncomingTransfer};
pub use client::{QuicClient, OutgoingTransfer};
pub use codec::{ControlMessage, FileHeader, FileAck};

use anyhow::Result;
pub use quinn::{RecvStream, SendStream};
pub use memmap2;
use quinn::VarInt;
use quinn::congestion::BbrConfig;
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

/// Chunk size for mmap'd file sends (4 MiB).  Large enough to amortise
/// per-write syscall overhead on fast LANs while still providing granular
/// progress updates.  The receive side uses zero-copy `read_chunk` so
/// this constant only governs the send-side mmap slice size.
pub const SEND_CHUNK_SIZE: usize = 4 * 1024 * 1024;

/// Send-side window (max bytes in-flight before ACK).  Must be >= the
/// receiver's receive_window for full throughput.
const SEND_WINDOW: u64 = 256 * 1024 * 1024;

// -- UDP Socket Configuration -------------------------------------------

/// Create and bind a UDP socket with heavily increased send/receive buffers.
/// OS default UDP buffers are usually ~200KB, which causes the kernel to drop
/// packets under heavy load at gigabit speeds, causing BBR to throttle down.
/// We increase them to 7MB to match Quinn's performance guidelines.
pub(crate) fn bind_udp_socket(addr: std::net::SocketAddr) -> Result<std::net::UdpSocket> {
    let socket = socket2::Socket::new(
        if addr.is_ipv4() { socket2::Domain::IPV4 } else { socket2::Domain::IPV6 },
        socket2::Type::DGRAM,
        Some(socket2::Protocol::UDP),
    )?;

    if addr.is_ipv6() {
        // Dual stack support
        socket.set_only_v6(false)?;
    }

    socket.bind(&addr.into())?;

    // 7 MiB buffers, ignoring errors if OS limits prevent it
    let buf_size = 7 * 1024 * 1024;
    let _ = socket.set_recv_buffer_size(buf_size);
    let _ = socket.set_send_buffer_size(buf_size);

    Ok(socket.into())
}

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
    // Allow receiving large files — 256 MiB windows.
    let window = VarInt::from_u32(256 * 1024 * 1024);
    transport.stream_receive_window(window);
    transport.receive_window(window);
    // Keep connection alive during long transfers.
    transport.max_idle_timeout(Some(
        quinn::IdleTimeout::try_from(std::time::Duration::from_secs(30)).unwrap(),
    ));

    // Sender-side window (how much data we're willing to have in-flight).
    transport.send_window(SEND_WINDOW);
    // Generic Segmentation Offload — lets the kernel send large payloads
    // in a single transmit instead of packet-by-packet.
    transport.enable_segmentation_offload(true);
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
    let mut quic_config = quinn::ClientConfig::new(Arc::new(quic_client_config));
    let mut transport = quinn::TransportConfig::default();
    let window = VarInt::from_u32(256 * 1024 * 1024);
    transport.stream_receive_window(window);
    transport.receive_window(window);
    transport.max_idle_timeout(Some(
        quinn::IdleTimeout::try_from(std::time::Duration::from_secs(30)).unwrap(),
    ));

    // Sender-side window — must be >= receiver's receive_window for full throughput.
    transport.send_window(SEND_WINDOW);
    // Generic Segmentation Offload for larger wire frames.
    transport.enable_segmentation_offload(true);
    quic_config.transport_config(Arc::new(transport));
    Ok(quic_config)
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
