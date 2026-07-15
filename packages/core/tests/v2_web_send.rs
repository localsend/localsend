#![cfg(feature = "http")]

use bytes::Bytes;
use localsend::http::client::{ClientError, LsHttpClientV2};
use localsend::http::dto::ProtocolType;
use localsend::http::server::v2::ServerEventV2;
use localsend::http::server::web::WebSendConfig;
use localsend::http::server::web::{WebSendEvent, WebSendI18n};
use localsend::http::server::{start_with_port, ServerConfigV2};
use localsend::http::state::ClientInfo;
use localsend::model::transfer::{FileContent, FileDto};
use std::collections::HashMap;
use std::net::IpAddr;
use std::path::PathBuf;
use std::sync::atomic::{AtomicU16, AtomicU32, Ordering};
use std::sync::Arc;
use std::time::Duration;
use tokio::io::AsyncReadExt;
use tokio::sync::{mpsc, oneshot};

struct TestServer {
    port: u16,
    /// Number of `PrepareDownload` events received.
    prepare_download_events: Arc<AtomicU32>,
    _stop_tx: oneshot::Sender<()>,
}

/// The content sources backing the offered files, used by the test event
/// handler to answer `FileDownload` events.
#[derive(Clone)]
enum TestFileContent {
    Bytes(Bytes),
    Path(PathBuf),
}

impl TestFileContent {
    /// Streams the content into `tx`, mimicking how an application would
    /// serve in-memory content or a file from disk.
    async fn stream(self, tx: mpsc::Sender<Bytes>) {
        match self {
            TestFileContent::Bytes(bytes) => {
                let _ = tx.send(bytes).await;
            }
            TestFileContent::Path(path) => {
                let mut file = tokio::fs::File::open(&path)
                    .await
                    .expect("Failed to open test file");
                let mut buffer = vec![0u8; 4096];
                loop {
                    let bytes_read = file.read(&mut buffer).await.expect("Failed to read");
                    if bytes_read == 0 {
                        break; // EOF
                    }
                    if tx
                        .send(Bytes::copy_from_slice(&buffer[..bytes_read]))
                        .await
                        .is_err()
                    {
                        break; // client disconnected
                    }
                }
            }
        }
    }
}

async fn start_test_server(
    web_send: Option<(WebSendConfig, HashMap<String, TestFileContent>)>,
    accept: bool,
) -> TestServer {
    let _ = tracing_subscriber::fmt().with_test_writer().try_init();
    let port = free_port();
    let prepare_download_events = Arc::new(AtomicU32::new(0));

    let (web_send, contents) = match web_send {
        Some((config, contents)) => (Some(config), contents),
        None => (None, HashMap::new()),
    };

    // Web send emits its own event type, independent of the v2 protocol events.
    let (web_event_tx, mut web_event_rx) = mpsc::channel::<WebSendEvent>(16);

    tokio::spawn({
        let prepare_download_events = prepare_download_events.clone();
        async move {
            while let Some(event) = web_event_rx.recv().await {
                match event {
                    WebSendEvent::PrepareDownload { decision_tx, .. } => {
                        prepare_download_events.fetch_add(1, Ordering::SeqCst);
                        let _ = decision_tx.send(accept);
                    }
                    WebSendEvent::FileDownload {
                        file_id,
                        content_tx,
                        ..
                    } => {
                        let content = contents
                            .get(&file_id)
                            .expect("FileDownload for unknown file")
                            .clone();
                        tokio::spawn(async move {
                            let (tx, rx) = mpsc::channel::<Bytes>(16);
                            if content_tx.send(FileContent::Stream(rx)).is_err() {
                                return;
                            }
                            content.stream(tx).await;
                        });
                    }
                }
            }
        }
    });

    // v2 stays enabled so the `/info` endpoint (which advertises `download`) can be
    // exercised. Its event channel is unused by these tests.
    let (v2_event_tx, _v2_event_rx) = tokio::sync::mpsc::channel::<ServerEventV2>(16);

    let (stop_tx, stop_rx) = oneshot::channel::<()>();

    // Web send is configured independently of the v2 endpoints.
    let web_send = web_send.map(|mut config| {
        config.event_tx = web_event_tx;
        config
    });

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
            event_tx: v2_event_tx,
        }),
        web_send,
        stop_rx,
    )
    .await
    .expect("Failed to start server");

    wait_until_reachable(port).await;

    TestServer {
        port,
        prepare_download_events,
        _stop_tx: stop_tx,
    }
}

