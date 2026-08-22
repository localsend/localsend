#![cfg(feature = "discovery")]

//! Emitting an informational event must never block the work that produced it.
//!
//! Registrations and discoveries arrive in bursts — a subnet scan confirms up
//! to 255 devices, and every device on the network answers an announcement —
//! while the event channels hold a handful of items. Waiting for the
//! application to catch up would stall an HTTP request handler, or a scan, for
//! as long as the application is busy.

use localsend::crypto::cert::generate_self_signed;
use localsend::discovery::{self, DeviceIdentity, DiscoveryConfig, DiscoveryEvent};
use localsend::http::client::LsHttpClientV2;
use localsend::http::dto_v2::RegisterDtoV2;
use localsend::http::server::v2::ServerEventV2;
use localsend::http::server::{start_with_port, ServerConfigV2};
use localsend::http::state::ClientInfo;
use localsend::model::discovery::{DeviceType, ProtocolType, PROTOCOL_VERSION_V2};
use localsend::multicast::MulticastDevice;
use std::net::Ipv4Addr;
use std::sync::atomic::{AtomicU16, Ordering};
use std::time::Duration;
use tokio::sync::{mpsc, oneshot};

/// The capacity the isolate layer uses for both event channels.
const CHANNEL_CAPACITY: usize = 16;

/// Multicast ports are not reused between tests: a lingering membership of a
/// stopped instance would leak messages into the next test.
static NEXT_MULTICAST_PORT: AtomicU16 = AtomicU16::new(43551);

fn register_dto(port: u16) -> RegisterDtoV2 {
    RegisterDtoV2 {
        alias: "Probe".to_string(),
        version: PROTOCOL_VERSION_V2.to_string(),
        device_model: None,
        device_type: None,
        fingerprint: "probe-fingerprint".to_string(),
        port,
        protocol: ProtocolType::Http,
        download: false,
    }
}

/// Starts a v2 server whose event receiver is kept alive but never read, i.e.
/// an application that is busy. Returns the port the OS picked.
async fn start_server_with_stalled_events(
) -> (u16, oneshot::Sender<()>, mpsc::Receiver<ServerEventV2>) {
    let (event_tx, event_rx) = mpsc::channel::<ServerEventV2>(CHANNEL_CAPACITY);
    let (stop_tx, stop_rx) = oneshot::channel();

    let handle = start_with_port(
        0,
        None, // plain HTTP
        ClientInfo {
            alias: "Target".to_string(),
            version: PROTOCOL_VERSION_V2.to_string(),
            device_model: None,
            device_type: Some(DeviceType::Headless),
            token: "target-fingerprint".to_string(),
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

    (handle.port(), stop_tx, event_rx)
}

/// More registrations than the event channel holds must all be answered, even
/// though the application reads none of them.
#[tokio::test(flavor = "multi_thread")]
async fn register_keeps_answering_when_events_are_not_consumed() {
    let (port, _stop_tx, _event_rx) = start_server_with_stalled_events().await;

    let cert = generate_self_signed().expect("Failed to generate an identity");
    let client = LsHttpClientV2::try_new(
        &cert.private_key_pem,
        &cert.certificate_pem,
        None,
        Some(Duration::from_secs(2)),
    )
    .expect("client");

    let requests = CHANNEL_CAPACITY * 4;
    for i in 0..requests {
        client
            .register(ProtocolType::Http, "127.0.0.1", port, register_dto(port))
            .await
            .unwrap_or_else(|err| {
                panic!("register #{i} was not answered ({requests} sent, channel holds {CHANNEL_CAPACITY}): {err}")
            });
    }
}

/// A scan that confirms more devices than the event channel holds must still
/// finish and return them, even though the application reads no event.
#[tokio::test(flavor = "multi_thread")]
async fn subnet_scan_finishes_when_events_are_not_consumed() {
    // Every 127.0.0.x address reaches this server, so the scan confirms the
    // whole subnet at once.
    let (port, _stop_tx, _server_event_rx) = start_server_with_stalled_events().await;

    let cert = generate_self_signed().expect("Failed to generate an identity");
    let (event_tx, _events) = mpsc::channel::<DiscoveryEvent>(CHANNEL_CAPACITY);
    let (_discovery_stop_tx, discovery_stop_rx) = oneshot::channel();

    let handle = discovery::start(
        DiscoveryConfig {
            group: Ipv4Addr::new(224, 0, 0, 171),
            group_v6: None,
            port: NEXT_MULTICAST_PORT.fetch_add(1, Ordering::SeqCst),
            interface_filter: Default::default(),
            device: MulticastDevice {
                alias: "Scanner".to_string(),
                version: PROTOCOL_VERSION_V2.to_string(),
                device_model: None,
                device_type: Some(DeviceType::Headless),
                fingerprint: cert.fingerprint.clone(),
                port,
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
        discovery_stop_rx,
    )
    .await;

    let found = tokio::time::timeout(
        Duration::from_secs(30),
        handle.scan_subnet(Ipv4Addr::new(127, 0, 0, 99), port, ProtocolType::Http),
    )
    .await
    .expect("the scan blocked on the full event channel")
    .expect("Subnet scan failed");

    assert!(
        found.len() > CHANNEL_CAPACITY,
        "the scan must return every confirmed device, got {} for a channel of {CHANNEL_CAPACITY}",
        found.len()
    );
}
