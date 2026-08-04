use crate::frb_generated::StreamSink;
use flutter_rust_bridge::frb;
pub use localsend::discovery::DeviceLogKind;
use localsend::discovery::{
    DeviceChannel, DeviceIdentity, DeviceLog, DiscoveredDevice, DiscoveryConfig, DiscoveryEvent,
    DiscoveryHandle, HttpChannel, StatefulDevice,
};
use localsend::model::discovery::{DeviceType, ProtocolType};
use localsend::multicast::{DEFAULT_MULTICAST_GROUP_V6, InterfaceFilter, MulticastDevice};
use std::sync::Arc;
use std::time::Duration;
use tokio::sync::{Mutex, mpsc, oneshot};

/// A single device confirmation over HTTP, fed into the store via
/// [RsDiscovery::add_device]: the device's register request was accepted by
/// our server, so it is known to be reachable at [RsDiscoveredDevice::host].
pub struct RsDiscoveredDevice {
    pub alias: String,

    /// Protocol version (major.minor) implemented by the device.
    pub version: String,

    pub device_model: Option<String>,

    pub device_type: Option<DeviceType>,

    /// Fingerprint identifying the device; devices are deduplicated by it.
    pub fingerprint: String,

    /// The host the device was confirmed on: an IP address, or the scoped
    /// form `fe80::1%3` for link-local IPv6 (the Rust HTTP client accepts
    /// both back as a host).
    pub host: String,

    /// The port of the device's HTTP server.
    pub port: u16,

    pub protocol: ProtocolType,

    /// Whether the device's download API is active.
    pub download: bool,
}

/// An address a stored device was confirmed on and is dialed at.
pub struct RsDeviceChannel {
    /// The host to dial: an IP address, or the scoped form `fe80::1%3` for
    /// link-local IPv6 (the Rust HTTP client accepts both back as a host).
    pub host: String,

    /// The port of the device's HTTP server at this address.
    pub port: u16,

    pub protocol: ProtocolType,
}

/// The merged stored state of a discovered device: one entry per fingerprint,
/// carrying every address the device was confirmed on. A multi-homed device
/// that is reachable over several network interfaces is still one
/// [RsStoredDevice].
///
/// Emitted on [RsDiscovery::listen] for every confirmation (answered
/// announcements, scan results and devices fed in via
/// [RsDiscovery::add_device]), so a device re-appears — with its channels
/// accumulated so far — whenever it re-announces itself or is re-discovered.
pub struct RsStoredDevice {
    pub alias: String,

    /// Protocol version (major.minor) implemented by the device.
    pub version: String,

    pub device_model: Option<String>,

    pub device_type: Option<DeviceType>,

    /// Fingerprint identifying the device; devices are deduplicated by it.
    pub fingerprint: String,

    /// Whether the device's download API is active.
    pub download: bool,

    /// Every address the device was confirmed on, best first (available
    /// before not-reachable, IPv6 before IPv4, most recently confirmed
    /// first). Never empty: a device only enters the store through a
    /// confirmation.
    pub channels: Vec<RsDeviceChannel>,
}

/// One retained confirmation of a stored device, for the device details UI.
pub struct RsDeviceLog {
    /// When the confirmation happened, in milliseconds since the Unix epoch.
    pub timestamp_millis: u64,

    /// Whether the confirmation discovered the device or re-confirmed it.
    pub kind: DeviceLogKind,

    /// The channel the confirmation happened on.
    pub channel: RsDeviceChannel,
}

#[frb(mirror(DeviceLogKind))]
pub enum _DeviceLogKind {
    Discovered,
    Updated,
}

pub struct RsDiscovery {
    instance: Arc<DiscoveryInstance>,
    event_rx: Mutex<Option<mpsc::Receiver<DiscoveryEvent>>>,
}

/// The stoppable part of a running discovery, shared between [RsDiscovery]
/// and [RUNNING_DISCOVERY] so that a leftover instance can be stopped without
/// its Dart owner.
struct DiscoveryInstance {
    handle: DiscoveryHandle,
    stop_tx: Mutex<Option<oneshot::Sender<()>>>,
}

impl DiscoveryInstance {
    /// Stops the discovery and waits until all sockets are closed.
    /// Does nothing when already stopped.
    async fn stop(&self) {
        if let Some(stop_tx) = self.stop_tx.lock().await.take() {
            let _ = stop_tx.send(());
            self.handle.wait_stopped().await;
        }
    }
}

/// The most recently started discovery. A Flutter hot restart kills all Dart
/// isolates without stopping the Rust discovery task, which would keep
/// answering announcements forever (the `SO_REUSEPORT` sockets do not even
/// fail the next bind); [start_discovery] stops such a leftover instance
/// before starting again.
static RUNNING_DISCOVERY: Mutex<Option<Arc<DiscoveryInstance>>> = Mutex::const_new(None);

