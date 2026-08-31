mod store;

pub use store::{
    ChannelStatus, DeviceChannel, DeviceLog, DeviceLogKind, DiscoveredDevice, HttpChannel,
    StatefulDevice,
};

use crate::http::client::{ClientError, LsHttpClientV2};
use crate::http::dto_v2::{RegisterDtoV2, RegisterResponseDtoV2};
use crate::model::discovery::{MulticastMessageV2, ProtocolType};
use crate::multicast::{self, MulticastConfig, MulticastDevice, MulticastEvent, MulticastHandle};
use crate::tailscale;
use crate::util::error::ErrorChain;
use crate::util::interface::InterfaceFilter;
use futures_util::StreamExt;
use std::collections::HashSet;
use std::net::{IpAddr, Ipv4Addr, Ipv6Addr};
use std::sync::atomic::{AtomicBool, AtomicU64, Ordering};
use std::sync::Arc;
use std::time::{Duration, SystemTime};
use store::DeviceStore;
use tokio::sync::{mpsc, oneshot};

/// The default timeout of the register requests sent by discovery, matching
/// the Flutter app's default discovery timeout. Discovery only talks to LAN
/// peers, which answer quickly or not at all.
pub const DEFAULT_DISCOVERY_TIMEOUT: Duration = Duration::from_millis(500);

/// The timeout of the register requests sent to tailnet peers.
///
/// Much longer than [`DEFAULT_DISCOVERY_TIMEOUT`], because a tailnet peer is
/// not a LAN peer: the first packet may have to punch through two NATs, and
/// falls back to a relay on another continent when it cannot. A LAN timeout
/// would drop exactly the remote devices this stage exists for.
pub const TAILNET_DISCOVERY_TIMEOUT: Duration = Duration::from_secs(3);

/// How many times a register request to a tailnet peer is attempted within
/// one scan.
///
/// More than once, because the first packets towards an idle peer are what
/// wake the VPN and start NAT traversal or the relay fallback, and on a
/// mobile network that setup regularly outlives
/// [`TAILNET_DISCOVERY_TIMEOUT`]. The first attempt is then not wasted — the
/// retry runs on the path it began establishing — but without a retry the
/// peer stays invisible until the user happens to rescan.
const TAILNET_PROBE_ATTEMPTS: u32 = 2;

/// The pause between two attempts of a tailnet probe: long enough for the
/// tunnel setup the first attempt triggered to make progress, short enough
/// that a scan whose tailnet peer is truly offline still ends within a few
/// seconds of the announcement burst.
const TAILNET_PROBE_RETRY_DELAY: Duration = Duration::from_secs(1);

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

    /// Whether [`DiscoveryHandle::discover_staged`] also probes the peers of
    /// this device's tailnet, see [`DiscoveryHandle::set_tailnet`].
    pub tailnet: bool,
}

/// An event emitted by the discovery. Every confirmation is also logged in
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

    /// The multicast sockets failed permanently, e.g. because the OS
    /// invalidated them while the application was suspended (iOS reclaims the
    /// sockets of suspended apps). Announcements are no longer heard or sent;
    /// the application should restart discovery to rebind the sockets.
    /// HTTP-based discovery (probes and subnet scans) keeps working.
    MulticastFailed,
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

    /// Whether the tailnet peers are probed, see
    /// [`DiscoveryHandle::set_tailnet`].
    tailnet: AtomicBool,

    /// The interface addresses a subnet scan is currently running for.
    scanning: std::sync::Mutex<HashSet<Ipv4Addr>>,

    /// Number of confirmations over the local network in this run, on which
    /// [`DiscoveryHandle::discover_staged`] decides whether to escalate.
    confirmations: AtomicU64,
}

/// Where a confirmation came from.
///
/// Only [`Origin::Local`] proves that the cheap stages work on the network
/// this device is attached to, which is the question
/// [`DiscoveryHandle::discover_staged`] escalates on. A peer answering over
/// the tailnet says nothing about the local network — it is reached through a
/// tunnel — so counting it would suppress the subnet scan on exactly the
/// multicast-less networks the scan exists for.
#[derive(Clone, Copy, PartialEq, Eq)]
enum Origin {
    Local,
    Tailnet,
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
    fn unpinned_client(&self, timeout: Duration) -> Result<LsHttpClientV2, ClientError> {
        LsHttpClientV2::try_new(
            &self.identity.private_key_pem,
            &self.identity.cert_pem,
            None,
            Some(timeout),
        )
    }

