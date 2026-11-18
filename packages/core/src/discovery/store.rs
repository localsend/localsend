//! The in-memory store of discovered devices.

use super::DiscoveryEvent;
use crate::http::server::PeerIp;
use crate::model::discovery::{DeviceType, ProtocolType};
use std::collections::HashMap;
use std::net::IpAddr;
use std::sync::Mutex;
use std::time::SystemTime;

/// How many log entries a device keeps. Every observation is logged and
/// chatty peers re-announce for the whole run, so the oldest entries are
/// dropped beyond this.
const MAX_LOGS: usize = 100;

/// A device discovered on the network, as it was observed on one of its
/// channels.
#[derive(Clone, Debug)]
pub struct DiscoveredDevice {
    /// The display name of the device.
    pub alias: String,

    /// Protocol version (major.minor) implemented by the device.
    pub version: String,

    /// Device model (e.g. "Samsung", "Windows").
    pub device_model: Option<String>,

    /// Device type category.
    pub device_type: Option<DeviceType>,

    /// Fingerprint identifying the device; devices are deduplicated by it.
    /// In HTTPS mode the SHA-256 hash of the certificate, otherwise a random string.
    pub fingerprint: String,

    /// The channel the device was observed on.
    pub channel: DeviceChannel,

    /// Whether the device's download API is active.
    pub download: bool,
}

/// A [`DiscoveredDevice`] as kept in the store.
#[derive(Clone, Debug)]
pub struct StatefulDevice {
    /// The device as it was most recently confirmed. For an unconfirmed
    /// device: as it most recently announced itself.
    pub device: DiscoveredDevice,

    /// Whether an HTTP request was ever exchanged with the device, in either
    /// direction.
    ///
    /// `false` for a device that was only heard announcing itself and did
    /// not answer: announcements are unauthenticated, so nothing about such
    /// a device is verified. It is kept for diagnostics and must not be
    /// offered as a transfer target.
    pub confirmed: bool,

    /// Every channel the device was observed on, with what is known about
    /// each direction.
    pub channels: HashMap<DeviceChannel, ChannelState>,

    /// The observations of this device in the order they were recorded, at
    /// most [`MAX_LOGS`].
    pub logs: Vec<DeviceLog>,
}

/// What is known about a [`DeviceChannel`] of a [`StatefulDevice`], per
/// direction: a channel that works one way does not have to work the other
/// way (e.g. because of a firewall on one of the devices).
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub struct ChannelState {
    /// This device → the peer: whether the peer can be dialed on the channel.
    pub outbound: Outbound,

    /// The peer → this device: when the peer last reached this device's
    /// server from the channel's address, `None` when it never did.
    ///
    /// There is no failed state: a request that does not arrive cannot be
    /// observed.
    pub inbound: Option<SystemTime>,
}

/// Whether a peer can be dialed on a channel.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum Outbound {
    /// No request was sent over the channel yet: the peer reached this
    /// device from it, which says nothing about the way back.
    Untested,

    /// The last request over the channel was answered, at the given time.
    Reachable(SystemTime),

    /// The last request over the channel failed, at the given time.
    Failed(SystemTime),
}

impl Outbound {
    /// The preference when choosing a channel to dial: proven before
    /// unknown before known to fail.
    fn rank(&self) -> u8 {
        match self {
            Outbound::Reachable(_) => 2,
            Outbound::Untested => 1,
            Outbound::Failed(_) => 0,
        }
    }
}

/// An observation of a device, as retained on it for display.
#[derive(Clone, Debug)]
pub struct DeviceLog {
    pub timestamp: SystemTime,

    pub event: DeviceLogEvent,
}

/// What was observed about a device, and in which direction.
#[derive(Clone, Debug, Eq, PartialEq)]
pub enum DeviceLogEvent {
    /// This device → the peer: a request over the channel was answered.
    Outbound { channel: DeviceChannel },

    /// This device → the peer: a request over the channel failed.
    OutboundFailed {
        channel: DeviceChannel,

        /// Why the request failed, for display.
        error: String,
    },

    /// The peer → this device: the peer sent a request to this device's
    /// server. The channel is the address the request came from, with the
    /// port the peer claims to serve on.
    Inbound { channel: DeviceChannel },

    /// The peer → this device: an announcement of the peer was heard.
    ///
    /// The opposite direction has no counterpart: whether the peer hears
    /// this device's announcements cannot be observed.
    MulticastInbound {
        /// The address the announcement came from, with the interface index
        /// it arrived on for link-local IPv6 sources.
        ip: PeerIp,
    },
}

