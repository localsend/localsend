mod store;

pub use store::{
    ChannelStatus, DeviceChannel, DeviceLog, DeviceLogKind, DiscoveredDevice, HttpChannel,
    StatefulDevice,
};

use crate::http::client::{ClientError, LsHttpClientV2};
use crate::http::dto_v2::{RegisterDtoV2, RegisterResponseDtoV2};
use crate::model::discovery::{MulticastMessageV2, ProtocolType};
use crate::multicast::{
    self, InterfaceFilter, MulticastConfig, MulticastDevice, MulticastEvent, MulticastHandle,
};
use futures_util::StreamExt;
use std::collections::HashSet;
use std::net::{IpAddr, Ipv4Addr, Ipv6Addr};
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::Arc;
use std::time::{Duration, SystemTime};
use store::DeviceStore;
use tokio::sync::{mpsc, oneshot};

/// The default timeout of the register requests sent by discovery, matching
/// the Flutter app's default discovery timeout. Discovery only talks to LAN
/// peers, which answer quickly or not at all.
pub const DEFAULT_DISCOVERY_TIMEOUT: Duration = Duration::from_millis(500);

/// Capacity of the internal multicast event channel.
const MULTICAST_CHANNEL_SIZE: usize = 64;

/// How many hosts a subnet scan probes at once, matching the Flutter app's
/// legacy HTTP discovery.
const SCAN_CONCURRENCY: usize = 50;

/// This device's TLS identity, sent as client certificate with every register
/// request (client certificates are mandatory in HTTPS mode).
///
/// Its fingerprint is the one carried in [`MulticastDevice::fingerprint`].
#[derive(Clone)]
pub struct DeviceIdentity {
    /// PEM-encoded certificate.
    pub cert_pem: String,

    /// PEM-encoded private key.
    pub private_key_pem: String,
}

/// Configuration of the discovery.
pub struct DiscoveryConfig {
    /// The multicast group to join, usually [`multicast::DEFAULT_MULTICAST_GROUP`].
    pub group: Ipv4Addr,

    /// The IPv6 multicast group to additionally join, usually
    /// [`multicast::DEFAULT_MULTICAST_GROUP_V6`]. `None` disables IPv6 discovery.
    pub group_v6: Option<Ipv6Addr>,

    /// The multicast port to bind, usually [`multicast::DEFAULT_PORT`].
    pub port: u16,

    /// Restricts the network interfaces that are used.
    pub interface_filter: InterfaceFilter,

    /// The device information announced to the network and sent in register
    /// requests.
    pub device: MulticastDevice,

    /// The TLS identity used for the register requests.
    pub identity: DeviceIdentity,

    /// Timeout of each register request sent by discovery, usually
    /// [`DEFAULT_DISCOVERY_TIMEOUT`]. Bounds how long an unresponsive host
    /// stalls a subnet scan, so keep it short.
    pub timeout: Duration,

    /// Channel on which discovery events are emitted. `None` when the
    /// application only polls [`DiscoveryHandle::devices`].
    pub event_tx: Option<mpsc::Sender<DiscoveryEvent>>,
}

/// An event emitted by the discovery. Every event is also logged in
/// [`StatefulDevice::logs`]; the accumulated state is read from
/// [`DiscoveryHandle::devices`].
#[derive(Clone, Debug)]
pub enum DiscoveryEvent {
    /// A device was confirmed over one of its channels for the first time
    /// in this run.
    Discovered {
        /// The device as it was confirmed, i.e. carrying only the channel
        /// the confirmation happened on.
        device: DiscoveredDevice,
    },

    /// An already known device was confirmed again: it re-announced itself
    /// or was re-discovered, at a known or a new address.
    Updated {
        /// The device as it was confirmed, like in
        /// [`DiscoveryEvent::Discovered`].
        device: DiscoveredDevice,
    },
}

struct DiscoveryState {
    device: MulticastDevice,
    identity: DeviceIdentity,
    timeout: Duration,
    store: DeviceStore,
    event_tx: Option<mpsc::Sender<DiscoveryEvent>>,

