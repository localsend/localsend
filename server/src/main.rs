use crate::controller::ws_controller;
use axum::routing::get;
use axum::Router;
use std::net::SocketAddr;

mod config;
mod controller;
mod util;

#[tokio::main]
async fn main() {
    let app_state = config::init::init().await;

    let app = configure_routes()
        .with_state(app_state)
        .into_make_service_with_connect_info::<SocketAddr>();

    let server_ip = std::env::var("SERVER_IP").unwrap_or_else(|_| "0.0.0.0".to_string());
    let server_port = std::env::var("SERVER_PORT").unwrap_or_else(|_| "3000".to_string());
    let bind_address = format!("{server_ip}:{server_port}");

    let listener = tokio::net::TcpListener::bind(bind_address.clone())
        .await
        .unwrap();
    tracing::info!("Listening on http://{bind_address}");
    axum::serve(listener, app).await.unwrap();
}

#[rustfmt::skip]
fn configure_routes() -> Router<config::state::AppState> {
    Router::new()
        .route("/v1/ws", get(ws_controller::ws_handler))
}