impl DeviceLogEvent {
    /// The channel the event proved to work, in either direction.
    fn confirmed_channel(&self) -> Option<&DeviceChannel> {
        match self {
            DeviceLogEvent::Outbound { channel } | DeviceLogEvent::Inbound { channel } => {
                Some(channel)
            }
            DeviceLogEvent::OutboundFailed { .. } | DeviceLogEvent::MulticastInbound { .. } => None,
        }
    }
}

/// What a request told about the channel it was sent over.
pub(super) enum Observation {
    /// This device → the peer: the peer answered.
    Reached,

    /// This device → the peer: the request failed, for the given reason.
    Failed(String),

    /// The peer → this device: the peer's request arrived.
    ReachedUs,
}

/// An announcement heard over multicast, which led to an [`Observation`].
pub(super) struct Announcement {
    pub(super) ip: PeerIp,

    /// When the announcement was heard.
    pub(super) timestamp: SystemTime,
}

impl StatefulDevice {
    /// The channel to dial first. It is not necessarily reachable: when no
    /// channel is, the least bad one is returned.
    pub fn get_best_channel(&self) -> Option<&DeviceChannel> {
        self.get_ranked_channels().into_iter().next()
    }

    /// The channels in the order to dial them: reachable before untested
    /// before failed, then by [`DeviceChannel::address_preference`] (global
    /// IPv6, then IPv4, then link-local and other special addresses), then
    /// most recently confirmed first.
    pub fn get_ranked_channels(&self) -> Vec<&DeviceChannel> {
        let mut channels: Vec<_> = self.channels.iter().collect();
        channels.sort_by_key(|(channel, state)| {
            std::cmp::Reverse((
                state.outbound.rank(),
                channel.address_preference(),
                self.last_confirmed(channel),
            ))
        });
        channels.into_iter().map(|(channel, _)| channel).collect()
    }

    /// The position of the channel's most recent confirmation (in either
    /// direction) in the logs; `None` when its confirmations have been
    /// dropped from the log cap or it was never confirmed.
    fn last_confirmed(&self, channel: &DeviceChannel) -> Option<usize> {
        self.logs
            .iter()
            .rposition(|log| log.event.confirmed_channel() == Some(channel))
    }

    /// Merges an observation of `device` — made on `device.channel` — into
    /// the stored state. Returns the event describing what happened.
    fn apply(
        &mut self,
        device: DiscoveredDevice,
        observation: Observation,
        timestamp: SystemTime,
    ) -> DiscoveryEvent {
        self.update_channel(&device.channel, &observation, timestamp);

        let channel = device.channel.clone();
        self.log(
            timestamp,
            match &observation {
                Observation::Reached => DeviceLogEvent::Outbound { channel },
                Observation::ReachedUs => DeviceLogEvent::Inbound { channel },
                Observation::Failed(error) => DeviceLogEvent::OutboundFailed {
                    channel,
                    error: error.clone(),
                },
            },
        );

        if let Observation::Failed(error) = observation {
            // A failed request carries no verified information: what a
            // confirmed device said about itself must not be replaced by
            // what an announcement claims.
            if self.confirmed {
                return DiscoveryEvent::Updated { device };
            }
            self.device = device.clone();
            return DiscoveryEvent::Unreachable { device, error };
        }

        let is_new = !self.confirmed;
        self.confirmed = true;
        self.device = device.clone();
        if is_new {
            DiscoveryEvent::Discovered { device }
        } else {
            DiscoveryEvent::Updated { device }
        }
    }

