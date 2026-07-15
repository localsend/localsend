use std::net::Ipv4Addr;
use std::path::PathBuf;

use anyhow::{Context, Result, bail};
use clap::Parser;
use directories::ProjectDirs;

pub const DEFAULT_LOCALSEND_PORT: u16 = 53_317;
pub const DEFAULT_MCP_PEER_PORT: u16 = 53_318;
pub const DEFAULT_MULTICAST_GROUP: &str = "224.0.0.167";

#[derive(Parser)]
#[command(
    name = "localsend-mcp",
    version,
    about = "Expose LocalSend peer-to-peer transfers as MCP tools"
)]
pub struct Args {
    /// Name advertised to other LocalSend devices.
    #[arg(long, env = "LOCALSEND_MCP_ALIAS")]
    alias: Option<String>,

    /// TCP and UDP port used by the headless LocalSend peer.
    #[arg(
        long,
        env = "LOCALSEND_MCP_PORT",
        default_value_t = DEFAULT_MCP_PEER_PORT
    )]
    port: u16,

    /// UDP ports that receive LocalSend multicast announcements.
    #[arg(
        long,
        env = "LOCALSEND_MCP_DISCOVERY_PORTS",
        value_delimiter = ',',
        default_values_t = [DEFAULT_LOCALSEND_PORT, DEFAULT_MCP_PEER_PORT]
    )]
    discovery_ports: Vec<u16>,

    /// LocalSend multicast group.
    #[arg(
        long,
        env = "LOCALSEND_MCP_MULTICAST_GROUP",
        default_value = DEFAULT_MULTICAST_GROUP
    )]
    multicast_group: Ipv4Addr,

    /// Directory used for identity, trust, inbox metadata, and received files.
    #[arg(long, env = "LOCALSEND_MCP_DATA_DIR")]
    data_dir: Option<PathBuf>,

    /// Root from which an agent may send files. Repeat to allow multiple roots.
    #[arg(long = "allowed-root", env = "LOCALSEND_MCP_ALLOWED_ROOTS")]
    allowed_roots: Vec<PathBuf>,

    /// Maximum total number of bytes accepted or sent in one transfer.
    #[arg(
        long,
        env = "LOCALSEND_MCP_MAX_TRANSFER_BYTES",
        default_value_t = 1_073_741_824
    )]
    max_transfer_bytes: u64,

    /// Optional PIN required by the LocalSend receive endpoint.
    #[arg(long, env = "LOCALSEND_MCP_RECEIVE_PIN")]
    receive_pin: Option<String>,

    /// Permit paired HTTP peers without certificate-bound identity.
    #[arg(long, env = "LOCALSEND_MCP_ALLOW_UNENCRYPTED", default_value_t = false)]
    allow_unencrypted: bool,
}

#[derive(Clone)]
pub struct RuntimeConfig {
    pub alias: String,
    pub port: u16,
    pub discovery_ports: Vec<u16>,
    pub multicast_group: Ipv4Addr,
    pub data_dir: PathBuf,
    pub allowed_roots: Vec<PathBuf>,
    pub max_transfer_bytes: u64,
    pub receive_pin: Option<String>,
    pub allow_unencrypted: bool,
}

impl Args {
    pub fn resolve(self) -> Result<RuntimeConfig> {
        if self.port == 0 {
            bail!("--port must be between 1 and 65535");
        }
        if self.discovery_ports.is_empty() || self.discovery_ports.contains(&0) {
            bail!("--discovery-ports must contain non-zero ports");
        }
        if self.max_transfer_bytes == 0 {
            bail!("--max-transfer-bytes must be greater than zero");
        }

        let alias = self.alias.unwrap_or_else(default_alias);
        if alias.trim().is_empty() {
            bail!("--alias must not be empty");
        }

        let data_dir = match self.data_dir {
            Some(path) => path,
            None => ProjectDirs::from("org", "LocalSend", "localsend-mcp")
                .context("could not determine the platform data directory")?
                .data_dir()
                .to_path_buf(),
        };

        let roots = match self.allowed_roots.is_empty() {
            true => vec![std::env::current_dir().context("could not read current directory")?],
            false => self.allowed_roots,
        };
        let allowed_roots = roots
            .into_iter()
            .map(|root| {
                let canonical = root
                    .canonicalize()
                    .with_context(|| format!("allowed root does not exist: {}", root.display()))?;
                if !canonical.is_dir() {
                    bail!("allowed root is not a directory: {}", canonical.display());
                }
                Ok(canonical)
            })
            .collect::<Result<Vec<_>>>()?;

        let mut discovery_ports = self.discovery_ports;
        if !discovery_ports.contains(&self.port) {
            discovery_ports.push(self.port);
        }
        discovery_ports.sort_unstable();
        discovery_ports.dedup();

        Ok(RuntimeConfig {
            alias: alias.trim().to_string(),
            port: self.port,
            discovery_ports,
            multicast_group: self.multicast_group,
            data_dir,
            allowed_roots,
            max_transfer_bytes: self.max_transfer_bytes,
            receive_pin: self.receive_pin.filter(|pin| !pin.is_empty()),
            allow_unencrypted: self.allow_unencrypted,
        })
    }
}

fn default_alias() -> String {
    let host = hostname::get()
        .ok()
        .and_then(|value| value.into_string().ok())
        .filter(|value| !value.is_empty())
        .unwrap_or_else(|| "LocalSend".to_string());
    format!("{host} Agent")
}

#[cfg(test)]
impl RuntimeConfig {
    pub fn for_test(data_dir: PathBuf, port: u16, alias: &str) -> Self {
        let allowed_root = data_dir.canonicalize().unwrap();
        Self {
            alias: alias.to_string(),
            port,
            discovery_ports: vec![DEFAULT_LOCALSEND_PORT, port],
            multicast_group: DEFAULT_MULTICAST_GROUP.parse().unwrap(),
            allowed_roots: vec![allowed_root],
            data_dir,
            max_transfer_bytes: 16 * 1024 * 1024,
            receive_pin: None,
            allow_unencrypted: false,
        }
    }
}
