//! UDP multicast discovery for the LocalSend protocol (v2.1).
//!
//! Devices announce themselves by sending a [`MulticastMessageV2`] to the
//! multicast group. Announcements are only ever sent, never answered over UDP:
//! the answer is an HTTP register request to the announcing device, which is
//! left to the application.
//!
//! [`start`] binds the sockets and emits a [`MulticastEvent`] per announcement;
//! the returned [`MulticastHandle`] drives the application-initiated side.

mod interface;
mod socket;

pub use interface::InterfaceFilter;

use crate::model::discovery::{DeviceType, MulticastMessageV2, ProtocolType};
use serde::Serialize;
use socket::MulticastSocket;
use std::net::{IpAddr, Ipv4Addr, Ipv6Addr, SocketAddr};
use std::sync::Arc;
use std::time::Duration;
use tokio::net::UdpSocket;
use tokio::sync::{mpsc, oneshot, Mutex, RwLock};
use tokio_util::sync::CancellationToken;

/// The multicast group used by LocalSend.
///
/// It is inside `224.0.0.0/24` because on some Android devices this is the only
/// IP range that can receive UDP multicast messages.
pub const DEFAULT_MULTICAST_GROUP: Ipv4Addr = Ipv4Addr::new(224, 0, 0, 167);

/// The IPv6 multicast group used by LocalSend, a transient (`ff1x::`) group
/// with link-local scope.
///
/// IPv6 discovery is a LocalSend extension on top of protocol v2.1, so IPv4
/// remains the baseline and IPv6 is announced in parallel.
pub const DEFAULT_MULTICAST_GROUP_V6: Ipv6Addr =
    Ipv6Addr::new(0xff12, 0, 0, 0, 0, 0, 0xfd3a, 0xe420);

/// The default multicast port, identical to the default HTTP server port.
pub const DEFAULT_PORT: u16 = 53317;

/// Delays before each message of an announcement burst.
///
/// A single datagram is easily lost and devices that just joined the network
/// may not be ready to answer yet, so an announcement is repeated.
const ANNOUNCE_DELAYS: [Duration; 3] = [
    Duration::from_millis(100),
    Duration::from_millis(500),
    Duration::from_millis(2000),
];

/// The largest datagram that is read at once. Announcements are far smaller;
/// anything bigger is truncated and then fails to parse.
const RECEIVE_BUFFER_SIZE: usize = 65536;

/// How many consecutive receive errors are tolerated before a socket is given
/// up on. Receiving may fail transiently (on Windows an ICMP error of a
/// previous send surfaces on the next receive).
const MAX_CONSECUTIVE_RECEIVE_ERRORS: u32 = 10;

/// The device information that is announced to the network.
#[derive(Clone, Debug)]
pub struct MulticastDevice {
    /// The display name of this device.
    pub alias: String,

    /// Protocol version (major.minor) implemented by this device.
    pub version: String,

    /// Device model (e.g. "Samsung", "Windows").
    pub device_model: Option<String>,

    /// Device type category.
    pub device_type: Option<DeviceType>,

    /// Fingerprint identifying this device.
    /// In HTTPS mode the SHA-256 hash of the certificate, otherwise a random string.
    ///
    /// Messages carrying this fingerprint are ignored (multicast loopback).
    pub fingerprint: String,

    /// The port of this device's HTTP server, which is not necessarily the
    /// multicast port.
    pub port: u16,

    /// Whether this device's HTTP server uses TLS.
    pub protocol: ProtocolType,

    /// Whether this device's download API is active.
    pub download: bool,
}

impl MulticastDevice {
    fn to_message(&self) -> MulticastMessageV2 {
        MulticastMessageV2 {
            alias: self.alias.clone(),
            version: self.version.clone(),
            device_model: self.device_model.clone(),
            device_type: self.device_type.clone(),
            fingerprint: self.fingerprint.clone(),
            port: self.port,
            protocol: self.protocol,
            download: self.download,
        }
    }
}

/// Configuration of the multicast discovery.
pub struct MulticastConfig {
    /// The multicast group to join, usually [`DEFAULT_MULTICAST_GROUP`].
    pub group: Ipv4Addr,