    /// Updates the per-direction state of `channel`.
    ///
    /// Channels are merged by endpoint: a confirmation over a known address
    /// replaces its channel (e.g. when the port changed), an unknown address
    /// adds one.
    fn update_channel(
        &mut self,
        channel: &DeviceChannel,
        observation: &Observation,
        timestamp: SystemTime,
    ) {
        let same_endpoint = self
            .channels
            .keys()
            .find(|known| known.same_endpoint(channel))
            .cloned();

        match observation {
            Observation::Reached => {
                // The inbound direction is about the address the peer's
                // requests come from, which did not change.
                let inbound = same_endpoint
                    .and_then(|known| self.channels.remove(&known))
                    .and_then(|state| state.inbound);
                self.channels.insert(
                    channel.clone(),
                    ChannelState {
                        outbound: Outbound::Reachable(timestamp),
                        inbound,
                    },
                );
            }
            Observation::ReachedUs => {
                // What is known about the outbound direction only holds for
                // the exact channel: the peer may claim another port by now.
                let outbound =
                    match same_endpoint.and_then(|known| self.channels.remove_entry(&known)) {
                        Some((known, state)) if known == *channel => state.outbound,
                        _ => Outbound::Untested,
                    };
                self.channels.insert(
                    channel.clone(),
                    ChannelState {
                        outbound,
                        inbound: Some(timestamp),
                    },
                );
            }
            Observation::Failed(_) => {
                // A failure never replaces a channel: when the address is
                // known with another port, the failure says nothing about
                // that one, and is only logged.
                if same_endpoint.is_none_or(|known| known == *channel) {
                    self.channels
                        .entry(channel.clone())
                        .or_insert(ChannelState {
                            outbound: Outbound::Untested,
                            inbound: None,
                        })
                        .outbound = Outbound::Failed(timestamp);
                }
            }
        }
    }

    fn log(&mut self, timestamp: SystemTime, event: DeviceLogEvent) {
        self.logs.push(DeviceLog { timestamp, event });
        if self.logs.len() > MAX_LOGS {
            let excess = self.logs.len() - MAX_LOGS;
            self.logs.drain(..excess);
        }
    }
}

impl DiscoveredDevice {
    /// The device's HTTP channel, when it was observed over HTTP.
    pub fn http(&self) -> Option<&HttpChannel> {
        self.channel.http()
    }
}

/// A channel a device is reachable on.
///
/// Only HTTP exists so far; other transports (e.g. WebRTC, Bluetooth) will
/// become further variants.
#[derive(Clone, Debug, Eq, Hash, PartialEq)]
pub enum DeviceChannel {
    /// The device's HTTP server (protocol v2), reachable at one address.
    Http(HttpChannel),
}

impl DeviceChannel {
    /// The HTTP address, when this is an HTTP channel.
    pub fn http(&self) -> Option<&HttpChannel> {
        match self {
            DeviceChannel::Http(http) => Some(http),
        }
    }

    /// Whether two channels address the same endpoint, so that a
    /// re-confirmation updates the known channel instead of adding one.
    fn same_endpoint(&self, other: &DeviceChannel) -> bool {
        match (self, other) {
            (DeviceChannel::Http(own), DeviceChannel::Http(other)) => own.host == other.host,
        }
    }

    /// How much the channel's address is preferred among channels that are
    /// equally reachable, higher first. It only judges the address's scope,
    /// not whether a route to it exists:
    ///
    /// - 2: global (`2000::/3`) and unique-local (`fc00::/7`) IPv6
    /// - 1: IPv4, including IPv4-mapped IPv6
    /// - 0: link-local IPv6 and any other special or unparsable host
    ///
    /// Link-local addresses come last because networks such as phone
    /// hotspots often do not deliver them, while a global address or IPv4 of
    /// the same device works. They stay candidates for when nothing else is.
    fn address_preference(&self) -> u8 {
        match self {
            DeviceChannel::Http(http) => {
                // Strip the scope of a link-local address like `fe80::1%3`.
                let host = http.host.split('%').next().unwrap_or(&http.host);
                match host.parse::<IpAddr>() {
                    Ok(IpAddr::V4(_)) => 1,
                    Ok(IpAddr::V6(address)) if address.to_ipv4_mapped().is_some() => 1,
                    Ok(IpAddr::V6(address)) => {
                        let prefix = address.segments()[0];
                        let global = prefix & 0xe000 == 0x2000;
                        let unique_local = prefix & 0xfe00 == 0xfc00;
                        if global || unique_local {
                            2
                        } else {
                            0
                        }
                    }
                    Err(_) => 0,
                }
            }
        }
    }
}

/// The address of a device's HTTP server.
#[derive(Clone, Debug, Eq, Hash, PartialEq)]
pub struct HttpChannel {
    /// The host to dial: an IP address, or the scoped form `fe80::1%3` for
    /// link-local IPv6 (the HTTP client accepts both).
    pub host: String,

    /// The port of the HTTP server.
    pub port: u16,

    /// Whether the HTTP server uses TLS.
    pub protocol: ProtocolType,
}

/// All devices observed in this run, identified by fingerprint, in the order
/// they were first observed.
pub(super) struct DeviceStore {
    devices: Mutex<Vec<StatefulDevice>>,
}

