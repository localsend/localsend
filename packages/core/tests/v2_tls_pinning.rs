#![cfg(feature = "http")]

//! Verifies that the client authenticates the peer certificate during the TLS
//! handshake, i.e. before any request data is written.

use bytes::Bytes;
use futures_util::StreamExt;
use localsend::http::client::{ClientError, LsHttpClientV2};
use localsend::http::dto_v2::{PrepareUploadRequestDtoV2, RegisterDtoV2};
use localsend::http::server::common::save::FileUploadTarget;
use localsend::http::server::v2::{PrepareUploadDecisionV2, ServerEventV2};
use localsend::http::server::web::{WebConfig, WebMode};
use localsend::http::server::{start_with_port, ServerConfigV2, TlsConfig};
use localsend::http::state::ClientInfo;
use localsend::model::discovery::ProtocolType;
use localsend::model::transfer::FileDto;
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::Arc;
use tokio::sync::{mpsc, oneshot, Mutex};
use tokio_stream::wrappers::ReceiverStream;
use tokio_util::sync::CancellationToken;

/// A generated self-signed certificate, as LocalSend peers use them.
struct Identity {
    cert: String,
    private_key: String,
    /// Uppercase-hex SHA-256 of the certificate in DER format.
    fingerprint: String,
}

fn generate_identity() -> Identity {
    let cert = localsend::crypto::cert::generate_self_signed().unwrap();

    Identity {
        cert: cert.certificate_pem,
        private_key: cert.private_key_pem,
        fingerprint: cert.fingerprint,
    }
}

struct TestServer {
    port: u16,
    /// Requests that reached the application layer.
    prepare_uploads: Arc<Mutex<Vec<String>>>,
    /// The `sender_fingerprint` of every `PrepareUpload` event.
    sender_fingerprints: Arc<Mutex<Vec<Option<String>>>>,
    /// The claimed fingerprint of every `Register` event.
    registers: Arc<Mutex<Vec<String>>>,
    /// Uploaded file contents, mapped by file ID.
    received: Arc<Mutex<Vec<(String, Vec<u8>)>>>,
    _stop_tx: oneshot::Sender<()>,
}

/// Starts a test server over TLS using the given identity.
async fn start_tls_server(identity: &Identity) -> TestServer {
    start_tls_server_with_web(identity, WebConfig::default()).await
}

/// Starts a test server over TLS, optionally with the web pages enabled
/// (which makes the client certificate optional).
async fn start_tls_server_with_web(identity: &Identity, web: WebConfig) -> TestServer {
    let _ = tracing_subscriber::fmt().with_test_writer().try_init();
    let prepare_uploads: Arc<Mutex<Vec<String>>> = Arc::new(Mutex::new(Vec::new()));
    let sender_fingerprints: Arc<Mutex<Vec<Option<String>>>> = Arc::new(Mutex::new(Vec::new()));
    let registers: Arc<Mutex<Vec<String>>> = Arc::new(Mutex::new(Vec::new()));
    let received: Arc<Mutex<Vec<(String, Vec<u8>)>>> = Arc::new(Mutex::new(Vec::new()));

    let (event_tx, mut event_rx) = mpsc::channel::<ServerEventV2>(16);

    tokio::spawn({
        let prepare_uploads = prepare_uploads.clone();
        let sender_fingerprints = sender_fingerprints.clone();
        let registers = registers.clone();
        let received = received.clone();
        async move {
            while let Some(event) = event_rx.recv().await {
                match event {
                    ServerEventV2::Register { info, .. } => {
                        registers.lock().await.push(info.fingerprint);
                    }
                    ServerEventV2::PrepareUpload {
                        sender_fingerprint,
                        files,
                        decision_tx,
                        ..
                    } => {
                        sender_fingerprints.lock().await.push(sender_fingerprint);
                        prepare_uploads
                            .lock()
                            .await
                            .extend(files.keys().cloned().collect::<Vec<_>>());
                        let _ = decision_tx.send(PrepareUploadDecisionV2::Accept(
                            files.keys().cloned().collect(),
                        ));
                    }
                    ServerEventV2::FileUpload {
                        file_id, target_tx, ..
                    } => {
                        let received = received.clone();
                        let (binary_tx, mut binary_rx) = mpsc::channel(16);
                        let (result_tx, result_rx) = oneshot::channel();
                        let _ = target_tx.send(FileUploadTarget::Stream {
                            binary_tx,
                            result_rx,
                        });
                        tokio::spawn(async move {
                            let mut bytes = Vec::new();
                            while let Some(chunk) = binary_rx.recv().await {
                                bytes.extend_from_slice(&chunk);
                            }
                            received.lock().await.push((file_id, bytes));
                            let _ = result_tx.send(Ok(()));
                        });
                    }
                    _ => {}
                }
            }
        }
    });

    let (stop_tx, stop_rx) = oneshot::channel::<()>();

    // Port 0 lets the OS pick a free port, avoiding collisions between tests.
    let handle = start_with_port(
        0,
        Some(TlsConfig {
            cert: identity.cert.clone(),
            private_key: identity.private_key.clone(),
        }),
        ClientInfo {
            alias: "Test Server".to_string(),
            version: "2.2".to_string(),
            device_model: Some("Rust".to_string()),
            device_type: None,
            token: identity.fingerprint.clone(),
        },
        None,
        Some(ServerConfigV2 {
            pin: None,
            verify_checksums: true,
            event_tx,
        }),
        web,
        stop_rx,
    )
    .await
    .expect("Failed to start server");

    TestServer {
        port: handle.port(),
        prepare_uploads,
        sender_fingerprints,
        registers,
        received,
        _stop_tx: stop_tx,
    }
}

