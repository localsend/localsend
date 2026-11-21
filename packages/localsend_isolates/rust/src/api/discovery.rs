use crate::frb_generated::StreamSink;
use localsend::discovery::{
    ChannelState, DeviceChannel, DeviceIdentity, DeviceLog, DeviceLogEvent, DiscoveredDevice,
    DiscoveryConfig, DiscoveryEvent, DiscoveryHandle, HttpChannel, Outbound, StatefulDevice,
};
use localsend::model::discovery::{DeviceType, ProtocolType};
use localsend::multicast::{DEFAULT_MULTICAST_GROUP_V6, MulticastDevice};
use localsend::util::interface::InterfaceFilter;
use std::sync::Arc;
use std::time::{Duration, SystemTime};
use tokio::sync::{Mutex, mpsc, oneshot};
use tokio_util::sync::CancellationToken;

/// A device that reached this device's HTTP server, fed into the store via
/// [RsDiscovery::observe_inbound]: its request arrived from
/// [RsDiscoveredDevice::host], which says nothing about whether it can be
/// dialed back there.
pub struct RsDiscoveredDevice {
    pub alias: String,

    /// Protocol version (major.minor) implemented by the device.
    pub version: String,

    pub device_model: Option<String>,

    pub device_type: Option<DeviceType>,

    /// Fingerprint identifying the device; devices are deduplicated by it.
    pub fingerprint: String,

    /// The host the request came from: an IP address, or the scoped form
    /// `fe80::1%3` for link-local IPv6 (the Rust HTTP client accepts both
    /// back as a host).
    pub host: String,

    /// The port the device claims its HTTP server listens on.
    pub port: u16,

    pub protocol: ProtocolType,

    /// Whether the device's download API is active.
    pub download: bool,
}

/// The address of a device's HTTP server.
pub struct RsDeviceChannel {
    /// The host to dial: an IP address, or the scoped form `fe80::1%3` for
    /// link-local IPv6 (the Rust HTTP client accepts both back as a host).
    pub host: String,

    /// The port of the device's HTTP server at this address.
    pub port: u16,

    pub protocol: ProtocolType,
}

/// An address of a stored device with what is known about each direction: a
/// channel that works one way does not have to work the other way (e.g.
/// because of a firewall on one of the devices).
pub struct RsStoredChannel {
    /// The host to dial: an IP address, or the scoped form `fe80::1%3` for
    /// link-local IPv6 (the Rust HTTP client accepts both back as a host).
    pub host: String,

    /// The port of the device's HTTP server at this address.
    pub port: u16,

    pub protocol: ProtocolType,

    /// This device → the peer: whether the peer can be dialed at this address.
    pub outbound: RsOutbound,

    /// The peer → this device: when the peer last reached this device's
    /// server from this address, in milliseconds since the Unix epoch.
    /// `None` when it never did.
    pub inbound_at_millis: Option<u64>,
}

/// Whether a peer can be dialed on a channel.
pub enum RsOutbound {
    /// No request was sent over the channel yet: the peer reached this
    /// device from it, which says nothing about the way back.
    Untested,

    /// The last request over the channel was answered.
    Reachable,

    /// The last request over the channel failed.
    Failed,
}

/// The merged stored state of a discovered device: one entry per fingerprint,
/// carrying every address the device was observed on. A multi-homed device
/// that is reachable over several network interfaces is still one
/// [RsStoredDevice].
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

    /// Every address the device was observed on, in the order to dial them
    /// (reachable before untested before failed, then global IPv6 before IPv4
    /// before link-local, then most recently confirmed first). Never empty:
    /// a device only enters the store through an observation on one of its addresses.
    pub channels: Vec<RsStoredChannel>,
}

/// An event emitted on [RsDiscovery::listen].
pub enum RsDiscoveryEvent {
    /// The state of a confirmed device changed: it was discovered or
    /// confirmed again (answered announcements, scan results and devices fed
    /// in via [RsDiscovery::observe_inbound]), or a request to it failed.
    /// Carries the merged state, so the device re-appears with everything
    /// known about its channels so far.
    Device(RsStoredDevice),

    /// A device was heard announcing itself but did not answer the register
    /// request, typically because a firewall blocks its server.
    ///
    /// Nothing about such a device is verified (announcements are
    /// unauthenticated): it is for diagnostics only and must not be offered
    /// as a transfer target.
    Unreachable {
        /// The merged state of the device, as its announcements claim it.
        device: RsStoredDevice,

        /// Why the most recent register request failed, for display.
        error: String,
    },
}

/// One retained observation of a stored device, for the device details UI.
pub struct RsDeviceLog {
    /// When the observation happened, in milliseconds since the Unix epoch.
    pub timestamp_millis: u64,

    pub event: RsDeviceLogEvent,
}

/// What was observed about a device, and in which direction.
pub enum RsDeviceLogEvent {
    /// This device → the peer: a request over the channel was answered.
    Outbound { channel: RsDeviceChannel },

