//! The sending side: picking a target device and files, and tracking the
//! transfer driven by the [`crate::send_task`].

use super::App;
use crate::picker::{Picker, PickerOutcome};
use crate::send_task;
use crate::ui::Category;
use crate::util::SpeedMeter;
use crossterm::event::KeyEvent;
use localsend::discovery::StatefulDevice;
use localsend::model::transfer::{FileDto, FileMetadata};
use std::collections::HashMap;
use std::path::PathBuf;
use std::sync::Arc;
use std::sync::atomic::AtomicU64;
use uuid::Uuid;

/// An outgoing transfer driven by the send task.
pub(super) struct SendState {
    pub(super) session_id: Option<String>,
    pub(super) alias: String,
    pub(super) host: String,
    pub(super) total_bytes: u64,
    pub(super) sent: Arc<AtomicU64>,
    pub(super) cancel: send_task::SendCancel,
    pub(super) speed: SpeedMeter,
}

impl App {
    pub(super) fn start_picking(&mut self, slot: u8) {
        let device = self
            .slots
            .fingerprint_by_slot(slot)
            .and_then(|fingerprint| self.discovery.device_by_fingerprint(fingerprint));
        let Some(device) = device else {
            self.ui
                .log(Category::Send, &format!("No device on [{slot}]"));
            return;
        };
        if !self.preselected.is_empty() {
            self.start_send(&device.device.fingerprint, self.preselected.clone());
            return;
        }
        self.open_picker(device);
    }

    pub(super) fn open_picker(&mut self, device: StatefulDevice) {
        if self.send.is_some() {
            self.close_device_list();
            self.ui.log(Category::Send, "A send is already in progress");
            return;
        }
        // When the device list is open, the picker takes over its alternate
        // screen — leaving and re-entering it would flash the main screen.
        let handoff = match self.device_list.take() {
            Some(list) => {
                list.close_keeping_screen();
                true
            }
            None => false,
        };
        let opened = match handoff {
            true => Picker::open_on_alternate_screen(
                device.device.fingerprint.clone(),
                device.device.alias.clone(),
            ),
            false => Picker::open(
                device.device.fingerprint.clone(),
                device.device.alias.clone(),
            ),
        };
        match opened {
            Ok(picker) => {
                self.ui.suspend();
                self.picker = Some(picker);
            }
            Err(err) => {
                if handoff {
                    crate::util::leave_alternate_screen();
                    self.ui.resume();
                }
                self.ui.log(
                    Category::Send,
                    &format!(
                        "{}: could not open the file picker: {err}",
                        device.device.alias
                    ),
                );
            }
        }
    }

    pub(super) fn handle_picker_key(&mut self, key: KeyEvent) {
        let Some(picker) = &mut self.picker else {
            return;
        };
        match picker.handle_key(key) {
            PickerOutcome::Open => {}
            PickerOutcome::Picked(files) => {
                let picker = self.picker.take().unwrap();
                let fingerprint = picker.fingerprint.clone();
                picker.close();
                self.ui.resume();
                self.start_send(&fingerprint, files);
            }
            PickerOutcome::Cancelled => {
                let picker = self.picker.take().unwrap();
                picker.close();
                self.ui.resume();
            }
        }
    }

    pub(super) fn start_send(&mut self, fingerprint: &str, picked: Vec<PathBuf>) {
        if self.send.is_some() {
            self.ui.log(Category::Send, "A send is already in progress");
            return;
        }
        let Some(device) = self.discovery.device_by_fingerprint(fingerprint) else {
            return;
        };
        let Some(host) = device
            .get_best_channel()
            .and_then(|channel| channel.http())
            .map(|http| http.host.clone())
        else {
            self.ui.log(
                Category::Send,
                &format!("{}: No dialable address", device.device.alias),
            );
            return;
        };

        let mut files = HashMap::new();
        let mut paths = HashMap::new();
        let mut total_bytes = 0u64;
        for path in picked {
            let metadata = match std::fs::metadata(&path) {
                Ok(metadata) if metadata.is_file() => metadata,
                _ => {
                    self.ui.log(
                        Category::Send,
                        &format!("Skipping unreadable file: {}", path.display()),
                    );
                    continue;
                }
            };
            let id = Uuid::new_v4().to_string();
            let file_name = path
                .file_name()
                .map(|name| name.to_string_lossy().into_owned())
                .unwrap_or_else(|| "unnamed".to_string());
            total_bytes += metadata.len();
            files.insert(
                id.clone(),
                FileDto {
                    id: id.clone(),
                    file_name,
                    size: metadata.len(),
                    file_type: mime_guess::from_path(&path)
                        .first_or_octet_stream()
                        .to_string(),
                    sha256: None,
                    preview: None,
                    metadata: FileMetadata::from_fs_metadata(&metadata),
                },
            );
            paths.insert(id, path);
        }
        if files.is_empty() {
            self.ui.log(Category::Send, "No files selected");
            return;
        }

        let progress = Arc::new(AtomicU64::new(0));
        let cancel = send_task::SendCancel::new();
        self.send = Some(SendState {
            session_id: None,
            alias: device.device.alias.clone(),
            host,
            total_bytes,
            sent: progress.clone(),
            cancel: cancel.clone(),
            speed: SpeedMeter::new(),
        });

        tokio::spawn(send_task::run_send(
            self.storage.identity.clone(),
            device,
            files,
            paths,
            progress,
            cancel,
            self.events_tx.clone(),
        ));
    }
}