/// Returns a free port.
///
/// A counter is used instead of binding to port 0 because the OS may hand out
/// the same just-freed ephemeral port to multiple tests running in parallel.
fn free_port() -> u16 {
    static PORT_COUNTER: AtomicU16 = AtomicU16::new(41551);

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

/// Creates a web send config with an in-memory text file and a file on disk.
///
/// Returns the config, the content sources for the test event handler and
/// the path of the file on disk (the caller should delete it).
fn web_send_config(
    pin: Option<String>,
) -> (
    WebSendConfig,
    HashMap<String, TestFileContent>,
    PathBuf,
    Vec<u8>,
) {
    let disk_content: Vec<u8> = (0..100_000u32).map(|i| i as u8).collect();
    let disk_path =
        std::env::temp_dir().join(format!("localsend-web-send-{}", uuid::Uuid::new_v4()));
    std::fs::write(&disk_path, &disk_content).expect("Failed to write test file");

    // The config only carries the metadata; the content is streamed by the
    // test event handler when the server emits `FileDownload`.
    let files = HashMap::from([
        (
            "file-text".to_string(),
            file_dto("file-text", "message.txt", 5),
        ),
        (
            "file-disk".to_string(),
            file_dto("file-disk", "dir/data.bin", disk_content.len() as u64),
        ),
    ]);

    let contents = HashMap::from([
        (
            "file-text".to_string(),
            TestFileContent::Bytes(Bytes::from_static(b"hello")),
        ),
        (
            "file-disk".to_string(),
            TestFileContent::Path(disk_path.clone()),
        ),
    ]);

    // The event channel is a placeholder; `start_test_server` replaces it with
    // the one whose receiver handles the web send events.
    let (event_tx, _event_rx) = tokio::sync::mpsc::channel::<WebSendEvent>(16);

    (
        WebSendConfig {
            files,
            pin,
            i18n: WebSendI18n::default(),
            event_tx,
        },
        contents,
        disk_path,
        disk_content,
    )
}

fn assert_status(result: Result<impl Sized, ClientError>, expected_status: u16) {
    match result {
        Err(ClientError::StatusCode(err)) => assert_eq!(err.status, expected_status),
        Err(err) => panic!("Expected status code {expected_status}, got error: {err:?}"),
        Ok(_) => panic!("Expected status code {expected_status}, got success"),
    }
}

#[tokio::test]
async fn test_web_page() {
    let (config, contents, disk_path, _) = web_send_config(None);
    let server = start_test_server(Some((config, contents)), true).await;
    let client = localsend::reqwest::Client::new();
    let base_url = format!("http://127.0.0.1:{}", server.port);

    let response = client.get(&base_url).send().await.unwrap();
    assert_eq!(response.status().as_u16(), 200);
    assert!(response.text().await.unwrap().contains("LocalSend"));

    let response = client
        .get(format!("{base_url}/main.js"))
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 200);
    assert_eq!(
        response.headers()["content-type"],
        "text/javascript; charset=utf-8"
    );

    let response = client
        .get(format!("{base_url}/i18n.json"))
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 200);
    let i18n = response.json::<HashMap<String, String>>().await.unwrap();
    assert_eq!(i18n["enterPin"], "Enter PIN");
    assert!(i18n.contains_key("waiting"));

    // The register/info endpoints advertise the download API.
    let info = LsHttpClientV2::try_new_without_cert()
        .unwrap()
        .info(ProtocolType::Http, "127.0.0.1", server.port)
        .await
        .unwrap();
    assert!(info.download);

    let _ = std::fs::remove_file(disk_path);
}

#[tokio::test]
async fn test_web_page_disabled() {
    let server = start_test_server(None, true).await;
    let client = localsend::reqwest::Client::new();
    let base_url = format!("http://127.0.0.1:{}", server.port);

    let response = client.get(&base_url).send().await.unwrap();
    assert_eq!(response.status().as_u16(), 403);

    let response = client
        .post(format!("{base_url}/api/localsend/v2/prepare-download"))
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 403);

    let info = LsHttpClientV2::try_new_without_cert()
        .unwrap()
        .info(ProtocolType::Http, "127.0.0.1", server.port)
        .await
        .unwrap();
    assert!(!info.download);
}

