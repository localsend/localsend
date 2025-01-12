use tracing::Level;

pub fn enable_debug_logging() {
    tracing_subscriber::fmt()
        .with_max_level(Level::DEBUG)
        .init();
}
