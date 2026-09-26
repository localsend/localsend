use super::*;
use tokio::io::{AsyncReadExt, AsyncWriteExt};

fn state() -> AppState {
    AppState::new(
        Arc::new(Mutex::new(ClientInfo {
            alias: "Test".into(),
            version: "2.2".into(),
            device_model: None,
            device_type: None,
            token: "test".into(),
        })),
        None,
        None,
        WebConfig::default(),
    )
}

#[tokio::test]
async fn connection_slots_are_shared_and_released_on_completion_error_and_stop() {
    let mut state = state();
    state.connection_slots = Arc::new(Semaphore::new(2));
    let other_listener = state.clone();
    let cancel = CancellationToken::new();
    let tracker = TaskTracker::new();
    let addr = "127.0.0.1:1".parse().unwrap();

    let (first_server, first_client) = tokio::io::duplex(256);
    spawn_connection(
        first_server,
        addr,
        None,
        state.clone(),
        cancel.clone(),
        &tracker,
    );
    let (second_server, second_client) = tokio::io::duplex(256);
    spawn_connection(
        second_server,
        addr,
        None,
        other_listener.clone(),
        cancel.clone(),
        &tracker,
    );
    assert_eq!(state.connection_slots.available_permits(), 0);

    let (excess_server, mut excess_client) = tokio::io::duplex(256);
    spawn_connection(
        excess_server,
        addr,
        None,
        other_listener,
        cancel.clone(),
        &tracker,
    );
    let mut byte = [0];
    assert_eq!(excess_client.read(&mut byte).await.unwrap(), 0);

    drop(first_client);
    tokio::time::timeout(Duration::from_secs(1), async {
        while state.connection_slots.available_permits() != 1 {
            tokio::task::yield_now().await;
        }
    })
    .await
    .unwrap();

    let cert = crate::crypto::cert::generate_self_signed().unwrap();
    let acceptor = create_tls_config(
        &TlsConfig {
            cert: cert.certificate_pem,
            private_key: cert.private_key_pem,
        },
        false,
    )
    .unwrap();
    let (error_server, error_client) = tokio::io::duplex(256);
    spawn_connection(
        error_server,
        addr,
        Some(acceptor),
        state.clone(),
        cancel.clone(),
        &tracker,
    );
    assert_eq!(state.connection_slots.available_permits(), 0);
    drop(error_client);
    tokio::time::timeout(Duration::from_secs(1), async {
        while state.connection_slots.available_permits() != 1 {
            tokio::task::yield_now().await;
        }
    })
    .await
    .unwrap();

    cancel.cancel();
    tracker.close();
    tracker.wait().await;
    assert_eq!(state.connection_slots.available_permits(), 2);
    drop(second_client);
}

#[tokio::test(start_paused = true)]
async fn tls_handshake_wait_ends_after_ten_seconds() {
    let cert = crate::crypto::cert::generate_self_signed().unwrap();
    let acceptor = create_tls_config(
        &TlsConfig {
            cert: cert.certificate_pem,
            private_key: cert.private_key_pem,
        },
        false,
    )
    .unwrap();
    let (server, _client) = tokio::io::duplex(256);
    let task = tokio::spawn(serve_connection(
        server,
        "127.0.0.1:1".parse().unwrap(),
        Some(acceptor),
        state(),
    ));
    tokio::task::yield_now().await;
    tokio::time::advance(Duration::from_secs(9)).await;
    assert!(!task.is_finished());
    tokio::time::advance(Duration::from_secs(1)).await;
    tokio::task::yield_now().await;
    assert!(task.is_finished());
    task.await.unwrap();
}

#[tokio::test(start_paused = true)]
async fn first_request_deadline_closes_idle_duplex() {
    let (server, _client) = tokio::io::duplex(256);
    let task = tokio::spawn(serve_http(
        server,
        RequestClientInfo {
            ip: PeerIp::from_remote_addr(&"127.0.0.1:1".parse().unwrap()),
            cert: None,
        },
        state(),
    ));
    tokio::task::yield_now().await;
    tokio::time::advance(Duration::from_secs(29)).await;
    assert!(!task.is_finished());
    tokio::time::advance(Duration::from_secs(1)).await;
    tokio::task::yield_now().await;
    assert!(task.is_finished());
    assert!(task.await.unwrap().is_ok());
}

