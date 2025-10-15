mod client_cert_verifier;
mod error;
mod collect_to_json;

use crate::crypto::cert::public_key_from_cert_der;
use crate::http::dto::{ErrorResponse, NonceRequest, NonceResponse, RegisterRequest, RegisterResponse};
use crate::http::server::client_cert_verifier::CustomClientCertVerifier;
use crate::http::server::error::AppError;
use crate::{crypto, util};
use bytes::Bytes;
use http_body_util::Full;
use hyper::body::{Body, Incoming};
use hyper::{http, Method, Request, Response, StatusCode};
use hyper_util::rt::{TokioExecutor, TokioIo};
use hyper_util::server::conn::auto::Builder;
use lru::LruCache;
use rustls::pki_types::pem::PemObject;
use rustls::pki_types::{CertificateDer, PrivateKeyDer};
use serde::{Deserialize, Serialize};
use std::fmt::Debug;
use std::net::{IpAddr, Ipv4Addr, Ipv6Addr, SocketAddr};
use std::num::NonZeroUsize;
use std::ops::Deref;
use std::sync::Arc;
use tokio::sync::{oneshot, Mutex};
use uuid::Uuid;
use x509_parser::nom::Parser;
use crate::http::server::collect_to_json::CollectToJson;

#[derive(Clone)]
struct AppState {
    /// Maps client identifiers to nonces that have been received from remote.
    received_nonce_map: Arc<Mutex<LruCache<String, Vec<u8>>>>,

    /// Maps client identifiers to nonces that are expected to be received from remote.
    generated_nonce_map: Arc<Mutex<LruCache<String, Vec<u8>>>>,
}

impl AppState {
    fn new() -> Self {
        Self {
            received_nonce_map: Arc::new(Mutex::new(LruCache::new(
                NonZeroUsize::new(200).unwrap(),
            ))),
            generated_nonce_map: Arc::new(Mutex::new(LruCache::new(
                NonZeroUsize::new(200).unwrap(),
            ))),
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

impl ClientInfo {
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

    fn to_remote_key(&self) -> String {
        self.extract_public_key()
            .unwrap_or_else(|| self.ip.to_string())
    }
}

async fn handle_request(req: Request<Incoming>) -> Result<Response<Full<Bytes>>, hyper::Error> {
    Ok(handle_request_inner(req).await.unwrap_or_else(|err| {
        tracing::error!("Error handling request: {err:?}");
        JsonResponse {
            status: err.status,
            body: ErrorResponse {
                message: err
                    .message
                    .unwrap_or_else(|| "Internal Server Error".to_string()),
            },
        }
        .into_response()
    }))
}

struct JsonResponse<T: Serialize> {
    status: StatusCode,
    body: T,
}

impl<T: Serialize> JsonResponse<T> {
    fn into_response(self) -> Response<Full<Bytes>> {
        let mut response = Response::new(Full::default());
        *response.status_mut() = self.status;

        response.headers_mut().insert(
            http::header::CONTENT_TYPE,
            http::HeaderValue::from_static("application/json"),
        );

        *response.body_mut() = Full::from(Bytes::from(
            serde_json::to_string(&self.body).unwrap_or_else(|_| "{}".to_string()),
        ));

        response
    }
}

async fn handle_request_inner(
    mut req: Request<Incoming>,
) -> Result<Response<Full<Bytes>>, AppError> {
    let Some(state) = req.extensions_mut().remove::<AppState>() else {
        return Err(AppError::status(StatusCode::INTERNAL_SERVER_ERROR, None));
    };

    let Some(client_info) = req.extensions_mut().remove::<ClientInfo>() else {
        return Err(AppError::status(StatusCode::INTERNAL_SERVER_ERROR, None));
    };

    match (req.method(), req.uri().path()) {
        (&Method::POST, "/api/localsend/v3/nonce") => {
            Ok(nonce_exchange(req.into_body(), state, client_info)
                .await?
                .into_response())
        }
        // (&Method::POST, "/api/localsend/v3/register") => {
        //     Ok(register(req.into_body(), state, client_info)
        //         .await?
        //         .into_response())
        // }
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
) -> Result<JsonResponse<NonceResponse>, AppError> {
    let payload = body.collect_to_json::<NonceRequest>().await?;

    let nonce = util::base64::decode(&payload.nonce).map_err(|_| {
        tracing::warn!("Failed to decode nonce from base64");
        AppError::status(
            StatusCode::BAD_REQUEST,
            Some("Invalid nonce format".to_string()),
        )
    })?;

    if !crypto::nonce::validate_nonce(&nonce) {
        tracing::warn!("Invalid nonce received");
        return Err(AppError::status(
            StatusCode::BAD_REQUEST,
            Some("Invalid nonce".to_string()),
        ));
    }

    // Save the nonce
    let remote_key = client_info.to_remote_key();
    let mut received_nonce_map = state.received_nonce_map.lock().await;
    received_nonce_map.put(remote_key.clone(), nonce);

    // Generate new nonce for the client
    let new_nonce = crypto::nonce::generate_nonce();
    let new_nonce_base64 = util::base64::encode(&new_nonce);
    let mut generated_nonce_map = state.generated_nonce_map.lock().await;
    generated_nonce_map.put(remote_key.clone(), new_nonce);

    tracing::info!(
        "Nonce exchange successful for client: {} (ID: {})",
        client_info.ip,
        remote_key
    );

    Ok(JsonResponse {
        status: StatusCode::OK,
        body: NonceResponse {
            nonce: new_nonce_base64,
        },
    })
}

// async fn register(
//     body: Incoming,
//     state: AppState,
//     client_info: ClientInfo,
// ) -> Result<JsonResponse<RegisterResponse>, AppError> {
//     let payload = body.collect_to_json::<RegisterRequest>().await?;
//
//     Ok(JsonResponse {
//         status: StatusCode::OK,
//         body: RegisterResponse {
//             token: payload.token,
//         },
//     })
// }
