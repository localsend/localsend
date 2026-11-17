//! Device discovery: the core discovery answers multicast announcements with
//! an HTTP register request and stores confirmed devices; the CLI assigns a
//! hotkey slot to every device entering the store, and tells the user about
//! the devices that announce themselves but do not answer.

use super::App;
use super::web_link::WebMode;
use crate::sanitize;
use crate::slots::slot_label;
use crate::storage::{PairedChannel, PairedDevices};
use crate::ui::{Category, Ui};
use localsend::discovery::{
    DeviceChannel, DeviceLogEvent, DiscoveredDevice, DiscoveryEvent, DiscoveryHandle, HttpChannel,
    StatefulDevice,
};
use localsend::http::dto_v2::RegisterDtoV2;
use std::collections::HashSet;
use std::sync::Arc;

/// The longest failure reason shown in an unreachable notice, in characters.
/// The reason is the error chain of a request to an unauthenticated peer.
const MAX_REASON_CHARS: usize = 300;

impl App {
    pub(super) fn handle_discovery(&mut self, event: DiscoveryEvent) {
        let device = match &event {
            DiscoveryEvent::Discovered { device } | DiscoveryEvent::Updated { device } => device,
            DiscoveryEvent::Unreachable { device } => {
                log_unreachable(&mut self.ui, &mut self.unreachable, &self.discovery, device);
                device
            }
            DiscoveryEvent::MulticastFailed => {
                self.ui.log(
                    Category::Discovery,
                    "Multicast stopped, no longer hearing announcements",
                );
                return;
            }
        };
        // Also after a failure: it changed the ranking of the channels.
        refresh_paired_channels(
            &mut self.ui,
            &mut self.storage.paired,
            &self.discovery,
            &device.fingerprint,
        );

        let DiscoveryEvent::Discovered { device } = event else {
            // Re-confirmations update the store silently; multi-homed peers
            // re-announce with a different address all the time. A device
            // that never answered gets no slot: it is not a send target.
            return;
        };
        let slot = self.slots.assign(&device.fingerprint);
        if matches!(self.web, Some(WebMode::Receive)) {
            // Every browser opening the upload page registers like a device;
            // those lines would just interleave the transfer prompts.
            return;
        }
        let host = device
            .http()
            .map(|http| http.host.as_str())
            .unwrap_or("unknown address");
        self.ui.log(
            Category::Discovery,
            &format!(
                "[{}] {} ({host})",
                slot_label(slot),
                sanitize::single_line(&device.alias)
            ),
        );
    }

    pub(super) fn device_confirmed(&self, host: String, info: RegisterDtoV2) {
        device_confirmed(
            &self.discovery,
            &self.storage.identity.fingerprint,
            host,
            info,
        );
    }
}

/// The unconfirmed devices the user was told about.
///
/// An announcing peer sends a burst of datagrams and re-announces for the
/// whole run, and every announcement that is not answered arrives as an
/// `Unreachable` event: the notice is logged once per device and address.
pub(super) struct UnreachableNotices {
    /// Fingerprint and host of every notice that was logged.
    logged: HashSet<(String, String)>,
}

impl UnreachableNotices {
    pub(super) fn new() -> Self {
        Self {
            logged: HashSet::new(),
        }
    }

    /// The line telling the user that `device` — as carried by an
    /// `Unreachable` event — is around but cannot be dialed. `None` when
    /// that was said before for the address, or when the device is not
    /// among the `unconfirmed` devices of the store: a failed request to a
    /// confirmed device only changes the ranking of its channels.
    ///
    /// `unconfirmed` is only called for a device and address not logged yet,
    /// which spares cloning the store for every datagram of a burst.
    fn notice(
        &mut self,
        device: &DiscoveredDevice,
        unconfirmed: impl FnOnce() -> Vec<StatefulDevice>,
    ) -> Option<String> {
        let host = device
            .http()
            .map(|http| http.host.as_str())
            .unwrap_or("unknown address");
        let key = (device.fingerprint.clone(), host.to_string());
        if self.logged.contains(&key) {
            return None;
        }
        let stored = unconfirmed()
            .into_iter()
            .find(|stored| stored.device.fingerprint == device.fingerprint)?;

        // The failure of this address: another address of the device may
        // have failed since the event was emitted.
        let reason = stored.logs.iter().rev().find_map(|log| match &log.event {
            DeviceLogEvent::OutboundFailed { channel, error } if *channel == device.channel => {
                Some(shorten_reason(error))
            }
            _ => None,
        });
        self.logged.insert(key);

        // Everything but the host is unverified: it is what the announcement
        // claimed, and what the peer answered.
        let alias = sanitize::single_line(&device.alias);
        Some(match reason {
            Some(reason) => {
                format!("{alias} ({host}): Announced itself, but could not be reached: {reason}")
            }
            None => format!("{alias} ({host}): Announced itself, but could not be reached"),
        })
    }
}

