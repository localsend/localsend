pub mod common;
pub mod internal;
pub mod v2;
pub mod v3;
pub mod web;

use crate::crypto::cert::{fingerprint_from_cert_der, public_key_from_cert_der};
use crate::http::server::internal::{InternalConfig, InternalState};
use crate::http::server::v2::ServerEventV2;
use crate::http::server::web::WebSendConfig;
use crate::http::state::ClientInfo;
use common::client_cert_verifier::CustomClientCertVerifier;
use common::error::AppError;
use common::response;
use common::response::BoxedBody;
use common::session::SessionStateV2;
use hyper::body::Incoming;
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
use tokio::sync::{mpsc, oneshot, Mutex};
use tokio_util::sync::CancellationToken;
use tokio_util::task::TaskTracker;
use web::WebPageState;

/// Configuration for the v2 (legacy) protocol endpoints.
pub struct ServerConfigV2 {
    /// Optional PIN that senders must provide via the `pin` query parameter.
    pub pin: Option<String>,

    /// Channel on which the server emits events that must be handled by the application.
    pub event_tx: mpsc::Sender<ServerEventV2>,
}

/// Runtime state of the v2 protocol endpoints.
pub(crate) struct V2State {
    /// Optional PIN required for prepare-upload requests.
    pub(crate) pin: Option<String>,

    /// Channel on which server events are emitted to the application.
    pub(crate) event_tx: mpsc::Sender<ServerEventV2>,

    /// The single upload session slot. Only one session can be active at a time.
    pub(crate) session: Mutex<Option<SessionStateV2>>,

    /// Maps client IPs to the number of failed PIN attempts.
    pub(crate) pin_attempts: Mutex<LruCache<IpAddr, u32>>,
}

#[derive(Clone)]
pub struct AppState {
    /// Information about server's device.
    info: Arc<Mutex<ClientInfo>>,

    /// State for serving web pages.
    web: Option<Arc<WebPageState>>,

    /// State for application-internal endpoints.
    internal: Option<Arc<InternalState>>,

    /// Maps client identifiers to nonces that have been received from remote.
    received_nonce_map: Arc<Mutex<LruCache<String, Vec<u8>>>>,

    /// Maps client identifiers to nonces that are expected to be received from remote.
    generated_nonce_map: Arc<Mutex<LruCache<String, Vec<u8>>>>,

    /// State of the v2 protocol endpoints. `None` disables the v2 routes.
    v2: Option<Arc<V2State>>,
}

impl AppState {
    fn new(
        info: Arc<Mutex<ClientInfo>>,
        internal_config: Option<InternalConfig>,
        v2_config: Option<ServerConfigV2>,
        web_send_config: Option<WebSendConfig>,
    ) -> Self {
        let v2 = v2_config.map(|config| {
            Arc::new(V2State {
                pin: config.pin,
                event_tx: config.event_tx,
                session: Mutex::new(None),
                pin_attempts: Mutex::new(LruCache::new(NonZeroUsize::new(200).unwrap())),
            })
        });

        let web = web_send_config.map(|config| Arc::new(WebPageState::new(config)));
        let internal = internal_config.map(|config| Arc::new(InternalState::new(config)));

        Self {
            info,
            web,
            internal,
            received_nonce_map: Arc::new(Mutex::new(LruCache::new(
                NonZeroUsize::new(200).unwrap(),
            ))),
            generated_nonce_map: Arc::new(Mutex::new(LruCache::new(
                NonZeroUsize::new(200).unwrap(),
            ))),
            v2,
        }
    }
}

/// A handle to a running server for interactions initiated by the application
/// (as opposed to the event channels which are driven by incoming requests).
pub struct ServerHandle {
    v2: Option<Arc<V2State>>,

    /// The task running the accept loops. Completes after a stop has been
    /// requested, the listeners have been dropped and all connections have
    /// been closed.
    task: Mutex<Option<tokio::task::JoinHandle<()>>>,
}

impl ServerHandle {
    /// Waits until the server task has terminated, the listeners are closed
    /// and all connections have been dropped, so that the port can be bound again.
    /// Must be called after requesting a stop via the stop channel.
    pub async fn wait_stopped(&self) {
        if let Some(task) = self.task.lock().await.take() {
            let _ = task.await;
        }
    }

