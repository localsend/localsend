#![cfg(feature = "http")]

use bytes::Bytes;
use futures_util::StreamExt;
use localsend::http::client::{ClientError, LsHttpClientV2};
use localsend::http::dto::ProtocolType;
use localsend::http::dto_v2::{PrepareUploadRequestDtoV2, ProtocolTypeV2, RegisterDtoV2};
use localsend::http::server::common::save::FileUploadTarget;
use localsend::http::server::v2::{PrepareUploadDecisionV2, ServerEventV2, SessionEndReasonV2};
use localsend::http::server::{start_with_port, ServerConfigV2};
use localsend::http::state::ClientInfo;
use localsend::model::transfer::FileDto;
use std::collections::HashMap;
use std::path::PathBuf;
use std::sync::atomic::{AtomicU16, AtomicU64, Ordering};
use std::sync::Arc;
use std::time::Duration;
use tokio::sync::{mpsc, oneshot, Mutex};
use tokio_stream::wrappers::ReceiverStream;
use tokio_util::sync::CancellationToken;

struct TestServer {
    port: u16,
    /// Uploaded file contents, mapped by file ID.
    received: Arc<Mutex<HashMap<String, Vec<u8>>>>,
    /// Ended sessions with their reasons.
    session_ends: Arc<Mutex<Vec<(String, SessionEndReasonV2)>>>,
    _stop_tx: oneshot::Sender<()>,
}

/// Starts a test server.
///
/// Uploads are received as a stream, or written by the server into `save_dir`
/// when given. Either way, the content ends up in [`TestServer::received`].
async fn start_test_server(
    pin: Option<String>,
    accept: bool,
    save_dir: Option<PathBuf>,
) -> TestServer {
    let _ = tracing_subscriber::fmt().with_test_writer().try_init();
    let port = free_port();
    let received: Arc<Mutex<HashMap<String, Vec<u8>>>> = Arc::new(Mutex::new(HashMap::new()));
    let session_ends: Arc<Mutex<Vec<(String, SessionEndReasonV2)>>> =
        Arc::new(Mutex::new(Vec::new()));

    let (event_tx, mut event_rx) = mpsc::channel::<ServerEventV2>(16);

    tokio::spawn({
        let received = received.clone();
        let session_ends = session_ends.clone();
        async move {
            while let Some(event) = event_rx.recv().await {
                match event {
                    ServerEventV2::Register { .. } => {}
                    ServerEventV2::PrepareUpload {
                        files, decision_tx, ..
                    } => {
                        let decision = match accept {
                            true => {
                                PrepareUploadDecisionV2::Accept(files.keys().cloned().collect())
                            }
                            false => PrepareUploadDecisionV2::Decline,
                        };
                        let _ = decision_tx.send(decision);
                    }
                    ServerEventV2::FileUpload {
                        file_id, target_tx, ..
                    } => {
                        let received = received.clone();
                        match &save_dir {
                            None => {
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
                                    received.lock().await.insert(file_id, bytes);
                                    let _ = result_tx.send(Ok(()));
                                });
                            }
                            Some(dir) => {
                                let path = dir.join(&file_id);
                                let (result_tx, result_rx) = oneshot::channel();
                                let _ = target_tx.send(FileUploadTarget::Path {
                                    path: path.clone(),
                                    result_tx,
                                    progress_tx: None,
                                });
                                tokio::spawn(async move {
                                    if let Ok(Ok(())) = result_rx.await {
                                        let bytes = tokio::fs::read(&path).await.unwrap();
                                        received.lock().await.insert(file_id, bytes);
                                    }
                                });
                            }
                        }
                    }
                    ServerEventV2::SessionEnd { session_id, reason } => {
                        session_ends.lock().await.push((session_id, reason));
                    }
                    ServerEventV2::PrepareUploadAborted { .. } => {}
                    ServerEventV2::CancelReceived { .. } => {}
                }
            }
        }
    });

    let (stop_tx, stop_rx) = oneshot::channel::<()>();

    start_with_port(
        port,
        None, // plain HTTP
        ClientInfo {
            alias: "Test Server".to_string(),
            version: "2.1".to_string(),
            device_model: Some("Rust".to_string()),
            device_type: None,
            token: "server-fingerprint".to_string(),
        },
        None,
        Some(ServerConfigV2 { pin, event_tx }),
        None,
        stop_rx,
    )
    .await
    .expect("Failed to start server");

    wait_until_reachable(port).await;

    TestServer {
        port,
        received,
        session_ends,
        _stop_tx: stop_tx,
    }
}

/// Returns a free port.
///
/// A counter is used instead of binding to port 0 because the OS may hand out
/// the same just-freed ephemeral port to multiple tests running in parallel.
fn free_port() -> u16 {
    static PORT_COUNTER: AtomicU16 = AtomicU16::new(40551);

    loop {
        let port = PORT_COUNTER.fetch_add(1, Ordering::SeqCst);
        if std::net::TcpListener::bind(("127.0.0.1", port)).is_ok() {
            return port;
        }
    }
}

