//! The in-memory store of discovered devices.

use super::DiscoveryEvent;
use crate::model::discovery::{DeviceType, ProtocolType};
use std::collections::HashMap;
use std::net::IpAddr;
use std::sync::Mutex;
use std::time::SystemTime;

/// How many log entries a device keeps. Every confirmation is logged and
/// chatty peers re-announce for the whole run, so the oldest entries are
/// dropped beyond this.
const MAX_LOGS: usize = 100;

/// A device discovered on the network, confirmed over one of its channels.
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

    /// The channel the device was confirmed over.
    pub channel: DeviceChannel,

    /// Whether the device's download API is active.
    pub download: bool,
}

/// A [`DiscoveredDevice`] as kept in the store.
#[derive(Clone, Debug)]
pub struct StatefulDevice {
    /// The device as it was most recently confirmed.
    pub device: DiscoveredDevice,

    /// Every channel the device was confirmed on, with its current status.
    /// Starts with `Available`, the application is responsible
    /// to set it to `NotReachable` on error.
    pub channels: HashMap<DeviceChannel, ChannelStatus>,

    /// The events that affected this device, oldest first, at most
    /// [`MAX_LOGS`]. Every confirmation is logged, so the last entry is when
    /// the device was last seen.
    pub logs: Vec<DeviceLog>,
}

/// Whether a [`DeviceChannel`] of a [`StatefulDevice`] is believed to work.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum ChannelStatus {
    /// The channel worked when it was last used.
    Available,

    /// The channel failed when it was last used. A re-confirmation over the
    /// channel makes it available again.
    NotReachable,
}

/// A confirmation of a device, as retained on it for display.
#[derive(Clone, Debug)]
pub struct DeviceLog {
    pub timestamp: SystemTime,

    /// Whether the confirmation discovered the device or re-confirmed it.
    pub kind: DeviceLogKind,

    /// The channel the confirmation happened on.
    pub channel: DeviceChannel,
}

/// What a logged confirmation meant for the device, mirroring the
/// [`DiscoveryEvent`] variants.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum DeviceLogKind {
    /// The device entered the store.
    Discovered,

    /// An already known device was confirmed again.
    Updated,
}

impl StatefulDevice {
    pub fn get_best_channel(&self) -> Option<&DeviceChannel> {
        self.get_ranked_channels().into_iter().next()
    }

    pub fn get_ranked_channels(&self) -> Vec<&DeviceChannel> {
        let mut channels: Vec<_> = self.channels.iter().collect();
        channels.sort_by_key(|(channel, status)| {
            std::cmp::Reverse((
                **status == ChannelStatus::Available,
                channel.is_ipv6(),
                self.last_confirmed(channel),
            ))
        });
        channels.into_iter().map(|(channel, _)| channel).collect()
    }

    /// The position of the channel's most recent confirmation in the logs;
    /// `None` when its confirmations have been dropped from the log cap.
    fn last_confirmed(&self, channel: &DeviceChannel) -> Option<usize> {
        self.logs.iter().rposition(|log| log.channel == *channel)
    }
}

impl DiscoveredDevice {
    /// The device's HTTP channel, when it was confirmed over HTTP.
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