impl DeviceStore {
    pub(super) fn new() -> Self {
        Self {
            devices: Mutex::new(Vec::new()),
        }
    }

    /// Merges an observation of a device — made on `device.channel`, after
    /// hearing `announcement` when that is what led to it — into the store,
    /// logging it on the device. Returns the event describing what happened
    /// and the stored state after the merge.
    ///
    /// A confirmation ([`Observation::Reached`], [`Observation::ReachedUs`])
    /// yields [`DiscoveryEvent::Discovered`] the first time and
    /// [`DiscoveryEvent::Updated`] afterwards. A failure yields `Updated`
    /// for a confirmed device and [`DiscoveryEvent::Unreachable`] otherwise;
    /// an unknown device then enters the store unconfirmed.
    pub(super) fn observe(
        &self,
        device: DiscoveredDevice,
        observation: Observation,
        announcement: Option<Announcement>,
        timestamp: SystemTime,
    ) -> (DiscoveryEvent, StatefulDevice) {
        let mut devices = self.devices.lock().unwrap();
        let index = match devices
            .iter()
            .position(|known| known.device.fingerprint == device.fingerprint)
        {
            Some(index) => index,
            None => {
                devices.push(StatefulDevice {
                    device: device.clone(),
                    confirmed: false,
                    channels: HashMap::new(),
                    logs: Vec::new(),
                });
                devices.len() - 1
            }
        };
        let known = &mut devices[index];

        if let Some(announcement) = announcement {
            known.log(
                announcement.timestamp,
                DeviceLogEvent::MulticastInbound {
                    ip: announcement.ip,
                },
            );
        }
        let event = known.apply(device, observation, timestamp);
        (event, known.clone())
    }

    /// Merges the outcome of a request sent to a known device over
    /// `channel` into the store, like [`DeviceStore::observe`]. Returns
    /// `None` when no device has the fingerprint.
    pub(super) fn report_outbound(
        &self,
        fingerprint: &str,
        channel: DeviceChannel,
        result: Result<(), String>,
        timestamp: SystemTime,
    ) -> Option<DiscoveryEvent> {
        let mut devices = self.devices.lock().unwrap();
        let known = devices
            .iter_mut()
            .find(|known| known.device.fingerprint == fingerprint)?;

        let device = DiscoveredDevice {
            channel,
            ..known.device.clone()
        };
        let observation = match result {
            Ok(()) => Observation::Reached,
            Err(error) => Observation::Failed(error),
        };
        Some(known.apply(device, observation, timestamp))
    }

    /// All confirmed devices in the order they were first observed.
    pub(super) fn devices(&self) -> Vec<StatefulDevice> {
        self.filtered(|known| known.confirmed)
    }

    /// The devices that were heard announcing themselves but never
    /// confirmed, in the order they were first heard.
    pub(super) fn unconfirmed_devices(&self) -> Vec<StatefulDevice> {
        self.filtered(|known| !known.confirmed)
    }

    /// The confirmed device with the given fingerprint.
    pub(super) fn by_fingerprint(&self, fingerprint: &str) -> Option<StatefulDevice> {
        self.devices
            .lock()
            .unwrap()
            .iter()
            .find(|known| known.confirmed && known.device.fingerprint == fingerprint)
            .cloned()
    }

