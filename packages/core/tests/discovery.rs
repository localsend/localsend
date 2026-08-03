#![cfg(feature = "discovery")]

//! End-to-end discovery tests: real HTTP servers confirm the register
//! requests. Most tests use plain HTTP; the client side of TLS pinning is
//! covered by `v2_tls_pinning.rs`.
//!
//! Binding multicast sockets and delivering multicast traffic depends on the
//! machine, so these tests skip themselves instead of failing when the
//! environment does not cooperate.

use localsend::crypto::cert::generate_self_signed;
use localsend::discovery::{
    self, DeviceIdentity, DiscoveryConfig, DiscoveryEvent, DiscoveryHandle,
};
use localsend::http::server::{start_with_port, ServerConfigV2, TlsConfig};
use localsend::http::state::ClientInfo;
use localsend::model::discovery::{DeviceType, ProtocolType, PROTOCOL_VERSION_V2};
use localsend::multicast::{InterfaceFilter, MulticastDevice};
use std::net::{Ipv4Addr, Ipv6Addr};
use std::sync::atomic::{AtomicU16, Ordering};
use std::time::Duration;
use tokio::sync::{mpsc, oneshot};

/// Like the group the protocol uses, but distinct from it (and from the one in
/// `multicast.rs`) so that unrelated instances stay out.
const TEST_GROUP: Ipv4Addr = Ipv4Addr::new(224, 0, 0, 169);

/// See [TEST_GROUP].
const TEST_GROUP_V6: Ipv6Addr = Ipv6Addr::new(0xff12, 0, 0, 0, 0, 0, 0xfd3a, 0xe422);

const RECEIVE_TIMEOUT: Duration = Duration::from_secs(5);

/// Multicast ports are not reused between tests: a lingering membership of a
/// stopped instance would leak messages into the next test.
static NEXT_MULTICAST_PORT: AtomicU16 = AtomicU16::new(55317);

/// Returns a free port for an HTTP server.
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