    /// The IPv6 multicast group to additionally join, usually
    /// [`DEFAULT_MULTICAST_GROUP_V6`]. `None` disables IPv6 discovery.
    ///
    /// A dual-stack peer is discovered over both families; deduplicating by
    /// fingerprint is left to the application.
    pub group_v6: Option<Ipv6Addr>,

    /// The port to bind, usually [`DEFAULT_PORT`].
    pub port: u16,

    /// Restricts the network interfaces that are used.
    pub interface_filter: InterfaceFilter,

    /// The device information announced to the network.
    pub device: MulticastDevice,

    /// Channel on which discovery emits events that must be handled by the application.
    pub event_tx: mpsc::Sender<MulticastEvent>,
}

/// An event emitted by the multicast discovery.
#[derive(Clone, Debug)]
pub enum MulticastEvent {
    /// Another device announced itself.
    ///
    /// The peer expects to be answered with an HTTP register request.
    Discovered {
        /// The address the datagram was sent from. The peer's HTTP server is
        /// reachable at this address on `message.port`.
        ip: IpAddr,

        /// The scope (interface index) the datagram was received with.
        /// Only set for IPv6 sources that carry one, i.e. link-local
        /// addresses, which are unreachable without it.
        scope_id: Option<u32>,

        /// The message as it was received.
        message: MulticastMessageV2,
    },
}

/// A socket announcements are sent on, together with its target address.
#[derive(Clone)]
struct SendSocket {
    target: SocketAddr,
    socket: Arc<UdpSocket>,
}

struct MulticastState {
    device: MulticastDevice,

    /// The sockets used for sending. Emptied once discovery is stopped, which
    /// releases the port and turns further sends into no-ops.
    sockets: RwLock<Vec<SendSocket>>,
}

/// A [`MulticastMessageV2`] plus the legacy `announce` flag of protocol v2.
#[derive(Serialize)]
struct AnnouncedMessage {
    #[serde(flatten)]
    message: MulticastMessageV2,
    announce: bool,
}

impl MulticastState {
    /// Sends one announcement on every interface. Failing interfaces are
    /// skipped: discovery on the remaining ones must keep working.
    async fn send(&self) {
        let message = AnnouncedMessage {
            message: self.device.to_message(),
            announce: true,
        };
        let payload = match serde_json::to_vec(&message) {
            Ok(payload) => payload,
            Err(err) => {
                tracing::error!("Could not serialize multicast message: {err:#}");
                return;
            }
        };

        let sockets = self.sockets.read().await.clone();
        for SendSocket { target, socket } in sockets {
            if let Err(err) = socket.send_to(&payload, target).await {
                tracing::warn!("Could not send multicast message to {target}: {err:#}");
            }
        }
    }
}

/// A handle to a running multicast discovery, for interactions initiated by
/// the application.
pub struct MulticastHandle {
    state: Arc<MulticastState>,
    cancel: CancellationToken,

    /// The task supervising the receive loops. Completes after a stop has been
    /// requested and all sockets have been closed.
    task: Mutex<Option<tokio::task::JoinHandle<()>>>,
}

impl MulticastHandle {
    /// Announces this device to the network, which makes every other LocalSend
    /// device on it register with this device over HTTP.
    ///
    /// Returns once the whole announcement burst has been sent, which takes a
    /// few seconds, or immediately once discovery has been stopped.
    pub async fn announce(&self) {
        for delay in ANNOUNCE_DELAYS {
            tokio::select! {
                _ = self.cancel.cancelled() => return,
                _ = tokio::time::sleep(delay) => {}
            }

            tracing::debug!("Announcing via UDP multicast");
            self.state.send().await;
        }
    }

    /// Waits until discovery has terminated and all sockets have been closed,
    /// so that the port can be bound again.
    /// Must be called after requesting a stop via the stop channel.
    pub async fn wait_stopped(&self) {
        if let Some(task) = self.task.lock().await.take() {
            let _ = task.await;
        }
    }
}