/// Sanitizes a failure reason for a log line and cuts it to
/// [`MAX_REASON_CHARS`], marking the cut with an ellipsis.
fn shorten_reason(reason: &str) -> String {
    let reason = sanitize::single_line(reason);
    match reason.char_indices().nth(MAX_REASON_CHARS) {
        Some((end, _)) => format!("{}…", &reason[..end]),
        None => reason,
    }
}

/// Logs a device that was heard announcing itself but did not answer the
/// register request (typically because a firewall blocks its server), once
/// per address. Such a device stays out of the device store's confirmed
/// devices, so it is neither listed nor selectable.
pub(super) fn log_unreachable(
    ui: &mut Ui,
    notices: &mut UnreachableNotices,
    discovery: &DiscoveryHandle,
    device: &DiscoveredDevice,
) {
    if let Some(line) = notices.notice(device, || discovery.unconfirmed_devices()) {
        ui.log(Category::Discovery, &line);
    }
}

/// Keeps a paired device's stored alias and channels in sync with the
/// discovery store, so the next run probes the addresses that worked last.
pub(super) fn refresh_paired_channels(
    ui: &mut Ui,
    paired: &mut PairedDevices,
    discovery: &DiscoveryHandle,
    fingerprint: &str,
) {
    if !paired.contains(fingerprint) {
        return;
    }
    let Some(stored) = discovery.device_by_fingerprint(fingerprint) else {
        return;
    };
    let result = paired.update(
        fingerprint,
        &sanitize::single_line(&stored.device.alias),
        PairedChannel::channels_of(&stored),
    );
    if let Err(err) = result {
        ui.log(
            Category::Discovery,
            &format!("Could not save the paired devices: {err:#}"),
        );
    }
}

/// Feeds a device confirmed outside of discovery — it registered with our
/// HTTP server, or it sent a transfer request — into the discovery store;
/// a device new to the store comes back as a `Discovered` event.
pub(super) fn device_confirmed(
    discovery: &Arc<DiscoveryHandle>,
    own_fingerprint: &str,
    host: String,
    info: RegisterDtoV2,
) {
    if info.fingerprint == own_fingerprint {
        return;
    }
    let device = DiscoveredDevice {
        alias: info.alias,
        version: info.version,
        device_model: info.device_model,
        device_type: info.device_type,
        fingerprint: info.fingerprint,
        channel: DeviceChannel::Http(HttpChannel {
            host,
            port: info.port,
            protocol: info.protocol,
        }),
        download: info.download,
    };
    let discovery = discovery.clone();
    tokio::spawn(async move {
        discovery.observe_inbound(device).await;
    });
}

#[cfg(test)]
mod tests {
    use super::{MAX_REASON_CHARS, UnreachableNotices};
    use localsend::discovery::{
        ChannelState, DeviceChannel, DeviceLog, DeviceLogEvent, DiscoveredDevice, HttpChannel,
        Outbound, StatefulDevice,
    };
    use localsend::model::discovery::ProtocolType;
    use std::time::SystemTime;

    fn channel(host: &str) -> DeviceChannel {
        DeviceChannel::Http(HttpChannel {
            host: host.to_string(),
            port: 53317,
            protocol: ProtocolType::Https,
        })
    }

    /// The device as an `Unreachable` event carries it.
    fn device(alias: &str, fingerprint: &str, host: &str) -> DiscoveredDevice {
        DiscoveredDevice {
            alias: alias.to_string(),
            version: "2.2".to_string(),
            device_model: None,
            device_type: None,
            fingerprint: fingerprint.to_string(),
            channel: channel(host),
            download: false,
        }
    }

    /// The device as the store keeps it after the given failed requests,
    /// oldest first.
    fn unconfirmed(device: &DiscoveredDevice, failures: &[(&str, &str)]) -> StatefulDevice {
        let now = SystemTime::now();
        StatefulDevice {
            device: device.clone(),
            confirmed: false,
            channels: failures
                .iter()
                .map(|(host, _)| {
                    let state = ChannelState {
                        outbound: Outbound::Failed(now),
                        inbound: None,
                    };
                    (channel(host), state)
                })
                .collect(),
            logs: failures
                .iter()
                .map(|(host, error)| DeviceLog {
                    timestamp: now,
                    event: DeviceLogEvent::OutboundFailed {
                        channel: channel(host),
                        error: error.to_string(),
                    },
                })
                .collect(),
        }
    }