    /// Whether announcements of other devices are answered, see
    /// [`DiscoveryHandle::set_answer_announcements`].
    answering: AtomicBool,

    /// The interface addresses a subnet scan is currently running for.
    scanning: std::sync::Mutex<HashSet<Ipv4Addr>>,
}

impl DiscoveryState {
    fn register_dto(&self) -> RegisterDtoV2 {
        RegisterDtoV2 {
            alias: self.device.alias.clone(),
            version: self.device.version.clone(),
            device_model: self.device.device_model.clone(),
            device_type: self.device.device_type.clone(),
            fingerprint: self.device.fingerprint.clone(),
            port: self.device.port,
            protocol: self.device.protocol,
            download: self.device.download,
        }
    }

    /// A client accepting any valid certificate, for peers whose fingerprint
    /// is not known before they answer. The fingerprint is then read off the
    /// handshake and pinned by connections that transfer data.
    fn unpinned_client(&self) -> Result<LsHttpClientV2, ClientError> {
        LsHttpClientV2::try_new(
            &self.identity.private_key_pem,
            &self.identity.cert_pem,
            None,
            Some(self.timeout),
        )
    }

    /// Registers with `host:port` and, when a device answers, puts it into
    /// the store. Returns the device's stored state after the merge, or
    /// `None` when the answer carried this device's own fingerprint.
    async fn probe(
        &self,
        client: &LsHttpClientV2,
        host: &str,
        port: u16,
        protocol: ProtocolType,
    ) -> Result<Option<StatefulDevice>, ClientError> {
        let response = client
            .register(protocol, host, port, self.register_dto())
            .await?;

        // In HTTPS mode the certificate is the peer's identity; the
        // fingerprint claimed in the body only counts without encryption.
        let fingerprint = match protocol {
            ProtocolType::Https => response
                .cert_fingerprint
                .clone()
                .ok_or_else(|| anyhow::anyhow!("HTTPS response carried no peer certificate"))?,
            ProtocolType::Http => response.body.fingerprint.clone(),
        };
        if fingerprint == self.device.fingerprint {
            return Ok(None);
        }

        let device = confirmed_device(response.body, host.to_string(), port, protocol, fingerprint);
        let (_, merged) = self.found(device).await;
        Ok(Some(merged))
    }

    /// Puts a device into the store, logging the confirmation on it, and
    /// emits the resulting event. Returns whether the device is new, and
    /// its stored state after the merge.
    async fn found(&self, device: DiscoveredDevice) -> (bool, StatefulDevice) {
        let (event, merged) = self.store.upsert(device, SystemTime::now());
        let is_new = matches!(event, DiscoveryEvent::Discovered { .. });
        if let Some(event_tx) = &self.event_tx {
            let _ = event_tx.send(event).await;
        }
        (is_new, merged)
    }
}

/// A handle to a running discovery: the store of discovered devices and the
/// application-initiated operations.
pub struct DiscoveryHandle {
    /// The multicast side, or the reason it could not be started; discovery
    /// keeps working without it, see [`DiscoveryHandle::multicast_error`].
    multicast: Result<MulticastHandle, anyhow::Error>,
    state: Arc<DiscoveryState>,
}

impl DiscoveryHandle {
    /// Announces this device to the network, which makes every other LocalSend
    /// device on it register with this device over HTTP.
    ///
    /// Devices registering in response arrive at the application as server
    /// events, not here: discovery only learns about peers that announce
    /// themselves. Feed them back via [`DiscoveryHandle::add_device`].
    ///
    /// Returns once the whole announcement burst has been sent, which takes a
    /// few seconds, or immediately once discovery has been stopped or
    /// multicast is unavailable.
    pub async fn announce(&self) {
        if let Ok(multicast) = &self.multicast {
            multicast.announce().await;
        }
    }

