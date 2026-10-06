#![cfg(feature = "http")]
//! How the server admits connections and which protocol they may speak.

use localsend::http::server::start_with_port;
use localsend::http::server::web::WebConfig;
use localsend::http::state::ClientInfo;
use std::time::Duration;
use tokio::io::{AsyncReadExt, AsyncWriteExt};
use tokio::net::TcpStream;
use tokio::sync::oneshot;

/// `MAX_CONNECTIONS` of the server. Loopback peers are not limited per IP,
/// so only this limit applies here.
const MAX_CONNECTIONS: usize = 64;

async fn start_test_server() -> (u16, oneshot::Sender<()>) {
    let _ = tracing_subscriber::fmt().with_test_writer().try_init();
    let (stop_tx, stop_rx) = oneshot::channel::<()>();

    // Port 0 lets the OS pick a free port, avoiding collisions between tests.
    let handle = start_with_port(
        0,
        None,
        ClientInfo {
            alias: "Test Server".to_string(),
            version: "2.2".to_string(),
            device_model: None,
            device_type: None,
            token: "server-fingerprint".to_string(),
        },
        None,
        None,
        WebConfig::default(),
        stop_rx,
    )
    .await
    .expect("Failed to start server");

    (handle.port(), stop_tx)
}

async fn connect(port: u16) -> TcpStream {
    TcpStream::connect(("127.0.0.1", port)).await.unwrap()
}

/// Reads until the server closes the connection.
async fn read_until_closed(stream: &mut TcpStream) -> Vec<u8> {
    let mut buf = Vec::new();
    tokio::time::timeout(Duration::from_secs(5), stream.read_to_end(&mut buf))
        .await
        .expect("the server did not close the connection")
        // A reset counts as closed as well.
        .ok();
    buf
}

#[tokio::test]
async fn http2_is_refused() {
    let (port, _stop_tx) = start_test_server().await;

    let mut stream = connect(port).await;
    stream
        .write_all(b"PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n")
        .await
        .unwrap();

    // An HTTP/2 server would answer with its SETTINGS frame.
    let response = read_until_closed(&mut stream).await;
    assert!(
        response.is_empty() || response.starts_with(b"HTTP/1.1 "),
        "the server spoke HTTP/2: {response:?}"
    );
}

#[tokio::test]
async fn connections_beyond_the_limit_are_closed() {
    let (port, _stop_tx) = start_test_server().await;

    // Idle connections, each holding a slot. Accepted in order, so all of
    // them are counted before the next one.
    let mut held = Vec::new();
    for _ in 0..MAX_CONNECTIONS {
        held.push(connect(port).await);
    }

    // Closed without an answer.
    let mut excess = connect(port).await;
    excess
        .write_all(b"GET /api/localsend/v2/info HTTP/1.1\r\nHost: localhost\r\n\r\n")
        .await
        .ok();
    assert!(read_until_closed(&mut excess).await.is_empty());

    // A closed connection frees its slot for the next one.
    drop(held.pop());
    let served = tokio::time::timeout(Duration::from_secs(5), async {
        loop {
            let mut stream = connect(port).await;
            stream
                .write_all(b"GET /api/localsend/v2/info HTTP/1.1\r\nHost: localhost\r\nConnection: close\r\n\r\n")
                .await
                .ok();
            if read_until_closed(&mut stream).await.starts_with(b"HTTP/1.1 ") {
                break;
            }
            tokio::time::sleep(Duration::from_millis(10)).await;
        }
    })
    .await;
    assert!(
        served.is_ok(),
        "no connection was served after one was closed"
    );
}