    /// Cancels the active v2 upload session if it matches `session_id`,
    /// e.g. because the user aborted the transfer on the receiving side.
    ///
    /// Uploads that are already in progress still run to completion, but new
    /// upload requests are rejected and a new session can be created.
    /// No [ServerEventV2::SessionEnd] is emitted: the application initiated
    /// the cancellation itself.
    ///
    /// Returns `true` when a session was cancelled.
    pub async fn cancel_v2_session(&self, session_id: &str) -> bool {
        let Some(v2) = &self.v2 else {
            return false;
        };
        let mut slot = v2.session.lock().await;
        match slot.as_ref() {
            Some(SessionStateV2::Active(session)) if session.session_id == session_id => {
                *slot = None;
                true
            }
            _ => false,
        }
    }
}

/// Binds the server to the specified port on both IPv4 and IPv6 addresses.
pub async fn start_with_port(
    port: u16,
    tls_config: Option<TlsConfig>,
    info: ClientInfo,
    internal_config: Option<InternalConfig>,
    v2_config: Option<ServerConfigV2>,
    web_send_config: Option<WebSendConfig>,
    stop_rx: oneshot::Receiver<()>,
) -> anyhow::Result<ServerHandle> {
    let ipv4_socket_addr = SocketAddr::new(Ipv4Addr::UNSPECIFIED.into(), port);
    let ipv6_socket_addr = SocketAddr::new(Ipv6Addr::UNSPECIFIED.into(), port);
    let info = Arc::new(Mutex::new(info));
    let state = AppState::new(info.clone(), internal_config, v2_config, web_send_config);

    let ipv4_listener = tokio::net::TcpListener::bind(ipv4_socket_addr).await?;
    let ipv6_listener = match bind_ipv6_only(ipv6_socket_addr) {
        Ok(listener) => Some(listener),
        Err(err) => {
            tracing::warn!("Failed to start server on {}: {err:#}", ipv6_socket_addr);
            None
        }
    };

    let cancel = CancellationToken::new();
    let connections = TaskTracker::new();

    let task = tokio::spawn({
        let state = state.clone();
        let cancel = cancel.clone();
        let connections = connections.clone();
        async move {
            tokio::select! {
                _ = start_server_with_listener(ipv4_listener, tls_config.clone(), state.clone(), cancel.clone(), connections.clone()) => {
                    tracing::info!("Server stopped on: {}", ipv4_socket_addr);
                }
                _ = async {
                    if let Some(listener) = ipv6_listener {
                        let _ = start_server_with_listener(listener, tls_config, state, cancel.clone(), connections.clone()).await;
                    }

                    // Keep the future running forever, so we continue using "ipv4 only" even if ipv6 fails.
                    tokio::time::sleep(std::time::Duration::from_secs(u64::MAX)).await;
                } => {}
                _ = stop_rx => {}
            }

            // Hard-drop connections that are still being served, so that no
            // client keeps talking to the stopped server.
            cancel.cancel();
            connections.close();
            connections.wait().await;
        }
    });

    Ok(ServerHandle {
        v2: state.v2.clone(),
        task: Mutex::new(Some(task)),
    })
}

/// Binds an IPv6 listener with `IPV6_V6ONLY` enabled.
///
/// Without this flag, some systems (e.g. macOS) bind IPv6 wildcard sockets in
/// dual-stack mode, which conflicts with the separate IPv4 listener on the same port.
fn bind_ipv6_only(socket_addr: SocketAddr) -> anyhow::Result<tokio::net::TcpListener> {
    let socket = socket2::Socket::new(
        socket2::Domain::IPV6,
        socket2::Type::STREAM,
        Some(socket2::Protocol::TCP),
    )?;
    socket.set_only_v6(true)?;
    #[cfg(not(windows))]
    socket.set_reuse_address(true)?;
    socket.set_nonblocking(true)?;
    socket.bind(&socket_addr.into())?;
    socket.listen(1024)?;
    Ok(tokio::net::TcpListener::from_std(socket.into())?)
}

#[derive(Clone, Debug)]
pub struct TlsConfig {
    pub cert: String,
    pub private_key: String,
}

async fn start_server_with_listener(
    incoming: tokio::net::TcpListener,
    tls_config: Option<TlsConfig>,
    app_state: AppState,
    cancel: CancellationToken,
    connections: TaskTracker,
) -> anyhow::Result<()> {
    let _ = rustls::crypto::ring::default_provider().install_default();

    let tls_acceptor = match tls_config {
        Some(tls_config) => Some(create_tls_config(&tls_config).inspect_err(|err| {
            tracing::error!("failed to create tls config: {err:#}");
        })?),
        None => None,
    };

    tracing::info!(
        "Started server on {} (TLS: {})",
        incoming.local_addr()?,
        tls_acceptor.is_some()
    );

    loop {
        let (tcp_stream, remote_addr) = incoming.accept().await?;

        let tls_acceptor = tls_acceptor.clone();
        let app_state = app_state.clone();
        let cancel = cancel.clone();
        connections.spawn(async move {
            let serve = serve_connection(tcp_stream, remote_addr, tls_acceptor, app_state);
            tokio::select! {
                _ = serve => {}
                // Hard-drop the connection when the server is stopped.
                _ = cancel.cancelled() => {}
            }
        });
    }
}

