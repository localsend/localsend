//! The sending side: picking a target device and files, and tracking the
//! transfer driven by the [`crate::send_task`].

use super::App;
use crate::picker::{Picker, PickerOutcome};
use crate::send_task;
use crate::ui::Category;
use crate::util::SpeedMeter;
use crossterm::event::KeyEvent;
use localsend::model::transfer::FileDto;
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
        let Some(device) = self.registry.by_slot(slot) else {
            self.ui
                .log(Category::Send, &format!("No device on [{slot}]"));
            return;
        };
        if self.send.is_some() {
            self.ui.log(Category::Send, "A send is already in progress");
            return;
        }
        let alias = device.alias.clone();
        match Picker::open(slot) {
            Ok(picker) => {
                self.ui.suspend();
                self.picker = Some(picker);
            }
            Err(err) => {
                self.ui.log(
                    Category::Send,
                    &format!("{alias}: could not open the file picker: {err}"),
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
                let slot = picker.slot;
                picker.close();
                self.ui.resume();
                self.start_send(slot, files);
            }
            PickerOutcome::Cancelled => {
                let picker = self.picker.take().unwrap();
                picker.close();
                self.ui.resume();
            }
        }
    }

    fn start_send(&mut self, slot: u8, picked: Vec<PathBuf>) {
        let Some(device) = self.registry.by_slot(slot).cloned() else {
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
                    metadata: None,
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
            alias: device.alias.clone(),
            host: device.host.clone(),
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
