use crate::model::transfer::FileDto;
use std::collections::HashMap;
use std::net::IpAddr;

/// State of the single v2 upload session slot.
pub(crate) enum SessionStateV2 {
    /// A prepare-upload request is waiting for the application's decision.
    Pending,

    /// An accepted upload session.
    Active(UploadSessionV2),
}

pub(crate) struct UploadSessionV2 {
    pub(crate) session_id: String,

    /// The IP address of the sender. Uploads are only accepted from this address.
    pub(crate) sender_ip: IpAddr,

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
}

#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub(crate) enum FileStatusV2 {
    Pending,
    InProgress,
    Finished,
    Failed,
}