fn client(sender: &Identity, expected_fingerprint: Option<&str>) -> LsHttpClientV2 {
    LsHttpClientV2::try_new(
        &sender.private_key,
        &sender.cert,
        expected_fingerprint.map(|f| f.to_string()),
        None,
    )
    .unwrap()
}

fn sender_info(fingerprint: &str) -> RegisterDtoV2 {
    RegisterDtoV2 {
        alias: "Test Sender".to_string(),
        version: "2.2".to_string(),
        device_model: Some("Rust".to_string()),
        device_type: None,
        fingerprint: fingerprint.to_string(),
        port: 53317,
        protocol: ProtocolType::Https,
        download: false,
    }
}

fn file_dto(id: &str, size: u64) -> FileDto {
    FileDto {
        id: id.to_string(),
        file_name: format!("{id}.bin"),
        size,
        file_type: "application/octet-stream".to_string(),
        sha256: None,
        preview: None,
        metadata: None,
    }
}

fn prepare_upload_request(sender: &Identity, files: &[FileDto]) -> PrepareUploadRequestDtoV2 {
    PrepareUploadRequestDtoV2 {
        info: sender_info(&sender.fingerprint),
        files: files
            .iter()
            .map(|file| (file.id.clone(), file.clone()))
            .collect(),
    }
}

/// Uploads `bytes` and returns how many bytes were actually read from the
/// source stream, so a test can assert that nothing left the machine.
async fn upload_bytes(
    client: &LsHttpClientV2,
    port: u16,
    session_id: &str,
    file_id: &str,
    token: &str,
    bytes: &[u8],
) -> (Result<(), ClientError>, u64) {
    let (tx, rx) = mpsc::channel::<Bytes>(4);
    let chunks: Vec<Vec<u8>> = bytes.chunks(1024).map(|chunk| chunk.to_vec()).collect();
    tokio::spawn(async move {
        for chunk in chunks {
            if tx.send(Bytes::from(chunk)).await.is_err() {
                break;
            }
        }
    });

    let sent = Arc::new(AtomicU64::new(0));
    let progress = sent.clone();
    let body =
        localsend::reqwest::Body::wrap_stream(ReceiverStream::new(rx).map(move |chunk: Bytes| {
            progress.fetch_add(chunk.len() as u64, Ordering::Relaxed);
            Ok::<Bytes, std::io::Error>(chunk)
        }));

    let result = client
        .upload(
            ProtocolType::Https,
            "127.0.0.1",
            port,
            None,
            session_id,
            file_id,
            token,
            body,
            CancellationToken::new(),
        )
        .await;

    (result, sent.load(Ordering::Relaxed))
}