async fn serve_connection(
    tcp_stream: tokio::net::TcpStream,
    remote_addr: SocketAddr,
    tls_acceptor: Option<tokio_rustls::TlsAcceptor>,
    app_state: AppState,
) {
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
                RequestClientInfo {
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
                            .insert::<RequestClientInfo>(client_info.clone());
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
                        req.extensions_mut()
                            .insert::<RequestClientInfo>(RequestClientInfo {
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
pub struct RequestClientInfo {
    /// The IP address of the client.
    ip: IpAddr,

    /// The client certificate in DER format.
    cert: Option<Vec<u8>>,
}

impl RequestClientInfo {
    /// The SHA-256 fingerprint (uppercase hex) of the client certificate
    /// verified during the mTLS handshake.
    /// `None` when the server runs without TLS.
    fn cert_fingerprint(&self) -> Option<String> {
        self.cert.as_deref().map(fingerprint_from_cert_der)
    }

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

    fn identifier(&self) -> String {
        self.extract_public_key()
            .unwrap_or_else(|| self.ip.to_string())
    }
}

async fn handle_request(req: Request<Incoming>) -> Result<Response<BoxedBody>, hyper::Error> {
    Ok(handle_request_inner(req).await.unwrap_or_else(|err| {
        tracing::error!("Error handling request: {err:?}");
        err.to_response()
    }))
}

async fn handle_request_inner(mut req: Request<Incoming>) -> Result<Response<BoxedBody>, AppError> {
    let Some(state) = req.extensions_mut().remove::<AppState>() else {
        return Err(AppError::Status(StatusCode::INTERNAL_SERVER_ERROR));
    };

    let Some(client_info) = req.extensions_mut().remove::<RequestClientInfo>() else {
        return Err(AppError::Status(StatusCode::INTERNAL_SERVER_ERROR));
    };

    let v2_enabled = state.v2.is_some();

    match (req.method(), req.uri().path()) {
        (&Method::GET, "/") => Ok(web::index(&state)),
        (&Method::GET, "/main.js") => Ok(web::main_js(&state)),
        (&Method::GET, "/i18n.json") => web::i18n(&state),
        (&Method::POST, "/api/localsend/v2/prepare-download") => {
            web::prepare_download(req, state, client_info).await
        }
        (&Method::GET, "/api/localsend/v2/download") => {
            web::download(req, state, client_info).await
        }
        (&Method::POST, "/api/localsend/v2/register") => {
            if !v2_enabled {
                return Err(AppError::Status(StatusCode::NOT_FOUND));
            }

            Ok(v2::register(req.into_body(), state, client_info)
                .await?
                .into_response())
        }
        (&Method::GET, "/api/localsend/v2/info") => {
            if !v2_enabled {
                return Err(AppError::Status(StatusCode::NOT_FOUND));
            }

            Ok(v2::info(state).await?.into_response())
        }
        (&Method::POST, "/api/localsend/v2/prepare-upload") => {
            if !v2_enabled {
                return Err(AppError::Status(StatusCode::NOT_FOUND));
            }

            v2::prepare_upload(req, state, client_info).await
        }
        (&Method::POST, "/api/localsend/v2/upload") => {
            if !v2_enabled {
                return Err(AppError::Status(StatusCode::NOT_FOUND));
            }

            v2::upload(req, state, client_info).await
        }
        (&Method::POST, "/api/localsend/v2/cancel") => {
            if !v2_enabled {
                return Err(AppError::Status(StatusCode::NOT_FOUND));
            }

            v2::cancel(req, state, client_info).await
        }
        // The versioned path is retained for compatibility, but this endpoint is internal.
        (&Method::POST, "/api/localsend/v2/show") => internal::show(req, state).await,
        (&Method::POST, "/api/localsend/v3/nonce") => {
            Ok(v3::nonce_exchange(req.into_body(), state, client_info)
                .await?
                .into_response())
        }
        (&Method::POST, "/api/localsend/v3/register") => {
            Ok(v3::register(req.into_body(), state, client_info)
                .await?
                .into_response())
        }
        _ => {
            let mut res = Response::new(response::empty_body());
            *res.status_mut() = StatusCode::NOT_FOUND;
            Ok(res)
        }
    }
}
