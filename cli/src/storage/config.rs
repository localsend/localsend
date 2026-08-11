//! `config.toml`: optional user settings. A commented template is written
//! on the first run; command-line flags and environment variables take
//! precedence.

use crate::Args;
use anyhow::Context;
use serde::Deserialize;
use std::io::ErrorKind;
use std::path::{Path, PathBuf};

#[derive(Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Config {
    pub alias: Option<String>,
    pub port: Option<u16>,
    pub destination: Option<PathBuf>,
}

const CONFIG_TEMPLATE: &str = "\
# LocalSend CLI configuration. Command-line flags and environment variables
# (LOCALSEND_ALIAS, LOCALSEND_PORT, LOCALSEND_DESTINATION) take precedence.

# Device name shown to other devices (default: the hostname).
#alias = \"My Device\"

# Port of the HTTP server.
#port = 53317

# Directory where received files are saved (default: the system Downloads folder).
#destination = \"~/Downloads\"
";

/// Default port of the HTTP server.
const DEFAULT_PORT: u16 = 53317;

/// The settings actually used by the app.
pub struct ResolvedConfig {
    pub alias: String,
    pub port: u16,
    pub destination: PathBuf,
}

/// Reads `config.toml` and resolves every setting, in order of precedence:
/// command-line flag > environment variable > config file > default
///
/// The environment variables are read by clap.
pub fn load_with_fallback(dir: &Path, args: &Args) -> anyhow::Result<ResolvedConfig> {
    let config = load(dir)?;
    Ok(ResolvedConfig {
        alias: args
            .alias
            .clone()
            .or(config.alias)
            .unwrap_or_else(default_alias),
        port: args.port.or(config.port).unwrap_or(DEFAULT_PORT),
        destination: match args.destination.clone().or(config.destination) {
            Some(destination) => expand_tilde(destination),
            None => dirs::download_dir().unwrap_or_else(|| PathBuf::from(".")),
        },
    })
}

/// Reads `config.toml`, writing a commented template when it is missing.
fn load(dir: &Path) -> anyhow::Result<Config> {
    let path = dir.join("config.toml");
    match std::fs::read_to_string(&path) {
        Ok(text) => toml::from_str(&text)
            .with_context(|| format!("Invalid config file: {}", path.display())),
        Err(err) if err.kind() == ErrorKind::NotFound => {
            // Best effort: a missing template is no reason to refuse to run.
            let _ = std::fs::write(&path, CONFIG_TEMPLATE);
            Ok(Config::default())
        }
        Err(err) => Err(err).context(format!("Could not read {}", path.display())),
    }
}

fn default_alias() -> String {
    gethostname::gethostname()
        .to_string_lossy()
        .trim_end_matches(".local")
        .to_string()
}

/// Replaces a leading `~/` with the home directory; config values are not
/// expanded by the shell.
fn expand_tilde(path: PathBuf) -> PathBuf {
    match (path.strip_prefix("~"), dirs::home_dir()) {
        (Ok(rest), Some(home)) => home.join(rest),
        _ => path,
    }
}
