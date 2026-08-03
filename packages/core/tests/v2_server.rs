#![cfg(feature = "http")]

use bytes::Bytes;
use futures_util::StreamExt;
use localsend::crypto::hash::sha256_hex;
use localsend::http::client::{ClientError, LsHttpClientV2};
use localsend::http::dto_v2::{PrepareUploadRequestDtoV2, RegisterDtoV2};
use localsend::http::server::common::save::FileUploadTarget;
use localsend::http::server::v2::{PrepareUploadDecisionV2, ServerEventV2, SessionEndReasonV2};
use localsend::http::server::{start_with_port, ServerConfigV2};
use localsend::http::state::ClientInfo;
use localsend::model::discovery::ProtocolType;
use localsend::model::transfer::{FileDto, FileMetadata};
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
    start_test_server_with_verification(pin, accept, save_dir, true).await
}

/// Like [start_test_server], but allows disabling the checksum verification.
async fn start_test_server_with_verification(
    pin: Option<String>,
    accept: bool,
    save_dir: Option<PathBuf>,
    verify_checksums: bool,
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
        Some(ServerConfigV2 {
            pin,
            verify_checksums,
            event_tx,
        }),
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
        protocol: ProtocolType::Http,
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
            CancellationToken::new(),
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

/// The sender-provided metadata timestamps are applied to the written file.
#[tokio::test]
async fn test_upload_applies_file_timestamps() {
    let save_dir = std::env::temp_dir().join(format!("localsend-test-{}", uuid::Uuid::new_v4()));
    tokio::fs::create_dir_all(&save_dir).await.unwrap();

    let server = start_test_server(None, true, Some(save_dir.clone())).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let bytes = b"hello".to_vec();
    let mut file = file_dto("file-a", "a.bin", bytes.len() as u64);
    file.metadata = Some(FileMetadata {
        modified: Some("2020-08-15T10:20:30.500Z".to_string()),
        accessed: None,
    });

    let response = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file]),
            None,
            CancellationToken::new(),
        )
        .await
        .unwrap()
        .response
        .unwrap();

    upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-a",
        &response.files["file-a"],
        &bytes,
    )
    .await
    .unwrap();

    let modified = tokio::fs::metadata(save_dir.join("file-a"))
        .await
        .unwrap()
        .modified()
        .unwrap();
    assert_eq!(
        modified,
        std::time::SystemTime::UNIX_EPOCH + Duration::from_millis(1_597_486_830_500),
    );

    tokio::fs::remove_dir_all(&save_dir).await.unwrap();
}

#[tokio::test]
async fn test_upload_with_matching_sha256() {
    let server = start_test_server(None, true, None).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let bytes = b"hello".to_vec();
    let mut file = file_dto("file-a", "a.bin", bytes.len() as u64);
    file.sha256 = Some(sha256_hex(&bytes));

    let response = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file]),
            None,
            CancellationToken::new(),
        )
        .await
        .unwrap()
        .response
        .unwrap();

    upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-a",
        &response.files["file-a"],
        &bytes,
    )
    .await
    .unwrap();

    assert_eq!(server.received.lock().await["file-a"], bytes);
}

#[tokio::test]
async fn test_upload_with_mismatched_sha256() {
    let server = start_test_server(None, true, None).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let bytes = b"hello".to_vec();
    let mut file = file_dto("file-a", "a.bin", bytes.len() as u64);
    file.sha256 = Some(sha256_hex(b"something else"));

    let response = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file]),
            None,
            CancellationToken::new(),
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
        &response.files["file-a"],
        &bytes,
    )
    .await;
    assert_status(result, 422);
}

