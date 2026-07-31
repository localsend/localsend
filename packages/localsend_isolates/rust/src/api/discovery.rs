use crate::frb_generated::StreamSink;
use localsend::discovery::{
    DeviceChannel, DeviceIdentity, DiscoveredDevice, DiscoveryConfig, DiscoveryEvent,
    DiscoveryHandle, HttpChannel,
};
use localsend::http::dto_v2::ProtocolTypeV2;
use localsend::model::discovery::DeviceType;
use localsend::multicast::{DEFAULT_MULTICAST_GROUP_V6, InterfaceFilter, MulticastDevice};
use std::time::Duration;
use tokio::sync::{Mutex, mpsc, oneshot};

/// A device that was confirmed over HTTP by the discovery: it answered a
/// register request, or its register request was accepted by our server and
/// was fed back via [RsDiscovery::add_device].
///
/// Emitted on [RsDiscovery::listen] for every confirmation, so a device
/// re-appears whenever it re-announces itself or is re-discovered.
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

    pub protocol: ProtocolTypeV2,

    /// Whether the device's download API is active.
    pub download: bool,
}

pub struct RsDiscovery {
    handle: DiscoveryHandle,
    event_rx: Mutex<Option<mpsc::Receiver<DiscoveryEvent>>>,
    stop_tx: Mutex<Option<oneshot::Sender<()>>>,
}

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
    protocol: ProtocolTypeV2,
    download: bool,
    cert_pem: String,
    private_key_pem: String,
    timeout_ms: u64,
) -> anyhow::Result<RsDiscovery> {
    let group = group
        .parse()
        .map_err(|_| anyhow::anyhow!("Invalid multicast group: {group}"))?;

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

    Ok(RsDiscovery {
        handle,
        event_rx: Mutex::new(Some(event_rx)),
        stop_tx: Mutex::new(Some(stop_tx)),
    })
}

impl RsDiscovery {
    /// Emits a [RsDiscoveredDevice] for every device confirmation until the
    /// discovery is stopped. Can only be listened to once.
    pub async fn listen(&self, sink: StreamSink<RsDiscoveredDevice>) {
        let Some(mut event_rx) = self.event_rx.lock().await.take() else {
            let _ = sink.add_error(anyhow::anyhow!("Discovery events already listened to"));
            return;
        };

        while let Some(event) = event_rx.recv().await {
            let (DiscoveryEvent::Discovered { device } | DiscoveryEvent::Updated { device }) =
                event;
            let _ = sink.add(rs_device(device));
        }
    }

    /// The reason the multicast sockets could not be bound, when they could
    /// not. Discovery then neither hears nor sends announcements.
    pub fn multicast_error(&self) -> Option<String> {
        self.handle.multicast_error().map(|err| format!("{err:#}"))
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
        self.handle.announce().await;
    }

    /// Sets whether announcements of other devices are answered with a
    /// register request (the answer is what makes the announcing device enter
    /// the store). On by default.
    ///
    /// Turned off while the HTTP server is not running: the answer would
    /// advertise a port that nobody listens on.
    pub fn set_answer_announcements(&self, answer: bool) {
        self.handle.set_answer_announcements(answer);
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
        protocol: ProtocolTypeV2,
    ) -> Option<RsDiscoveredDevice> {
        match self.handle.discover(&host, port, protocol).await {
            Ok(found) => found.map(|found| rs_device(found.device)),
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
        protocol: ProtocolTypeV2,
    ) -> anyhow::Result<()> {
        let interface_ip = interface_ip
            .parse()
            .map_err(|_| anyhow::anyhow!("Invalid interface address: {interface_ip}"))?;
        self.handle.scan_subnet(interface_ip, port, protocol).await?;
        Ok(())
    }

    /// Puts a device confirmed outside of the discovery into the store, e.g.
    /// one that answered an announcement by registering with this device's
    /// HTTP server. The device is emitted on [RsDiscovery::listen].
    pub async fn add_device(&self, device: RsDiscoveredDevice) {
        self.handle
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

    /// Stops the discovery, which also ends the [RsDiscovery::listen] stream.
    /// Returns after all sockets are closed, so the port can be bound again.
    pub async fn stop(&self) {
        if let Some(stop_tx) = self.stop_tx.lock().await.take() {
            let _ = stop_tx.send(());
            self.handle.wait_stopped().await;
        }
    }
}

/// The stored device flattened for the Dart side; only the channel of the
/// current confirmation is carried.
fn rs_device(device: DiscoveredDevice) -> RsDiscoveredDevice {
    let DeviceChannel::Http(http) = device.channel;
    RsDiscoveredDevice {
        alias: device.alias,
        version: device.version,
        device_model: device.device_model,
        device_type: device.device_type,
        fingerprint: device.fingerprint,
        host: http.host,
        port: http.port,
        protocol: http.protocol,
        download: device.download,
    }
}