async fn wait_until_reachable(port: u16) {
    for _ in 0..100 {
        if tokio::net::TcpStream::connect(("127.0.0.1", port))
            .await
            .is_ok()
        {
            return;
        }
        tokio::time::sleep(Duration::from_millis(20)).await;
    }
    panic!("Server did not become reachable on port {port}");
}

fn sender_info() -> RegisterDtoV2 {
    RegisterDtoV2 {
        alias: "Test Sender".to_string(),
        version: "2.1".to_string(),
        device_model: Some("Rust".to_string()),
        device_type: None,
        fingerprint: "sender-fingerprint".to_string(),
        port: 53317,
        protocol: ProtocolTypeV2::Http,
        download: false,
    }
}

fn file_dto(id: &str, name: &str, size: u64) -> FileDto {
    FileDto {
        id: id.to_string(),
        file_name: name.to_string(),
        size,
        file_type: "application/octet-stream".to_string(),
        sha256: None,
        preview: None,
        metadata: None,
    }
}

fn prepare_upload_request(files: &[FileDto]) -> PrepareUploadRequestDtoV2 {
    PrepareUploadRequestDtoV2 {
        info: sender_info(),
        files: files
            .iter()
            .map(|file| (file.id.clone(), file.clone()))
            .collect(),
    }
}

async fn upload_bytes(
    client: &LsHttpClientV2,
    port: u16,
    session_id: &str,
    file_id: &str,
    token: &str,
    bytes: &[u8],
) -> Result<(), ClientError> {
    let (tx, rx) = mpsc::channel::<Bytes>(4);
    let chunks: Vec<Vec<u8>> = bytes.chunks(1024).map(|chunk| chunk.to_vec()).collect();
    let sent = Arc::new(AtomicU64::new(0));
    tokio::spawn(async move {
        for chunk in chunks {
            if tx.send(Bytes::from(chunk)).await.is_err() {
                break;
            }
        }
    });

    // The caller now owns building the request body; track cumulative bytes
    // sent so the progress assertion below still holds.
    let progress = sent.clone();
    let body =
        localsend::reqwest::Body::wrap_stream(ReceiverStream::new(rx).map(move |chunk: Bytes| {
            progress.fetch_add(chunk.len() as u64, Ordering::Relaxed);
            Ok::<Bytes, std::io::Error>(chunk)
        }));
    let result = client
        .upload(
            ProtocolType::Http,
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

    if result.is_ok() {
        assert_eq!(sent.load(Ordering::Relaxed), bytes.len() as u64);
    }

    result
}

fn assert_status(result: Result<impl Sized, ClientError>, expected_status: u16) {
    match result {
        Err(ClientError::StatusCode(err)) => assert_eq!(err.status, expected_status),
        Err(err) => panic!("Expected status code {expected_status}, got error: {err:?}"),
        Ok(_) => panic!("Expected status code {expected_status}, got success"),
    }
}

#[tokio::test]
async fn test_register_and_info() {
    let server = start_test_server(None, true, None).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let response = client
        .register(ProtocolType::Http, "127.0.0.1", server.port, sender_info())
        .await
        .unwrap();
    assert_eq!(response.body.alias, "Test Server");
    assert_eq!(response.body.fingerprint, "server-fingerprint");
    assert!(!response.body.download);

    let info = client
        .info(ProtocolType::Http, "127.0.0.1", server.port)
        .await
        .unwrap();
    assert_eq!(info.alias, "Test Server");
    assert_eq!(info.fingerprint, "server-fingerprint");
}

#[tokio::test]
async fn test_register_over_ipv6() {
    let server = start_test_server(None, true, None).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let response = client
        .register(ProtocolType::Http, "::1", server.port, sender_info())
        .await
        .unwrap();
    assert_eq!(response.body.alias, "Test Server");
}

#[tokio::test]
async fn test_full_upload_flow() {
    let server = start_test_server(None, true, None).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let file_a = file_dto("file-a", "a.bin", 100_000);
    let file_b = file_dto("file-b", "b.bin", 5);

    let result = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file_a.clone(), file_b.clone()]),
            None,
        )
        .await
        .unwrap();

    assert_eq!(result.status_code, 200);
    let response = result.response.unwrap();
    assert_eq!(response.files.len(), 2);

    let bytes_a: Vec<u8> = (0..100_000u32).map(|i| i as u8).collect();
    let bytes_b = b"hello".to_vec();

    upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-a",
        &response.files["file-a"],
        &bytes_a,
    )
    .await
    .unwrap();

    upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-b",
        &response.files["file-b"],
        &bytes_b,
    )
    .await
    .unwrap();

    let received = server.received.lock().await;
    assert_eq!(received["file-a"], bytes_a);
    assert_eq!(received["file-b"], bytes_b);
    drop(received);

    // The session should have ended after all files were uploaded.
    tokio::time::sleep(Duration::from_millis(100)).await;
    let session_ends = server.session_ends.lock().await;
    assert_eq!(
        *session_ends,
        vec![(response.session_id.clone(), SessionEndReasonV2::Finished)]
    );

    // The session is gone, so uploading again is rejected.
    let result = upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-a",
        &response.files["file-a"],
        b"again",
    )
    .await;
    assert_status(result, 403);
}