#[tokio::test]
async fn test_upload_mismatched_sha256_with_verification_disabled() {
    let server = start_test_server_with_verification(None, true, None, false).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let bytes = b"hello".to_vec();
    let mut file = file_dto("file-a", "a.bin", bytes.len() as u64);
    file.sha256 = Some(sha256_hex(b"something else"));

    let response = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file]),
            None,
            CancellationToken::new(),
        )
        .await
        .unwrap()
        .response
        .unwrap();

    // The mismatch goes unnoticed because the received bytes are not hashed.
    upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-a",
        &response.files["file-a"],
        &bytes,
    )
    .await
    .unwrap();

    assert_eq!(server.received.lock().await["file-a"], bytes);
}

#[tokio::test]
async fn test_upload_retry_after_mismatched_sha256() {
    let server = start_test_server(None, true, None).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let bytes = b"hello".to_vec();
    let corrupted = b"hellO".to_vec();
    let mut file = file_dto("file-a", "a.bin", bytes.len() as u64);
    file.sha256 = Some(sha256_hex(&bytes));

    let response = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file]),
            None,
            CancellationToken::new(),
        )
        .await
        .unwrap()
        .response
        .unwrap();

    // The first upload is rejected because of the checksum mismatch ...
    let result = upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-a",
        &response.files["file-a"],
        &corrupted,
    )
    .await;
    assert_status(result, 422);

    // ... but a retry with the same token is accepted.
    upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-a",
        &response.files["file-a"],
        &bytes,
    )
    .await
    .unwrap();

    assert_eq!(server.received.lock().await["file-a"], bytes);

    tokio::time::sleep(Duration::from_millis(100)).await;
    let session_ends = server.session_ends.lock().await;
    assert_eq!(session_ends.len(), 1);
    assert_eq!(session_ends[0].0, response.session_id);
    assert!(matches!(session_ends[0].1, SessionEndReasonV2::Finished));
}

/// A retry writes to the same path as the failed attempt, so the receiver ends
/// up with exactly one file holding the correct content.
#[tokio::test]
async fn test_upload_retry_reuses_the_same_path() {
    let save_dir = std::env::temp_dir().join(format!("localsend-test-{}", uuid::Uuid::new_v4()));
    tokio::fs::create_dir_all(&save_dir).await.unwrap();

    let server = start_test_server(None, true, Some(save_dir.clone())).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let bytes: Vec<u8> = (0..50_000u32).map(|i| i as u8).collect();
    let mut corrupted = bytes.clone();
    *corrupted.last_mut().unwrap() ^= 0xff;
    let mut file = file_dto("file-a", "a.bin", bytes.len() as u64);
    file.sha256 = Some(sha256_hex(&bytes));

    let response = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file]),
            None,
            CancellationToken::new(),
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
        &response.files["file-a"],
        &corrupted,
    )
    .await;
    assert_status(result, 422);

    upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-a",
        &response.files["file-a"],
        &bytes,
    )
    .await
    .unwrap();

    // The corrupted attempt has been overwritten, not kept as a second file.
    let mut entries = tokio::fs::read_dir(&save_dir).await.unwrap();
    let mut file_names = Vec::new();
    while let Some(entry) = entries.next_entry().await.unwrap() {
        file_names.push(entry.file_name().to_string_lossy().to_string());
    }
    assert_eq!(file_names, vec!["file-a".to_string()]);
    assert_eq!(
        tokio::fs::read(save_dir.join("file-a")).await.unwrap(),
        bytes
    );

    tokio::fs::remove_dir_all(&save_dir).await.unwrap();
}

