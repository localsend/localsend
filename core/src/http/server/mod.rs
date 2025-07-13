mod client_cert_verifier;

use crate::crypto::cert::public_key_from_cert_der;
use crate::http::server::client_cert_verifier::CustomClientCertVerifier;
use bytes::Bytes;
use http_body_util::{BodyExt, Full};
use hyper::body::{Body, Incoming};
use hyper::{Method, Request, Response, StatusCode};
use hyper_util::rt::{TokioExecutor, TokioIo};
use hyper_util::server::conn::auto::Builder;
use lru::LruCache;
use rustls::pki_types::pem::PemObject;
use rustls::pki_types::{CertificateDer, PrivateKeyDer};
use std::fmt::Debug;
use std::net::{IpAddr, Ipv4Addr, Ipv6Addr, SocketAddr};
use std::num::NonZeroUsize;
use std::ops::Deref;
use std::sync::Arc;
use serde::{Deserialize, Serialize};
use tokio::sync::{oneshot, Mutex};
use uuid::Uuid;
use crate::http::dto::NonceRequest;

#[derive(Clone)]
struct AppState {
    local_nonce_map: Arc<Mutex<LruCache<String, Vec<u8>>>>,
    remote_nonce_map: Arc<Mutex<LruCache<String, Vec<u8>>>>,
}

impl AppState {
    fn new() -> Self {
        Self {
            local_nonce_map: Arc::new(Mutex::new(LruCache::new(NonZeroUsize::new(200).unwrap()))),
            remote_nonce_map: Arc::new(Mutex::new(LruCache::new(NonZeroUsize::new(200).unwrap()))),
        }
    }
}

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

                        // Keep the future running forever, so we continue using ipv4 only even if ipv6 fails.
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
    let app_state = AppState::new();

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
        let (tcp_stream, remote_addr) = incoming.accept().await?;

        let tls_acceptor = tls_acceptor.clone();
        let app_state = app_state.clone();
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

                    let client_info = {
                        let (_, server_connection) = tls_stream.get_ref();
                        ClientInfo {
                            ip: remote_addr.ip(),
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
                                    .insert::<ClientInfo>(client_info.clone());
                                req.extensions_mut().insert::<AppState>(app_state.clone());
                                handle_request(req)
                            }),
                        )
                        .await
                }
                None => {
                    Builder::new(TokioExecutor::new())
                        .serve_connection(
                            TokioIo::new(tcp_stream),
                            hyper::service::service_fn(move |mut req: Request<Incoming>| {
                                req.extensions_mut().insert::<ClientInfo>(ClientInfo {
                                    ip: remote_addr.ip(),
                                    cert: None,
                                });
                                req.extensions_mut().insert::<AppState>(app_state.clone());
                                handle_request(req)
                            }),
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

#[derive(Clone, Debug)]
struct ClientInfo {
    /// The IP address of the client.
    ip: IpAddr,

    /// The client certificate in DER format.
    cert: Option<Vec<u8>>,
}

trait PublicCertExt {
    fn extract_public_key(&self) -> Option<String>;
}

impl PublicCertExt for &ClientInfo {
    fn extract_public_key(&self) -> Option<String> {
        match &self.cert {
            Some(cert) => match public_key_from_cert_der(cert) {
                Ok(public_key) => Some(public_key),
                Err(err) => {
                    tracing::warn!("Failed to extract public key from certificate: {err:#}");
                    None
                }
            },
            None => None,
        }
    }
}

fn build_response(
    status: StatusCode,
    body: Option<serde_json::Value>,
) -> Result<Response<Full<Bytes>>, hyper::Error> {
    let mut response = Response::new(Full::default());
    *response.status_mut() = status;

    if let Some(body) = body {
        *response.body_mut() = Full::from(Bytes::from(serde_json::to_string(&body).unwrap_or_else(|_| "{}".to_string())));
    }

    Ok(response)
}

async fn handle_request(mut req: Request<Incoming>) -> Result<Response<Full<Bytes>>, hyper::Error> {
    let Some(state) = req.extensions_mut().remove::<AppState>() else {
        return build_response(StatusCode::INTERNAL_SERVER_ERROR, None);
    };

    let Some(client_info) = req.extensions_mut().remove::<ClientInfo>() else {
        return build_response(StatusCode::INTERNAL_SERVER_ERROR, None);
    };

    match (req.method(), req.uri().path()) {
        (&Method::POST, "/api/localsend/v3/nonce") => {
            nonce_exchange(req.into_body(), state, client_info).await
        }
        _ => {
            let mut res = Response::new(Full::default());
            *res.status_mut() = StatusCode::NOT_FOUND;
            Ok(res)
        }
    }
}

async fn nonce_exchange(
    body: Incoming,
    state: AppState,
    client_info: ClientInfo,
) -> Result<Response<Full<Bytes>>, hyper::Error> {
    let bytes = body.collect().await?.to_bytes();
    let request = match serde_json::from_slice::<NonceRequest>(&bytes) {
        Ok(json) => json,
        Err(err) => {
            tracing::warn!("Failed to parse JSON body: {err:#}");
            return build_response(StatusCode::BAD_REQUEST, Some(serde_json::json!({
                "message": "Invalid JSON body"
            })));
        }
    };
    Ok(Response::new(Full::from(
        "Nonce exchange successful".to_string(),
    )))
}
