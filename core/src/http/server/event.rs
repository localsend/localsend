use crate::http::dto_v2::RegisterDtoV2;
use crate::model::transfer::FileDto;
use bytes::Bytes;
use std::collections::{HashMap, HashSet};
use std::net::IpAddr;
use tokio::sync::{mpsc, oneshot};

/// Events emitted by the v2 HTTP server that must be handled by the application.
#[derive(Debug)]
pub enum ServerEventV2 {
    /// A device registered itself via `POST /api/localsend/v2/register`.
    Register {
        /// The IP address of the remote device.
        ip: IpAddr,

        /// The device information sent by the remote device.
        info: RegisterDtoV2,
    },

    /// A sender requests to upload files via `POST /api/localsend/v2/prepare-upload`.
    ///
    /// The application must answer on `decision_tx`.
    /// Dropping `decision_tx` results in a 500 response.
    PrepareUpload {
        /// The IP address of the sender.
        ip: IpAddr,

        /// The device information of the sender.
        info: RegisterDtoV2,

        /// The offered files, mapped by file ID.
        files: HashMap<String, FileDto>,

        /// Channel to send the decision (accept all, a subset, or decline).
        decision_tx: oneshot::Sender<PrepareUploadDecisionV2>,
    },

    /// An accepted file is being uploaded via `POST /api/localsend/v2/upload`.
    ///
    /// Binary chunks arrive on `binary_rx` until the channel is closed.
    /// The application should compare the number of received bytes with `file.size`
    /// and report the result on `result_tx` which determines the HTTP response
    /// (200 on `Ok`, 500 on `Err` or when `result_tx` is dropped).
    FileUpload {
        /// The session ID of the upload session.
        session_id: String,

        /// The ID of the file being uploaded.
        file_id: String,

        /// The metadata of the file being uploaded.
        file: FileDto,

        /// Channel receiving the binary chunks of the file.
        binary_rx: mpsc::Receiver<Bytes>,

        /// Channel to report whether the file was processed successfully.
        result_tx: oneshot::Sender<Result<(), String>>,
    },

    /// An upload session ended.
    SessionEnd {
        /// The session ID of the ended session.
        session_id: String,

        /// Why the session ended.
        reason: SessionEndReasonV2,
    },
}

/// Events emitted by the web send (download API) endpoints that must be handled
/// by the application. Web send can be enabled independently of the v2 endpoints.
#[derive(Debug)]
pub enum WebSendEvent {
    /// A web client requests to download the shared files
    /// via `POST /api/localsend/v2/prepare-download`.
    ///
    /// The application must answer on `decision_tx`.
    /// Dropping `decision_tx` results in a 500 response.
    PrepareDownload {
        /// The IP address of the web client.
        ip: IpAddr,

        /// The ID of the download session that is created when accepted.
        session_id: String,

        /// The `User-Agent` header of the web client.
        user_agent: Option<String>,

        /// Channel to send the decision (`true` to accept, `false` to decline).
        decision_tx: oneshot::Sender<bool>,
    },
}

/// The application's decision for a prepare-upload request.
#[derive(Debug)]
pub enum PrepareUploadDecisionV2 {
    /// Accept the given file IDs (a subset of the offered files).
    /// An empty set responds with 204 (no file transfer needed).
    Accept(HashSet<String>),

    /// Decline the request (403).
    Decline,
}

/// Why an upload session ended.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum SessionEndReasonV2 {
    /// All accepted files reached a final state (finished or failed).
    Finished,

    /// The sender cancelled the session via `POST /api/localsend/v2/cancel`.
    Cancelled,
}
