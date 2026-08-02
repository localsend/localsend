use anyhow::Context;
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
use std::io::ErrorKind;
use std::path::{Path, PathBuf};

/// Current schema version of `paired-v2.json`. On a schema change within
/// this file, bump this and migrate the old versions in
/// [`PairedDevices::load`].
///
/// The file name tracks the trust model, not this schema version: a new
/// trust model gets a new file, so a downgraded build still finds its own
/// file intact. Planned `paired-v3.json`: trust the peer's permanent
/// ed25519 public key (see `crypto::token` in the core crate) instead of
/// its certificate fingerprint; certificates (RSA) then become ephemeral.
const PAIRED_DEVICES_VERSION: u32 = 1;

#[derive(Serialize, Deserialize)]
pub struct PairedDevice {
    pub alias: String,
}

/// The on-disk format of `paired-v2.json`,
/// keyed by certificate fingerprint.
#[derive(Serialize, Deserialize)]
struct PairedDevicesFile {
    version: u32,
    devices: BTreeMap<String, PairedDevice>,
}

pub struct PairedDevices {
    path: PathBuf,
    file: PairedDevicesFile,
}

impl PairedDevices {
    pub fn load(dir: &Path) -> anyhow::Result<Self> {
        let path = dir.join("paired-v2.json");
        let devices = match std::fs::read_to_string(&path) {
            Ok(text) => {
                // Read the version on its own first: old versions are parsed
                // by their own (migration) arm, not by the current schema.
                #[derive(Deserialize)]
                struct Version {
                    version: u32,
                }
                let context = || format!("Invalid paired devices file: {}", path.display());
                let Version { version } = serde_json::from_str(&text).with_context(context)?;
                match version {
                    PAIRED_DEVICES_VERSION => {
                        serde_json::from_str::<PairedDevicesFile>(&text)
                            .with_context(context)?
                            .devices
                    }
                    version => anyhow::bail!(
                        "{} has version {version}, but this build supports only version {PAIRED_DEVICES_VERSION}. \
                         Was it written by a newer LocalSend CLI?",
                        path.display()
                    ),
                }
            }
            Err(err) if err.kind() == ErrorKind::NotFound => BTreeMap::new(),
            Err(err) => return Err(err).context(format!("Could not read {}", path.display())),
        };
        Ok(Self {
            path,
            file: PairedDevicesFile {
                version: PAIRED_DEVICES_VERSION,
                devices,
            },
        })
    }

    pub fn contains(&self, fingerprint: &str) -> bool {
        self.file.devices.contains_key(fingerprint)
    }

    /// Adds a device and saves the file. The device stays paired for this
    /// run even when saving fails.
    pub fn insert(&mut self, fingerprint: String, alias: String) -> anyhow::Result<()> {
        self.file
            .devices
            .insert(fingerprint, PairedDevice { alias });
        self.save()
    }

    /// Removes a device and saves the file. The device stays removed for
    /// this run even when saving fails.
    pub fn remove(&mut self, fingerprint: &str) -> anyhow::Result<Option<PairedDevice>> {
        match self.file.devices.remove(fingerprint) {
            Some(device) => self.save().map(|()| Some(device)),
            None => Ok(None),
        }
    }

    /// All paired devices with their fingerprints, ordered by fingerprint.
    pub fn iter(&self) -> impl Iterator<Item = (&String, &PairedDevice)> {
        self.file.devices.iter()
    }

    fn save(&self) -> anyhow::Result<()> {
        // Write-then-rename so a crash cannot leave a truncated file.
        let temp = self.path.with_extension("json.tmp");
        std::fs::write(&temp, serde_json::to_string_pretty(&self.file)?)
            .with_context(|| format!("Could not write {}", temp.display()))?;
        std::fs::rename(&temp, &self.path)
            .with_context(|| format!("Could not write {}", self.path.display()))
    }
}
