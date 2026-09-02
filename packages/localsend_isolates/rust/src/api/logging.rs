use anyhow::Result;

pub fn enable_debug_logging() -> Result<()> {
    #[cfg(target_os = "android")]
    {
        use tracing_subscriber::layer::SubscriberExt;
        use tracing_subscriber::util::SubscriberInitExt;

        // Android discards native stdout/stderr, so route tracing to logcat.
        tracing_subscriber::registry()
            .with(tracing_subscriber::filter::LevelFilter::DEBUG)
            .with(tracing_android::layer("localsend_rust")?)
            .try_init()
            .map_err(|e| anyhow::anyhow!(e.to_string()))?;
    }

    #[cfg(not(target_os = "android"))]
    tracing_subscriber::fmt()
        .with_max_level(tracing::Level::DEBUG)
        .try_init()
        .map_err(|e| anyhow::anyhow!(e.to_string()))?;

    Ok(())
}
