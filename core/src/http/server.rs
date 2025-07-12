use crate::crypto::cert::public_key_from_cert_der;
use bytes::Bytes;
use http_body_util::{BodyExt, Full};
use hyper::body::Incoming;
use hyper::{Method, Request, Response, StatusCode};
use hyper_util::rt::{TokioExecutor, TokioIo};
use hyper_util::server::conn::auto::Builder;
use rustls::client::danger::HandshakeSignatureValid;
use rustls::pki_types::pem::PemObject;
use rustls::pki_types::{CertificateDer, PrivateKeyDer, UnixTime};
use rustls::server::danger::{ClientCertVerified, ClientCertVerifier};
use rustls::server::WebPkiClientVerifier;
use rustls::{DigitallySignedStruct, DistinguishedName, Error, RootCertStore, SignatureScheme};
use std::fmt::{Debug, Formatter};
use std::net::{Ipv4Addr, Ipv6Addr, SocketAddr};
use std::ops::Deref;
use std::sync::Arc;
use tokio::sync::{oneshot, Mutex};
use x509_parser::nom::AsBytes;

pub struct LsHttpServer {
    stop_tx: Arc<Mutex<Option<oneshot::Sender<()>>>>,
}

impl LsHttpServer {
    pub async fn start_with_port(
        port: u16,
        tls_config: Option<TlsConfig>,
    ) -> anyhow::Result<LsHttpServer> {
        let ipv4_socket_addr = SocketAddr::new(Ipv4Addr::UNSPECIFIED.into(), port);
        let ipv6_socket_addr = SocketAddr::new(Ipv6Addr::UNSPECIFIED.into(), port);

        let (stop_tx, stop_rx) = oneshot::channel::<()>();

        tokio::spawn(async move {
            tokio::select! {
                result = start_server_with_addr(ipv4_socket_addr, tls_config.clone()) => {
                    tracing::info!("Server stopped on: {}, {:?}", ipv4_socket_addr, result);
                }
                _ = async {
                    if start_server_with_addr(ipv6_socket_addr, tls_config).await.is_err() {
                        tracing::warn!("Failed to start server on: {}", ipv6_socket_addr);

                        // Keep the future running forever so we continue using ipv4 only.
                        tokio::time::sleep(std::time::Duration::from_secs(u64::MAX)).await;
                    }
                } => {}
                _ = stop_rx => {}
            }
        });

        Ok(LsHttpServer {
            stop_tx: Arc::new(Mutex::new(Some(stop_tx))),
        })
    }

    pub async fn stop(&self) -> anyhow::Result<()> {
        let mut stop_tx = self.stop_tx.lock().await;

        if let Some(stop_tx) = stop_tx.take() {
            stop_tx
                .send(())
                .map_err(|_| anyhow::anyhow!("Failed to send stop signal"))?;
        }

        Ok(())
    }
}

#[derive(Clone, Debug)]
pub struct TlsConfig {
    pub cert: String,
    pub private_key: String,
}

async fn start_server_with_addr(
    socket_addr: SocketAddr,
    tls_config: Option<TlsConfig>,
) -> anyhow::Result<()> {
    let _ = rustls::crypto::ring::default_provider().install_default();

    let incoming = tokio::net::TcpListener::bind(socket_addr).await?;

    let tls_acceptor = match tls_config {
        Some(tls_config) => Some(create_tls_config(&tls_config).inspect_err(|err| {
            tracing::error!("failed to create tls config: {err:#}");
        })?),
        None => None,
    };

    tracing::info!(
        "Started server on {} (TLS: {})",
        socket_addr,
        tls_acceptor.is_some()
    );

    loop {
        let (tcp_stream, _remote_addr) = incoming.accept().await?;

        let tls_acceptor = tls_acceptor.clone();
        tokio::spawn(async move {
            let res = match tls_acceptor {
                Some(tls_acceptor) => {
                    let tls_stream = match tls_acceptor.accept(tcp_stream).await {
                        Ok(tls_stream) => tls_stream,
                        Err(err) => {
                            tracing::warn!("TLS handshake error: {err:#}");
                            return;
                        }
                    };

                    let client_cert = {
                        let (_, server_connection) = tls_stream.get_ref();
                        ClientCertExt {
                            cert: server_connection
                                .deref()
                                .deref()
                                .peer_certificates()
                                .map(|cert| cert.get(0).unwrap().to_vec()),
                        }
                    };

                    Builder::new(TokioExecutor::new())
                        .serve_connection(
                            TokioIo::new(tls_stream),
                            hyper::service::service_fn(move |mut req: Request<Incoming>| {
                                req.extensions_mut()
                                    .insert::<ClientCertExt>(client_cert.clone());
                                echo(req)
                            }),
                        )
                        .await
                }
                None => {
                    Builder::new(TokioExecutor::new())
                        .serve_connection(
                            TokioIo::new(tcp_stream),
                            hyper::service::service_fn(move |req: Request<Incoming>| echo(req)),
                        )
                        .await
                }
            };

            if let Err(err) = res {
                tracing::warn!("Failed to serve connection: {err:#}");
            }
        });
    }
}

fn create_tls_config(tls_config: &TlsConfig) -> anyhow::Result<tokio_rustls::TlsAcceptor> {
    let config = {
        let certs = vec![CertificateDer::from_pem_slice(&tls_config.cert.as_bytes())?];
        let key = PrivateKeyDer::from_pem_slice(&tls_config.private_key.as_bytes())?;

        rustls::ServerConfig::builder()
            .with_client_cert_verifier(Arc::new(CustomClientCertVerifier::try_new(
                &tls_config.cert,
            )?))
            .with_single_cert(certs, key)?
    };
    Ok(tokio_rustls::TlsAcceptor::from(Arc::new(config)))
}

async fn echo(req: Request<Incoming>) -> Result<Response<Full<Bytes>>, hyper::Error> {
    let mut response = Response::new(Full::default());

    match (req.method(), req.uri().path()) {
        (&Method::GET, "/") => {
            let cert = req.extensions().get::<ClientCertExt>();
            println!("{:?}", cert.extract_public_key());

            *response.body_mut() = Full::from("Try POST /echo\n");
        }
        (&Method::POST, "/echo") => {
            *response.body_mut() = Full::from(req.into_body().collect().await?.to_bytes());
        }
        // Catch-all 404.
        _ => {
            *response.status_mut() = StatusCode::NOT_FOUND;
        }
    };
    Ok(response)
}

#[derive(Clone, Debug)]
struct ClientCertExt {
    /// The client certificate in DER format.
    cert: Option<Vec<u8>>,
}

trait PublicCertExt {
    fn extract_public_key(&self) -> Option<String>;
}

impl PublicCertExt for Option<&ClientCertExt> {
    fn extract_public_key(&self) -> Option<String> {
        self.as_ref()
            .map(|cert| public_key_from_cert_der(cert.cert.as_ref().unwrap()).unwrap())
    }
}

struct CustomClientCertVerifier {
    inner: Arc<dyn ClientCertVerifier>,
}

impl CustomClientCertVerifier {
    fn try_new(cert: &str) -> anyhow::Result<Self> {
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