/// The happy path: the pinned fingerprint matches, so the transfer works.
/// This also covers that mTLS still functions with the hand-built TLS config.
#[tokio::test]
async fn test_transfer_with_matching_fingerprint() {
    let server_identity = generate_identity();
    let sender = generate_identity();
    let server = start_tls_server(&server_identity).await;
    let client = client(&sender, Some(&server_identity.fingerprint));

    let content = b"hello localsend".repeat(100);
    let files = vec![file_dto("file-1", content.len() as u64)];

    let result = client
        .prepare_upload(
            ProtocolType::Https,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&sender, &files),
            None,
            CancellationToken::new(),
        )
        .await
        .expect("prepare-upload should succeed");

    let response = result.response.expect("expected a session");
    let token = response.files.get("file-1").unwrap();

    let (upload_result, sent) = upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-1",
        token,
        &content,
    )
    .await;

    upload_result.expect("upload should succeed");
    assert_eq!(sent, content.len() as u64);

    let received = server.received.lock().await;
    assert_eq!(received.len(), 1);
    assert_eq!(received[0].1, content);

    // The sender is identified by its client certificate.
    assert_eq!(
        *server.sender_fingerprints.lock().await,
        vec![Some(sender.fingerprint.clone())]
    );
}

/// The peer presents a valid self-signed certificate, but not the one that was
/// discovered. The handshake must fail, and the request must never reach the
/// application layer of the impostor.
#[tokio::test]
async fn test_prepare_upload_rejected_on_fingerprint_mismatch() {
    let server_identity = generate_identity();
    let sender = generate_identity();
    let server = start_tls_server(&server_identity).await;

    // Pin some other device, e.g. the one the user actually picked.
    let expected = generate_identity();
    let client = client(&sender, Some(&expected.fingerprint));

    let files = vec![file_dto("file-1", 10)];
    let result = client
        .prepare_upload(
            ProtocolType::Https,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&sender, &files),
            None,
            CancellationToken::new(),
        )
        .await;

    // A transport error, not a status code: the peer never got to answer.
    assert!(
        matches!(result, Err(ClientError::Reqwest(_))),
        "expected the handshake to fail, got {:?}",
        result.err()
    );

    // The decisive assertion: the request body never reached the peer.
    assert!(
        server.prepare_uploads.lock().await.is_empty(),
        "the impostor must not receive the file metadata"
    );
}

/// The file content must not be streamed to a peer that fails the pin check.
#[tokio::test]
async fn test_upload_body_not_sent_on_fingerprint_mismatch() {
    let server_identity = generate_identity();
    let sender = generate_identity();
    let server = start_tls_server(&server_identity).await;

    let expected = generate_identity();
    let client = client(&sender, Some(&expected.fingerprint));

    let content = b"secret".repeat(10_000);
    let (result, sent) = upload_bytes(
        &client,
        server.port,
        "some-session",
        "file-1",
        "some-token",
        &content,
    )
    .await;

    assert!(
        matches!(result, Err(ClientError::Reqwest(_))),
        "expected the handshake to fail, got {:?}",
        result.err()
    );
    assert_eq!(sent, 0, "no file content may be read or sent");
    assert!(server.received.lock().await.is_empty());
}

/// Without the web pages, the client certificate stays mandatory: a client
/// without one (e.g. a browser) must fail the handshake.
#[tokio::test]
async fn test_client_without_cert_rejected() {
    let server_identity = generate_identity();
    let server = start_tls_server(&server_identity).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let result = client
        .info(ProtocolType::Https, "127.0.0.1", server.port)
        .await;

    assert!(
        matches!(result, Err(ClientError::Reqwest(_))),
        "expected the handshake to fail, got {:?}",
        result.err()
    );
}

/// With the web pages served, the client certificate is optional so that
/// browsers can connect; a presented certificate is still verified (mTLS
/// clients keep working).
#[tokio::test]
async fn test_client_without_cert_allowed_in_web_mode() {
    let server_identity = generate_identity();
    let sender = generate_identity();
    let server = start_tls_server_with_web(
        &server_identity,
        WebConfig {
            mode: WebMode::Upload,
            ..WebConfig::default()
        },
    )
    .await;

    // A browser-like client: no client certificate, self-signed server cert accepted.
    let browser = localsend::reqwest::Client::builder()
        .use_rustls_tls()
        .danger_accept_invalid_certs(true)
        .build()
        .unwrap();
    let response = browser
        .get(format!("https://127.0.0.1:{}/", server.port))
        .send()
        .await
        .expect("browser without client certificate should be able to connect");
    assert_eq!(response.status().as_u16(), 200);
    assert!(response.text().await.unwrap().contains("prepare-upload"));

    // A LocalSend peer still authenticates with its certificate.
    let client = client(&sender, Some(&server_identity.fingerprint));
    let response = client
        .register(
            ProtocolType::Https,
            "127.0.0.1",
            server.port,
            sender_info(&sender.fingerprint),
        )
        .await
        .expect("register with client certificate should succeed");
    assert!(response.public_key.is_some());
}

