use serde::{Deserialize, Serialize};
use std::collections::HashMap;

use crate::model::transfer::FileDto;

// ─── Wire protocol: framed messages on QUIC streams ───────────────────
//
// Control stream (bidi stream 0):
//   - Length-prefixed JSON frames: [u32 BE length][JSON bytes]
//
// File streams (uni streams 1..N):
//   - [u32 BE length][JSON FileHeader]
//   - [raw file bytes until FIN]
//

/// Messages exchanged on the control stream (bidi stream 0).
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(tag = "type", rename_all = "camelCase")]
pub enum ControlMessage {
    /// Initial handshake. Replaces POST /register + GET /info.
    Hello {
        version: String,
        alias: String,
        fingerprint: String,
    },

    /// Nonce exchange. Replaces POST /v3/nonce.
    NonceExchange {
        nonce: String, // base64-encoded
    },

    /// Sender -> Receiver: file list. Replaces POST /prepare-upload.
    PrepareUpload {
        files: HashMap<String, FileDto>,
    },

    /// Receiver -> Sender: accepted files with tokens.
    PrepareUploadAccept {
        session_id: String,
        files: HashMap<String, String>, // file_id -> token
    },

    /// Receiver -> Sender: transfer declined.
    PrepareUploadDecline,

    /// Cancel an in-progress session. Replaces POST /cancel.
    Cancel {
        session_id: String,
    },

    /// Acknowledgment after each file stream completes.
    FileAck(FileAck),

    /// Graceful shutdown.
    Done,
}

/// Header sent at the start of each file stream.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct FileHeader {
    pub file_id: String,
    pub token: String,
}

/// Per-file acknowledgment sent on the control stream.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct FileAck {
    pub file_id: String,
    pub success: bool,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub error: Option<String>,
}

// ─── Frame read/write helpers ─────────────────────────────────────────

use quinn::{RecvStream, SendStream};

/// Write a length-prefixed JSON frame to a send stream.
pub async fn write_frame<T: Serialize>(
    send: &mut SendStream,
    msg: &T,
) -> anyhow::Result<()> {
    let json = serde_json::to_vec(msg)?;
    let len = (json.len() as u32).to_be_bytes();
    send.write_all(&len).await?;
    send.write_all(&json).await?;
    Ok(())
}

/// Read a length-prefixed JSON frame from a receive stream.
pub async fn read_frame<T: serde::de::DeserializeOwned>(
    recv: &mut RecvStream,
) -> anyhow::Result<T> {
    let mut len_buf = [0u8; 4];
    recv.read_exact(&mut len_buf).await?;
    let len = u32::from_be_bytes(len_buf) as usize;

    // Cap max frame size at 1 MiB to prevent OOM on malformed data.
    anyhow::ensure!(len <= 1024 * 1024, "control frame too large: {len} bytes");

    let mut buf = vec![0u8; len];
    recv.read_exact(&mut buf).await?;
    Ok(serde_json::from_slice(&buf)?)
}