/// Starts the discovery: binds the UDP multicast sockets on all usable
/// network interfaces, answers announcements of other devices with an HTTP
/// register request, and keeps the store of confirmed devices.
///
/// Announcements are received from the IPv4 [group] and, as a LocalSend
/// extension, from the (currently hardcoded) IPv6 group `ff12::fd3a:e420`.
///
/// [port] is used both to bind the multicast sockets and as the HTTP server
/// port announced to other devices. [cert_pem] and [private_key_pem] are this
/// device's TLS identity, sent as client certificate with every register
/// request; [fingerprint] must be the certificate's SHA-256 fingerprint.
///
/// Nothing is announced until [RsDiscovery::announce] is called.
///
/// Cannot fail besides an invalid [group]: when no multicast socket could be
/// bound (e.g. the port is taken by another process), discovery still runs
/// without multicast — see [RsDiscovery::multicast_error] — and still learns
/// about devices through [RsDiscovery::discover], [RsDiscovery::scan_subnet]
/// and [RsDiscovery::add_device].
pub async fn start_discovery(
    group: String,
    port: u16,
    network_whitelist: Option<Vec<String>>,
    network_blacklist: Option<Vec<String>>,
    alias: String,
    version: String,
    device_model: Option<String>,
    device_type: Option<DeviceType>,
    fingerprint: String,
    protocol: ProtocolType,
    download: bool,
    cert_pem: String,
    private_key_pem: String,
    timeout_ms: u64,
) -> anyhow::Result<RsDiscovery> {
    let group = group
        .parse()
        .map_err(|_| anyhow::anyhow!("Invalid multicast group: {group}"))?;

    // Stop a discovery left over from before a hot restart (its Dart owner
    // died without calling stop)
    let mut running_discovery = RUNNING_DISCOVERY.lock().await;
    if let Some(previous) = running_discovery.take() {
        previous.stop().await;
    }

    let (event_tx, event_rx) = mpsc::channel::<DiscoveryEvent>(16);
    let (stop_tx, stop_rx) = oneshot::channel::<()>();

    let handle = localsend::discovery::start(
        DiscoveryConfig {
            group,
            // Hardcoded for now; becomes a parameter once the app exposes it.
            group_v6: Some(DEFAULT_MULTICAST_GROUP_V6),
            port,
            interface_filter: InterfaceFilter {
                whitelist: network_whitelist,
                blacklist: network_blacklist,
            },
            device: MulticastDevice {
                alias,
                version,
                device_model,
                device_type,
                fingerprint,
                port,
                protocol,
                download,
            },
            identity: DeviceIdentity {
                cert_pem,
                private_key_pem,
            },
            timeout: Duration::from_millis(timeout_ms),
            event_tx: Some(event_tx),
        },
        stop_rx,
    )
    .await;

    let instance = Arc::new(DiscoveryInstance {
        handle,
        stop_tx: Mutex::new(Some(stop_tx)),
    });
    *running_discovery = Some(instance.clone());

    Ok(RsDiscovery {
        instance,
        event_rx: Mutex::new(Some(event_rx)),
    })
}

impl RsDiscovery {
    /// Emits a [RsStoredDevice] for every device confirmation until the
    /// discovery is stopped. Can only be listened to once.
    ///
    /// Also returns when the Dart side of the stream is gone (e.g. after a
    /// hot restart), so this call does not keep the discovery alive forever.
    pub async fn listen(&self, sink: StreamSink<RsStoredDevice>) {
        let Some(mut event_rx) = self.event_rx.lock().await.take() else {
            let _ = sink.add_error(anyhow::anyhow!("Discovery events already listened to"));
            return;
        };

        while let Some(event) = event_rx.recv().await {
            let (DiscoveryEvent::Discovered { device } | DiscoveryEvent::Updated { device }) =
                event;
            // The store is updated before the event is emitted, so the merged
            // state is at least as new as the confirmation.
            if let Some(stored) = self
                .instance
                .handle
                .device_by_fingerprint(&device.fingerprint)
                && sink.add(rs_stored_device(stored)).is_err()
            {
                // The Dart listener is gone; the remaining events have no receiver.
                break;
            }
        }
    }

    /// The reason the multicast sockets could not be bound, when they could
    /// not. Discovery then neither hears nor sends announcements.
    pub fn multicast_error(&self) -> Option<String> {
        self.instance
            .handle
            .multicast_error()
            .map(|err| format!("{err:#}"))
    }

    /// Announces this device to the network, which makes every other LocalSend
    /// device on it register with this device over HTTP.
    ///
    /// Devices registering in response arrive at the application as server
    /// events, not here: feed them back via [RsDiscovery::add_device].
    ///
    /// Returns once the whole announcement burst has been sent, which takes a
    /// few seconds, or immediately once the discovery has been stopped or
    /// multicast is unavailable.
    pub async fn announce(&self) {
        self.instance.handle.announce().await;
    }

