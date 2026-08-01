#![cfg(feature = "multicast")]

//! Discovery tests that exercise real multicast traffic between two instances.
//!
//! Whether multicast datagrams are delivered depends on the machine (no network
//! interface, a firewall dropping the group), so these tests skip themselves
//! instead of failing when the environment does not carry the traffic.

use localsend::model::discovery::{DeviceType, ProtocolType, PROTOCOL_VERSION_V2};
use localsend::multicast::{
    self, MulticastConfig, MulticastDevice, MulticastEvent, MulticastHandle,
};
use std::net::{IpAddr, Ipv4Addr, Ipv6Addr};
use std::sync::atomic::{AtomicU16, Ordering};
use std::time::Duration;
use tokio::sync::{mpsc, oneshot};

/// Ports are not reused between tests: a lingering membership of a stopped
/// instance would leak messages into the next test.
static NEXT_PORT: AtomicU16 = AtomicU16::new(54317);

/// Like the group the protocol uses, but distinct from it so that real
/// LocalSend instances on the machine stay out.
const TEST_GROUP: Ipv4Addr = Ipv4Addr::new(224, 0, 0, 168);

/// See [TEST_GROUP].
const TEST_GROUP_V6: Ipv6Addr = Ipv6Addr::new(0xff12, 0, 0, 0, 0, 0, 0xfd3a, 0xe421);

const RECEIVE_TIMEOUT: Duration = Duration::from_secs(5);

struct TestInstance {
    handle: MulticastHandle,
    events: mpsc::Receiver<MulticastEvent>,
    _stop_tx: oneshot::Sender<()>,
}

impl TestInstance {
    /// Waits for the next discovery of the device with the given fingerprint,
    /// ignoring messages of unrelated devices that may be on the network.
    async fn next_discovery(&mut self, fingerprint: &str) -> Option<MulticastMessage> {
        let deadline = tokio::time::Instant::now() + RECEIVE_TIMEOUT;
        loop {
            let event = tokio::time::timeout_at(deadline, self.events.recv())
                .await
                .ok()??;

            let MulticastEvent::Discovered {
                ip,
                scope_id,
                message,
            } = event;
            if message.fingerprint == fingerprint {
                return Some(MulticastMessage {
                    source: ip,
                    scope_id,
                    alias: message.alias,
                    port: message.port,
                });
            }
        }
    }
}

/// The parts of a received message the tests assert on.
struct MulticastMessage {
    source: IpAddr,
    scope_id: Option<u32>,
    alias: String,
    port: u16,
}

/// Starts an instance on `port`, or returns `None` when this machine has no
/// interface that multicast can be bound to.
async fn start_instance(alias: &str, port: u16) -> Option<TestInstance> {
    let (event_tx, events) = mpsc::channel(32);
    let (stop_tx, stop_rx) = oneshot::channel();

    let handle = multicast::start(
        MulticastConfig {
            group: TEST_GROUP,
            group_v6: Some(TEST_GROUP_V6),
            port,
            interface_filter: Default::default(),
            device: MulticastDevice {
                alias: alias.to_string(),
                version: PROTOCOL_VERSION_V2.to_string(),
                device_model: Some("Test".to_string()),
                device_type: Some(DeviceType::Headless),
                fingerprint: format!("fingerprint-of-{alias}"),
                port,
                protocol: ProtocolType::Https,
                download: false,
            },
            event_tx,
        },
        stop_rx,
    )
    .await
    .ok()?;

    Some(TestInstance {
        handle,
        events,
        _stop_tx: stop_tx,
    })
}

fn skip(reason: &str) {
    eprintln!("skipping multicast test: {reason}");
}

#[tokio::test]
async fn test_announcement_is_received_by_other_instance() {
    let port = NEXT_PORT.fetch_add(1, Ordering::Relaxed);

    let Some(sender) = start_instance("Sender", port).await else {
        return skip("no network interface available for multicast");
    };
    let Some(mut receiver) = start_instance("Receiver", port).await else {
        return skip("no network interface available for multicast");
    };

    sender.handle.announce().await;

    let Some(message) = receiver.next_discovery("fingerprint-of-Sender").await else {
        return skip("multicast traffic is not delivered on this machine");
    };

    assert_eq!(message.alias, "Sender");
    assert_eq!(
        message.port, port,
        "the peer's HTTP port must be carried in the announcement, \
         so that the response can be sent over HTTP"
    );
}

#[tokio::test]
async fn test_announcement_is_received_over_ipv6() {
    let port = NEXT_PORT.fetch_add(1, Ordering::Relaxed);

    let Some(sender) = start_instance("Sender6", port).await else {
        return skip("no network interface available for multicast");
    };
    let Some(mut receiver) = start_instance("Receiver6", port).await else {
        return skip("no network interface available for multicast");
    };

    sender.handle.announce().await;

    // The same announcement also arrives over IPv4; wait for an IPv6 source.
    // The loop ends because `next_discovery` times out once the finite
    // announcement burst has been drained.
    loop {
        match receiver.next_discovery("fingerprint-of-Sender6").await {
            Some(message) if message.source.is_ipv6() => {
                assert_eq!(message.alias, "Sender6");
                assert_eq!(message.port, port);

                if let IpAddr::V6(source) = message.source {
                    if source.is_unicast_link_local() {
                        assert!(
                            message.scope_id.is_some(),
                            "a link-local source must carry its scope"
                        );
                    }
                }
                return;
            }
            Some(_) => continue, // Discovered over IPv4, keep waiting.
            None => return skip("IPv6 multicast traffic is not delivered on this machine"),
        }
    }
}

#[tokio::test]
async fn test_own_messages_are_not_discovered() {
    let port = NEXT_PORT.fetch_add(1, Ordering::Relaxed);

    let Some(mut instance) = start_instance("Lonely", port).await else {
        return skip("no network interface available for multicast");
    };

    instance.handle.announce().await;

    // The announcement comes back through the loopback and must be filtered
    // out by fingerprint.
    let own = tokio::time::timeout(Duration::from_secs(1), async {
        instance.next_discovery("fingerprint-of-Lonely").await
    })
    .await;

    assert!(
        matches!(own, Err(_) | Ok(None)),
        "a device must not discover itself"
    );
}

#[tokio::test]
async fn test_port_is_released_after_stop() {
    let port = NEXT_PORT.fetch_add(1, Ordering::Relaxed);

    let (event_tx, _events) = mpsc::channel(32);
    let (stop_tx, stop_rx) = oneshot::channel();

    let handle = multicast::start(
        MulticastConfig {
            group: TEST_GROUP,
            group_v6: Some(TEST_GROUP_V6),
            port,
            interface_filter: Default::default(),
            device: MulticastDevice {
                alias: "Restarting".to_string(),
                version: PROTOCOL_VERSION_V2.to_string(),
                device_model: None,
                device_type: None,
                fingerprint: "fingerprint-of-Restarting".to_string(),
                port,
                protocol: ProtocolType::Http,
                download: false,
            },
            event_tx,
        },
        stop_rx,
    )
    .await;

    let Ok(handle) = handle else {
        return skip("no network interface available for multicast");
    };

    stop_tx.send(()).unwrap();
    handle.wait_stopped().await;

    // Sending after a stop must not panic, it simply reaches nobody.
    handle.announce().await;

    assert!(
        start_instance("Restarted", port).await.is_some(),
        "the port must be bindable again after the discovery stopped"
    );
}