#[tokio::test(start_paused = true)]
async fn first_request_deadline_is_separate_from_idle_keep_alive_timeout() {
    use http_body_util::{BodyExt, Empty};

    let (server, client) = tokio::io::duplex(4096);
    let task = tokio::spawn(serve_http(
        server,
        RequestClientInfo {
            ip: PeerIp::from_remote_addr(&"127.0.0.1:1".parse().unwrap()),
            cert: None,
        },
        state(),
    ));
    tokio::task::yield_now().await;
    tokio::time::advance(Duration::from_secs(20)).await;
    let (mut sender, connection) = hyper::client::conn::http1::handshake(TokioIo::new(client))
        .await
        .unwrap();
    let client_task = tokio::spawn(connection);
    let response = sender
        .send_request(
            Request::builder()
                .uri("/")
                .header("Host", "localhost")
                .body(Empty::<bytes::Bytes>::new())
                .unwrap(),
        )
        .await
        .unwrap();
    assert_eq!(response.status(), StatusCode::FORBIDDEN);
    response.into_body().collect().await.unwrap();

    // At t=35 the initial deadline has passed, but this fully consumed
    // response has left the connection idle for only 15 seconds.
    tokio::time::advance(Duration::from_secs(15)).await;
    tokio::task::yield_now().await;
    assert!(!task.is_finished());
    tokio::time::advance(Duration::from_secs(16)).await;
    tokio::task::yield_now().await;
    assert!(task.is_finished());
    drop(sender);
    let _ = client_task.await.unwrap();
    let _ = task.await.unwrap();
}

#[tokio::test(start_paused = true)]
async fn prepare_upload_waits_for_approval_beyond_first_request_deadline() {
    use crate::http::server::v2::PrepareUploadDecisionV2;

    let (event_tx, mut event_rx) = mpsc::channel(1);
    let mut state = state();
    state.v2 = AppState::new(
        state.info.clone(),
        None,
        Some(ServerConfigV2 {
            pin: None,
            verify_checksums: true,
            event_tx,
        }),
        WebConfig::default(),
    )
    .v2;
    let (server, mut client) = tokio::io::duplex(4096);
    let task = tokio::spawn(serve_http(
        server,
        RequestClientInfo {
            ip: PeerIp::from_remote_addr(&"127.0.0.1:1".parse().unwrap()),
            cert: None,
        },
        state,
    ));
    let body = serde_json::json!({
        "info": {
            "alias": "Sender", "version": "2.2", "fingerprint": "sender",
            "port": 53317, "protocol": "http", "download": false
        },
        "files": {
            "file-a": {
                "id": "file-a", "fileName": "a.txt", "size": 1,
                "fileType": "text/plain"
            }
        }
    })
    .to_string();
    let request = format!(
        "POST /api/localsend/v2/prepare-upload HTTP/1.1\r\nHost: localhost\r\nContent-Type: application/json\r\nContent-Length: {}\r\n\r\n{body}",
        body.len()
    );
    client.write_all(request.as_bytes()).await.unwrap();
    let event = tokio::time::timeout(Duration::from_secs(1), event_rx.recv())
        .await
        .unwrap()
        .unwrap();
    let ServerEventV2::PrepareUpload { decision_tx, .. } = event else {
        panic!("expected prepare-upload approval event");
    };
    tokio::time::advance(Duration::from_secs(31)).await;
    assert!(!task.is_finished());
    decision_tx.send(PrepareUploadDecisionV2::Decline).unwrap();
    let mut response = [0; 512];
    let count = client.read(&mut response).await.unwrap();
    assert!(response[..count].starts_with(b"HTTP/1.1 403"));
    drop(client);
    let _ = task.await.unwrap();
}