#[tokio::test]
async fn test_upload_saved_to_path_by_server() {
    let save_dir = std::env::temp_dir().join(format!("localsend-test-{}", uuid::Uuid::new_v4()));
    tokio::fs::create_dir_all(&save_dir).await.unwrap();

    let server = start_test_server(None, true, Some(save_dir.clone())).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let file_a = file_dto("file-a", "a.bin", 100_000);
    let file_b = file_dto("file-b", "b.bin", 5);

    let result = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file_a.clone(), file_b.clone()]),
            None,
        )
        .await
        .unwrap();
    let response = result.response.unwrap();

    let bytes_a: Vec<u8> = (0..100_000u32).map(|i| i as u8).collect();
    let bytes_b = b"hello".to_vec();

    upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-a",
        &response.files["file-a"],
        &bytes_a,
    )
    .await
    .unwrap();

    upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-b",
        &response.files["file-b"],
        &bytes_b,
    )
    .await
    .unwrap();

    // The test harness reads the files back after the server reported the result.
    tokio::time::sleep(Duration::from_millis(100)).await;
    let received = server.received.lock().await;
    assert_eq!(received["file-a"], bytes_a);
    assert_eq!(received["file-b"], bytes_b);
    drop(received);

    let session_ends = server.session_ends.lock().await;
    assert_eq!(
        *session_ends,
        vec![(response.session_id.clone(), SessionEndReasonV2::Finished)]
    );

    let _ = tokio::fs::remove_dir_all(&save_dir).await;
}

#[tokio::test]
async fn test_upload_with_invalid_token() {
    let server = start_test_server(None, true, None).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let file = file_dto("file-a", "a.bin", 5);
    let response = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file]),
            None,
        )
        .await
        .unwrap()
        .response
        .unwrap();

    let result = upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-a",
        "wrong-token",
        b"hello",
    )
    .await;
    assert_status(result, 403);

    // The correct token still works afterwards.
    upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-a",
        &response.files["file-a"],
        b"hello",
    )
    .await
    .unwrap();
}

#[tokio::test]
async fn test_upload_missing_parameters() {
    let server = start_test_server(None, true, None).await;

    let response = localsend::reqwest::Client::new()
        .post(format!(
            "http://127.0.0.1:{}/api/localsend/v2/upload?sessionId=abc",
            server.port
        ))
        .body("data")
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 400);
}

#[tokio::test]
async fn test_second_session_blocked_and_cancel() {
    let server = start_test_server(None, true, None).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let file = file_dto("file-a", "a.bin", 5);
    let response = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file.clone()]),
            None,
        )
        .await
        .unwrap()
        .response
        .unwrap();

    // A second session is blocked while the first one is active.
    let result = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file.clone()]),
            None,
        )
        .await;
    assert_status(result, 409);

    client
        .cancel(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            &response.session_id,
        )
        .await
        .unwrap();

    tokio::time::sleep(Duration::from_millis(100)).await;
    let session_ends = server.session_ends.lock().await.clone();
    assert_eq!(
        session_ends,
        vec![(response.session_id.clone(), SessionEndReasonV2::Cancelled)]
    );

    // After cancelling, a new session can be created.
    client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file]),
            None,
        )
        .await
        .unwrap();
}

#[tokio::test]
async fn test_prepare_upload_declined() {
    let server = start_test_server(None, false, None).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let file = file_dto("file-a", "a.bin", 5);
    let result = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file.clone()]),
            None,
        )
        .await;
    assert_status(result, 403);

    // A declined request must not block subsequent sessions.
    let result = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file]),
            None,
        )
        .await;
    assert_status(result, 403);
}

#[tokio::test]
async fn test_pin() {
    let server = start_test_server(Some("123456".to_string()), true, None).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let file = file_dto("file-a", "a.bin", 5);

    // Missing PIN.
    let result = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file.clone()]),
            None,
        )
        .await;
    assert_status(result, 401);

    // Wrong PIN.
    let result = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file.clone()]),
            Some("000000"),
        )
        .await;
    assert_status(result, 401);

    // Correct PIN.
    client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file]),
            Some("123456"),
        )
        .await
        .unwrap();
}

#[tokio::test]
async fn test_pin_too_many_attempts() {
    let server = start_test_server(Some("123456".to_string()), true, None).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let file = file_dto("file-a", "a.bin", 5);

    for _ in 0..3 {
        let result = client
            .prepare_upload(
                ProtocolType::Http,
                "127.0.0.1",
                server.port,
                None,
                prepare_upload_request(&[file.clone()]),
                Some("000000"),
            )
            .await;
        assert_status(result, 401);
    }

    // Blocked even with the correct PIN.
    let result = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file]),
            Some("123456"),
        )
        .await;
    assert_status(result, 429);
}
