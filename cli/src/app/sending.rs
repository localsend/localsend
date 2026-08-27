//! The sending side: picking a target device and files, and tracking the
//! transfer driven by the [`crate::send_task`].

use super::{App, AppEvent, Overlay};
use crate::picker::{Picker, PickerOutcome, PickerTarget};
use crate::send_task;
use crate::storage::Identity;
use crate::ui::{Category, Ui};
use crate::util::SpeedMeter;
use crossterm::event::KeyEvent;
use localsend::discovery::StatefulDevice;
use localsend::model::transfer::{FileDto, FileMetadata};
use std::collections::HashMap;
use std::path::{Component, Path, PathBuf};
use std::sync::Arc;
use std::sync::atomic::AtomicU64;
use tokio::sync::mpsc;
use uuid::Uuid;
use walkdir::WalkDir;

type CollectedPath = Result<(PathBuf, String), (PathBuf, String)>;

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

/// Expands a file or directory into local paths and protocol-v2 file names.
/// Directory names include the selected root so receivers can reconstruct it.
fn collect_path(path: &Path) -> Vec<CollectedPath> {
    let metadata = match path.metadata() {
        Ok(metadata) => metadata,
        Err(error) => {
            return vec![Err((path.to_path_buf(), error.to_string()))];
        }
    };
    if metadata.is_file() {
        let file_name = path
            .file_name()
            .map(|name| name.to_string_lossy().into_owned())
            .unwrap_or_else(|| "unnamed".to_string());
        return vec![Ok((path.to_path_buf(), file_name))];
    }
    if !metadata.is_dir() {
        return vec![Err((
            path.to_path_buf(),
            "not a regular file or directory".to_string(),
        ))];
    }

    let root_name = path
        .file_name()
        .map(|name| name.to_string_lossy().into_owned())
        .or_else(|| {
            path.canonicalize()
                .ok()?
                .file_name()
                .map(|name| name.to_string_lossy().into_owned())
        });
    let Some(root_name) = root_name else {
        return vec![Err((
            path.to_path_buf(),
            "directory has no transferable name".to_string(),
        ))];
    };

    WalkDir::new(path)
        .min_depth(1)
        .sort_by_file_name()
        .into_iter()
        .filter_map(|entry| match entry {
            Ok(entry) if entry.file_type().is_file() => {
                let relative = match entry.path().strip_prefix(path) {
                    Ok(relative) => relative,
                    Err(error) => {
                        return Some(Err((entry.path().to_path_buf(), error.to_string())));
                    }
                };
                let file_name = std::iter::once(root_name.clone())
                    .chain(
                        relative
                            .components()
                            .filter_map(|component| match component {
                                Component::Normal(name) => {
                                    Some(name.to_string_lossy().into_owned())
                                }
                                _ => None,
                            }),
                    )
                    .collect::<Vec<_>>()
                    .join("/");
                Some(Ok((entry.path().to_path_buf(), file_name)))
            }
            Ok(_) => None,
            Err(error) => Some(Err((
                error.path().unwrap_or(path).to_path_buf(),
                error.to_string(),
            ))),
        })
        .collect()
}

/// Collects `picked` and spawns the send task towards `device`. Returns the
/// state tracking the transfer, or the reason the transfer could not start.
pub(super) fn spawn_send(
    ui: &mut Ui,
    identity: Arc<Identity>,
    device: StatefulDevice,
    picked: Vec<PathBuf>,
    events_tx: mpsc::Sender<AppEvent>,
) -> Result<SendState, String> {
    let Some(host) = device
        .get_best_channel()
        .and_then(|channel| channel.http())
        .map(|http| http.host.clone())
    else {
        return Err(format!("{}: No dialable address", device.device.alias));
    };

    let (files, paths, total_bytes) = collect_files(ui, picked);
    if files.is_empty() {
        return Err("No files selected".to_string());
    }

    let progress = Arc::new(AtomicU64::new(0));
    let cancel = send_task::SendCancel::new();
    let state = SendState {
        session_id: None,
        alias: device.device.alias.clone(),
        host,
        total_bytes,
        sent: progress.clone(),
        cancel: cancel.clone(),
        speed: SpeedMeter::new(),
    };
    tokio::spawn(send_task::run_send(
        identity, device, files, paths, progress, cancel, events_tx,
    ));
    Ok(state)
}

