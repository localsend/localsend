#![cfg(feature = "http")]

use localsend::http::server::internal::{InternalConfig, InternalEvent};
use localsend::http::server::start_with_port;
use localsend::http::server::web::WebConfig;
use localsend::http::state::ClientInfo;
use std::sync::Arc;
use tokio::sync::{mpsc, oneshot, Mutex};

struct TestServer {
    port: u16,
    show_args: Arc<Mutex<Vec<Vec<String>>>>,
    _stop_tx: oneshot::Sender<()>,
}

async fn start_test_server(internal_enabled: bool) -> TestServer {
    let _ = tracing_subscriber::fmt().with_test_writer().try_init();
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

    // Port 0 lets the OS pick a free port, avoiding collisions between tests.
    let handle = start_with_port(
        0,
        None,
        ClientInfo {
            alias: "Test Server".to_string(),
            version: "2.2".to_string(),
            device_model: Some("Rust".to_string()),
            device_type: None,
            token: "server-fingerprint".to_string(),
        },
        internal_config,
        None,
        WebConfig::default(),
        stop_rx,
    )
    .await
    .expect("Failed to start server");

    TestServer {
        port: handle.port(),
        show_args,
        _stop_tx: stop_tx,
    }
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
