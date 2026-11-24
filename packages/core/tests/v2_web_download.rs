#![cfg(feature = "http")]

use bytes::Bytes;
use localsend::http::client::{ClientError, LsHttpClientV2};
use localsend::http::server::v2::ServerEventV2;
use localsend::http::server::web::WebDownloadConfig;
use localsend::http::server::web::{WebConfig, WebDownloadEvent, WebMode, WebPages};
use localsend::http::server::{start_with_port, ServerConfigV2};
use localsend::http::state::ClientInfo;
use localsend::model::discovery::ProtocolType;
use localsend::model::transfer::{FileContent, FileDto};
use std::collections::HashMap;
use std::net::IpAddr;
use std::path::PathBuf;
use std::sync::atomic::{AtomicU32, Ordering};
use std::sync::Arc;
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
                for chunk in bytes.chunks(2) {
                    if tx.send(Bytes::copy_from_slice(chunk)).await.is_err() {
                        break;
                    }
                }
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
    web_download: Option<(WebDownloadConfig, HashMap<String, TestFileContent>)>,
    accept: bool,
) -> TestServer {
    start_test_server_with_tls(web_download, accept, None).await
}

async fn start_test_server_with_tls(
    web_download: Option<(WebDownloadConfig, HashMap<String, TestFileContent>)>,
    accept: bool,
    tls: Option<localsend::http::server::TlsConfig>,
) -> TestServer {
    let _ = tracing_subscriber::fmt().with_test_writer().try_init();
    let prepare_download_events = Arc::new(AtomicU32::new(0));

    let (web_download, contents) = match web_download {
        Some((config, contents)) => (Some(config), contents),
        None => (None, HashMap::new()),
    };

    // Web download emits its own event type, independent of the v2 protocol events.
    let (web_event_tx, mut web_event_rx) = mpsc::channel::<WebDownloadEvent>(16);

    tokio::spawn({
        let prepare_download_events = prepare_download_events.clone();
        async move {
            while let Some(event) = web_event_rx.recv().await {
                match event {
                    WebDownloadEvent::PrepareDownload { decision_tx, .. } => {
                        prepare_download_events.fetch_add(1, Ordering::SeqCst);
                        let _ = decision_tx.send(accept);
                    }
                    WebDownloadEvent::FileDownload {
                        file_id,
                        content_tx,
                        ..
                    } => {
                        let content = contents
                            .get(&file_id)
                            .expect("FileDownload for unknown file")
                            .clone();
                        tokio::spawn(async move {
                            if let TestFileContent::Path(path) = content {
                                let _ = content_tx.send(FileContent::Path(path));
                                return;
                            }
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

    // Web download is configured independently of the v2 endpoints.
    let web_config = match web_download {
        Some(mut config) => {
            config.event_tx = web_event_tx;
            WebConfig {
                mode: WebMode::Download(config),
                ..WebConfig::default()
            }
        }
        None => WebConfig::default(),
    };

    // Port 0 lets the OS pick a free port, avoiding collisions between tests.
    let handle = start_with_port(
        0,
        tls,
        ClientInfo {
            alias: "Test Server".to_string(),
            version: "2.2".to_string(),
            device_model: Some("Rust".to_string()),
            device_type: None,
            token: "server-fingerprint".to_string(),
        },
        None,
        Some(ServerConfigV2 {
            pin: None,
            verify_checksums: true,
            event_tx: v2_event_tx,
        }),
        web_config,
        stop_rx,
    )
    .await
    .expect("Failed to start server");

    TestServer {
        port: handle.port(),
        prepare_download_events,
        _stop_tx: stop_tx,
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

/// Creates a web download config with an in-memory text file and a file on disk.
///
/// Returns the config, the content sources for the test event handler and
/// the path of the file on disk (the caller should delete it).
fn web_download_config(
    pin: Option<String>,
) -> (
    WebDownloadConfig,
    HashMap<String, TestFileContent>,
    PathBuf,
    Vec<u8>,
) {
    let disk_content: Vec<u8> = (0..100_000u32).map(|i| i as u8).collect();
    let disk_path =
        std::env::temp_dir().join(format!("localsend-web-download-{}", uuid::Uuid::new_v4()));
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
    // the one whose receiver handles the web download events.
    let (event_tx, _event_rx) = tokio::sync::mpsc::channel::<WebDownloadEvent>(16);

    (
        WebDownloadConfig {
            files,
            pin,
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

/// A download manager resumes an accepted download from its saved byte offset.
#[tokio::test]
async fn test_resume_download_with_byte_range() {
    let (config, contents, disk_path, disk_content) = web_download_config(None);
    let server = start_test_server(Some((config, contents)), true).await;
    let client = LsHttpClientV2::try_new_without_cert().unwrap();
    let session = client
        .prepare_download(ProtocolType::Http, "127.0.0.1", server.port, None, None)
        .await
        .unwrap();
    let response = localsend::reqwest::Client::new()
        .get(format!(
            "http://127.0.0.1:{}/api/localsend/v2/download?sessionId={}&fileId=file-disk",
            server.port, session.session_id
        ))
        .header("Range", "bytes=4096-")
        .send()
        .await
        .unwrap();
    let status = response.status();
    let headers = response.headers().clone();
    let body = response.bytes().await.unwrap();
    std::fs::remove_file(disk_path).unwrap();
    assert_eq!(status.as_u16(), 206);
    assert_eq!(headers["accept-ranges"], "bytes");
    assert_eq!(headers["content-range"], "bytes 4096-99999/100000");
    assert_eq!(body.as_ref(), &disk_content[4096..]);
}

#[tokio::test]
async fn test_download_range_boundaries_and_authorization() {
    let (mut config, mut contents, disk_path, _) = web_download_config(None);
    config
        .files
        .insert("empty".into(), file_dto("empty", "empty", 0));
    contents.insert("empty".into(), TestFileContent::Bytes(Bytes::new()));
    let server = start_test_server(Some((config, contents)), true).await;
    let session = LsHttpClientV2::try_new_without_cert()
        .unwrap()
        .prepare_download(ProtocolType::Http, "127.0.0.1", server.port, None, None)
        .await
        .unwrap();
    let client = localsend::reqwest::Client::new();
    let url = format!(
        "http://127.0.0.1:{}/api/localsend/v2/download?sessionId={}&fileId=file-text",
        server.port, session.session_id
    );
    for (range, status, expected, content_range) in [
        ("bytes=1-3", 206, "ell", Some("bytes 1-3/5")),
        ("bytes=4-", 206, "o", Some("bytes 4-4/5")),
        ("bytes=-2", 206, "lo", Some("bytes 3-4/5")),
        (
            "bytes=-99999999999999999999999999",
            206,
            "hello",
            Some("bytes 0-4/5"),
        ),
        (
            "bytes=0-99999999999999999999999999",
            206,
            "hello",
            Some("bytes 0-4/5"),
        ),
        ("bytes=5-", 416, "", Some("bytes */5")),
        ("bytes=-0", 416, "", Some("bytes */5")),
        (
            "bytes=99999999999999999999999999-",
            416,
            "",
            Some("bytes */5"),
        ),
        ("bytes=3-1", 200, "hello", None),
        ("bytes=abc-", 200, "hello", None),
        ("bytes=+1-", 200, "hello", None),
        ("bytes=0-1,3-4", 200, "hello", None),
        ("items=0-1", 200, "hello", None),
    ] {
        let response = client
            .get(&url)
            .header("Range", range)
            .send()
            .await
            .unwrap();
        assert_eq!(response.status().as_u16(), status, "{range}");
        assert_eq!(
            response
                .headers()
                .get("content-range")
                .map(|v| v.to_str().unwrap()),
            content_range,
            "{range}"
        );
        assert_eq!(response.text().await.unwrap(), expected, "{range}");
    }
    let response = client
        .get(&url)
        .header("Range", "bytes=1-")
        .header("If-Range", "\"unverified\"")
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 200);
    assert_eq!(response.text().await.unwrap(), "hello");
    let response = client
        .get(url.replace("fileId=file-text", "fileId=empty"))
        .header("Range", "bytes=0-")
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 416);
    assert_eq!(response.headers()["content-range"], "bytes */0");
    let response = client
        .get(url.replace(
            &format!("sessionId={}", session.session_id),
            "sessionId=invalid",
        ))
        .header("Range", "bytes=0-1")
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 403);
    let response = client.get(&url).send().await.unwrap();
    assert_eq!(response.status().as_u16(), 200);
    assert_eq!(response.headers()["accept-ranges"], "bytes");
    assert_eq!(response.text().await.unwrap(), "hello");
    let response = client
        .head(&url)
        .header("Range", "bytes=1-")
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 200);
    assert_eq!(response.headers()["accept-ranges"], "bytes");
    assert_eq!(response.headers()["content-length"], "5");
    assert!(response.bytes().await.unwrap().is_empty());
    std::fs::remove_file(disk_path).unwrap();
}

#[tokio::test]
async fn test_https_browser_download_range_without_client_certificate() {
    let (config, contents, disk_path, disk_content) = web_download_config(None);
    let identity = localsend::crypto::cert::generate_self_signed().unwrap();
    let server = start_test_server_with_tls(
        Some((config, contents)),
        true,
        Some(localsend::http::server::TlsConfig {
            cert: identity.certificate_pem,
            private_key: identity.private_key_pem,
        }),
    )
    .await;
    // Only this loopback test client trusts the generated self-signed server.
    let client = localsend::reqwest::Client::builder()
        .danger_accept_invalid_certs(true)
        .build()
        .unwrap();
    let base = format!("https://127.0.0.1:{}", server.port);
    let session: serde_json::Value = client
        .post(format!("{base}/api/localsend/v2/prepare-download"))
        .send()
        .await
        .unwrap()
        .error_for_status()
        .unwrap()
        .json()
        .await
        .unwrap();
    let response = client
        .get(format!(
            "{base}/api/localsend/v2/download?sessionId={}&fileId=file-disk",
            session["sessionId"].as_str().unwrap()
        ))
        .header("Range", "bytes=4096-8191")
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 206);
    assert_eq!(response.headers()["content-length"], "4096");
    assert_eq!(
        response.bytes().await.unwrap().as_ref(),
        &disk_content[4096..8192]
    );
    std::fs::remove_file(disk_path).unwrap();
}

#[tokio::test]
async fn test_interrupted_download_resumes_without_corrupting_file() {
    let (mut config, contents, disk_path, _) = web_download_config(None);
    let original: Vec<u8> = (0..4_000_000u32)
        .map(|n| (n.wrapping_mul(31) >> 8) as u8)
        .collect();
    std::fs::write(&disk_path, &original).unwrap();
    config.files.get_mut("file-disk").unwrap().size = original.len() as u64;
    let server = start_test_server(Some((config, contents)), true).await;
    let session = LsHttpClientV2::try_new_without_cert()
        .unwrap()
        .prepare_download(ProtocolType::Http, "127.0.0.1", server.port, None, None)
        .await
        .unwrap();
    let client = localsend::reqwest::Client::new();
    let url = format!(
        "http://127.0.0.1:{}/api/localsend/v2/download?sessionId={}&fileId=file-disk",
        server.port, session.session_id
    );
    let mut response = client.get(&url).send().await.unwrap();
    let mut downloaded = response.chunk().await.unwrap().unwrap().to_vec();
    assert!(!downloaded.is_empty() && downloaded.len() < original.len());
    drop(response);
    // Use a fresh client so resuming also exercises a new TCP connection.
    let response = localsend::reqwest::Client::new()
        .get(&url)
        .header("Range", format!("bytes={}-", downloaded.len()))
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 206);
    downloaded.extend_from_slice(&response.bytes().await.unwrap());
    assert_eq!(downloaded, original);
    assert_eq!(server.prepare_download_events.load(Ordering::SeqCst), 1);
    std::fs::remove_file(disk_path).unwrap();
}

#[tokio::test]
async fn test_web_page() {
    let (config, contents, disk_path, _) = web_download_config(None);
    let server = start_test_server(Some((config, contents)), true).await;
    let client = localsend::reqwest::Client::new();
    let base_url = format!("http://127.0.0.1:{}", server.port);

    let response = client.get(&base_url).send().await.unwrap();
    assert_eq!(response.status().as_u16(), 200);
    let body = response.text().await.unwrap();
    assert!(body.contains("LocalSend"));
    assert!(body.contains("prepare-download"));

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
async fn test_upload_page() {
    let _ = tracing_subscriber::fmt().with_test_writer().try_init();
    let (v2_event_tx, _v2_event_rx) = mpsc::channel::<ServerEventV2>(16);
    let (_stop_tx, stop_rx) = oneshot::channel::<()>();

    let handle = start_with_port(
        0,
        None, // plain HTTP
        ClientInfo {
            alias: "Test Server".to_string(),
            version: "2.2".to_string(),
            device_model: Some("Rust".to_string()),
            device_type: None,
            token: "server-fingerprint".to_string(),
        },
        None,
        Some(ServerConfigV2 {
            pin: None,
            verify_checksums: true,
            event_tx: v2_event_tx,
        }),
        WebConfig {
            mode: WebMode::Upload,
            ..WebConfig::default()
        },
        stop_rx,
    )
    .await
    .expect("Failed to start server");
    let port = handle.port();

    let client = localsend::reqwest::Client::new();
    let base_url = format!("http://127.0.0.1:{port}");

    // The upload page is served at `/` because web download is not active.
    let response = client.get(&base_url).send().await.unwrap();
    assert_eq!(response.status().as_u16(), 200);
    let body = response.text().await.unwrap();
    assert!(body.contains("LocalSend"));
    assert!(body.contains("prepare-upload"));
    // The download page is not served without web download.
    assert!(!body.contains("prepare-download"));

    let response = client
        .get(format!("{base_url}/i18n.json"))
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 200);
    let i18n = response.json::<HashMap<String, String>>().await.unwrap();
    assert!(i18n.contains_key("busy"));
    assert!(i18n.contains_key("uploadRejected"));
    assert!(i18n.contains_key("dropHint"));
}

#[tokio::test]
async fn test_custom_web_pages() {
    let (v2_event_tx, _v2_event_rx) = mpsc::channel::<ServerEventV2>(16);
    let (_stop_tx, stop_rx) = oneshot::channel::<()>();

    let handle = start_with_port(
        0,
        None, // plain HTTP
        ClientInfo {
            alias: "Test Server".to_string(),
            version: "2.2".to_string(),
            device_model: Some("Rust".to_string()),
            device_type: None,
            token: "server-fingerprint".to_string(),
        },
        None,
        Some(ServerConfigV2 {
            pin: None,
            verify_checksums: true,
            event_tx: v2_event_tx,
        }),
        WebConfig {
            mode: WebMode::Upload,
            pages: WebPages {
                download_html: None,
                upload_html: Some("<html>custom upload page</html>".to_string()),
                error_403_html: None,
            },
            ..WebConfig::default()
        },
        stop_rx,
    )
    .await
    .expect("Failed to start server");

    let client = localsend::reqwest::Client::new();
    let response = client
        .get(format!("http://127.0.0.1:{}", handle.port()))
        .send()
        .await
        .unwrap();
    assert_eq!(response.status().as_u16(), 200);
    assert_eq!(
        response.text().await.unwrap(),
        "<html>custom upload page</html>"
    );
}

#[tokio::test]
async fn test_full_download_flow() {
    let (config, contents, disk_path, disk_content) = web_download_config(None);
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
    let (config, contents, disk_path, _) = web_download_config(None);
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
    let (config, contents, disk_path, _) = web_download_config(None);
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
    let (config, contents, disk_path, _) = web_download_config(Some("123456".to_string()));
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
    let (config, contents, disk_path, _) = web_download_config(Some("123456".to_string()));
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