/// Expands and stats picked files/directories into transfer metadata keyed
/// by a fresh file ID, plus paths under the same IDs and the total byte
/// count. Entries that are not readable files are skipped with a log line.
pub(super) fn collect_files(
    ui: &mut Ui,
    picked: Vec<PathBuf>,
) -> (HashMap<String, FileDto>, HashMap<String, PathBuf>, u64) {
    let mut files = HashMap::new();
    let mut paths = HashMap::new();
    let mut total_bytes = 0u64;
    for collected in picked.iter().flat_map(|path| collect_path(path)) {
        let (path, file_name) = match collected {
            Ok(collected) => collected,
            Err((path, error)) => {
                ui.log(
                    Category::Send,
                    &format!("Skipping unreadable path: {} ({error})", path.display()),
                );
                continue;
            }
        };
        let metadata = match std::fs::metadata(&path) {
            Ok(metadata) if metadata.is_file() => metadata,
            _ => {
                ui.log(
                    Category::Send,
                    &format!("Skipping unreadable file: {}", path.display()),
                );
                continue;
            }
        };
        let id = Uuid::new_v4().to_string();
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
    (files, paths, total_bytes)
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
        self.open_picker(PickerTarget::Device {
            fingerprint: device.device.fingerprint.clone(),
            alias: device.device.alias.clone(),
        });
    }

    pub(super) fn open_picker(&mut self, target: PickerTarget) {
        if matches!(target, PickerTarget::Device { .. }) && self.send.is_some() {
            self.close_overlay();
            self.ui.log(Category::Send, "A send is already in progress");
            return;
        }
        // When the device list is open, the picker takes over its alternate
        // screen — leaving and re-entering it would flash the main screen.
        let handoff = match std::mem::replace(&mut self.overlay, Overlay::None) {
            Overlay::DeviceList(list) => {
                list.close_keeping_screen();
                true
            }
            // An open picker never reaches here: it consumes every key.
            Overlay::Picker(picker) => {
                picker.close();
                false
            }
            Overlay::None => false,
        };
        let opened = match handoff {
            true => Picker::open_on_alternate_screen(target),
            false => Picker::open(target),
        };
        match opened {
            Ok(picker) => {
                self.ui.suspend();
                self.overlay = Overlay::Picker(Box::new(picker));
            }
            Err(err) => {
                if handoff {
                    crate::util::leave_alternate_screen();
                    self.ui.resume();
                }
                self.ui.log(
                    Category::Send,
                    &format!("Could not open the file picker: {err}"),
                );
            }
        }
    }

    pub(super) async fn handle_picker_key(&mut self, key: KeyEvent) {
        let Overlay::Picker(picker) = &mut self.overlay else {
            return;
        };
        match picker.handle_key(key) {
            PickerOutcome::Open => {}
            PickerOutcome::Picked(files) => {
                let target = picker.target.clone();
                self.close_overlay();
                match target {
                    PickerTarget::Device { fingerprint, .. } => {
                        self.start_send(&fingerprint, files)
                    }
                    PickerTarget::WebShare => self.enable_web_share(files).await,
                }
            }
            PickerOutcome::Cancelled => self.close_overlay(),
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
        match spawn_send(
            &mut self.ui,
            self.storage.identity.clone(),
            device,
            picked,
            self.events_tx.clone(),
        ) {
            Ok(state) => self.send = Some(state),
            Err(reason) => self.ui.log(Category::Send, &reason),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::collect_path;
    use std::fs;
    use std::path::{Path, PathBuf};
    use std::time::{SystemTime, UNIX_EPOCH};

    struct TestDirectory(PathBuf);

    impl TestDirectory {
        fn new(name: &str) -> Self {
            let nonce = SystemTime::now()
                .duration_since(UNIX_EPOCH)
                .unwrap()
                .as_nanos();
            let path = std::env::temp_dir().join(format!(
                "localsend-cli-{name}-{}-{nonce}",
                std::process::id()
            ));
            fs::create_dir_all(&path).unwrap();
            Self(path)
        }

        fn path(&self) -> &Path {
            &self.0
        }
    }

    impl Drop for TestDirectory {
        fn drop(&mut self) {
            let _ = fs::remove_dir_all(&self.0);
        }
    }

    #[test]
    fn keeps_an_individual_file_name() {
        let temp = TestDirectory::new("single-file");
        let file = temp.path().join("backup.sha256");
        fs::write(&file, "hash").unwrap();

        let collected = collect_path(&file)
            .into_iter()
            .collect::<Result<Vec<_>, _>>()
            .unwrap();

        assert_eq!(collected, vec![(file, "backup.sha256".to_string())]);
    }

    #[test]
    fn expands_a_directory_with_its_root_and_relative_paths() {
        let temp = TestDirectory::new("directory");
        let root = temp.path().join("MLB-002");
        let nested = root.join("checksums");
        fs::create_dir_all(&nested).unwrap();
        fs::write(root.join("backup.tar.zst"), "archive").unwrap();
        fs::write(nested.join("backup.sha256"), "hash").unwrap();

        let mut collected = collect_path(&root)
            .into_iter()
            .collect::<Result<Vec<_>, _>>()
            .unwrap();
        collected.sort_by(|left, right| left.1.cmp(&right.1));

        assert_eq!(
            collected,
            vec![
                (
                    root.join("backup.tar.zst"),
                    "MLB-002/backup.tar.zst".to_string()
                ),
                (
                    nested.join("backup.sha256"),
                    "MLB-002/checksums/backup.sha256".to_string(),
                ),
            ]
        );
    }

    #[test]
    fn ignores_empty_directories() {
        let temp = TestDirectory::new("empty-directory");
        let root = temp.path().join("empty");
        fs::create_dir_all(&root).unwrap();

        assert!(collect_path(&root).is_empty());
    }
}