    /// The clients a stage needs for `channels`, see [`Probes::client`]. The
    /// patient one is only built when one of the addresses is a tailnet
    /// address, so a stage that has none does exactly the work it always did.
    fn probes(&self, channels: &[HttpChannel]) -> Result<Probes, ClientError> {
        let tailnet = channels
            .iter()
            .any(|channel| tailscale::is_tailnet_address(&channel.host));

        Ok(Probes {
            lan: self.unpinned_client(self.timeout)?,
            tailnet: match tailnet {
                true => Some(self.unpinned_client(TAILNET_DISCOVERY_TIMEOUT)?),
                false => None,
            },
        })
    }

    /// The tailnet addresses a device in the store was confirmed on, in
    /// discovery order, without the channels the caller already probes.
    ///
    /// This is what a device that cannot enumerate its own tailnet has
    /// instead of a peer list: the addresses it has already been reached
    /// from. Only tailnet addresses are collected, because every other
    /// address is found again by the stage that exists for it — a LAN peer
    /// answers the announcement, and a subnet scan walks the rest.
    fn stored_tailnet_channels(&self, except: &[HttpChannel]) -> Vec<HttpChannel> {
        tailnet_channels(self.store.devices(), except)
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
        origin: Origin,
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
        let (_, merged) = self.found(device, origin).await;
        Ok(Some(merged))
    }

    /// Puts a device into the store, logging the confirmation on it, and
    /// emits the resulting event. Returns whether the device is new, and
    /// its stored state after the merge.
    async fn found(&self, device: DiscoveredDevice, origin: Origin) -> (bool, StatefulDevice) {
        if origin == Origin::Local {
            self.confirmations.fetch_add(1, Ordering::Relaxed);
        }
        let (event, merged) = self.store.upsert(device, SystemTime::now());
        let is_new = matches!(event, DiscoveryEvent::Discovered { .. });
        if let Some(event_tx) = &self.event_tx {
            // Never wait for the application here. A subnet scan confirms up to
            // 255 devices in a burst, far more than the channel holds, and
            // every confirmation runs inside the scan's own concurrency limit:
            // blocking on a full channel would stall the scan for good and
            // leave its `ScanGuard` held, so the interface could never be
            // scanned again.
            //
            // Dropping an event only costs a refresh. The device is in the
            // store before the event is emitted, so it is still returned by
            // the scan and by `devices()`.
            if let Err(err) = event_tx.try_send(event) {
                tracing::debug!("Dropped a discovery event: {err}");
            }
        }
        (is_new, merged)
    }
}

/// The clients of a discovery stage whose addresses the application supplied
/// and may therefore point at a LAN or into the tailnet.
struct Probes {
    lan: LsHttpClientV2,

    /// Only built when the stage carries a tailnet address, see
    /// [`DiscoveryState::probes`].
    tailnet: Option<LsHttpClientV2>,
}

impl Probes {
    /// The client to dial `host` with.
    ///
    /// A tailnet address gets [`TAILNET_DISCOVERY_TIMEOUT`], because first
    /// contact may have to punch through two NATs and falls back to a relay
    /// when it cannot, which [`DEFAULT_DISCOVERY_TIMEOUT`] would cut off —
    /// dropping exactly the remote devices such an address stands for. Every
    /// other address keeps the short timeout it always had.
    fn client(&self, host: &str) -> &LsHttpClientV2 {
        match &self.tailnet {
            Some(tailnet) if tailscale::is_tailnet_address(host) => tailnet,
            _ => &self.lan,
        }
    }
}

/// What a confirmation over `host` proves, in a stage probing addresses the
/// application supplied: a peer inside the tailnet answers through a tunnel
/// and so says nothing about the local network, see [`Origin`].
fn origin_of(host: &str) -> Origin {
    if tailscale::is_tailnet_address(host) {
        Origin::Tailnet
    } else {
        Origin::Local
    }
}

