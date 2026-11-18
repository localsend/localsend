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
    DeviceChannel, DiscoveredDevice, DiscoveryEvent, DiscoveryHandle, HttpChannel,
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
            DiscoveryEvent::Unreachable { device, error } => {
                log_unreachable(&mut self.ui, &mut self.unreachable, device, error);
                return;
            }
            DiscoveryEvent::MulticastFailed => {
                self.ui.log(
                    Category::Discovery,
                    "Multicast stopped, no longer hearing announcements",
                );
                return;
            }
        };
        // Also after a failed request: it changed the ranking of the channels.
        refresh_paired_channels(
            &mut self.ui,
            &mut self.storage.paired,
            &self.discovery,
            &device.fingerprint,
        );

        let DiscoveryEvent::Discovered { device } = event else {
            // Re-confirmations update the store silently; multi-homed peers
            // re-announce with a different address all the time.
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
    /// `Unreachable` event, with its `error` — is around but cannot be
    /// dialed. `None` when that was said before for the address.
    fn notice(&mut self, device: &DiscoveredDevice, error: &str) -> Option<String> {
        let host = device
            .http()
            .map(|http| http.host.as_str())
            .unwrap_or("unknown address");
        if !self
            .logged
            .insert((device.fingerprint.clone(), host.to_string()))
        {
            return None;
        }

        // Everything but the host is unverified: it is what the announcement
        // claimed, and what the peer answered.
        Some(format!(
            "{} ({host}): Announced itself, but could not be reached: {}",
            sanitize::single_line(&device.alias),
            shorten_reason(error),
        ))
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
    device: &DiscoveredDevice,
    error: &str,
) {
    if let Some(line) = notices.notice(device, error) {
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
    use localsend::discovery::{DeviceChannel, DiscoveredDevice, HttpChannel};
    use localsend::model::discovery::ProtocolType;

    /// The device as an `Unreachable` event carries it.
    fn device(alias: &str, fingerprint: &str, host: &str) -> DiscoveredDevice {
        DiscoveredDevice {
            alias: alias.to_string(),
            version: "2.2".to_string(),
            device_model: None,
            device_type: None,
            fingerprint: fingerprint.to_string(),
            channel: DeviceChannel::Http(HttpChannel {
                host: host.to_string(),
                port: 53317,
                protocol: ProtocolType::Https,
            }),
            download: false,
        }
    }

    #[test]
    fn tells_about_an_unconfirmed_device_with_the_reason() {
        let device = device("Cute Tomato", "tomato", "192.168.0.10");

        let line = UnreachableNotices::new().notice(&device, "connection refused");

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
        let mut notices = UnreachableNotices::new();

        assert!(notices.notice(&tomato, "timed out").is_some());
        assert!(
            notices.notice(&tomato, "timed out").is_none(),
            "the datagrams of a burst must not repeat the line"
        );
        assert!(
            notices.notice(&tomato_v6, "timed out").is_some(),
            "another address of the device must be told"
        );
        assert!(
            notices.notice(&cherry, "timed out").is_some(),
            "another device at the same address must be told"
        );
        assert!(notices.notice(&tomato_v6, "timed out").is_none());
        assert!(notices.notice(&cherry, "timed out").is_none());
    }

    #[test]
    fn sanitizes_what_the_peer_controls() {
        let device = device("Cute\u{1b}[31m\nTomato", "tomato", "192.168.0.10");

        let line = UnreachableNotices::new()
            .notice(&device, "500;\u{1b}[2Jgone\r\n")
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

        let line = UnreachableNotices::new().notice(&device, &reason).unwrap();

        let shown = line.rsplit(": ").next().unwrap();
        assert_eq!(shown.chars().count(), MAX_REASON_CHARS + 1);
        assert!(shown.ends_with('…'));
    }
}