#[tokio::test]
async fn test_full_download_flow() {
    let (config, contents, disk_path, disk_content) = web_send_config(None);
    let server = start_test_server(Some((config, contents)), true).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let response = client
        .prepare_download(ProtocolType::Http, "127.0.0.1", server.port, None, None)
        .await
        .unwrap();

    assert_eq!(response.info.alias, "Test Server");
    assert_eq!(response.files.len(), 2);
    assert_eq!(response.files["file-text"].file_name, "message.txt");
    assert_eq!(server.prepare_download_events.load(Ordering::SeqCst), 1);

    // Download the in-memory file.
    let mut bytes = Vec::new();
    client
        .download_to_writer(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            &response.session_id,
            "file-text",
            &mut bytes,
        )
        .await
        .unwrap();
    assert_eq!(bytes, b"hello");

    // Download the file from disk (streamed).
    let download_response = client
        .download(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            &response.session_id,
            "file-disk",
        )
        .await
        .unwrap();
    assert_eq!(
        download_response.headers()["content-length"],
        disk_content.len().to_string().as_str()
    );
    assert_eq!(
        download_response.headers()["content-disposition"],
        "attachment; filename=\"dir-data.bin\""
    );
    assert_eq!(
        download_response.bytes().await.unwrap().as_ref(),
        disk_content.as_slice()
    );

    // The session can be reused without a new permission request (e.g. page reload).
    let reused = client
        .prepare_download(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            Some(&response.session_id),
            None,
        )
        .await
        .unwrap();
    assert_eq!(reused.session_id, response.session_id);
    assert_eq!(server.prepare_download_events.load(Ordering::SeqCst), 1);

    let _ = std::fs::remove_file(disk_path);
}

#[tokio::test]
async fn test_prepare_download_rejected() {
    let (config, contents, disk_path, _) = web_send_config(None);
    let server = start_test_server(Some((config, contents)), false).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let result = client
        .prepare_download(ProtocolType::Http, "127.0.0.1", server.port, None, None)
        .await;
    assert_status(result, 403);

    // The rejected session must not allow downloads.
    let local_ip: IpAddr = "127.0.0.1".parse().unwrap();
    let result = client
        .download(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            &local_ip.to_string(),
            "file-text",
        )
        .await;
    assert_status(result, 403);

    let _ = std::fs::remove_file(disk_path);
}

#[tokio::test]
async fn test_download_invalid_session() {
    let (config, contents, disk_path, _) = web_send_config(None);
    let server = start_test_server(Some((config, contents)), true).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    let result = client
        .download(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            "unknown-session",
            "file-text",
        )
        .await;
    assert_status(result, 403);

    // Valid session but unknown file.
    let response = client
        .prepare_download(ProtocolType::Http, "127.0.0.1", server.port, None, None)
        .await
        .unwrap();
    let result = client
        .download(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            &response.session_id,
            "unknown-file",
        )
        .await;
    assert_status(result, 403);

    let _ = std::fs::remove_file(disk_path);
}

#[tokio::test]
async fn test_pin() {
    let (config, contents, disk_path, _) = web_send_config(Some("123456".to_string()));
    let server = start_test_server(Some((config, contents)), true).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    // Missing PIN.
    let result = client
        .prepare_download(ProtocolType::Http, "127.0.0.1", server.port, None, None)
        .await;
    assert_status(result, 401);

    // Wrong PIN.
    let result = client
        .prepare_download(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            Some("000000"),
        )
        .await;
    assert_status(result, 401);

    // Correct PIN.
    client
        .prepare_download(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            Some("123456"),
        )
        .await
        .unwrap();

    let _ = std::fs::remove_file(disk_path);
}

#[tokio::test]
async fn test_pin_too_many_attempts() {
    let (config, contents, disk_path, _) = web_send_config(Some("123456".to_string()));
    let server = start_test_server(Some((config, contents)), true).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();

    for _ in 0..3 {
        let result = client
            .prepare_download(
                ProtocolType::Http,
                "127.0.0.1",
                server.port,
                None,
                Some("000000"),
            )
            .await;
        assert_status(result, 401);
    }

    // Blocked even with the correct PIN.
    let result = client
        .prepare_download(
            ProtocolType::Http,
            "127.0.0.1",
            server.port,
            None,
            Some("123456"),
        )
        .await;
    assert_status(result, 429);

    let _ = std::fs::remove_file(disk_path);
}