    /// The reason the multicast sockets could not be bound (e.g. the port is
    /// taken, or there is no usable network interface), when they could not.
    ///
    /// Discovery then neither hears nor sends announcements; it still learns
    /// about devices through [`DiscoveryHandle::discover`],
    /// [`DiscoveryHandle::scan_subnet`] and [`DiscoveryHandle::add_device`].
    pub fn multicast_error(&self) -> Option<&anyhow::Error> {
        self.multicast.as_ref().err()
    }

    /// Discovers a device at a known address, e.g. a favorite or a peer that
    /// multicast does not reach, by sending it a register request.
    ///
    /// On success the device is put into the store (and emitted, as
    /// `Discovered` or `Updated`), and its full stored state — all known
    /// channels and logs — is returned.
    /// Returns `None` when the address answered with this device's own
    /// fingerprint, i.e. the device discovered itself.
    pub async fn discover(
        &self,
        host: &str,
        port: u16,
        protocol: ProtocolType,
    ) -> Result<Option<StatefulDevice>, ClientError> {
        let client = self.state.unpinned_client()?;
        self.state.probe(&client, host, port, protocol).await
    }

    /// Scans the `/24` subnet of the local interface address `interface_ip`
    /// by sending every other host a register request,
    /// for networks that do not carry multicast.
    ///
    /// At most one scan runs per interface: a call for an address that is
    /// still being scanned returns an empty list immediately.
    pub async fn scan_subnet(
        &self,
        interface_ip: Ipv4Addr,
        port: u16,
        protocol: ProtocolType,
    ) -> Result<Vec<StatefulDevice>, ClientError> {
        if !self.state.scanning.lock().unwrap().insert(interface_ip) {
            return Ok(Vec::new());
        }
        let _guard = ScanGuard {
            state: &self.state,
            interface_ip,
        };

        let client = self.state.unpinned_client()?;
        let base = interface_ip.octets();

        let state = &self.state;
        let client = &client;
        let found = futures_util::stream::iter(
            (0..=255u8)
                .map(|host| Ipv4Addr::new(base[0], base[1], base[2], host))
                .filter(|ip| *ip != interface_ip),
        )
        .map(|ip| async move {
            state
                .probe(client, &ip.to_string(), port, protocol)
                .await
                .ok()
                .flatten()
        })
        .buffer_unordered(SCAN_CONCURRENCY)
        .filter_map(std::future::ready)
        .collect()
        .await;

        Ok(found)
    }

    /// Sets whether announcements of other devices are answered with a
    /// register request (the answer is what makes the announcing device
    /// enter the store). On by default.
    ///
    /// An application whose server is not running turns this off: the answer
    /// would advertise an HTTP port that nobody listens on.
    pub fn set_answer_announcements(&self, answer: bool) {
        self.state.answering.store(answer, Ordering::Relaxed);
    }

    /// Puts a device confirmed outside of discovery into the store, e.g. one
    /// that answered an announcement by registering with this device's HTTP
    /// server. The confirmation is emitted as `Discovered` or `Updated`;
    /// returns `true` when the device is new.
    pub async fn add_device(&self, device: DiscoveredDevice) -> bool {
        self.state.found(device).await.0
    }

    /// All discovered devices in discovery order.
    pub fn devices(&self) -> Vec<StatefulDevice> {
        self.state.store.devices()
    }

    pub fn device_by_fingerprint(&self, fingerprint: &str) -> Option<StatefulDevice> {
        self.state.store.by_fingerprint(fingerprint)
    }

    /// Waits until discovery has terminated and the multicast sockets have
    /// been closed, so that the port can be bound again.
    /// Must be called after requesting a stop via the stop channel.
    /// Returns immediately when multicast is unavailable.
    pub async fn wait_stopped(&self) {
        if let Ok(multicast) = &self.multicast {
            multicast.wait_stopped().await;
        }
    }
}

/// Releases the interface of a finished subnet scan, also when the scan is
/// cancelled by dropping its future.
struct ScanGuard<'a> {
    state: &'a DiscoveryState,
    interface_ip: Ipv4Addr,
}

impl Drop for ScanGuard<'_> {
    fn drop(&mut self) {
        self.state
            .scanning
            .lock()
            .unwrap()
            .remove(&self.interface_ip);
    }
}