#[tokio::test]
async fn test_upload_mismatched_sha256_attempts_exhausted() {
    let server = start_test_server(None, true, None).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let bytes = b"hello".to_vec();
    let corrupted = b"hellO".to_vec();
    let mut file = file_dto("file-a", "a.bin", bytes.len() as u64);
    file.sha256 = Some(sha256_hex(&bytes));

    let response = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            prepare_upload_request(&[file]),
            None,
            CancellationToken::new(),
        )
        .await
        .unwrap()
        .response
        .unwrap();

    // Three attempts are allowed, each failing with a checksum mismatch.
    for _ in 0..3 {
        let result = upload_bytes(
            &client,
            server.port,
            &response.session_id,
            "file-a",
            &response.files["file-a"],
            &corrupted,
        )
        .await;
        assert_status(result, 422);
    }

    // The file is now failed and the session is over; further attempts are rejected.
    let result = upload_bytes(
        &client,
        server.port,
        &response.session_id,
        "file-a",
        &response.files["file-a"],
        &bytes,
    )
    .await;
    assert_status(result, 403);

    tokio::time::sleep(Duration::from_millis(100)).await;
    let session_ends = server.session_ends.lock().await;
    assert_eq!(session_ends.len(), 1);
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
            CancellationToken::new(),
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
            CancellationToken::new(),
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
            CancellationToken::new(),
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
            CancellationToken::new(),
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
            CancellationToken::new(),
        )
        .await
        .unwrap();
}

