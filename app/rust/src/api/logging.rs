use anyhow::Result;
use tracing::Level;

pub fn enable_debug_logging() -> Result<()> {
    tracing_subscriber::fmt()
        .with_max_level(Level::DEBUG)
        .try_init()
        .map_err(|e| anyhow::anyhow!(e.to_string()))?;

    Ok(())
}
