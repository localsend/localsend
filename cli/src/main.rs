mod app;
mod banner;
mod devices;
mod picker;
mod send_task;
mod storage;
mod ui;
mod util;

use clap::Parser;
use std::path::PathBuf;

/// LocalSend CLI
#[derive(Parser)]
#[command(name = "localsend-cli", version, about, after_help = HELP_SECTIONS)]
pub struct Args {
    /// Device name shown to other devices [default: config.toml, else the hostname]
    #[arg(long, env = "LOCALSEND_ALIAS")]
    pub alias: Option<String>,

    /// Port of the HTTP server [default: config.toml, else 53317]
    #[arg(long, env = "LOCALSEND_PORT")]
    pub port: Option<u16>,

    /// Directory where received files are saved [default: config.toml, else the Downloads folder]
    #[arg(long, env = "LOCALSEND_DESTINATION")]
    pub destination: Option<PathBuf>,
}

const HELP_SECTIONS: &str = "Events:\n  \
                             D      Discovered a new device\n  \
                             S      Send files\n  \
                             R      Receive files\n\
                             \nHotkeys:\n  \
                             1-9    Send files to the device with that number\n  \
                             Y/N/P  Accept / Decline / Accept-and-Pair an incoming request\n  \
                             Ctrl+C Cancel the current transfer or request, or quit when idle\n \
                             \nEnvironment Variables:\n  \
                             XDG_CONFIG_HOME, LOCALSEND_ALIAS, LOCALSEND_PORT, LOCALSEND_DESTINATION";

fn main() -> anyhow::Result<()> {
    let args = Args::parse();
    tokio::runtime::Runtime::new()?.block_on(app::run(args))
}
