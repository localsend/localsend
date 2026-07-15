#![cfg(feature = "http")]

use localsend::http::server::internal::{InternalConfig, InternalEvent};
use localsend::http::server::start_with_port;
use localsend::http::state::ClientInfo;
use std::sync::atomic::{AtomicU16, Ordering};
use std::sync::Arc;
use std::time::Duration;
use tokio::sync::{mpsc, oneshot, Mutex};

struct TestServer {
    port: u16,
    show_args: Arc<Mutex<Vec<Vec<String>>>>,
    _stop_tx: oneshot::Sender<()>,
}

async fn start_test_server(internal_enabled: bool) -> TestServer {
    let _ = tracing_subscriber::fmt().with_test_writer().try_init();
    let port = free_port();
    let show_args = Arc::new(Mutex::new(Vec::new()));
    let (event_tx, mut event_rx) = mpsc::channel::<InternalEvent>(16);

    tokio::spawn({
        let show_args = show_args.clone();
        async move {
            while let Some(event) = event_rx.recv().await {
                match event {
                    InternalEvent::Show { args } => show_args.lock().await.push(args),
                }
            }
        }
    });

    let internal_config = internal_enabled.then_some(InternalConfig {
        show_token: "show-token".to_string(),
        event_tx,
    });
    let (stop_tx, stop_rx) = oneshot::channel::<()>();

    start_with_port(
        port,
        None,
        ClientInfo {
            alias: "Test Server".to_string(),
            version: "2.1".to_string(),
            device_model: Some("Rust".to_string()),
            device_type: None,
            token: "server-fingerprint".to_string(),
        },
        internal_config,
        None,
        None,
        stop_rx,
    )
    .await
    .expect("Failed to start server");

    wait_until_reachable(port).await;

    TestServer {
        port,
        show_args,
        _stop_tx: stop_tx,
    }
}

fn free_port() -> u16 {
    static PORT_COUNTER: AtomicU16 = AtomicU16::new(42551);

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

#[tokio::test]
async fn test_show() {
    let server = start_test_server(true).await;

    let response = localsend::reqwest::Client::new()
        .post(format!(
            "http://127.0.0.1:{}/api/localsend/v2/show?token=show-token",
            server.port
        ))
        .json(&serde_json::json!({"args": ["file-a", "file-b"]}))
        .send()
        .await
        .unwrap();

    assert_eq!(response.status().as_u16(), 200);
    assert_eq!(
        *server.show_args.lock().await,
        vec![vec!["file-a".to_string(), "file-b".to_string()]]
    );
}

#[tokio::test]
async fn test_show_with_empty_body() {
    let server = start_test_server(true).await;

    let response = localsend::reqwest::Client::new()
        .post(format!(
            "http://127.0.0.1:{}/api/localsend/v2/show?token=show-token",
            server.port
        ))
        .send()
        .await
        .unwrap();

    assert_eq!(response.status().as_u16(), 200);
    assert_eq!(*server.show_args.lock().await, vec![Vec::<String>::new()]);
}

#[tokio::test]
async fn test_show_with_invalid_token() {
    let server = start_test_server(true).await;

    let response = localsend::reqwest::Client::new()
        .post(format!(
            "http://127.0.0.1:{}/api/localsend/v2/show?token=wrong-token",
            server.port
        ))
        .json(&serde_json::json!({"args": ["file-a"]}))
        .send()
        .await
        .unwrap();

    assert_eq!(response.status().as_u16(), 403);
    assert!(server.show_args.lock().await.is_empty());
}

#[tokio::test]
async fn test_show_disabled() {
    let server = start_test_server(false).await;

    let response = localsend::reqwest::Client::new()
        .post(format!(
            "http://127.0.0.1:{}/api/localsend/v2/show?token=show-token",
            server.port
        ))
        .send()
        .await
        .unwrap();

    assert_eq!(response.status().as_u16(), 404);
}
