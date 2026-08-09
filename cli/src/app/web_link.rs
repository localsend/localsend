//! "Share via link" (W+S) and "Receive via link" (W+R): serving the web
//! pages so browsers can download from or upload to this device.
//!
//! Browsers cannot verify the self-signed certificate, so while a link is
//! active the server is restarted without TLS and the links use plain
//! `http://`. Toggling off restarts the encrypted server.

use super::App;
use crate::picker::PickerTarget;
use crate::ui::Category;
use crate::util;
use localsend::http::server::web::{WebConfig, WebI18n, WebSendConfig, WebSendEvent};
use localsend::http::server::{ServerConfigV2, start_with_port};
use localsend::model::transfer::FileContent;
use qrcode::{EcLevel, QrCode};
use qrcode::render::unicode;
use std::collections::HashMap;
use std::path::PathBuf;
use std::sync::Arc;
use std::time::Duration;
use tokio::sync::oneshot;

/// The active web link mode. Only one at a time: the download page would
/// shadow the upload page at `/`.
pub(super) enum WebMode {
    /// "Share via link": the served files' paths, keyed by file ID.
    Share { paths: HashMap<String, PathBuf> },

    /// "Receive via link": browsers upload through the regular v2 endpoints,
    /// so incoming requests go through the usual Y/N/P prompt.
    Receive,
}

impl App {
    pub(super) async fn toggle_web_share(&mut self) {
        match &self.web {
            Some(WebMode::Share { .. }) => {
                self.disable_web(Category::Send, "Share via link").await;
                return;
            }
            Some(WebMode::Receive) => {
                self.ui.log(
                    Category::Send,
                    "Receive via link is active, press W+R to stop it first",
                );
                return;
            }
            None => {}
        }
        if self.pending.is_some() || self.receive.is_some() {
            self.ui.log(
                Category::Send,
                "Share via link: not while a receive is active (the server would restart)",
            );
            return;
        }
        match self.preselected.is_empty() {
            true => self.open_picker(PickerTarget::WebShare),
            false => self.enable_web_share(self.preselected.clone()).await,
        }
    }

    pub(super) async fn toggle_web_receive(&mut self) {
        match &self.web {
            Some(WebMode::Receive) => {
                self.disable_web(Category::Receive, "Receive via link")
                    .await;
                return;
            }
            Some(WebMode::Share { .. }) => {
                self.ui.log(
                    Category::Receive,
                    "Share via link is active, press W+S to stop it first",
                );
                return;
            }
            None => {}
        }
        if self.pending.is_some() || self.receive.is_some() {
            self.ui.log(
                Category::Receive,
                "Receive via link: not while a receive is active (the server would restart)",
            );
            return;
        }
        let web_config = WebConfig {
            send: None,
            upload: true,
            i18n: WebI18n::default(),
        };
        if let Err(err) = self.restart_server(Some(web_config)).await {
            self.ui.log(
                Category::Receive,
                &format!("Receive via link: could not restart the server: {err:#}"),
            );
            self.restore_encrypted_server().await;
            return;
        }
        self.web = Some(WebMode::Receive);
        let mut text = format!(
            "Receive via link enabled, encryption is off\nOpen in a browser to upload files here:\n{}\n",
            self.web_links(),
        );
        if let Some(qr) = self.web_qr() {
            text.push_str(&format!("\n{qr}\n"));
        }
        text.push_str("Press W+R again to stop.\n\n");
        self.ui.log(Category::Receive, &text);
    }

    /// Restarts the server in plain-HTTP mode offering `picked` for download
    /// and prints the links to open in a browser.
    pub(super) async fn enable_web_share(&mut self, picked: Vec<PathBuf>) {
        let (files, paths, total_bytes) = self.collect_files(picked);
        if files.is_empty() {
            self.ui.log(Category::Send, "No files selected");
            return;
        }
        let count = files.len();
        let web_config = WebConfig {
            send: Some(WebSendConfig {
                files,
                pin: None,
                event_tx: self.web_tx.clone(),
            }),
            upload: false,
            i18n: WebI18n::default(),
        };
        if let Err(err) = self.restart_server(Some(web_config)).await {
            self.ui.log(
                Category::Send,
                &format!("Share via link: could not restart the server: {err:#}"),
            );
            self.restore_encrypted_server().await;
            return;
        }
        self.web = Some(WebMode::Share { paths });
        let mut text = format!(
            "Share via link enabled: {count} file{} ({}), encryption is off\nOpen in a browser:\n{}\n",
            if count == 1 { "" } else { "s" },
            util::format_bytes(total_bytes),
            self.web_links(),
        );
        if let Some(qr) = self.web_qr() {
            text.push_str(&format!("\n{qr}\n"));
        }
        text.push_str("Press W+S again to stop sharing.\n\n");
        self.ui.log(Category::Send, &text);
    }

