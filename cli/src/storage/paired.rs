use anyhow::Context;
use localsend::discovery::{HttpChannel, StatefulDevice};
use localsend::model::discovery::ProtocolType;
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

    /// The HTTP addresses the device was reachable at, best first; probed
    /// as known channels by the startup discovery.
    pub channels: Vec<PairedChannel>,
}

/// An [`HttpChannel`] in on-disk form.
#[derive(Clone, Deserialize, Eq, PartialEq, Serialize)]
pub struct PairedChannel {
    pub host: String,
    pub port: u16,
    pub protocol: ProtocolType,
}

impl PairedChannel {
    /// The device's HTTP channels in on-disk form, best first.
    pub fn channels_of(stored: &StatefulDevice) -> Vec<PairedChannel> {
        stored
            .get_ranked_channels()
            .into_iter()
            .filter_map(|channel| channel.http())
            .map(PairedChannel::from)
            .collect()
    }

    /// The channel as discovery dials it.
    pub fn http_channel(&self) -> HttpChannel {
        HttpChannel {
            host: self.host.clone(),
            port: self.port,
            protocol: self.protocol,
        }
    }
}

impl From<&HttpChannel> for PairedChannel {
    fn from(channel: &HttpChannel) -> Self {
        Self {
            host: channel.host.clone(),
            port: channel.port,
            protocol: channel.protocol,
        }
    }
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
    pub fn insert(
        &mut self,
        fingerprint: String,
        alias: String,
        channels: Vec<PairedChannel>,
    ) -> anyhow::Result<()> {
        self.file
            .devices
            .insert(fingerprint, PairedDevice { alias, channels });
        self.save()
    }

    /// Refreshes a paired device's alias and channels after a confirmation,
    /// saving only when something changed. Unpaired fingerprints are ignored.
    pub fn update(
        &mut self,
        fingerprint: &str,
        alias: &str,
        channels: Vec<PairedChannel>,
    ) -> anyhow::Result<()> {
        let Some(device) = self.file.devices.get_mut(fingerprint) else {
            return Ok(());
        };
        if device.alias == alias && device.channels == channels {
            return Ok(());
        }
        device.alias = alias.to_string();
        device.channels = channels;
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

    /// The stored channels of every paired device, for the known-address
    /// stage of the startup discovery.
    pub fn known_http_channels(&self) -> Vec<HttpChannel> {
        self.file
            .devices
            .values()
            .flat_map(|device| device.channels.iter().map(PairedChannel::http_channel))
            .collect()
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

#[cfg(test)]
mod tests {
    use super::*;

    /// A fresh directory per test (`name` disambiguates tests, the process
    /// id parallel `cargo test` processes).
    fn temp_dir(name: &str) -> PathBuf {
        let dir = std::env::temp_dir().join(format!(
            "localsend-cli-paired-{name}-{}",
            std::process::id()
        ));
        let _ = std::fs::remove_dir_all(&dir);
        std::fs::create_dir_all(&dir).unwrap();
        dir
    }

    fn channel(host: &str) -> PairedChannel {
        PairedChannel {
            host: host.to_string(),
            port: 53317,
            protocol: ProtocolType::Https,
        }
    }

    #[test]
    fn test_channels_round_trip() {
        let dir = temp_dir("round-trip");

        let mut paired = PairedDevices::load(&dir).unwrap();
        paired
            .insert(
                "FP".to_string(),
                "Alias".to_string(),
                vec![channel("fe80::1%3"), channel("192.168.0.10")],
            )
            .unwrap();

        let paired = PairedDevices::load(&dir).unwrap();
        let hosts: Vec<String> = paired
            .known_http_channels()
            .into_iter()
            .map(|channel| channel.host)
            .collect();
        assert_eq!(hosts, ["fe80::1%3", "192.168.0.10"]);
    }
}