/// The sender aborts the prepare-upload request (drops the connection) while
/// the receiving application is still deciding. The application must be told
/// via [ServerEventV2::PrepareUploadAborted] and the session slot must be
/// freed so the next request is not blocked.
#[tokio::test]
async fn test_prepare_upload_aborted_by_sender_disconnect() {
    let _ = tracing_subscriber::fmt().with_test_writer().try_init();
    let port = free_port();

    let (event_tx, mut event_rx) = mpsc::channel::<ServerEventV2>(16);
    let (aborted_tx, aborted_rx) = oneshot::channel::<String>();

    // Unlike the shared harness, this event loop does not answer the first
    // prepare-upload decision: the request stays pending like a real
    // application waiting for user input. Later requests are declined so the
    // test can verify the slot was freed without hanging.
    tokio::spawn(async move {
        let mut held_decision = None;
        let mut aborted_tx = Some(aborted_tx);
        while let Some(event) = event_rx.recv().await {
            match event {
                ServerEventV2::PrepareUpload { decision_tx, .. } => {
                    if held_decision.is_none() {
                        held_decision = Some(decision_tx);
                    } else {
                        let _ = decision_tx.send(PrepareUploadDecisionV2::Decline);
                    }
                }
                ServerEventV2::PrepareUploadAborted { session_id } => {
                    if let Some(tx) = aborted_tx.take() {
                        let _ = tx.send(session_id);
                    }
                }
                _ => {}
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
        Some(ServerConfigV2 {
            pin: None,
            verify_checksums: true,
            event_tx,
        }),
        None,
        stop_rx,
    )
    .await
    .expect("Failed to start server");
    wait_until_reachable(port).await;

    // Raw TCP so the connection can be closed mid-request.
    let body =
        serde_json::to_string(&prepare_upload_request(&[file_dto("file-a", "a.bin", 5)])).unwrap();
    let request = format!(
        "POST /api/localsend/v2/prepare-upload HTTP/1.1\r\nHost: 127.0.0.1:{port}\r\nContent-Type: application/json\r\nContent-Length: {}\r\n\r\n{body}",
        body.len()
    );
    let mut stream = tokio::net::TcpStream::connect(("127.0.0.1", port))
        .await
        .unwrap();
    tokio::io::AsyncWriteExt::write_all(&mut stream, request.as_bytes())
        .await
        .unwrap();

    // Give the server time to read the request and emit PrepareUpload,
    // then hang up without waiting for the response.
    tokio::time::sleep(Duration::from_millis(200)).await;
    drop(stream);

    tokio::time::timeout(Duration::from_secs(3), aborted_rx)
        .await
        .expect("PrepareUploadAborted was not emitted after the sender disconnected")
        .unwrap();

    // The pending slot must be free again for the next sender.
    let client = LsHttpClientV2::try_new_without_cert().unwrap();
    let result = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            port,
            None,
            prepare_upload_request(&[file_dto("file-b", "b.bin", 5)]),
            None,
            CancellationToken::new(),
        )
        .await;
    // The event loop declines the second request; 409 would mean the
    // pending slot of the aborted request leaked.
    assert_status(result, 403);

    let _ = stop_tx.send(());
}

/// A released (Dart) sender cancels a pending prepare-upload with a
/// session-less `POST /cancel` while keeping the prepare-upload request open:
/// it does not know the session ID (that is part of the response it never
/// waits for) and does not abort the connection. The pending request must be
/// rejected, the application notified, and the slot freed.
#[tokio::test]
async fn test_prepare_upload_cancelled_by_session_less_cancel() {
    let _ = tracing_subscriber::fmt().with_test_writer().try_init();
    let port = free_port();

    let (event_tx, mut event_rx) = mpsc::channel::<ServerEventV2>(16);
    let (aborted_tx, mut aborted_rx) = oneshot::channel::<String>();

    tokio::spawn(async move {
        let mut held_decision = None;
        let mut aborted_tx = Some(aborted_tx);
        while let Some(event) = event_rx.recv().await {
            match event {
                ServerEventV2::PrepareUpload { decision_tx, .. } => {
                    if held_decision.is_none() {
                        held_decision = Some(decision_tx);
                    } else {
                        let _ = decision_tx.send(PrepareUploadDecisionV2::Decline);
                    }
                }
                ServerEventV2::PrepareUploadAborted { session_id } => {
                    if let Some(tx) = aborted_tx.take() {
                        let _ = tx.send(session_id);
                    }
                }
                _ => {}
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
        Some(ServerConfigV2 {
            pin: None,
            verify_checksums: true,
            event_tx,
        }),
        None,
        stop_rx,
    )
    .await
    .expect("Failed to start server");
    wait_until_reachable(port).await;

    // The prepare-upload request stays open in the background, like the
    // released sender that fires the cancel without aborting it.
    let prepare_task = tokio::spawn(async move {
        let client = LsHttpClientV2::try_new_without_cert().unwrap();
        client
            .prepare_upload(
                ProtocolType::Http,
                "127.0.0.1",
                port,
                None,
                prepare_upload_request(&[file_dto("file-a", "a.bin", 5)]),
                None,
                CancellationToken::new(),
            )
            .await
    });
    tokio::time::sleep(Duration::from_millis(200)).await;

    let cancel_url = format!("http://127.0.0.1:{port}/api/localsend/v2/cancel");
    let cancel_client = localsend::reqwest::Client::new();

    // A cancel with a wrong session ID must not cancel the pending request.
    cancel_client
        .post(format!("{cancel_url}?sessionId=some-other-session"))
        .send()
        .await
        .unwrap();
    assert!(
        tokio::time::timeout(Duration::from_millis(300), &mut aborted_rx)
            .await
            .is_err(),
        "a cancel with a foreign session ID must not abort the pending request"
    );

    // The session-less cancel of the released sender.
    cancel_client.post(&cancel_url).send().await.unwrap();

    tokio::time::timeout(Duration::from_secs(3), aborted_rx)
        .await
        .expect("PrepareUploadAborted was not emitted after the session-less cancel")
        .unwrap();

    // The open prepare-upload request is answered with a rejection.
    let result = prepare_task.await.unwrap();
    assert_status(result, 403);

    // The pending slot must be free again for the next sender.
    let client = LsHttpClientV2::try_new_without_cert().unwrap();
    let result = client
        .prepare_upload(
            ProtocolType::Http,
            "127.0.0.1",
            port,
            None,
            prepare_upload_request(&[file_dto("file-b", "b.bin", 5)]),
            None,
            CancellationToken::new(),
        )
        .await;
    assert_status(result, 403);

    let _ = stop_tx.send(());
}

/// Same as [test_prepare_upload_aborted_by_sender_disconnect], but over TLS
/// with mutual certificates - the transport every real LocalSend transfer
/// uses - and cancelled through the client's cancellation token, the way a
/// sender cancels while waiting for the receiver's decision.
#[tokio::test]
async fn test_prepare_upload_aborted_by_sender_disconnect_tls() {
    let _ = tracing_subscriber::fmt().with_test_writer().try_init();
    let port = free_port();

    let server_key = rcgen::KeyPair::generate().unwrap();
    let server_cert = rcgen::CertificateParams::new(vec!["LocalSend User".to_string()])
        .unwrap()
        .self_signed(&server_key)
        .unwrap();
    let sender_key = rcgen::KeyPair::generate().unwrap();
    let sender_cert = rcgen::CertificateParams::new(vec!["LocalSend User".to_string()])
        .unwrap()
        .self_signed(&sender_key)
        .unwrap();

    let (event_tx, mut event_rx) = mpsc::channel::<ServerEventV2>(16);
    let (aborted_tx, aborted_rx) = oneshot::channel::<String>();

    tokio::spawn(async move {
        let mut held_decision = None;
        let mut aborted_tx = Some(aborted_tx);
        while let Some(event) = event_rx.recv().await {
            match event {
                ServerEventV2::PrepareUpload { decision_tx, .. } => {
                    if held_decision.is_none() {
                        held_decision = Some(decision_tx);
                    } else {
                        let _ = decision_tx.send(PrepareUploadDecisionV2::Decline);
                    }
                }
                ServerEventV2::PrepareUploadAborted { session_id } => {
                    if let Some(tx) = aborted_tx.take() {
                        let _ = tx.send(session_id);
                    }
                }
                _ => {}
            }
        }
    });

    let (stop_tx, stop_rx) = oneshot::channel::<()>();
    start_with_port(
        port,
        Some(localsend::http::server::TlsConfig {
            cert: server_cert.pem(),
            private_key: server_key.serialize_pem(),
        }),
        ClientInfo {
            alias: "Test Server".to_string(),
            version: "2.1".to_string(),
            device_model: Some("Rust".to_string()),
            device_type: None,
            token: "server-fingerprint".to_string(),
        },
        None,
        Some(ServerConfigV2 {
            pin: None,
            verify_checksums: true,
            event_tx,
        }),
        None,
        stop_rx,
    )
    .await
    .expect("Failed to start server");
    wait_until_reachable(port).await;

    // The sender cancels while the server is still waiting for the
    // application's decision.
    let client =
        LsHttpClientV2::try_new(&sender_key.serialize_pem(), &sender_cert.pem(), None, None)
            .unwrap();
    let cancel = CancellationToken::new();
    tokio::spawn({
        let cancel = cancel.clone();
        async move {
            tokio::time::sleep(Duration::from_millis(300)).await;
            cancel.cancel();
        }
    });
    let result = client
        .prepare_upload(
            ProtocolType::Https,
            "127.0.0.1",
            port,
            None,
            prepare_upload_request(&[file_dto("file-a", "a.bin", 5)]),
            None,
            cancel,
        )
        .await;
    assert!(
        matches!(result, Err(ClientError::Cancelled)),
        "expected ClientError::Cancelled, got {:?}",
        result.err()
    );

    tokio::time::timeout(Duration::from_secs(3), aborted_rx)
        .await
        .expect("PrepareUploadAborted was not emitted after the sender disconnected (TLS)")
        .unwrap();

    // The pending slot must be free again for the next sender.
    let client =
        LsHttpClientV2::try_new(&sender_key.serialize_pem(), &sender_cert.pem(), None, None)
            .unwrap();
    let result = client
        .prepare_upload(
            ProtocolType::Https,
            "127.0.0.1",
            port,
            None,
            prepare_upload_request(&[file_dto("file-b", "b.bin", 5)]),
            None,
            CancellationToken::new(),
        )
        .await;
    assert_status(result, 403);

    let _ = stop_tx.send(());
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
            CancellationToken::new(),
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
            CancellationToken::new(),
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
            CancellationToken::new(),
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
            CancellationToken::new(),
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
            CancellationToken::new(),
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
                CancellationToken::new(),
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
            CancellationToken::new(),
        )
        .await;
    assert_status(result, 429);
}