/// Starts a v2 server on `port` that only exists to answer register requests
/// with the given identity, over TLS when `tls` is given.
async fn start_register_server(
    port: u16,
    alias: &str,
    fingerprint: &str,
    tls: Option<TlsConfig>,
) -> oneshot::Sender<()> {
    let _ = tracing_subscriber::fmt().with_test_writer().try_init();

    // The receiver is dropped: the register endpoint responds either way.
    let (event_tx, _) = mpsc::channel(16);
    let (stop_tx, stop_rx) = oneshot::channel();

    start_with_port(
        port,
        tls,
        ClientInfo {
            alias: alias.to_string(),
            version: PROTOCOL_VERSION_V2.to_string(),
            device_model: Some("Rust".to_string()),
            device_type: Some(DeviceType::Headless),
            token: fingerprint.to_string(),
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

    for _ in 0..100 {
        if tokio::net::TcpStream::connect(("127.0.0.1", port))
            .await
            .is_ok()
        {
            return stop_tx;
        }
        tokio::time::sleep(Duration::from_millis(20)).await;
    }
    panic!("Server did not become reachable on port {port}");
}

struct TestInstance {
    fingerprint: String,
    handle: DiscoveryHandle,
    events: mpsc::Receiver<DiscoveryEvent>,
    _stop_tx: oneshot::Sender<()>,
}

impl TestInstance {
    /// Waits for the discovery of the device with the given fingerprint,
    /// ignoring unrelated devices that may be on the network.
    async fn next_discovery(
        &mut self,
        fingerprint: &str,
    ) -> Option<localsend::discovery::DiscoveredDevice> {
        let deadline = tokio::time::Instant::now() + RECEIVE_TIMEOUT;
        loop {
            let event = tokio::time::timeout_at(deadline, self.events.recv())
                .await
                .ok()??;
            let DiscoveryEvent::Discovered { device } = event else {
                continue;
            };
            if device.fingerprint == fingerprint {
                return Some(device);
            }
        }
    }
}

/// Starts a discovery instance announcing `server_port` as its HTTP port, or
/// returns `None` when this machine has no interface multicast can be bound to.
async fn start_instance(
    alias: &str,
    multicast_port: u16,
    server_port: u16,
) -> Option<TestInstance> {
    let cert = generate_self_signed().expect("Failed to generate an identity");
    let (event_tx, events) = mpsc::channel(32);
    let (stop_tx, stop_rx) = oneshot::channel();

    let handle = discovery::start(
        DiscoveryConfig {
            group: TEST_GROUP,
            group_v6: Some(TEST_GROUP_V6),
            port: multicast_port,
            interface_filter: Default::default(),
            device: MulticastDevice {
                alias: alias.to_string(),
                version: PROTOCOL_VERSION_V2.to_string(),
                device_model: Some("Rust".to_string()),
                device_type: Some(DeviceType::Headless),
                fingerprint: cert.fingerprint.clone(),
                port: server_port,
                protocol: ProtocolType::Http,
                download: false,
            },
            identity: DeviceIdentity {
                cert_pem: cert.certificate_pem,
                private_key_pem: cert.private_key_pem,
            },
            timeout: discovery::DEFAULT_DISCOVERY_TIMEOUT,
            event_tx: Some(event_tx),
        },
        stop_rx,
    )
    .await;
    if handle.multicast_error().is_some() {
        return None;
    }

    Some(TestInstance {
        fingerprint: cert.fingerprint,
        handle,
        events,
        _stop_tx: stop_tx,
    })
}

fn skip(reason: &str) {
    eprintln!("skipping discovery test: {reason}");
}

#[tokio::test]
async fn test_targeted_discovery_stores_and_emits_device() {
    let multicast_port = NEXT_MULTICAST_PORT.fetch_add(1, Ordering::Relaxed);
    let server_port = free_port();
    let _server_stop =
        start_register_server(server_port, "Target", "target-fingerprint", None).await;

    let Some(mut instance) = start_instance("Finder", multicast_port, free_port()).await else {
        return skip("no network interface available for multicast");
    };

    let device = instance
        .handle
        .discover("127.0.0.1", server_port, ProtocolType::Http)
        .await
        .expect("Targeted discovery failed")
        .expect("The target must not be mistaken for the device itself");

    assert_eq!(device.device.alias, "Target");
    assert_eq!(device.device.fingerprint, "target-fingerprint");
    let http = device
        .device
        .http()
        .expect("The device must have an HTTP channel");
    assert_eq!(http.host, "127.0.0.1");
    assert_eq!(http.port, server_port);

    let stored = instance
        .handle
        .device_by_fingerprint("target-fingerprint")
        .expect("The discovered device must be stored");
    assert_eq!(stored.device.alias, "Target");

    let emitted = instance
        .next_discovery("target-fingerprint")
        .await
        .expect("The discovered device must be emitted");
    assert_eq!(emitted.alias, "Target");

    // Discovering the same device again emits Updated instead of Discovered.
    let updated = instance
        .handle
        .discover("127.0.0.1", server_port, ProtocolType::Http)
        .await
        .expect("Targeted discovery failed")
        .expect("The target must still be discoverable");
    assert_eq!(instance.handle.devices().len(), 1);
    assert_eq!(
        updated.logs.len(),
        2,
        "every confirmation must be logged on the stored device"
    );
    match instance.events.try_recv() {
        Ok(DiscoveryEvent::Updated { device }) => {
            assert_eq!(device.fingerprint, "target-fingerprint");
        }
        other => panic!("expected an Updated event for a known device, got {other:?}"),
    }
}

#[tokio::test]
async fn test_targeted_discovery_does_not_discover_itself() {
    let multicast_port = NEXT_MULTICAST_PORT.fetch_add(1, Ordering::Relaxed);

    let Some(instance) = start_instance("Selfish", multicast_port, free_port()).await else {
        return skip("no network interface available for multicast");
    };

    // A server answering with this instance's own fingerprint, as the
    // instance's real server would.
    let server_port = free_port();
    let _server_stop =
        start_register_server(server_port, "Selfish", &instance.fingerprint, None).await;

    let device = instance
        .handle
        .discover("127.0.0.1", server_port, ProtocolType::Http)
        .await
        .expect("Targeted discovery failed");

    assert!(device.is_none(), "a device must not discover itself");
    assert!(instance.handle.devices().is_empty());
}

#[tokio::test]
async fn test_subnet_scan_finds_device_on_loopback() {
    let multicast_port = NEXT_MULTICAST_PORT.fetch_add(1, Ordering::Relaxed);
    let server_port = free_port();
    let _server_stop =
        start_register_server(server_port, "ScanTarget", "scan-fingerprint", None).await;

    let Some(mut instance) = start_instance("Scanner", multicast_port, free_port()).await else {
        return skip("no network interface available for multicast");
    };

    // The scan probes 127.0.0.0/24 except the interface address itself.
    // Loopback routes the whole subnet to this host, so depending on the OS
    // the server is found on one or many of the addresses.
    let found = instance
        .handle
        .scan_subnet(
            Ipv4Addr::new(127, 0, 0, 99),
            server_port,
            ProtocolType::Http,
        )
        .await
        .expect("Subnet scan failed");

    assert!(!found.is_empty(), "the scan must find the loopback server");
    assert!(found
        .iter()
        .all(|device| device.device.fingerprint == "scan-fingerprint"));

    let stored = instance
        .handle
        .device_by_fingerprint("scan-fingerprint")
        .expect("The scanned device must be stored");
    assert_eq!(stored.device.alias, "ScanTarget");
    assert!(
        stored
            .channels
            .keys()
            .filter_map(|channel| channel.http())
            .all(|http| http.host != "127.0.0.99"),
        "the interface address itself must not be probed"
    );

    let emitted = instance
        .next_discovery("scan-fingerprint")
        .await
        .expect("The scanned device must be emitted");
    assert_eq!(emitted.alias, "ScanTarget");
}

#[tokio::test]
async fn test_targeted_discovery_reads_fingerprint_from_certificate_on_https() {
    let multicast_port = NEXT_MULTICAST_PORT.fetch_add(1, Ordering::Relaxed);

    let Some(instance) = start_instance("TlsFinder", multicast_port, free_port()).await else {
        return skip("no network interface available for multicast");
    };

    // A TLS server whose response body claims a fingerprint that does not
    // match its certificate.
    let server_cert = generate_self_signed().expect("Failed to generate an identity");
    let server_port = free_port();
    let _server_stop = start_register_server(
        server_port,
        "TlsTarget",
        "claimed-fingerprint",
        Some(TlsConfig {
            cert: server_cert.certificate_pem.clone(),
            private_key: server_cert.private_key_pem.clone(),
        }),
    )
    .await;

    let device = instance
        .handle
        .discover("127.0.0.1", server_port, ProtocolType::Https)
        .await
        .expect("Targeted discovery failed")
        .expect("The target must not be mistaken for the device itself");

    assert_eq!(
        device.device.fingerprint, server_cert.fingerprint,
        "on HTTPS the identity must be the certificate fingerprint, not the claimed one"
    );
    assert!(instance
        .handle
        .device_by_fingerprint(&server_cert.fingerprint)
        .is_some());
    assert!(instance
        .handle
        .device_by_fingerprint("claimed-fingerprint")
        .is_none());
}

#[tokio::test]
async fn test_discovery_works_without_multicast() {
    let server_port = free_port();
    let _server_stop =
        start_register_server(server_port, "Target", "target-fingerprint", None).await;

    // An interface whitelist matching no interface makes the multicast side
    // fail deterministically.
    let cert = generate_self_signed().expect("Failed to generate an identity");
    let (stop_tx, stop_rx) = oneshot::channel();
    let handle = discovery::start(
        DiscoveryConfig {
            group: TEST_GROUP,
            group_v6: Some(TEST_GROUP_V6),
            port: NEXT_MULTICAST_PORT.fetch_add(1, Ordering::Relaxed),
            interface_filter: InterfaceFilter {
                whitelist: Some(vec!["203.0.113.1".to_string()]),
                blacklist: None,
            },
            device: MulticastDevice {
                alias: "NoMulticast".to_string(),
                version: PROTOCOL_VERSION_V2.to_string(),
                device_model: Some("Rust".to_string()),
                device_type: Some(DeviceType::Headless),
                fingerprint: cert.fingerprint.clone(),
                port: free_port(),
                protocol: ProtocolType::Http,
                download: false,
            },
            identity: DeviceIdentity {
                cert_pem: cert.certificate_pem,
                private_key_pem: cert.private_key_pem,
            },
            timeout: discovery::DEFAULT_DISCOVERY_TIMEOUT,
            event_tx: None,
        },
        stop_rx,
    )
    .await;

    assert!(
        handle.multicast_error().is_some(),
        "no interface matches the whitelist, so multicast must be unavailable"
    );

    // Announcing is a no-op, the active operations still work.
    handle.announce().await;
    let device = handle
        .discover("127.0.0.1", server_port, ProtocolType::Http)
        .await
        .expect("Targeted discovery failed")
        .expect("The target must not be mistaken for the device itself");
    assert_eq!(device.device.alias, "Target");
    assert!(handle.device_by_fingerprint("target-fingerprint").is_some());

    // Stopping must not hang without multicast sockets to close.
    drop(stop_tx);
    handle.wait_stopped().await;
}

#[tokio::test]
async fn test_announcement_is_answered_and_device_stored() {
    let multicast_port = NEXT_MULTICAST_PORT.fetch_add(1, Ordering::Relaxed);

    // The receiver answers the announcement with a register request to the
    // announcer's HTTP server, so the announcer needs a real one.
    let Some(mut receiver) = start_instance("Receiver", multicast_port, free_port()).await else {
        return skip("no network interface available for multicast");
    };
    let announcer_port = free_port();
    let Some(announcer) = start_instance("Announcer", multicast_port, announcer_port).await else {
        return skip("no network interface available for multicast");
    };
    let _server_stop =
        start_register_server(announcer_port, "Announcer", &announcer.fingerprint, None).await;

    announcer.handle.announce().await;

    let Some(device) = receiver.next_discovery(&announcer.fingerprint).await else {
        return skip("multicast traffic is not delivered on this machine");
    };

    assert_eq!(device.alias, "Announcer");
    let http = device.http().expect("The device must have an HTTP channel");
    assert_eq!(http.port, announcer_port);
    assert_eq!(http.protocol, ProtocolType::Http);

    assert!(
        receiver
            .handle
            .device_by_fingerprint(&announcer.fingerprint)
            .is_some(),
        "the announced device must be stored"
    );
    assert!(
        announcer
            .handle
            .device_by_fingerprint(&receiver.fingerprint)
            .is_none(),
        "answering over HTTP must not make the receiver appear on the announcer's side"
    );
}