    /// This device → the peer: a request over the channel failed.
    OutboundFailed {
        channel: RsDeviceChannel,

        /// Why the request failed, for display.
        error: String,
    },

    /// The peer → this device: the peer sent a request to this device's
    /// server. The channel is the address the request came from, with the
    /// port the peer claims to serve on.
    Inbound { channel: RsDeviceChannel },

    /// The peer → this device: an announcement of the peer was heard.
    MulticastInbound {
        /// The address the announcement came from, in the scoped form
        /// `fe80::1%3` for link-local IPv6.
        host: String,
    },
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

    /// Ends the [RsDiscovery::listen] stream on stop. The discovery event
    /// sender lives in the handle itself, so the event channel never closes
    /// while this instance exists; without this signal the stream would
    /// outlive the stop.
    cancel: CancellationToken,
}

impl DiscoveryInstance {
    /// Stops the discovery and waits until all sockets are closed.
    /// Does nothing when already stopped.
    async fn stop(&self) {
        if let Some(stop_tx) = self.stop_tx.lock().await.take() {
            let _ = stop_tx.send(());
            self.handle.wait_stopped().await;
        }
        self.cancel.cancel();
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
/// about devices through [RsDiscovery::discover_staged],
/// [RsDiscovery::scan_subnet] and [RsDiscovery::observe_inbound].
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
        cancel: CancellationToken::new(),
    });
    *running_discovery = Some(instance.clone());

    Ok(RsDiscovery {
        instance,
        event_rx: Mutex::new(Some(event_rx)),
    })
}

