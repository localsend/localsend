//! The CLI's persistence layer. All persistent files live in one directory
//! (see [`Repository::dir`]) and are loaded through the unified
//! [`Repository`]:
//!
//! - `config.toml` ([`config`]): user-edited settings; a commented template
//!   is written on the first run.
//! - `identity.pem` ([`identity`]): this device's certificate and private
//!   key.
//! - `paired-v2.json` ([`paired`]): paired devices; machine-written.

mod config;
mod identity;
mod paired;

pub use identity::Identity;
pub use paired::{PairedChannel, PairedDevices};

use crate::Args;
use anyhow::Context;
use std::path::PathBuf;
use std::sync::Arc;

/// Everything the CLI persists, loaded (or initialized) at startup.
pub struct Repository {
    /// The directory holding all persistent files.
    pub dir: PathBuf,

    /// Directory where received files are saved.
    pub destination: PathBuf,

    /// This device's identity from `identity.pem`, with the resolved alias
    /// and port applied.
    pub identity: Arc<Identity>,

    /// Devices whose transfer requests are auto-accepted; persisted across
    /// runs as `paired-v2.json`.
    pub paired: PairedDevices,
}

impl Repository {
    /// Creates the storage directory if needed and loads every file in it,
    /// writing the config template and generating the identity on the
    /// first run.
    pub fn load(args: &Args) -> anyhow::Result<Self> {
        let dir = dir();
        std::fs::create_dir_all(&dir)
            .with_context(|| format!("Could not create {}", dir.display()))?;
        let config = config::load_with_fallback(&dir, args)?;
        let paired = PairedDevices::load(&dir)?;
        let identity = Arc::new(Identity::load_or_generate(&dir, config.alias, config.port)?);
        Ok(Self {
            dir,
            destination: config.destination,
            identity,
            paired,
        })
    }
}

/// The directory holding all persistent files:
/// `$XDG_CONFIG_HOME/localsend-cli`, or `~/.config/localsend-cli`.
///
/// `~/.config` is used on every platform instead of `dirs::config_dir()`:
/// terminal tools conventionally keep their config there even on macOS, and
/// the `-cli` suffix keeps the directory separate from the Flutter app's.
fn dir() -> PathBuf {
    std::env::var_os("XDG_CONFIG_HOME")
        .map(PathBuf::from)
        // The XDG spec says to ignore relative paths.
        .filter(|path| path.is_absolute())
        .or_else(|| dirs::home_dir().map(|home| home.join(".config")))
        .unwrap_or_else(|| PathBuf::from("."))
        .join("localsend-cli")
}
