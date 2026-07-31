//! The in-memory store of discovered devices.

use super::DiscoveryEvent;
use crate::model::discovery::{DeviceType, ProtocolTypeV2};
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

    /// The channels the device is reachable on, in discovery order.
    /// A transfer can jump to another channel when one fails.
    pub channels: Vec<DeviceChannel>,

    /// Whether the device's download API is active.
    pub download: bool,
}

/// A [`DiscoveredDevice`] as kept in the store, together with the history of
/// events that affected it.
#[derive(Clone, Debug)]
pub struct DiscoveredDeviceWithLogs {
    pub device: DiscoveredDevice,

    /// The events that affected this device, oldest first, at most
    /// [`MAX_LOGS`]. Every confirmation is logged, so the last entry is when
    /// the device was last seen.
    pub logs: Vec<DeviceLog>,
}

/// A [`DiscoveryEvent`] that affected a device, with the time it happened.
#[derive(Clone, Debug)]
pub struct DeviceLog {
    pub timestamp: SystemTime,
    pub event: DiscoveryEvent,
}

impl DiscoveredDevice {
    /// The device's HTTP channels — the addresses it is reachable on — in
    /// discovery order. A multi-homed device has one per address it was
    /// discovered on.
    pub fn http_channels(&self) -> impl Iterator<Item = &HttpChannel> {
        // With more channel kinds this becomes a `filter_map`.
        self.channels.iter().map(|channel| match channel {
            DeviceChannel::Http(http) => http,
        })
    }

    /// The device's first HTTP channel, when it has one.
    pub fn http(&self) -> Option<&HttpChannel> {
        self.http_channels().next()
    }
}

/// A channel a device is reachable on.
///
/// Only HTTP exists so far; other transports (e.g. WebRTC, Bluetooth) will
/// become further variants.
#[derive(Clone, Debug)]
pub enum DeviceChannel {
    /// The device's HTTP server (protocol v2), reachable at one address.
    Http(HttpChannel),
}

impl DeviceChannel {
    /// Whether two channels address the same endpoint, so that a
    /// re-confirmation updates the known channel instead of adding one.
    fn same_endpoint(&self, other: &DeviceChannel) -> bool {
        match (self, other) {
            (DeviceChannel::Http(own), DeviceChannel::Http(other)) => own.host == other.host,
        }
    }
}

/// The address of a device's HTTP server.
#[derive(Clone, Debug)]
pub struct HttpChannel {
    /// The host to dial: an IP address, or the scoped form `fe80::1%3` for
    /// link-local IPv6 (the HTTP client accepts both).
    pub host: String,

    /// The port of the HTTP server.
    pub port: u16,

    /// Whether the HTTP server uses TLS.
    pub protocol: ProtocolTypeV2,
}

/// All devices discovered in this run, identified by fingerprint, in
/// discovery order.
pub(super) struct DeviceStore {
    devices: Mutex<Vec<DiscoveredDeviceWithLogs>>,
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
    /// updates its channel in place, an unknown address adds one.
    pub(super) fn upsert(
        &self,
        device: DiscoveredDevice,
        timestamp: SystemTime,
    ) -> (DiscoveryEvent, DiscoveredDeviceWithLogs) {
        let mut devices = self.devices.lock().unwrap();
        match devices
            .iter_mut()
            .find(|known| known.device.fingerprint == device.fingerprint)
        {
            Some(known) => {
                let event = DiscoveryEvent::Updated {
                    device: device.clone(),
                };

                let mut channels = std::mem::take(&mut known.device.channels);
                for channel in device.channels {
                    match channels.iter_mut().find(|c| c.same_endpoint(&channel)) {
                        Some(known) => *known = channel,
                        None => channels.push(channel),
                    }
                }

                known.logs.push(DeviceLog {
                    timestamp,
                    event: event.clone(),
                });
                if known.logs.len() > MAX_LOGS {
                    let excess = known.logs.len() - MAX_LOGS;
                    known.logs.drain(..excess);
                }

                known.device = DiscoveredDevice { channels, ..device };
                (event, known.clone())
            }
            None => {
                let event = DiscoveryEvent::Discovered {
                    device: device.clone(),
                };
                let known = DiscoveredDeviceWithLogs {
                    device,
                    logs: vec![DeviceLog {
                        timestamp,
                        event: event.clone(),
                    }],
                };
                devices.push(known.clone());
                (event, known)
            }
        }
    }

    /// All discovered devices in discovery order.
    pub(super) fn devices(&self) -> Vec<DiscoveredDeviceWithLogs> {
        self.devices.lock().unwrap().clone()
    }

    pub(super) fn by_fingerprint(&self, fingerprint: &str) -> Option<DiscoveredDeviceWithLogs> {
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
            channels: vec![DeviceChannel::Http(HttpChannel {
                host: host.to_string(),
                port: 53317,
                protocol: ProtocolTypeV2::Https,
            })],
            download: false,
        }
    }

    /// The marker telling log entries apart: the host the logged snapshot
    /// was confirmed on.
    fn log_marker(log: &DeviceLog) -> &str {
        let device = match &log.event {
            DiscoveryEvent::Discovered { device } | DiscoveryEvent::Updated { device } => device,
        };
        device.http().unwrap().host.as_str()
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
        assert!(matches!(
            known.logs[0].event,
            DiscoveryEvent::Discovered { .. }
        ));
        assert!(matches!(
            known.logs[1].event,
            DiscoveryEvent::Updated { .. }
        ));
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
        let hosts: Vec<&str> = devices[0]
            .device
            .http_channels()
            .map(|http| http.host.as_str())
            .collect();
        assert_eq!(
            hosts,
            ["192.168.0.10", "fe80::1%3"],
            "every address the device was confirmed on must be kept"
        );
    }

    #[test]
    fn test_upsert_updates_channel_of_known_endpoint_in_place() {
        let store = DeviceStore::new();

        store.upsert(device("a", "192.168.0.10"), SystemTime::now());
        store.upsert(device("a", "fe80::1%3"), SystemTime::now());

        let mut update = device("a", "192.168.0.10");
        match &mut update.channels[0] {
            DeviceChannel::Http(http) => http.port = 54000,
        }
        store.upsert(update, SystemTime::now());

        let known = store.by_fingerprint("a").unwrap();
        let channels: Vec<(&str, u16)> = known
            .device
            .http_channels()
            .map(|http| (http.host.as_str(), http.port))
            .collect();
        assert_eq!(
            channels,
            [("192.168.0.10", 54000), ("fe80::1%3", 53317)],
            "a known address must be updated in place, not duplicated"
        );
    }

    #[test]
    fn test_upsert_keeps_channels_missing_from_the_update() {
        let store = DeviceStore::new();

        store.upsert(device("a", "192.168.0.10"), SystemTime::now());

        let mut update = device("a", "10.0.0.10");
        update.channels.clear();
        store.upsert(update, SystemTime::now());

        assert_eq!(
            store
                .by_fingerprint("a")
                .unwrap()
                .device
                .http()
                .unwrap()
                .host,
            "192.168.0.10",
            "an update without an HTTP channel must not drop the known one"
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