    #[test]
    fn tells_about_an_unconfirmed_device_with_the_reason() {
        let device = device("Cute Tomato", "tomato", "192.168.0.10");
        let stored = unconfirmed(&device, &[("192.168.0.10", "connection refused")]);

        let line = UnreachableNotices::new().notice(&device, || vec![stored]);

        assert_eq!(
            line.as_deref(),
            Some(
                "Cute Tomato (192.168.0.10): Announced itself, but could not be reached: \
                 connection refused"
            )
        );
    }

    #[test]
    fn tells_once_per_device_and_address() {
        let tomato = device("Cute Tomato", "tomato", "192.168.0.10");
        let tomato_v6 = device("Cute Tomato", "tomato", "fe80::1%3");
        let cherry = device("Wise Cherry", "cherry", "192.168.0.10");
        let store = || {
            vec![
                unconfirmed(
                    &tomato,
                    &[("192.168.0.10", "timed out"), ("fe80::1%3", "timed out")],
                ),
                unconfirmed(&cherry, &[("192.168.0.10", "timed out")]),
            ]
        };
        let mut notices = UnreachableNotices::new();

        assert!(notices.notice(&tomato, store).is_some());
        assert!(
            notices.notice(&tomato, store).is_none(),
            "the datagrams of a burst must not repeat the line"
        );
        assert!(
            notices.notice(&tomato_v6, store).is_some(),
            "another address of the device must be told"
        );
        assert!(
            notices.notice(&cherry, store).is_some(),
            "another device at the same address must be told"
        );
        assert!(notices.notice(&tomato_v6, store).is_none());
        assert!(notices.notice(&cherry, store).is_none());
    }

    #[test]
    fn does_not_ask_the_store_about_a_notice_that_was_logged() {
        let device = device("Cute Tomato", "tomato", "192.168.0.10");
        let stored = unconfirmed(&device, &[("192.168.0.10", "timed out")]);
        let mut notices = UnreachableNotices::new();
        assert!(notices.notice(&device, || vec![stored]).is_some());

        let line = notices.notice(&device, || panic!("the store must not be cloned again"));

        assert!(line.is_none());
    }

    #[test]
    fn stays_silent_about_a_confirmed_device() {
        let device = device("Cute Tomato", "tomato", "192.168.0.10");
        let mut notices = UnreachableNotices::new();

        // A confirmed device is not among the unconfirmed devices.
        assert!(notices.notice(&device, Vec::new).is_none());
        assert!(
            notices.logged.is_empty(),
            "a device that was not told about must not count as logged"
        );
    }

    #[test]
    fn gives_the_most_recent_reason_of_the_failed_address() {
        let device = device("Cute Tomato", "tomato", "192.168.0.10");
        let stored = unconfirmed(
            &device,
            &[
                ("192.168.0.10", "timed out"),
                ("192.168.0.10", "connection refused"),
                ("fe80::1%3", "no route to host"),
            ],
        );

        let line = UnreachableNotices::new()
            .notice(&device, || vec![stored])
            .unwrap();

        assert!(line.ends_with(": connection refused"), "{line}");
    }

    #[test]
    fn omits_a_reason_that_is_no_longer_logged() {
        let device = device("Cute Tomato", "tomato", "192.168.0.10");
        let stored = unconfirmed(&device, &[("fe80::1%3", "timed out")]);

        let line = UnreachableNotices::new().notice(&device, || vec![stored]);

        assert_eq!(
            line.as_deref(),
            Some("Cute Tomato (192.168.0.10): Announced itself, but could not be reached")
        );
    }

    #[test]
    fn sanitizes_what_the_peer_controls() {
        let device = device("Cute\u{1b}[31m\nTomato", "tomato", "192.168.0.10");
        let stored = unconfirmed(&device, &[("192.168.0.10", "500;\u{1b}[2Jgone\r\n")]);

        let line = UnreachableNotices::new()
            .notice(&device, || vec![stored])
            .unwrap();

        assert_eq!(
            line,
            "Cute[31m Tomato (192.168.0.10): Announced itself, but could not be reached: \
             500;[2Jgone  "
        );
    }

    #[test]
    fn cuts_an_overlong_reason() {
        let device = device("Cute Tomato", "tomato", "192.168.0.10");
        let reason = "ä".repeat(MAX_REASON_CHARS + 50);
        let stored = unconfirmed(&device, &[("192.168.0.10", &reason)]);

        let line = UnreachableNotices::new()
            .notice(&device, || vec![stored])
            .unwrap();

        let shown = line.rsplit(": ").next().unwrap();
        assert_eq!(shown.chars().count(), MAX_REASON_CHARS + 1);
        assert!(shown.ends_with('…'));
    }
}