/// Binds one socket per usable network interface and starts listening for
/// discovery messages of other devices.
///
/// Nothing is sent until [`MulticastHandle::announce`] is called.
///
/// Fails when no network interface could be used, e.g. because the port is
/// already bound by another process or because there is no network at all.
pub async fn start(
    config: MulticastConfig,
    stop_rx: oneshot::Receiver<()>,
) -> anyhow::Result<MulticastHandle> {
    let sockets = socket::bind_multicast_sockets(
        config.group,
        config.group_v6,
        config.port,
        &config.interface_filter,
    )?;
    if sockets.is_empty() {
        anyhow::bail!(
            "No network interface available for multicast on port {}",
            config.port
        );
    }

    let state = Arc::new(MulticastState {
        device: config.device,
        sockets: RwLock::new(
            sockets
                .iter()
                .map(|socket| SendSocket {
                    target: socket.target,
                    socket: socket.socket.clone(),
                })
                .collect(),
        ),
    });

    let cancel = CancellationToken::new();

    let task = tokio::spawn({
        let state = state.clone();
        let cancel = cancel.clone();
        async move {
            let mut receivers = tokio::task::JoinSet::new();
            for socket in sockets {
                receivers.spawn(receive_loop(
                    socket,
                    state.clone(),
                    config.event_tx.clone(),
                    cancel.clone(),
                ));
            }

            tokio::select! {
                // All receive loops gave up on their socket.
                _ = async { while receivers.join_next().await.is_some() {} } => {}
                _ = stop_rx => {}
            }

            cancel.cancel();

            // Wait for the sockets to be released, so that the port is free
            // once this task completes.
            receivers.shutdown().await;
            state.sockets.write().await.clear();
        }
    });

    Ok(MulticastHandle {
        state,
        cancel,
        task: Mutex::new(Some(task)),
    })
}

/// Reads discovery messages from a single interface until discovery is stopped
/// or the socket keeps failing.
async fn receive_loop(
    socket: MulticastSocket,
    state: Arc<MulticastState>,
    event_tx: mpsc::Sender<MulticastEvent>,
    cancel: CancellationToken,
) {
    let mut buffer = vec![0u8; RECEIVE_BUFFER_SIZE];
    let mut consecutive_errors = 0;

    loop {
        let received = tokio::select! {
            _ = cancel.cancelled() => return,
            received = socket.socket.recv_from(&mut buffer) => received,
        };

        let (size, source) = match received {
            Ok(received) => {
                consecutive_errors = 0;
                received
            }
            Err(err) => {
                consecutive_errors += 1;
                tracing::warn!(
                    "Could not receive multicast message on interface {}: {err:#}",
                    socket.description,
                );
                if consecutive_errors >= MAX_CONSECUTIVE_RECEIVE_ERRORS {
                    tracing::error!(
                        "Giving up on multicast interface {} after {consecutive_errors} consecutive errors",
                        socket.description,
                    );
                    return;
                }
                continue;
            }
        };

        let message = match serde_json::from_slice::<MulticastMessageV2>(&buffer[..size]) {
            Ok(message) => message,
            Err(err) => {
                tracing::warn!("Could not parse multicast message from {source}: {err:#}");
                continue;
            }
        };

        // Loopback is enabled, so our own messages come back as well.
        if message.fingerprint == state.device.fingerprint {
            continue;
        }

        let event = MulticastEvent::Discovered {
            ip: source.ip(),
            scope_id: match &source {
                SocketAddr::V6(source) if source.scope_id() != 0 => Some(source.scope_id()),
                _ => None,
            },
            message,
        };

        if event_tx.send(event).await.is_err() {
            tracing::debug!("Multicast event receiver dropped, stopping discovery");
            return;
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_sent_message_carries_legacy_announce_flag() {
        let device = MulticastDevice {
            alias: "Nice Orange".to_string(),
            version: "2.1".to_string(),
            device_model: None,
            device_type: Some(DeviceType::Desktop),
            fingerprint: "my-fingerprint".to_string(),
            port: 53317,
            protocol: ProtocolType::Https,
            download: false,
        };

        let json = serde_json::to_string(&AnnouncedMessage {
            message: device.to_message(),
            announce: true,
        })
        .unwrap();

        assert!(json.contains("\"announce\":true"));
        assert!(json.contains("\"alias\":\"Nice Orange\""));
        assert!(json.contains("\"fingerprint\":\"my-fingerprint\""));
        assert!(json.contains("\"deviceType\":\"desktop\""));
        assert!(!json.contains("deviceModel"));
    }
}
