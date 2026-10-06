#![cfg(all(feature = "http", unix))]

//! Accepting a connection fails for reasons that say nothing about the
//! listener: the peer can go away before the handshake completes, or the
//! process can momentarily run out of file descriptors. The server has to keep
//! accepting afterwards — nothing tells the application that it stopped, so a
//! device would silently stop receiving files until the app is restarted.
//!
//! This test lowers the descriptor limit of its own process, which is why it
//! is the only test in this binary.

use localsend::http::server::v2::ServerEventV2;
use localsend::http::server::web::WebConfig;
use localsend::http::server::{start_with_port, ServerConfigV2};
use localsend::http::state::ClientInfo;
use std::time::Duration;
use tokio::io::{AsyncReadExt, AsyncWriteExt};
use tokio::sync::{mpsc, oneshot};

/// Descriptors this process is allowed to hold while the test runs. Low enough
/// to be exhausted quickly, high enough for the runtime and the listeners.
const DESCRIPTOR_LIMIT: u64 = 256;

/// Lowers the soft limit on open descriptors. Only ever lowers it, which needs
/// no privileges.
fn limit_descriptors() -> bool {
    // SAFETY: `getrlimit`/`setrlimit` only read and write the `rlimit` below.
    unsafe {
        let mut limit = std::mem::zeroed::<libc::rlimit>();
        if libc::getrlimit(libc::RLIMIT_NOFILE, &mut limit) != 0 {
            return false;
        }
        if limit.rlim_cur <= DESCRIPTOR_LIMIT as libc::rlim_t {
            return true;
        }
        limit.rlim_cur = DESCRIPTOR_LIMIT as libc::rlim_t;
        libc::setrlimit(libc::RLIMIT_NOFILE, &limit) == 0
    }
}

/// Requests `/info` and returns the status line.
async fn info_status(port: u16) -> std::io::Result<String> {
    let mut stream = tokio::net::TcpStream::connect(("127.0.0.1", port)).await?;
    stream
        .write_all(
            b"GET /api/localsend/v2/info HTTP/1.1\r\nHost: 127.0.0.1\r\nConnection: close\r\n\r\n",
        )
        .await?;
    let mut buf = Vec::new();
    tokio::time::timeout(Duration::from_secs(5), stream.read_to_end(&mut buf))
        .await
        .map_err(|_| std::io::Error::other("timed out"))??;
    Ok(String::from_utf8_lossy(&buf)
        .lines()
        .next()
        .unwrap_or_default()
        .to_string())
}

#[tokio::test(flavor = "multi_thread")]
async fn server_survives_descriptor_exhaustion() {
    if !limit_descriptors() {
        eprintln!("skipping: could not lower the descriptor limit");
        return;
    }

    let (event_tx, _event_rx) = mpsc::channel::<ServerEventV2>(16);
    let (_stop_tx, stop_rx) = oneshot::channel();

    // Port 0 lets the OS pick a free port, avoiding collisions between tests.
    let handle = start_with_port(
        0,
        None, // plain HTTP
        ClientInfo {
            alias: "Target".to_string(),
            version: "2.2".to_string(),
            device_model: None,
            device_type: None,
            token: "target-fingerprint".to_string(),
        },
        None,
        Some(ServerConfigV2 {
            pin: None,
            verify_checksums: true,
            event_tx,
        }),
        WebConfig::default(),
        stop_rx,
    )
    .await
    .expect("Failed to start server");
    let port = handle.port();

    for _ in 0..100 {
        if info_status(port).await.is_ok() {
            break;
        }
        tokio::time::sleep(Duration::from_millis(20)).await;
    }
    assert!(
        info_status(port).await.unwrap_or_default().contains("200"),
        "the server did not answer before the test started"
    );

    // A client in another process, so its sockets do not come out of the
    // budget this process is about to exhaust. Started first: spawning needs
    // descriptors too.
    let mut knocker = std::process::Command::new("bash")
        .arg("-c")
        .arg(format!(
            // `/dev/tcp` is a bash feature; dash does not have it.
            "for i in $(seq 1 400); do (exec 3<>/dev/tcp/127.0.0.1/{port}) 2>/dev/null; sleep 0.02; done"
        ))
        .spawn()
        .expect("failed to spawn the connecting process");
    tokio::time::sleep(Duration::from_millis(300)).await;

    // Exhaust the descriptors, so the pending connections cannot be accepted.
    let mut held: Vec<std::fs::File> = Vec::new();
    while held.len() < DESCRIPTOR_LIMIT as usize * 2 {
        match std::fs::File::open("/dev/null") {
            Ok(file) => held.push(file),
            Err(_) => break,
        }
    }
    assert!(
        !held.is_empty(),
        "no descriptor could be held, the limit is not what the test assumes"
    );

    // Let the accept loop run into them.
    tokio::time::sleep(Duration::from_secs(2)).await;

    // Give the descriptors back: the process is healthy again.
    drop(held);
    let _ = knocker.wait();
    tokio::time::sleep(Duration::from_millis(500)).await;

    let status = info_status(port).await;
    assert!(
        status.as_deref().unwrap_or_default().contains("200"),
        "the server stopped accepting after running out of descriptors: {status:?}"
    );
}
