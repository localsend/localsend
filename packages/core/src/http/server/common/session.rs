use crate::http::server::PeerIp;
use crate::model::transfer::FileDto;
use std::collections::HashMap;
use tokio_util::sync::CancellationToken;

/// State of the single v2 upload session slot.
pub(crate) enum SessionStateV2 {
    /// A prepare-upload request is waiting for the application's decision.
    Pending(PendingSessionV2),

    /// An accepted upload session.
    Active(UploadSessionV2),
}

/// A prepare-upload request that is waiting for the application's decision.
///
/// Senders on protocol 2.0/2.1 do not know the session ID before the
/// prepare-upload response, so they cancel the pending request with a
/// session-less `POST /cancel` from the same address; `cancel` interrupts
/// the waiting request handler.
pub(crate) struct PendingSessionV2 {
    pub(crate) session_id: String,

    /// The IP address of the sender. Only this address may cancel the request.
    pub(crate) sender_ip: PeerIp,

    pub(crate) cancel: CancellationToken,
}

pub(crate) struct UploadSessionV2 {
    pub(crate) session_id: String,

    /// The IP address of the sender. Uploads are only accepted from this address.
    pub(crate) sender_ip: PeerIp,

    /// The accepted files, mapped by file ID.
    pub(crate) files: HashMap<String, SessionFileV2>,
}

impl UploadSessionV2 {
    /// Whether all files reached a final state.
    pub(crate) fn is_complete(&self) -> bool {
        self.files
            .values()
            .all(|file| matches!(file.status, FileStatusV2::Finished | FileStatusV2::Failed))
    }
}

pub(crate) struct SessionFileV2 {
    pub(crate) dto: FileDto,

    /// The file-specific token required for the upload request.
    pub(crate) token: String,

    pub(crate) status: FileStatusV2,

    /// Number of upload requests started for this file.
    /// Limits how often a checksum mismatch resets the file to
    /// [FileStatusV2::Pending] for a retry.
    pub(crate) attempts: u8,
}

#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub(crate) enum FileStatusV2 {
    Pending,
    InProgress,
    Finished,
    Failed,
}