    /// Sets whether announcements of other devices are answered with a
    /// register request (the answer is what makes the announcing device enter
    /// the store). On by default.
    ///
    /// Turned off while the HTTP server is not running: the answer would
    /// advertise a port that nobody listens on.
    pub fn set_answer_announcements(&self, answer: bool) {
        self.instance.handle.set_answer_announcements(answer);
    }

    /// Discovers a device at a known address, e.g. a favorite or a peer that
    /// multicast does not reach, by sending it a register request.
    ///
    /// The confirmed device is also emitted on [RsDiscovery::listen].
    /// Returns `None` when the device did not answer or answered with this
    /// device's own fingerprint (i.e. the device discovered itself).
    pub async fn discover(
        &self,
        host: String,
        port: u16,
        protocol: ProtocolType,
    ) -> Option<RsStoredDevice> {
        match self.instance.handle.discover(&host, port, protocol).await {
            Ok(found) => found.map(rs_stored_device),
            Err(err) => {
                tracing::debug!("Could not discover {host}:{port}: {err:#}");
                None
            }
        }
    }

    /// Scans the `/24` subnet of the local interface address [interface_ip]
    /// by sending every other host a register request, for networks that do
    /// not carry multicast.
    ///
    /// The found devices are emitted on [RsDiscovery::listen] as they answer;
    /// this method returns once the whole scan has finished. At most one scan
    /// runs per interface: a call for an address that is still being scanned
    /// returns immediately.
    pub async fn scan_subnet(
        &self,
        interface_ip: String,
        port: u16,
        protocol: ProtocolType,
    ) -> anyhow::Result<()> {
        let interface_ip = interface_ip
            .parse()
            .map_err(|_| anyhow::anyhow!("Invalid interface address: {interface_ip}"))?;
        self.instance
            .handle
            .scan_subnet(interface_ip, port, protocol)
            .await?;
        Ok(())
    }

    /// Puts a device confirmed outside of the discovery into the store, e.g.
    /// one that answered an announcement by registering with this device's
    /// HTTP server. The device is emitted on [RsDiscovery::listen].
    pub async fn add_device(&self, device: RsDiscoveredDevice) {
        self.instance
            .handle
            .add_device(DiscoveredDevice {
                alias: device.alias,
                version: device.version,
                device_model: device.device_model,
                device_type: device.device_type,
                fingerprint: device.fingerprint,
                channel: DeviceChannel::Http(HttpChannel {
                    host: device.host,
                    port: device.port,
                    protocol: device.protocol,
                }),
                download: device.download,
            })
            .await;
    }

    /// The retained confirmations of a stored device, oldest first, capped at
    /// the store's log limit. Empty when the fingerprint is unknown.
    pub fn device_logs(&self, fingerprint: String) -> Vec<RsDeviceLog> {
        self.instance
            .handle
            .device_by_fingerprint(&fingerprint)
            .map(|stored| stored.logs.into_iter().map(rs_device_log).collect())
            .unwrap_or_default()
    }

    /// Stops the discovery, which also ends the [RsDiscovery::listen] stream.
    /// Returns after all sockets are closed, so the port can be bound again.
    pub async fn stop(&self) {
        self.instance.stop().await;

        let mut running_discovery = RUNNING_DISCOVERY.lock().await;
        if running_discovery
            .as_ref()
            .is_some_and(|running| Arc::ptr_eq(running, &self.instance))
        {
            *running_discovery = None;
        }
    }
}

fn rs_device_log(log: DeviceLog) -> RsDeviceLog {
    let DeviceChannel::Http(http) = log.channel;
    RsDeviceLog {
        timestamp_millis: log
            .timestamp
            .duration_since(std::time::UNIX_EPOCH)
            .map(|elapsed| elapsed.as_millis() as u64)
            .unwrap_or(0),
        kind: log.kind,
        channel: RsDeviceChannel {
            host: http.host,
            port: http.port,
            protocol: http.protocol,
        },
    }
}

/// The merged stored device flattened for the Dart side, its channels ranked
/// best first.
fn rs_stored_device(stored: StatefulDevice) -> RsStoredDevice {
    let channels = stored
        .get_ranked_channels()
        .into_iter()
        .map(|channel| {
            let DeviceChannel::Http(http) = channel;
            RsDeviceChannel {
                host: http.host.clone(),
                port: http.port,
                protocol: http.protocol,
            }
        })
        .collect();

    let device = stored.device;
    RsStoredDevice {
        alias: device.alias,
        version: device.version,
        device_model: device.device_model,
        device_type: device.device_type,
        fingerprint: device.fingerprint,
        download: device.download,
        channels,
    }
}