/// The tailnet addresses among the channels of `devices`, in their order,
/// without the ones in `except`.
fn tailnet_channels(devices: Vec<StatefulDevice>, except: &[HttpChannel]) -> Vec<HttpChannel> {
    devices
        .into_iter()
        .flat_map(|known| {
            known
                .channels
                .into_keys()
                .filter_map(|channel| channel.http().cloned())
                .collect::<Vec<_>>()
        })
        .filter(|channel| {
            tailscale::is_tailnet_address(&channel.host) && !except.contains(channel)
        })
        .collect()
}

/// Runs `attempt`, a register probe of the tailnet address `host`, retrying
/// it after a pause when it fails — [`TAILNET_PROBE_ATTEMPTS`] attempts in
/// all.
///
/// The retry is what makes a cold tunnel survivable: the first attempt's
/// packets wake the VPN and start NAT traversal or the relay fallback, so
/// the second attempt lands on the path the first one began establishing.
/// An answer is never retried — `Ok(None)` is an answer too, the peer turned
/// out to be this device itself.
///
/// Failures are logged and mapped to `None`, because an unreachable peer is
/// the normal case for a stage that probes every address a peer was ever
/// seen at. Unlike on the LAN stages, the log line matters here: a dropped
/// tailnet probe has no announcement or subnet scan to catch it, so it must
/// at least be diagnosable.
async fn retry_tailnet_probe<T, F, Fut>(host: &str, mut attempt: F) -> Option<T>
where
    F: FnMut() -> Fut,
    Fut: std::future::Future<Output = Result<Option<T>, ClientError>>,
{
    for tries_left in (0..TAILNET_PROBE_ATTEMPTS).rev() {
        match attempt().await {
            Ok(found) => return found,
            Err(err) => {
                tracing::debug!(
                    "Tailnet probe of {host} failed, {tries_left} attempt(s) left: {}",
                    ErrorChain(&err)
                );
                if tries_left > 0 {
                    tokio::time::sleep(TAILNET_PROBE_RETRY_DELAY).await;
                }
            }
        }
    }
    None
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
        let channel = HttpChannel {
            host: host.to_string(),
            port,
            protocol,
        };
        let probes = self.state.probes(std::slice::from_ref(&channel))?;
        self.state
            .probe(probes.client(host), host, port, protocol, origin_of(host))
            .await
    }

    /// Discovers devices at known addresses, e.g. the favorites, by sending
    /// each channel a register request: [`DiscoveryHandle::discover`] for a
    /// whole list, probed concurrently.
    ///
    /// Channels that do not answer are skipped; returns the stored state of
    /// the devices that answered, in completion order.
    ///
    /// A channel inside the tailnet is probed with the patience such a peer
    /// needs — the longer timeout of [`Probes::client`] and the retry of
    /// [`retry_tailnet_probe`] — so that a favorite reachable only over
    /// Tailscale is dropped neither by the LAN timeout nor by a tunnel that
    /// is still waking up.
    pub async fn discover_known_http_channels(
        &self,
        channels: Vec<HttpChannel>,
    ) -> Result<Vec<StatefulDevice>, ClientError> {
        let probes = self.state.probes(&channels)?;

        let state = &self.state;
        let probes = &probes;
        let found = futures_util::stream::iter(channels)
            .map(|channel| async move {
                let client = probes.client(&channel.host);
                // A tailnet address gets the retry a cold tunnel needs;
                // every other address keeps the single attempt it always had.
                if tailscale::is_tailnet_address(&channel.host) {
                    retry_tailnet_probe(&channel.host, || {
                        state.probe(client, &channel.host, channel.port, channel.protocol, Origin::Tailnet)
                    })
                    .await
                } else {
                    state
                        .probe(client, &channel.host, channel.port, channel.protocol, Origin::Local)
                        .await
                        .ok()
                        .flatten()
                }
            })
            .buffer_unordered(SCAN_CONCURRENCY)
            .filter_map(std::future::ready)
            .collect()
            .await;

        Ok(found)
    }

    /// Probes every online peer of this device's tailnet with a register
    /// request, so that devices on the same tailnet find each other even when
    /// they are on different physical networks — a phone on mobile data and a
    /// desktop on Wi-Fi, say.
    ///
    /// The peer list comes from the local Tailscale daemon, see
    /// [`crate::tailscale`]. Probing a peer is what makes this two-way: the
    /// register request also registers *this* device with the peer, so a
    /// device that cannot enumerate the tailnet itself — Android and iOS
    /// cannot — still ends up seeing the one that probed it.
    ///
    /// A device that cannot enumerate has nothing but the tailnet addresses it
    /// has already been reached from, so those are probed too, see
    /// [`DiscoveryState::stored_tailnet_channels`]. Without them a rescan on
    /// such a device loses the peer for good: the application drops its list
    /// when the user rescans, and neither an announcement nor a subnet scan
    /// can ever find a tailnet peer again.
    ///
    /// Does nothing, and is not an error, when the tailnet stage is off or no
    /// local Tailscale daemon can be reached. Every address is probed with
    /// the retry a cold tunnel needs, see [`retry_tailnet_probe`]. Returns
    /// the stored state of the peers that answered, in completion order.
    pub async fn discover_tailnet(
        &self,
        port: u16,
        protocol: ProtocolType,
    ) -> Result<Vec<StatefulDevice>, ClientError> {
        if !self.state.tailnet.load(Ordering::Relaxed) {
            return Ok(Vec::new());
        }

        // The daemon's peers come first, so that a peer which is enumerated
        // and also already known is probed at the address the daemon reports.
        let mut channels: Vec<HttpChannel> = match tailscale::peers().await {
            Ok(peers) => {
                // The one line that says whether this device can enumerate
                // its tailnet at all. A device that cannot reach its daemon —
                // a sandbox hiding the socket, Tailscale logged out — is
                // otherwise indistinguishable from one that simply found no
                // peers, and that silence has already been read once as the
                // stage never running. It is INFO because the two builds that
                // do install a subscriber, the CLI and the debug app, would
                // otherwise need their level raised by hand to answer a
                // question that costs one line to answer always.
                tracing::info!("Enumerated {} online tailnet peer(s)", peers.len());

                peers
                    .into_iter()
                    .map(|peer| HttpChannel {
                        host: peer.host,
                        port,
                        protocol,
                    })
                    .collect()
            }
            Err(err) => {
                // The normal case on a device without Tailscale, and the case
                // of every Android and iOS device, so this is not worth more
                // than a debug line.
                tracing::debug!("No tailnet peers to enumerate: {}", ErrorChain(&err));
                Vec::new()
            }
        };
        channels.extend(self.state.stored_tailnet_channels(&channels));

        if channels.is_empty() {
            return Ok(Vec::new());
        }
        tracing::debug!("Probing {} tailnet address(es)", channels.len());

        let client = self.state.unpinned_client(TAILNET_DISCOVERY_TIMEOUT)?;

        let state = &self.state;
        let client = &client;
        let found = futures_util::stream::iter(channels)
            .map(|channel| async move {
                retry_tailnet_probe(&channel.host, || {
                    state.probe(client, &channel.host, channel.port, channel.protocol, Origin::Tailnet)
                })
                .await
            })
            .buffer_unordered(SCAN_CONCURRENCY)
            .filter_map(std::future::ready)
            .collect()
            .await;

        Ok(found)
    }

    /// Discovers devices in stages, cheapest first: announces this device to
    /// the network and probes `known_channels` (e.g. the favorites), then
    /// falls back to scanning the `/24` subnets of the local interface
    /// addresses `interface_ips`, for networks that do not carry multicast.
    ///
    /// The fallback only runs when nothing was confirmed until `grace` after
    /// the known channels have been probed: any confirmation — a new device
    /// or a known one — proves that the cheap stages work on this network.
    ///
    /// The found devices are put into the store (and emitted) as they answer;
    /// returns once every stage has finished, including the whole
    /// announcement burst.
    pub async fn discover_staged(
        &self,
        known_channels: Vec<HttpChannel>,
        interface_ips: Vec<Ipv4Addr>,
        port: u16,
        protocol: ProtocolType,
        grace: Duration,
    ) -> Result<(), ClientError> {
        // A known channel inside the tailnet is probed with retries and a
        // long timeout, so it must not sit in front of the grace period: the
        // escalation would start late by exactly that much on the
        // multicast-less networks the subnet scan exists for. The tailnet
        // channels ride beside the escalation instead, like the tailnet
        // stage itself.
        let (tailnet_channels, known_channels): (Vec<_>, Vec<_>) = known_channels
            .into_iter()
            .partition(|channel| tailscale::is_tailnet_address(&channel.host));

        let confirmations = self.state.confirmations.load(Ordering::Relaxed);
        let escalate = async {
            self.discover_known_http_channels(known_channels).await?;
            tokio::time::sleep(grace).await;

            if self.state.confirmations.load(Ordering::Relaxed) == confirmations {
                futures_util::future::try_join_all(
                    interface_ips
                        .into_iter()
                        .map(|ip| self.scan_subnet(ip, port, protocol)),
                )
                .await?;
            }
            Ok(())
        };

        // The tailnet stage runs alongside the others rather than inside the
        // escalation: it reaches a different network, so it neither waits for
        // the grace period nor influences it. The application's tailnet
        // channels are probed in this lane for the same reason — but unlike
        // the enumeration they are not gated on the tailnet setting, because
        // a favorite has always been probed regardless of it.
        let tailnet = async {
            let known = async {
                if tailnet_channels.is_empty() {
                    return;
                }
                if let Err(err) = self.discover_known_http_channels(tailnet_channels).await {
                    tracing::debug!("The tailnet channel probes failed: {}", ErrorChain(&err));
                }
            };
            let enumerated = async {
                if let Err(err) = self.discover_tailnet(port, protocol).await {
                    tracing::debug!("The tailnet stage failed: {}", ErrorChain(&err));
                }
            };
            tokio::join!(known, enumerated);
        };

        let (_, _, escalated) = tokio::join!(self.announce(), tailnet, escalate);
        escalated
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

        let client = self.state.unpinned_client(self.state.timeout)?;
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
                .probe(client, &ip.to_string(), port, protocol, Origin::Local)
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

    /// Sets whether [`DiscoveryHandle::discover_staged`] also probes the
    /// peers of this device's tailnet. On by default; it costs nothing on a
    /// device that has no Tailscale.
    ///
    /// Takes effect on the next discovery, so turning the setting off does
    /// not require the sockets to be rebound.
    pub fn set_tailnet(&self, tailnet: bool) {
        self.state.tailnet.store(tailnet, Ordering::Relaxed);
    }

    /// Puts a device confirmed outside of discovery into the store, e.g. one
    /// that answered an announcement by registering with this device's HTTP
    /// server. The confirmation is emitted as `Discovered` or `Updated`;
    /// returns `true` when the device is new.
    ///
    /// A device may also have registered through the tailnet — over which it
    /// hears no announcements, so the register was probably an answer to a
    /// probe. Such a confirmation must not count towards the escalation
    /// decision for the same reason a tailnet probe does not (see [`Origin`]):
    /// it would suppress the subnet scan on exactly the multicast-less
    /// networks the scan exists for.
    pub async fn add_device(&self, device: DiscoveredDevice) -> bool {
        let origin = match device.http() {
            Some(channel) => origin_of(&channel.host),
            None => Origin::Local,
        };
        self.state.found(device, origin).await.0
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
        tailnet: AtomicBool::new(config.tailnet),
        scanning: std::sync::Mutex::new(HashSet::new()),
        confirmations: AtomicU64::new(0),
    });

    // Ends once discovery is stopped: the multicast side then drops its
    // sender and the channel closes.
    tokio::spawn({
        let state = state.clone();
        async move {
            while let Some(event) = multicast_rx.recv().await {
                match event {
                    MulticastEvent::Discovered {
                        ip,
                        scope_id,
                        message,
                    } => {
                        if !state.answering.load(Ordering::Relaxed) {
                            continue;
                        }

                        // The register request may take a while (up to the timeout),
                        // so announcements are answered concurrently.
                        tokio::spawn(answer_announcement(state.clone(), ip, scope_id, message));
                    }
                    MulticastEvent::SocketsFailed => {
                        if let Some(event_tx) = &state.event_tx {
                            let _ = event_tx.try_send(DiscoveryEvent::MulticastFailed);
                        }
                    }
                }
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
            tracing::error!(
                "Could not create the client to answer {host}: {}",
                ErrorChain(&err)
            );
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
            state.found(device, Origin::Local).await;
        }
        Err(err) => {
            let url = format!("{}://{host}:{}", message.protocol.as_str(), message.port);
            tracing::debug!(
                "Could not register with announcing device {} ({url}): {}",
                message.alias,
                ErrorChain(&err),
            );
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

#[cfg(test)]
mod tests {
    use super::*;
    use crate::model::discovery::DeviceType;

    const PORT: u16 = 53317;

    /// A device reachable at `hosts`, shaped like the store hands it out.
    fn stored(fingerprint: &str, hosts: &[&str]) -> StatefulDevice {
        let channel = |host: &str| {
            DeviceChannel::Http(HttpChannel {
                host: host.to_string(),
                port: PORT,
                protocol: ProtocolType::Https,
            })
        };

        StatefulDevice {
            device: DiscoveredDevice {
                alias: format!("Alias of {fingerprint}"),
                version: "2.2".to_string(),
                device_model: None,
                device_type: Some(DeviceType::Desktop),
                fingerprint: fingerprint.to_string(),
                channel: channel(hosts[0]),
                download: false,
            },
            channels: hosts
                .iter()
                .map(|host| (channel(host), ChannelStatus::Available))
                .collect(),
            logs: Vec::new(),
        }
    }

    fn hosts_of(channels: Vec<HttpChannel>) -> Vec<String> {
        let mut hosts: Vec<String> = channels.into_iter().map(|channel| channel.host).collect();
        hosts.sort();
        hosts
    }

    #[test]
    fn test_only_the_tailnet_addresses_are_re_probed() {
        let devices = vec![
            stored("lan", &["192.168.1.20"]),
            stored("tailnet", &["100.90.62.40"]),
        ];

        assert_eq!(
            hosts_of(tailnet_channels(devices, &[])),
            ["100.90.62.40"],
            "a LAN address is found again by the announcement and the subnet scan, \
             so re-probing it would only add work to every rescan"
        );
    }

    #[test]
    fn test_every_tailnet_address_of_a_multi_homed_device_is_re_probed() {
        let devices = vec![stored(
            "both",
            &["192.168.1.20", "100.90.62.40", "fd7a:115c:a1e0::1"],
        )];

        assert_eq!(
            hosts_of(tailnet_channels(devices, &[])),
            ["100.90.62.40", "fd7a:115c:a1e0::1"]
        );
    }

    #[test]
    fn test_a_channel_the_caller_already_probes_is_skipped() {
        let devices = vec![stored("tailnet", &["100.90.62.40"])];
        let except = [HttpChannel {
            host: "100.90.62.40".to_string(),
            port: PORT,
            protocol: ProtocolType::Https,
        }];

        assert!(
            tailnet_channels(devices, &except).is_empty(),
            "a peer the daemon enumerated must not be probed twice"
        );
    }

    /// The error an unreachable peer fails a probe with, shaped well enough
    /// for the retry helper, which only looks at success or failure.
    fn unreachable() -> ClientError {
        ClientError::Other(anyhow::anyhow!("connection timed out"))
    }

    #[tokio::test]
    async fn test_a_failed_tailnet_probe_is_retried() {
        let attempts = std::cell::Cell::new(0u32);
        let found = retry_tailnet_probe("100.64.0.1", || {
            attempts.set(attempts.get() + 1);
            let attempt = attempts.get();
            async move {
                match attempt {
                    1 => Err(unreachable()),
                    later => Ok(Some(later)),
                }
            }
        })
        .await;

        assert_eq!(
            found,
            Some(2),
            "the answer of the second attempt must be returned"
        );
        assert_eq!(
            attempts.get(),
            2,
            "success on the second attempt must stop the loop"
        );
    }

    #[tokio::test]
    async fn test_an_unreachable_tailnet_peer_is_given_up_on_after_the_retries() {
        let attempts = std::cell::Cell::new(0u32);
        let found: Option<u32> = retry_tailnet_probe("100.64.0.1", || {
            attempts.set(attempts.get() + 1);
            async { Err(unreachable()) }
        })
        .await;

        assert_eq!(found, None);
        assert_eq!(
            attempts.get(),
            TAILNET_PROBE_ATTEMPTS,
            "an offline peer is the normal case and must not be probed forever"
        );
    }

    #[tokio::test]
    async fn test_a_tailnet_probe_answered_by_this_device_itself_is_not_retried() {
        let attempts = std::cell::Cell::new(0u32);
        let found: Option<u32> = retry_tailnet_probe("100.64.0.1", || {
            attempts.set(attempts.get() + 1);
            async { Ok(None) }
        })
        .await;

        assert_eq!(found, None);
        assert_eq!(
            attempts.get(),
            1,
            "Ok(None) is an answer — the peer was this device itself — not a failure"
        );
    }
}
