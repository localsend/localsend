mod config;
mod identity;
mod mcp;
mod model;
mod network;
mod store;

use std::sync::Arc;

use anyhow::Result;
use clap::Parser;
use rmcp::ServiceExt;

use crate::config::Args;
use crate::mcp::LocalSendMcp;
use crate::network::NetworkService;

#[tokio::main]
async fn main() -> Result<()> {
    tracing_subscriber::fmt()
        .with_writer(std::io::stderr)
        .with_max_level(tracing::Level::INFO)
        .with_target(false)
        .init();

    let config = Args::parse().resolve()?;
    let network = Arc::new(NetworkService::new(config).await?);
    network.start().await?;

    let result = LocalSendMcp::new(Arc::clone(&network))
        .serve(rmcp::transport::stdio())
        .await;
    let result: anyhow::Result<()> = match result {
        Ok(service) => service
            .waiting()
            .await
            .map(|_| ())
            .map_err(anyhow::Error::from),
        Err(error) => Err(anyhow::Error::from(error)),
    };

    network.shutdown().await;
    result?;
    Ok(())
}