/// Discovery has no fingerprint to pin yet, so any valid certificate is
/// accepted and the public key is read from the response.
#[tokio::test]
async fn test_register_without_pin_returns_public_key() {
    let server_identity = generate_identity();
    let sender = generate_identity();
    let server = start_tls_server(&server_identity).await;
    let client = client(&sender, None);

    let response = client
        .register(
            ProtocolType::Https,
            "127.0.0.1",
            server.port,
            sender_info(&sender.fingerprint),
        )
        .await
        .expect("register should succeed");

    assert!(response.public_key.is_some());
    assert_eq!(response.body.fingerprint, server_identity.fingerprint);
}

/// A browser-like client without a client certificate while the web pages are
/// served. It must not be able to pass itself off as a known device by
/// claiming that device's fingerprint (GHSA-hxmj-fjxh-v795).
#[tokio::test]
async fn test_client_without_cert_cannot_claim_fingerprint() {
    let server_identity = generate_identity();
    let favorite = generate_identity();
    let server = start_tls_server_with_web(
        &server_identity,
        WebConfig {
            mode: WebMode::Upload,
            ..WebConfig::default()
        },
    )
    .await;

    let attacker = localsend::reqwest::Client::builder()
        .use_rustls_tls()
        .danger_accept_invalid_certs(true)
        .build()
        .unwrap();
    let base = format!("https://127.0.0.1:{}/api/localsend/v2", server.port);

    // A register claiming the favorite's fingerprint is answered, but ignored.
    let response = attacker
        .post(format!("{base}/register"))
        .body(serde_json::to_string(&sender_info(&favorite.fingerprint)).unwrap())
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 200);

    // Register events are delivered in order: once the authenticated one
    // arrives, the anonymous one would have arrived before it.
    let peer = generate_identity();
    client(&peer, Some(&server_identity.fingerprint))
        .register(
            ProtocolType::Https,
            "127.0.0.1",
            server.port,
            sender_info(&peer.fingerprint),
        )
        .await
        .expect("register with client certificate should succeed");
    tokio::time::timeout(std::time::Duration::from_secs(5), async {
        while server.registers.lock().await.is_empty() {
            tokio::time::sleep(std::time::Duration::from_millis(10)).await;
        }
    })
    .await
    .expect("the authenticated register should arrive");
    assert_eq!(*server.registers.lock().await, vec![peer.fingerprint.clone()]);

    // A prepare-upload still reaches the application (browsers upload this
    // way), but as an anonymous sender, not as the claimed favorite.
    let files = vec![file_dto("file-1", 10)];
    let response = attacker
        .post(format!("{base}/prepare-upload"))
        .body(serde_json::to_string(&prepare_upload_request(&favorite, &files)).unwrap())
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 200);
    assert_eq!(*server.sender_fingerprints.lock().await, vec![None]);
}

/// A sender with a valid client certificate that claims another device's
/// fingerprint in its payload: the claim is disproven by the certificate, so
/// the request is rejected instead of passing `info` on as that device.
#[tokio::test]
async fn test_prepare_upload_rejected_when_claim_disagrees_with_cert() {
    let server_identity = generate_identity();
    let sender = generate_identity();
    let impersonated = generate_identity();
    let server = start_tls_server(&server_identity).await;
    let client = client(&sender, Some(&server_identity.fingerprint));

    let files = vec![file_dto("file-1", 10)];
    let result = client
        .prepare_upload(
            ProtocolType::Https,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&impersonated, &files),
            None,
            CancellationToken::new(),
        )
        .await;

    match result {
        Err(ClientError::StatusCode(err)) => assert_eq!(err.status, 403),
        Err(err) => panic!("expected 403, got {err:?}"),
        Ok(_) => panic!("expected 403, got success"),
    }
    assert!(server.prepare_uploads.lock().await.is_empty());

    // The claim is compared case-insensitively.
    let mut request = prepare_upload_request(&sender, &files);
    request.info.fingerprint = sender.fingerprint.to_lowercase();
    client
        .prepare_upload(
            ProtocolType::Https,
            "127.0.0.1",
            server.port,
            None,
            request,
            None,
            CancellationToken::new(),
        )
        .await
        .expect("a lowercase claim of the own fingerprint should be accepted");
}
