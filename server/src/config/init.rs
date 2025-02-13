use crate::config::scheduler;
use crate::config::state::AppState;
use tracing::Level;

pub async fn init() -> AppState {
    // Set up tracing / logging
    tracing_subscriber::fmt().with_max_level(Level::INFO).init();

    tracing::info!("Starting LocalSend WebRTC signaling server...");

    // Initialize the AppState
    let app_state = AppState::new();

    // Setup scheduler
    scheduler::configure_scheduling(app_state.request_count_map.clone())
        .await
        .expect("Error configuring scheduler");

    app_state
}