    fn filtered(&self, predicate: impl Fn(&StatefulDevice) -> bool) -> Vec<StatefulDevice> {
        self.devices
            .lock()
            .unwrap()
            .iter()
            .filter(|known| predicate(known))
            .cloned()
            .collect()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn channel(host: &str, port: u16) -> DeviceChannel {
        DeviceChannel::Http(HttpChannel {
            host: host.to_string(),
            port,
            protocol: ProtocolType::Https,
        })
    }

    fn device(fingerprint: &str, host: &str) -> DiscoveredDevice {
        DiscoveredDevice {
            alias: format!("Alias of {fingerprint}"),
            version: "2.2".to_string(),
            device_model: None,
            device_type: Some(DeviceType::Desktop),
            fingerprint: fingerprint.to_string(),
            channel: channel(host, 53317),
            download: false,
        }
    }

    /// This device reached `device`.
    fn reach(store: &DeviceStore, device: DiscoveredDevice) -> DiscoveryEvent {
        store
            .observe(device, Observation::Reached, None, SystemTime::now())
            .0
    }

    /// `device` reached this device.
    fn reached_by(store: &DeviceStore, device: DiscoveredDevice) -> DiscoveryEvent {
        store
            .observe(device, Observation::ReachedUs, None, SystemTime::now())
            .0
    }

    /// This device could not reach `device`.
    fn fail(store: &DeviceStore, device: DiscoveredDevice) -> DiscoveryEvent {
        store
            .observe(
                device,
                Observation::Failed("connection refused".to_string()),
                None,
                SystemTime::now(),
            )
            .0
    }

    fn channel_host(channel: &DeviceChannel) -> &str {
        channel.http().unwrap().host.as_str()
    }

    fn state_of(known: &StatefulDevice, host: &str) -> ChannelState {
        *known
            .channels
            .iter()
            .find(|(channel, _)| channel_host(channel) == host)
            .unwrap_or_else(|| panic!("no channel for {host}"))
            .1
    }

    fn ranked_hosts(known: &StatefulDevice) -> Vec<&str> {
        known
            .get_ranked_channels()
            .into_iter()
            .map(channel_host)
            .collect()
    }

    /// The marker telling log entries apart: the host the confirmation
    /// happened on.
    fn log_marker(log: &DeviceLog) -> &str {
        channel_host(log.event.confirmed_channel().unwrap())
    }

    #[test]
    fn test_only_the_first_confirmation_is_reported_as_discovered() {
        let store = DeviceStore::new();

        let event = reach(&store, device("a", "192.168.0.10"));
        assert!(matches!(event, DiscoveryEvent::Discovered { .. }));
        let event = reached_by(&store, device("b", "192.168.0.11"));
        assert!(matches!(event, DiscoveryEvent::Discovered { .. }));
        let event = reach(&store, device("a", "10.0.0.10"));
        assert!(matches!(event, DiscoveryEvent::Updated { .. }));
        let event = reached_by(&store, device("a", "10.0.0.10"));
        assert!(matches!(event, DiscoveryEvent::Updated { .. }));
    }

    #[test]
    fn test_every_observation_is_logged_with_its_direction() {
        let store = DeviceStore::new();

        reach(&store, device("a", "192.168.0.10"));
        reached_by(&store, device("a", "fe80::1%3"));
        fail(&store, device("a", "10.0.0.10"));

        let events: Vec<DeviceLogEvent> = store
            .by_fingerprint("a")
            .unwrap()
            .logs
            .into_iter()
            .map(|log| log.event)
            .collect();
        assert_eq!(
            events,
            [
                DeviceLogEvent::Outbound {
                    channel: channel("192.168.0.10", 53317)
                },
                DeviceLogEvent::Inbound {
                    channel: channel("fe80::1%3", 53317)
                },
                DeviceLogEvent::OutboundFailed {
                    channel: channel("10.0.0.10", 53317),
                    error: "connection refused".to_string(),
                },
            ]
        );
    }

    #[test]
    fn test_announcement_is_logged_before_what_it_led_to() {
        let store = DeviceStore::new();
        let heard = SystemTime::now();
        let ip = PeerIp {
            ip: "192.168.0.10".parse().unwrap(),
            scope_id: None,
        };

        store.observe(
            device("a", "192.168.0.10"),
            Observation::Reached,
            Some(Announcement {
                ip,
                timestamp: heard,
            }),
            SystemTime::now(),
        );

        let logs = store.by_fingerprint("a").unwrap().logs;
        assert_eq!(logs.len(), 2);
        assert_eq!(logs[0].event, DeviceLogEvent::MulticastInbound { ip });
        assert_eq!(
            logs[0].timestamp, heard,
            "the announcement must be logged with the time it was heard"
        );
        assert!(matches!(logs[1].event, DeviceLogEvent::Outbound { .. }));
    }

    #[test]
    fn test_oldest_logs_are_dropped_beyond_the_cap() {
        let store = DeviceStore::new();

        for i in 0..MAX_LOGS + 5 {
            reach(&store, device("a", &i.to_string()));
        }

        let logs = store.by_fingerprint("a").unwrap().logs;
        assert_eq!(logs.len(), MAX_LOGS);
        assert_eq!(log_marker(&logs[0]), "5", "the oldest entries must go");
        assert_eq!(
            log_marker(logs.last().unwrap()),
            &(MAX_LOGS + 4).to_string()
        );
    }

    #[test]
    fn test_answered_request_makes_the_channel_reachable() {
        let store = DeviceStore::new();

        reach(&store, device("a", "192.168.0.10"));

        let state = state_of(&store.by_fingerprint("a").unwrap(), "192.168.0.10");
        assert!(matches!(state.outbound, Outbound::Reachable(_)));
        assert_eq!(
            state.inbound, None,
            "reaching a device must not claim that it can reach us"
        );
    }

    #[test]
    fn test_incoming_request_leaves_the_outbound_direction_untested() {
        let store = DeviceStore::new();

        reached_by(&store, device("a", "192.168.0.10"));

        let state = state_of(&store.by_fingerprint("a").unwrap(), "192.168.0.10");
        assert_eq!(
            state.outbound,
            Outbound::Untested,
            "a device reaching us must not count as reachable"
        );
        assert!(state.inbound.is_some());
    }

    #[test]
    fn test_directions_of_a_channel_are_tracked_independently() {
        let store = DeviceStore::new();

        reach(&store, device("a", "192.168.0.10"));
        reached_by(&store, device("a", "192.168.0.10"));
        let state = state_of(&store.by_fingerprint("a").unwrap(), "192.168.0.10");
        assert!(
            matches!(state.outbound, Outbound::Reachable(_)),
            "an incoming request must keep the proven outbound direction"
        );
        assert!(state.inbound.is_some());

        fail(&store, device("a", "192.168.0.10"));
        let state = state_of(&store.by_fingerprint("a").unwrap(), "192.168.0.10");
        assert!(matches!(state.outbound, Outbound::Failed(_)));
        assert!(
            state.inbound.is_some(),
            "a failed request must keep the inbound direction"
        );

        reach(&store, device("a", "192.168.0.10"));
        let state = state_of(&store.by_fingerprint("a").unwrap(), "192.168.0.10");
        assert!(
            matches!(state.outbound, Outbound::Reachable(_)),
            "an answered request must make a failed channel reachable again"
        );
        assert!(state.inbound.is_some());
    }

    #[test]
    fn test_channels_of_a_multi_homed_device_are_collected() {
        let store = DeviceStore::new();

        reach(&store, device("a", "192.168.0.10"));
        reach(&store, device("a", "fe80::1%3"));

        let devices = store.devices();
        assert_eq!(devices.len(), 1);
        let known = &devices[0];
        let mut hosts: Vec<&str> = known.channels.keys().map(channel_host).collect();
        hosts.sort();
        assert_eq!(
            hosts,
            ["192.168.0.10", "fe80::1%3"],
            "every address the device was confirmed on must be kept"
        );
        assert_eq!(
            channel_host(&known.device.channel),
            "fe80::1%3",
            "the device must carry the channel of the last confirmation"
        );
    }

    #[test]
    fn test_confirmation_replaces_channel_of_known_endpoint() {
        let store = DeviceStore::new();

        reach(&store, device("a", "192.168.0.10"));
        reached_by(&store, device("a", "192.168.0.10"));
        reach(&store, device("a", "fe80::1%3"));

        let mut update = device("a", "192.168.0.10");
        update.channel = channel("192.168.0.10", 54000);
        reach(&store, update);

        let known = store.by_fingerprint("a").unwrap();
        let mut channels: Vec<(&str, u16)> = known
            .channels
            .keys()
            .map(|channel| {
                let http = channel.http().unwrap();
                (http.host.as_str(), http.port)
            })
            .collect();
        channels.sort();
        assert_eq!(
            channels,
            [("192.168.0.10", 54000), ("fe80::1%3", 53317)],
            "a known address must be replaced, not duplicated"
        );
        assert!(
            state_of(&known, "192.168.0.10").inbound.is_some(),
            "the inbound direction belongs to the address, not to the port"
        );
    }

    #[test]
    fn test_incoming_request_claiming_another_port_resets_the_outbound_direction() {
        let store = DeviceStore::new();

        reach(&store, device("a", "192.168.0.10"));

        let mut update = device("a", "192.168.0.10");
        update.channel = channel("192.168.0.10", 54000);
        reached_by(&store, update);

        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(
            known.channels.keys().collect::<Vec<_>>(),
            [&channel("192.168.0.10", 54000)],
            "the claimed port must replace the known one"
        );
        assert_eq!(
            state_of(&known, "192.168.0.10").outbound,
            Outbound::Untested,
            "the proof for the old port must not carry over to the new one"
        );
    }

    #[test]
    fn test_failure_does_not_touch_the_same_address_with_another_port() {
        let store = DeviceStore::new();

        reach(&store, device("a", "192.168.0.10"));

        let mut failed = device("a", "192.168.0.10");
        failed.channel = channel("192.168.0.10", 54000);
        fail(&store, failed);

        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(
            known.channels.keys().collect::<Vec<_>>(),
            [&channel("192.168.0.10", 53317)],
            "a failure must not replace or add a channel for a known address"
        );
        assert!(matches!(
            state_of(&known, "192.168.0.10").outbound,
            Outbound::Reachable(_)
        ));
        assert!(
            matches!(
                known.logs.last().unwrap().event,
                DeviceLogEvent::OutboundFailed { .. }
            ),
            "the failure must still be logged"
        );
    }

    #[test]
    fn test_unanswered_device_is_stored_unconfirmed() {
        let store = DeviceStore::new();

        let event = fail(&store, device("a", "192.168.0.10"));
        match event {
            DiscoveryEvent::Unreachable { error, .. } => assert_eq!(error, "connection refused"),
            other => panic!("expected an Unreachable event, got {other:?}"),
        }

        assert!(
            store.devices().is_empty(),
            "an unconfirmed device must not be listed as discovered"
        );
        assert!(store.by_fingerprint("a").is_none());

        let unconfirmed = store.unconfirmed_devices();
        assert_eq!(unconfirmed.len(), 1);
        assert!(!unconfirmed[0].confirmed);
        assert!(matches!(
            state_of(&unconfirmed[0], "192.168.0.10").outbound,
            Outbound::Failed(_)
        ));
    }

    #[test]
    fn test_unconfirmed_device_is_discovered_by_its_first_confirmation() {
        let store = DeviceStore::new();

        fail(&store, device("a", "192.168.0.10"));
        let event = reached_by(&store, device("a", "192.168.0.10"));

        assert!(
            matches!(event, DiscoveryEvent::Discovered { .. }),
            "the first confirmation must discover the device"
        );
        assert!(store.unconfirmed_devices().is_empty());
        let known = store.by_fingerprint("a").unwrap();
        assert!(known.confirmed);
        let state = state_of(&known, "192.168.0.10");
        assert!(
            matches!(state.outbound, Outbound::Failed(_)),
            "an incoming request must keep the failed outbound direction"
        );
        assert!(state.inbound.is_some());
    }

    #[test]
    fn test_failure_does_not_replace_what_a_confirmed_device_said() {
        let store = DeviceStore::new();

        reach(&store, device("a", "192.168.0.10"));

        let mut claimed = device("a", "10.0.0.10");
        claimed.alias = "Claimed".to_string();
        fail(&store, claimed);

        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(known.device.alias, "Alias of a");
        assert_eq!(channel_host(&known.device.channel), "192.168.0.10");
        assert!(
            matches!(state_of(&known, "10.0.0.10").outbound, Outbound::Failed(_)),
            "the failed address must still be recorded"
        );
    }

    #[test]
    fn test_reported_outcome_updates_the_channel() {
        let store = DeviceStore::new();
        let now = SystemTime::now();

        reach(&store, device("a", "192.168.0.10"));

        let event = store.report_outbound(
            "a",
            channel("192.168.0.10", 53317),
            Err("timed out".to_string()),
            now,
        );
        match event {
            // The device stays confirmed: only the ranking of its channels
            // changed.
            Some(DiscoveryEvent::Updated { device }) => {
                assert_eq!(device.alias, "Alias of a");
                assert_eq!(channel_host(&device.channel), "192.168.0.10");
            }
            other => panic!("expected an Updated event, got {other:?}"),
        }
        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(
            state_of(&known, "192.168.0.10").outbound,
            Outbound::Failed(now)
        );

        let event = store.report_outbound("a", channel("192.168.0.10", 53317), Ok(()), now);
        assert!(matches!(event, Some(DiscoveryEvent::Updated { .. })));
        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(
            state_of(&known, "192.168.0.10").outbound,
            Outbound::Reachable(now)
        );

        assert!(
            store
                .report_outbound("unknown", channel("192.168.0.10", 53317), Ok(()), now)
                .is_none(),
            "an outcome for an unknown device must be ignored"
        );
    }

    #[test]
    fn test_ranking_prefers_the_most_recent_confirmation() {
        let store = DeviceStore::new();

        reach(&store, device("a", "192.168.0.10"));
        reach(&store, device("a", "10.0.0.10"));
        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(channel_host(known.get_best_channel().unwrap()), "10.0.0.10");

        reach(&store, device("a", "192.168.0.10"));
        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(
            channel_host(known.get_best_channel().unwrap()),
            "192.168.0.10",
            "the latest confirmation must win among equals"
        );
    }

    #[test]
    fn test_ranking_prefers_global_ipv6_over_ipv4() {
        let store = DeviceStore::new();

        reach(&store, device("a", "fd00::1"));
        reach(&store, device("a", "192.168.0.10"));

        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(
            channel_host(known.get_best_channel().unwrap()),
            "fd00::1",
            "global IPv6 must beat a more recent IPv4 confirmation"
        );
    }

    #[test]
    fn test_ranking_prefers_ipv4_over_link_local() {
        let store = DeviceStore::new();

        // As on a phone hotspot: both addresses only reached us so far, and
        // the link-local one may not be delivered in the other direction.
        reached_by(&store, device("a", "192.168.0.10"));
        reached_by(&store, device("a", "fe80::1%3"));

        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(
            ranked_hosts(&known),
            ["192.168.0.10", "fe80::1%3"],
            "IPv4 must beat a more recent link-local confirmation"
        );
    }

    #[test]
    fn test_ranking_prefers_reachable_link_local_over_untested_ipv4() {
        let store = DeviceStore::new();

        reach(&store, device("a", "fe80::1%3"));
        reached_by(&store, device("a", "192.168.0.10"));

        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(
            ranked_hosts(&known),
            ["fe80::1%3", "192.168.0.10"],
            "a proven link-local channel must beat an untested IPv4 one"
        );
    }

    #[test]
    fn test_link_local_only_device_has_a_best_channel() {
        let store = DeviceStore::new();

        reached_by(&store, device("a", "fe80::1%3"));

        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(channel_host(known.get_best_channel().unwrap()), "fe80::1%3");
    }

    #[test]
    fn test_address_preference() {
        for (host, expected) in [
            ("2001:db8::1", 2),
            ("fc00::1", 2),
            ("fd12:3456::1", 2),
            ("192.168.0.10", 1),
            ("::ffff:192.168.0.10", 1),
            ("fe80::1%3", 0),
            ("febf::1%4", 0),
            ("::1", 0),
            ("::", 0),
            ("ff02::1", 0),
            ("localhost", 0),
        ] {
            assert_eq!(
                channel(host, 53317).address_preference(),
                expected,
                "{host}"
            );
        }
    }

    #[test]
    fn test_ranking_prefers_reachable_over_untested_over_failed() {
        let store = DeviceStore::new();

        fail(&store, device("a", "fe80::2%3"));
        reach(&store, device("a", "192.168.0.10"));
        reached_by(&store, device("a", "fe80::1%3"));

        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(
            ranked_hosts(&known),
            ["192.168.0.10", "fe80::1%3", "fe80::2%3"],
            "a proven IPv4 channel must beat a more recent IPv6 one that only reached us"
        );
    }

    #[test]
    fn test_ranking_sorts_best_first() {
        let store = DeviceStore::new();

        reach(&store, device("a", "192.168.0.10"));
        reach(&store, device("a", "10.0.0.10"));
        reach(&store, device("a", "fd00::1"));

        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(
            ranked_hosts(&known),
            ["fd00::1", "10.0.0.10", "192.168.0.10"],
            "global IPv6 must come first, then the more recent IPv4 confirmation"
        );

        fail(&store, device("a", "fd00::1"));
        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(
            ranked_hosts(&known),
            ["10.0.0.10", "192.168.0.10", "fd00::1"],
            "a failed channel must sort last"
        );
    }

    #[test]
    fn test_devices_keep_discovery_order() {
        let store = DeviceStore::new();

        reach(&store, device("a", "192.168.0.10"));
        reach(&store, device("b", "192.168.0.11"));
        reach(&store, device("a", "192.168.0.12"));

        let fingerprints: Vec<String> = store
            .devices()
            .into_iter()
            .map(|known| known.device.fingerprint)
            .collect();
        assert_eq!(fingerprints, ["a", "b"]);

        assert_eq!(
            store
                .by_fingerprint("b")
                .unwrap()
                .device
                .http()
                .unwrap()
                .host,
            "192.168.0.11"
        );
        assert!(store.by_fingerprint("c").is_none());
    }
}
