//! Device discovery: the core discovery answers multicast announcements with
//! an HTTP register request and stores confirmed devices; the CLI assigns a
//! hotkey slot to every device entering the store.

use super::App;
use crate::slots::slot_label;
use crate::ui::Category;
use localsend::discovery::{DeviceChannel, DiscoveredDevice, DiscoveryEvent, HttpChannel};
use localsend::http::dto_v2::RegisterDtoV2;

impl App {
    pub(super) fn handle_discovery(&mut self, event: DiscoveryEvent) {
        let DiscoveryEvent::Discovered { device } = event else {
            // Re-confirmations update the store silently; multi-homed peers
            // re-announce with a different address all the time.
            return;
        };
        let slot = self.slots.assign(&device.fingerprint);
        let host = device
            .http()
            .map(|http| http.host.as_str())
            .unwrap_or("unknown address");
        self.ui.log(
            Category::Discovery,
            &format!("[{}] {} ({host})", slot_label(slot), device.alias),
        );
    }

    /// Feeds a device confirmed outside of discovery — it registered with our
    /// HTTP server, or it sent a transfer request — into the discovery store;
    /// a device new to the store comes back as a `Discovered` event.
    pub(super) fn device_confirmed(&self, host: String, info: RegisterDtoV2) {
        if info.fingerprint == self.storage.identity.fingerprint {
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
        let discovery = self.discovery.clone();
        tokio::spawn(async move {
            discovery.add_device(device).await;
        });
    }
}
