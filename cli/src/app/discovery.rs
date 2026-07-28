//! Device discovery: multicast announcements are answered with an HTTP
//! register request, and confirmed devices get a slot in the registry.

use super::{App, AppEvent};
use crate::ui::Category;
use localsend::http::client::v2::LsHttpClientV2;
use localsend::http::dto::ProtocolType;
use localsend::http::dto_v2::ProtocolTypeV2;
use localsend::multicast::MulticastEvent;
use std::time::Duration;

impl App {
    pub(super) fn handle_multicast(&mut self, event: MulticastEvent) {
        let MulticastEvent::Discovered {
            ip,
            scope_id,
            message,
        } = event;
        if message.fingerprint == self.storage.identity.fingerprint {
            return;
        }
        let host = match scope_id {
            Some(scope_id) => format!("{ip}%{scope_id}"),
            None => ip.to_string(),
        };

        // Answer the announcement with an HTTP register request; the device
        // is only shown once that request succeeds.
        let identity = self.storage.identity.clone();
        let events_tx = self.events_tx.clone();
        tokio::spawn(async move {
            let expected_fingerprint = match message.protocol {
                ProtocolTypeV2::Https => Some(message.fingerprint.clone()),
                ProtocolTypeV2::Http => None,
            };
            let Ok(client) = LsHttpClientV2::try_new(
                &identity.key_pem,
                &identity.cert_pem,
                expected_fingerprint,
                Some(Duration::from_secs(5)),
            ) else {
                return;
            };
            let protocol = match message.protocol {
                ProtocolTypeV2::Http => ProtocolType::Http,
                ProtocolTypeV2::Https => ProtocolType::Https,
            };
            let result = client
                .register(protocol, &host, message.port, identity.register_dto())
                .await;
            if let Ok(response) = result {
                let _ = events_tx
                    .send(AppEvent::DeviceUp {
                        alias: response.body.alias,
                        host,
                        port: message.port,
                        protocol: message.protocol,
                        fingerprint: message.fingerprint,
                    })
                    .await;
            }
        });
    }

    pub(super) fn device_up(
        &mut self,
        alias: String,
        host: String,
        port: u16,
        protocol: ProtocolTypeV2,
        fingerprint: String,
    ) {
        if fingerprint == self.storage.identity.fingerprint {
            return;
        }
        if let Some(device) = self
            .registry
            .upsert(alias, host, port, protocol, fingerprint)
        {
            self.ui.log(
                Category::Discovery,
                &format!(
                    "[{}] {} ({})",
                    device.slot_label(),
                    device.alias,
                    device.host
                ),
            );
        }
    }
}