/// Binds the multicast sockets and starts answering announcements of other
/// devices. Nothing is announced until [`DiscoveryHandle::announce`] is called.
///
/// Starting cannot fail: when no multicast socket could be bound, e.g. because
/// the port is already bound by another process or because there is no network
/// at all, discovery runs without multicast.
pub async fn start(config: DiscoveryConfig, stop_rx: oneshot::Receiver<()>) -> DiscoveryHandle {
    let (multicast_tx, mut multicast_rx) = mpsc::channel(MULTICAST_CHANNEL_SIZE);

    // On failure `multicast_tx` is dropped, which ends the answering task.
    let multicast = multicast::start(
        MulticastConfig {
            group: config.group,
            group_v6: config.group_v6,
            port: config.port,
            interface_filter: config.interface_filter,
            device: config.device.clone(),
            event_tx: multicast_tx,
        },
        stop_rx,
    )
    .await;

    let state = Arc::new(DiscoveryState {
        device: config.device,
        identity: config.identity,
        timeout: config.timeout,
        store: DeviceStore::new(),
        event_tx: config.event_tx,
        answering: AtomicBool::new(true),
        scanning: std::sync::Mutex::new(HashSet::new()),
    });

    // Ends once discovery is stopped: the multicast side then drops its
    // sender and the channel closes.
    tokio::spawn({
        let state = state.clone();
        async move {
            while let Some(event) = multicast_rx.recv().await {
                if !state.answering.load(Ordering::Relaxed) {
                    continue;
                }
                let MulticastEvent::Discovered {
                    ip,
                    scope_id,
                    message,
                } = event;

                // The register request may take a while (up to the timeout),
                // so announcements are answered concurrently.
                tokio::spawn(answer_announcement(state.clone(), ip, scope_id, message));
            }
        }
    });

    DiscoveryHandle { multicast, state }
}

/// Answers an announcement with a register request, as the protocol requires.
/// The device enters the store only once that request succeeded, so that
/// everything in the store is known to be reachable.
async fn answer_announcement(
    state: Arc<DiscoveryState>,
    ip: IpAddr,
    scope_id: Option<u32>,
    message: MulticastMessageV2,
) {
    let host = match scope_id {
        Some(scope_id) => format!("{ip}%{scope_id}"),
        None => ip.to_string(),
    };

    // Pin the claimed fingerprint, so nothing is sent to a device that does
    // not hold the matching certificate.
    let expected_fingerprint = match message.protocol {
        ProtocolType::Https => Some(message.fingerprint.clone()),
        ProtocolType::Http => None,
    };
    let client = match LsHttpClientV2::try_new(
        &state.identity.private_key_pem,
        &state.identity.cert_pem,
        expected_fingerprint,
        Some(state.timeout),
    ) {
        Ok(client) => client,
        Err(err) => {
            tracing::error!("Could not create the client to answer {host}: {err:#}");
            return;
        }
    };

    let result = client
        .register(message.protocol, &host, message.port, state.register_dto())
        .await;

    match result {
        Ok(response) => {
            // The pinned certificate identifies the peer, so the fingerprint
            // is taken from the announcement, not from the response body.
            let device = confirmed_device(
                response.body,
                host,
                message.port,
                message.protocol,
                message.fingerprint,
            );
            state.found(device).await;
        }
        Err(err) => {
            tracing::debug!("Could not register with announcing device {host}: {err:#}");
        }
    }
}

/// Builds the stored device from the register response of a peer confirmed
/// over HTTP.
fn confirmed_device(
    response: RegisterResponseDtoV2,
    host: String,
    port: u16,
    protocol: ProtocolType,
    fingerprint: String,
) -> DiscoveredDevice {
    DiscoveredDevice {
        alias: response.alias,
        version: response.version,
        device_model: response.device_model,
        device_type: response.device_type,
        fingerprint,
        channel: DeviceChannel::Http(HttpChannel {
            host,
            port,
            protocol,
        }),
        download: response.download,
    }
}
