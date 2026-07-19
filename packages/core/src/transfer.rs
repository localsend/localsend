use anyhow::Result;
use std::collections::HashMap;
use std::path::Path;

use crate::model::transfer::FileDto;

/// The result of a successful prepare_upload call.
pub struct AcceptedFiles {
    pub session_id: String,
    pub files: HashMap<String, String>,
}

/// A unified trait for stateful file transfers, abstracting away the differences
/// between stateless protocols (HTTP) and stateful protocols (QUIC).
#[allow(async_fn_in_trait)]
pub trait TransferSession: Send + Sync {
    /// Propose a list of files to send.
    /// Returns `Ok(Some(AcceptedFiles))` if accepted, `Ok(None)` if declined.
    async fn prepare_upload(
        &mut self,
        files: HashMap<String, FileDto>,
    ) -> Result<Option<AcceptedFiles>>;

    /// Send a single file. Implementations may use zero-copy mmap or streaming internally.
    async fn send_file(
        &mut self,
        file_id: &str,
        file_path: &Path,
        token: &str,
    ) -> Result<()>;

    /// Cancel the transfer session.
    async fn cancel(&mut self, session_id: &str) -> Result<()>;

    /// Signal graceful completion of the transfer.
    async fn finish(&mut self) -> Result<()>;
}