    /// The plain-HTTP links of the running server, one per line.
    fn web_links(&self) -> String {
        match crate::banner::listening_lines(&self.server.local_addresses(), "http") {
            lines if lines.is_empty() => " - (no network interface found)".to_string(),
            lines => lines.join("\n"),
        }
    }

    /// The first link as a QR code in half-block characters, scannable
    /// straight from the terminal. `None` when there is no address.
    ///
    /// Only the modules are drawn, in the terminal's foreground color; the
    /// rest stays the plain background. On dark terminals that inverts the
    /// code (light on dark), which phone scanners accept.
    fn web_qr(&self) -> Option<String> {
        let address = self.server.local_addresses().into_iter().next()?;
        let code = QrCode::with_error_correction_level(format!("http://{address}"), EcLevel::L).ok()?;
        Some(code.render::<unicode::Dense1x2>().quiet_zone(false).build())
    }

    async fn disable_web(&mut self, category: Category, feature: &str) {
        self.web = None;
        match self.restart_server(None).await {
            Ok(()) => self.ui.log(
                category,
                &format!("{feature} disabled, encryption is back on"),
            ),
            Err(err) => self.ui.log(
                category,
                &format!("{feature} disabled, but the server could not be restarted: {err:#}"),
            ),
        }
    }

    /// Best effort after a failed plain-HTTP restart: get back to the normal
    /// encrypted server.
    async fn restore_encrypted_server(&mut self) {
        if let Err(err) = self.restart_server(None).await {
            self.ui.log(
                Category::Send,
                &format!("Could not restore the encrypted server: {err:#}"),
            );
        }
    }

    /// Stops the running server and starts a fresh one on the same port:
    /// the normal encrypted one, or, when `web_config` is given, a plain-HTTP
    /// one that additionally serves that web page.
    async fn restart_server(&mut self, web_config: Option<WebConfig>) -> anyhow::Result<()> {
        if let Some(stop_tx) = self.server_stop_tx.take() {
            let _ = stop_tx.send(());
        }
        let _ = tokio::time::timeout(Duration::from_secs(3), self.server.wait_stopped()).await;

        let identity = &self.storage.identity;
        let tls_config = match web_config.is_some() {
            true => None,
            false => Some(identity.tls_config()),
        };
        let (stop_tx, stop_rx) = oneshot::channel::<()>();
        let server = start_with_port(
            identity.port,
            tls_config,
            identity.client_info(),
            None,
            Some(ServerConfigV2 {
                pin: None,
                verify_checksums: true,
                event_tx: self.server_tx.clone(),
            }),
            web_config,
            stop_rx,
        )
        .await?;
        self.server = Arc::new(server);
        self.server_stop_tx = Some(stop_tx);
        Ok(())
    }

    pub(super) fn handle_web_event(&mut self, event: WebSendEvent) {
        match event {
            WebSendEvent::PrepareDownload {
                ip,
                user_agent,
                decision_tx,
                ..
            } => {
                // For now every browser is accepted without asking.
                let _ = decision_tx.send(true);
                let agent = user_agent
                    .map(|agent| format!(" ({agent})"))
                    .unwrap_or_default();
                self.ui.log(
                    Category::Send,
                    &format!("Web: {ip} opened the shared link{agent}"),
                );
            }
            WebSendEvent::FileDownload {
                session_id,
                file_id,
                file,
                content_tx,
            } => {
                let path = match &self.web {
                    Some(WebMode::Share { paths }) => paths.get(&file_id),
                    _ => None,
                };
                let Some(path) = path else {
                    // Sharing ended: dropping the responder fails the download.
                    return;
                };
                let _ = content_tx.send(FileContent::Path(path.clone()));
                self.ui.log(
                    Category::Send,
                    &format!("Web: {session_id} downloads {}", file.file_name),
                );
            }
        }
    }
}