impl RsDiscovery {
    /// Emits a [RsDiscoveryEvent] for every observation of a device until
    /// the discovery is stopped. Can only be listened to once.
    ///
    /// Also ends when the multicast sockets failed permanently (e.g. because
    /// the OS invalidated them while the application was suspended): the
    /// application reacts to the ended stream by starting a new discovery,
    /// which rebinds the sockets.
    ///
    /// Also returns when the Dart side of the stream is gone (e.g. after a
    /// hot restart), so this call does not keep the discovery alive forever.
    pub async fn listen(&self, sink: StreamSink<RsDiscoveryEvent>) {
        let Some(mut event_rx) = self.event_rx.lock().await.take() else {
            let _ = sink.add_error(anyhow::anyhow!("Discovery events already listened to"));
            return;
        };

        loop {
            let event = tokio::select! {
                event = event_rx.recv() => event,
                // The event sender lives in the handle this instance holds,
                // so the channel never closes on its own; the stop signals
                // the end explicitly.
                _ = self.instance.cancel.cancelled() => break,
            };
            // The store is updated before the event is emitted, so the merged
            // state is at least as new as the observation. It is missing when
            // the device changed between confirmed and unconfirmed since; the
            // event about that change follows.
            let handle = &self.instance.handle;
            let event = match event {
                Some(
                    DiscoveryEvent::Discovered { device } | DiscoveryEvent::Updated { device },
                ) => handle
                    .device_by_fingerprint(&device.fingerprint)
                    .map(|stored| RsDiscoveryEvent::Device(rs_stored_device(stored))),
                Some(DiscoveryEvent::Unreachable { device, error }) => {
                    unconfirmed_device(handle, &device.fingerprint).map(|stored| {
                        // The stored state may include a later failure than
                        // the event; its reason must match that state.
                        let error = stored
                            .logs
                            .iter()
                            .rev()
                            .find_map(|log| match &log.event {
                                DeviceLogEvent::OutboundFailed { error, .. } => Some(error.clone()),
                                _ => None,
                            })
                            .unwrap_or(error);
                        RsDiscoveryEvent::Unreachable {
                            device: rs_stored_device(stored),
                            error,
                        }
                    })
                }
                Some(DiscoveryEvent::MulticastFailed) => {
                    tracing::error!("Multicast sockets failed, ending the discovery event stream");
                    break;
                }
                None => break,
            };
            if let Some(event) = event
                && sink.add(event).is_err()
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
    /// events, not here: feed them back via [RsDiscovery::observe_inbound].
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

    /// Discovers devices in stages, cheapest first: announces this device to
    /// the network and probes [channels] (e.g. the favorites), then falls
    /// back to scanning the `/24` subnets of the local interface addresses
    /// [interface_ips], for networks that do not carry multicast. The
    /// fallback only runs when nothing was confirmed until [grace_ms] after
    /// the channels have been probed.
    ///
    /// The found devices are emitted on [RsDiscovery::listen] as they answer;
    /// returns once every stage has finished, including the whole
    /// announcement burst.
    pub async fn discover_staged(
        &self,
        channels: Vec<RsDeviceChannel>,
        interface_ips: Vec<String>,
        port: u16,
        protocol: ProtocolType,
        grace_ms: u64,
    ) -> anyhow::Result<()> {
        let channels = channels
            .into_iter()
            .map(|channel| HttpChannel {
                host: channel.host,
                port: channel.port,
                protocol: channel.protocol,
            })
            .collect();
        let interface_ips = interface_ips
            .into_iter()
            .map(|ip| {
                ip.parse()
                    .map_err(|_| anyhow::anyhow!("Invalid interface address: {ip}"))
            })
            .collect::<anyhow::Result<Vec<_>>>()?;

        self.instance
            .handle
            .discover_staged(
                channels,
                interface_ips,
                port,
                protocol,
                Duration::from_millis(grace_ms),
            )
            .await?;
        Ok(())
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

    /// Puts a device that reached this device's HTTP server into the store,
    /// e.g. one that answered an announcement by registering. The device is
    /// emitted on [RsDiscovery::listen].
    ///
    /// Only the inbound direction of the address is confirmed: an address
    /// new to the device is stored with [RsOutbound::Untested] and dialed
    /// back in the background, whose outcome is emitted as well.
    pub async fn observe_inbound(&self, device: RsDiscoveredDevice) {
        self.instance
            .handle
            .observe_inbound(DiscoveredDevice {
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

    /// Records the outcome of a request the application sent to a stored
    /// device over [channel], e.g. a transfer: without an [error] the channel
    /// becomes [RsOutbound::Reachable], with one — the reason, for display —
    /// it becomes [RsOutbound::Failed], which ranks it behind the device's
    /// other channels. The device is emitted on [RsDiscovery::listen].
    ///
    /// Only report failures to reach the device at all, not requests that
    /// the device answered with an error.
    ///
    /// Returns `false` when no device has the fingerprint.
    pub fn report_outbound(
        &self,
        fingerprint: String,
        channel: RsDeviceChannel,
        error: Option<String>,
    ) -> bool {
        self.instance.handle.report_outbound(
            &fingerprint,
            DeviceChannel::Http(HttpChannel {
                host: channel.host,
                port: channel.port,
                protocol: channel.protocol,
            }),
            match error {
                Some(error) => Err(error),
                None => Ok(()),
            },
        )
    }

    /// The retained observations of a stored device, oldest first, capped at
    /// the store's log limit. Empty when the fingerprint is unknown.
    pub fn device_logs(&self, fingerprint: String) -> Vec<RsDeviceLog> {
        let handle = &self.instance.handle;
        handle
            .device_by_fingerprint(&fingerprint)
            .or_else(|| unconfirmed_device(handle, &fingerprint))
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

/// The device with the given fingerprint that was heard announcing itself
/// but never confirmed.
fn unconfirmed_device(handle: &DiscoveryHandle, fingerprint: &str) -> Option<StatefulDevice> {
    handle
        .unconfirmed_devices()
        .into_iter()
        .find(|stored| stored.device.fingerprint == fingerprint)
}

fn rs_device_log(log: DeviceLog) -> RsDeviceLog {
    RsDeviceLog {
        timestamp_millis: millis_since_epoch(log.timestamp),
        event: match log.event {
            DeviceLogEvent::Outbound { channel } => RsDeviceLogEvent::Outbound {
                channel: rs_device_channel(&channel),
            },
            DeviceLogEvent::OutboundFailed { channel, error } => RsDeviceLogEvent::OutboundFailed {
                channel: rs_device_channel(&channel),
                error,
            },
            DeviceLogEvent::Inbound { channel } => RsDeviceLogEvent::Inbound {
                channel: rs_device_channel(&channel),
            },
            DeviceLogEvent::MulticastInbound { ip } => RsDeviceLogEvent::MulticastInbound {
                host: ip.to_string(),
            },
        },
    }
}

fn rs_device_channel(channel: &DeviceChannel) -> RsDeviceChannel {
    let DeviceChannel::Http(http) = channel;
    RsDeviceChannel {
        host: http.host.clone(),
        port: http.port,
        protocol: http.protocol,
    }
}

fn rs_stored_channel(channel: &DeviceChannel, state: &ChannelState) -> RsStoredChannel {
    let DeviceChannel::Http(http) = channel;
    RsStoredChannel {
        host: http.host.clone(),
        port: http.port,
        protocol: http.protocol,
        outbound: match state.outbound {
            Outbound::Untested => RsOutbound::Untested,
            Outbound::Reachable(_) => RsOutbound::Reachable,
            Outbound::Failed(_) => RsOutbound::Failed,
        },
        inbound_at_millis: state.inbound.map(millis_since_epoch),
    }
}

fn millis_since_epoch(time: SystemTime) -> u64 {
    time.duration_since(std::time::UNIX_EPOCH)
        .map(|elapsed| elapsed.as_millis() as u64)
        .unwrap_or(0)
}

/// The merged stored device flattened for the Dart side, its channels in the
/// order to dial them.
fn rs_stored_device(stored: StatefulDevice) -> RsStoredDevice {
    let channels = stored
        .get_ranked_channels()
        .into_iter()
        .map(|channel| rs_stored_channel(channel, &stored.channels[channel]))
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