    /// Whether the channel dials an IPv6 address.
    fn is_ipv6(&self) -> bool {
        match self {
            DeviceChannel::Http(http) => {
                // Strip the scope of a link-local address like `fe80::1%3`.
                let host = http.host.split('%').next().unwrap_or(&http.host);
                matches!(host.parse::<IpAddr>(), Ok(IpAddr::V6(_)))
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

/// All devices discovered in this run, identified by fingerprint, in
/// discovery order.
pub(super) struct DeviceStore {
    devices: Mutex<Vec<StatefulDevice>>,
}

impl DeviceStore {
    pub(super) fn new() -> Self {
        Self {
            devices: Mutex::new(Vec::new()),
        }
    }

    /// Adds or updates a device, logging the confirmation on it. Returns the
    /// event describing what happened — [`DiscoveryEvent::Discovered`] for a
    /// new device, [`DiscoveryEvent::Updated`] for a known one — and the
    /// stored state after the merge.
    ///
    /// Channels are merged by endpoint: a rediscovery over a known address
    /// replaces its channel (and makes it available again), an unknown
    /// address adds one.
    pub(super) fn upsert(
        &self,
        device: DiscoveredDevice,
        timestamp: SystemTime,
    ) -> (DiscoveryEvent, StatefulDevice) {
        let mut devices = self.devices.lock().unwrap();
        match devices
            .iter_mut()
            .find(|known| known.device.fingerprint == device.fingerprint)
        {
            Some(known) => {
                known
                    .channels
                    .retain(|channel, _| !channel.same_endpoint(&device.channel));
                known
                    .channels
                    .insert(device.channel.clone(), ChannelStatus::Available);

                known.logs.push(DeviceLog {
                    timestamp,
                    kind: DeviceLogKind::Updated,
                    channel: device.channel.clone(),
                });
                if known.logs.len() > MAX_LOGS {
                    let excess = known.logs.len() - MAX_LOGS;
                    known.logs.drain(..excess);
                }

                let event = DiscoveryEvent::Updated {
                    device: device.clone(),
                };
                known.device = device;
                (event, known.clone())
            }
            None => {
                let known = StatefulDevice {
                    channels: HashMap::from([(device.channel.clone(), ChannelStatus::Available)]),
                    logs: vec![DeviceLog {
                        timestamp,
                        kind: DeviceLogKind::Discovered,
                        channel: device.channel.clone(),
                    }],
                    device: device.clone(),
                };
                devices.push(known.clone());
                (DiscoveryEvent::Discovered { device }, known)
            }
        }
    }

    /// All discovered devices in discovery order.
    pub(super) fn devices(&self) -> Vec<StatefulDevice> {
        self.devices.lock().unwrap().clone()
    }

    pub(super) fn by_fingerprint(&self, fingerprint: &str) -> Option<StatefulDevice> {
        self.devices
            .lock()
            .unwrap()
            .iter()
            .find(|known| known.device.fingerprint == fingerprint)
            .cloned()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn device(fingerprint: &str, host: &str) -> DiscoveredDevice {
        DiscoveredDevice {
            alias: format!("Alias of {fingerprint}"),
            version: "2.1".to_string(),
            device_model: None,
            device_type: Some(DeviceType::Desktop),
            fingerprint: fingerprint.to_string(),
            channel: DeviceChannel::Http(HttpChannel {
                host: host.to_string(),
                port: 53317,
                protocol: ProtocolType::Https,
            }),
            download: false,
        }
    }

    fn channel_host(channel: &DeviceChannel) -> &str {
        channel.http().unwrap().host.as_str()
    }

    /// The marker telling log entries apart: the host the confirmation
    /// happened on.
    fn log_marker(log: &DeviceLog) -> &str {
        log.channel.http().unwrap().host.as_str()
    }

    #[test]
    fn test_upsert_reports_only_the_first_confirmation_as_discovered() {
        let store = DeviceStore::new();
        let now = SystemTime::now();

        let (event, _) = store.upsert(device("a", "192.168.0.10"), now);
        assert!(matches!(event, DiscoveryEvent::Discovered { .. }));
        let (event, _) = store.upsert(device("b", "192.168.0.11"), now);
        assert!(matches!(event, DiscoveryEvent::Discovered { .. }));
        let (event, _) = store.upsert(device("a", "10.0.0.10"), now);
        assert!(matches!(event, DiscoveryEvent::Updated { .. }));
    }

    #[test]
    fn test_upsert_logs_every_confirmation() {
        let store = DeviceStore::new();

        store.upsert(device("a", "192.168.0.10"), SystemTime::now());
        store.upsert(device("a", "fe80::1%3"), SystemTime::now());

        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(known.logs.len(), 2, "every confirmation must be logged");
        assert_eq!(known.logs[0].kind, DeviceLogKind::Discovered);
        assert_eq!(known.logs[1].kind, DeviceLogKind::Updated);
        assert_eq!(log_marker(&known.logs[1]), "fe80::1%3");
    }

    #[test]
    fn test_oldest_logs_are_dropped_beyond_the_cap() {
        let store = DeviceStore::new();

        for i in 0..MAX_LOGS + 5 {
            store.upsert(device("a", &i.to_string()), SystemTime::now());
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
    fn test_upsert_collects_channels_of_a_multi_homed_device() {
        let store = DeviceStore::new();

        store.upsert(device("a", "192.168.0.10"), SystemTime::now());
        store.upsert(device("a", "fe80::1%3"), SystemTime::now());

        let devices = store.devices();
        assert_eq!(devices.len(), 1);
        let known = &devices[0];
        assert!(
            known
                .channels
                .values()
                .all(|status| *status == ChannelStatus::Available),
            "a confirmed channel must be available"
        );
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
    fn test_upsert_replaces_channel_of_known_endpoint() {
        let store = DeviceStore::new();

        store.upsert(device("a", "192.168.0.10"), SystemTime::now());
        store.upsert(device("a", "fe80::1%3"), SystemTime::now());

        let mut update = device("a", "192.168.0.10");
        match &mut update.channel {
            DeviceChannel::Http(http) => http.port = 54000,
        }
        store.upsert(update, SystemTime::now());

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
    }

    #[test]
    fn test_get_channel_prefers_the_most_recent_confirmation() {
        let store = DeviceStore::new();

        store.upsert(device("a", "192.168.0.10"), SystemTime::now());
        store.upsert(device("a", "10.0.0.10"), SystemTime::now());
        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(channel_host(known.get_best_channel().unwrap()), "10.0.0.10");

        store.upsert(device("a", "192.168.0.10"), SystemTime::now());
        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(
            channel_host(known.get_best_channel().unwrap()),
            "192.168.0.10",
            "the latest confirmation must win among equals"
        );
    }

    #[test]
    fn test_get_channel_prefers_ipv6_over_ipv4() {
        let store = DeviceStore::new();

        store.upsert(device("a", "fe80::1%3"), SystemTime::now());
        store.upsert(device("a", "192.168.0.10"), SystemTime::now());

        let known = store.by_fingerprint("a").unwrap();
        assert_eq!(
            channel_host(known.get_best_channel().unwrap()),
            "fe80::1%3",
            "IPv6 must beat a more recent IPv4 confirmation"
        );
    }

    #[test]
    fn test_get_channel_prefers_available_channels() {
        let store = DeviceStore::new();

        store.upsert(device("a", "192.168.0.10"), SystemTime::now());
        store.upsert(device("a", "fe80::1%3"), SystemTime::now());

        let mut known = store.by_fingerprint("a").unwrap();
        for (channel, status) in known.channels.iter_mut() {
            if channel_host(channel) == "fe80::1%3" {
                *status = ChannelStatus::NotReachable;
            }
        }
        assert_eq!(
            channel_host(known.get_best_channel().unwrap()),
            "192.168.0.10",
            "an available IPv4 channel must beat a not-reachable IPv6 one"
        );
    }

    #[test]
    fn test_get_channels_sorts_best_first() {
        let store = DeviceStore::new();

        store.upsert(device("a", "192.168.0.10"), SystemTime::now());
        store.upsert(device("a", "10.0.0.10"), SystemTime::now());
        store.upsert(device("a", "fe80::1%3"), SystemTime::now());

        let mut known = store.by_fingerprint("a").unwrap();
        let hosts: Vec<&str> = known
            .get_ranked_channels()
            .into_iter()
            .map(channel_host)
            .collect();
        assert_eq!(
            hosts,
            ["fe80::1%3", "10.0.0.10", "192.168.0.10"],
            "IPv6 must come first, then the more recent IPv4 confirmation"
        );

        for (channel, status) in known.channels.iter_mut() {
            if channel_host(channel) == "fe80::1%3" {
                *status = ChannelStatus::NotReachable;
            }
        }
        let hosts: Vec<&str> = known
            .get_ranked_channels()
            .into_iter()
            .map(channel_host)
            .collect();
        assert_eq!(
            hosts,
            ["10.0.0.10", "192.168.0.10", "fe80::1%3"],
            "a not-reachable channel must sort last"
        );
    }

    #[test]
    fn test_devices_keep_discovery_order() {
        let store = DeviceStore::new();

        store.upsert(device("a", "192.168.0.10"), SystemTime::now());
        store.upsert(device("b", "192.168.0.11"), SystemTime::now());
        store.upsert(device("a", "192.168.0.12"), SystemTime::now());

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
