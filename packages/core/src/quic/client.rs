use super::codec::{self, ControlMessage, FileAck, FileHeader};
use super::build_client_config;

use anyhow::Result;
use bytes::Bytes;
use memmap2::Mmap;
use quinn::{Connection, Endpoint};
use std::collections::HashMap;
use std::net::SocketAddr;
use std::path::Path;
use tracing;

/// QUIC client that connects to a receiver for file sending.
pub struct QuicClient {
    endpoint: Endpoint,
}

impl QuicClient {
    /// Create a new client endpoint.
    ///
    /// If `server_cert_pem` is provided, only that specific certificate
    /// will be trusted (fingerprint-based trust, same as the HTTP path).
    /// If not provided, any self-signed cert is accepted (first connection).
    pub fn new(server_cert_pem: Option<String>) -> Result<Self> {
        let client_config = build_client_config(server_cert_pem.as_deref())?;

        let mut endpoint = Endpoint::client("[::]:0".parse()?)?;
        endpoint.set_default_client_config(client_config);

        Ok(Self { endpoint })
    }

    /// Connect to a QUIC receiver and perform the Hello handshake.
    pub async fn connect(
        &self,
        addr: SocketAddr,
        alias: &str,
        fingerprint: &str,
    ) -> Result<OutgoingTransfer> {
        let conn = self.endpoint.connect(addr, "localsend")?.await?;

        tracing::info!("QUIC connected to {addr}");

        // Open bidi stream 0 = control channel.
        let (mut control_send, mut control_recv) = conn.open_bi().await?;

        // Send our hello.
        codec::write_frame(
            &mut control_send,
            &ControlMessage::Hello {
                version: "3.0".into(),
                alias: alias.to_string(),
                fingerprint: fingerprint.to_string(),
            },
        )
        .await?;

        // Wait for receiver's hello.
        let response = codec::read_frame::<ControlMessage>(&mut control_recv).await?;
        let ControlMessage::Hello { version, alias: remote_alias, fingerprint: remote_fp } = response else {
            anyhow::bail!("expected Hello from receiver, got a different message type");
        };

        tracing::info!(
            "QUIC handshake complete with {remote_alias} (version={version}, fp={remote_fp})"
        );

        Ok(OutgoingTransfer {
            conn,
            control_send,
            control_recv,
        })
    }
}

/// State machine for an outgoing transfer (sender side).
pub struct OutgoingTransfer {
    conn: Connection,
    control_send: quinn::SendStream,
    control_recv: quinn::RecvStream,
}

impl OutgoingTransfer {
    /// Send a nonce for the v3-style nonce exchange.
    /// Returns the receiver's nonce.
    pub async fn send_nonce(&mut self, nonce: &str) -> Result<String> {
        codec::write_frame(
            &mut self.control_send,
            &ControlMessage::NonceExchange {
                nonce: nonce.to_string(),
            },
        )
        .await?;

        let response = codec::read_frame::<ControlMessage>(&mut self.control_recv).await?;
        match response {
            ControlMessage::NonceExchange { nonce: remote_nonce } => Ok(remote_nonce),
            other => anyhow::bail!("expected NonceExchange, got {:?}", other),
        }
    }

    /// Send the file list (replaces POST /prepare-upload).
    ///
    /// Returns the accepted file tokens, or None if the receiver declined.
    pub async fn prepare_upload(
        &mut self,
        files: HashMap<String, crate::model::transfer::FileDto>,
    ) -> Result<Option<(String, HashMap<String, String>)>> {
        codec::write_frame(
            &mut self.control_send,
            &ControlMessage::PrepareUpload { files },
        )
        .await?;

        let response = codec::read_frame::<ControlMessage>(&mut self.control_recv).await?;
        match response {
            ControlMessage::PrepareUploadAccept { session_id, files } => {
                tracing::info!("Transfer accepted, session={session_id}, {} files", files.len());
                Ok(Some((session_id, files)))
            }
            ControlMessage::PrepareUploadDecline => {
                tracing::info!("Transfer declined by receiver");
                Ok(None)
            }
            other => anyhow::bail!("expected PrepareUpload response, got {:?}", other),
        }
    }

    /// Send a single file using memory-mapped I/O.
    ///
    /// Opens a new unidirectional QUIC stream, writes the file header,
    /// then streams the entire file via `write_chunk`. This is the core
    /// optimization: no manual chunking, no `mpsc` channel bridging,
    /// zero-copy from the kernel page cache through to Quinn's send buffer.
    pub async fn send_file_mmap(
        &self,
        file_path: &Path,
        file_id: &str,
        token: &str,
    ) -> Result<()> {
        let file = std::fs::File::open(file_path)?;
        let metadata = file.metadata()?;
        let mmap = unsafe { Mmap::map(&file)? };

        tracing::debug!(
            "Sending file {} ({}, {} bytes) via mmap+QUIC",
            file_id,
            file_path.display(),
            metadata.len(),
        );

        // Open a fresh unidirectional stream for this file.
        let mut stream = self.conn.open_uni().await?;

        // Write the file header as a framed message.
        let header = FileHeader {
            file_id: file_id.to_string(),
            token: token.to_string(),
        };
        codec::write_frame(&mut stream, &header).await?;

        // Send the entire mmap'd file in one write_chunk call.
        // Quinn internally handles segmentation, congestion control,
        // and retransmission -- no manual 16 KiB chunking needed.
        stream.write_chunk(Bytes::copy_from_slice(&mmap)).await?;
        stream.finish()?;

        tracing::debug!("File {} sent successfully", file_id);
        Ok(())
    }

    /// Send a file from a stream (non-mmap fallback for Android SAF, etc).
    ///
    /// Reads chunks from the provided receiver and writes them to the
    /// QUIC stream. This is the fallback when memory mapping isn't
    /// possible (e.g., Android scoped storage, files in assets).
    pub async fn send_file_stream(
        &self,
        file_id: &str,
        token: &str,
        mut data_rx: tokio::sync::mpsc::Receiver<Vec<u8>>,
    ) -> Result<()> {
        let mut stream = self.conn.open_uni().await?;

        let header = FileHeader {
            file_id: file_id.to_string(),
            token: token.to_string(),
        };
        codec::write_frame(&mut stream, &header).await?;

        while let Some(chunk) = data_rx.recv().await {
            stream.write_chunk(Bytes::from(chunk)).await?;
        }

        stream.finish()?;
        Ok(())
    }

    /// Wait for the receiver to acknowledge a file.
    pub async fn wait_file_ack(&mut self) -> Result<FileAck> {
        let msg = codec::read_frame::<ControlMessage>(&mut self.control_recv).await?;
        match msg {
            ControlMessage::FileAck(ack) => Ok(ack),
            ControlMessage::Cancel { session_id } => {
                anyhow::bail!("transfer cancelled by receiver (session={session_id})");
            }
            other => anyhow::bail!("expected FileAck, got {:?}", other),
        }
    }

    /// Cancel the transfer.
    pub async fn cancel(&mut self, session_id: &str) -> Result<()> {
        codec::write_frame(
            &mut self.control_send,
            &ControlMessage::Cancel {
                session_id: session_id.to_string(),
            },
        )
        .await
    }

    /// Signal graceful completion.
    pub async fn done(&mut self) -> Result<()> {
        codec::write_frame(&mut self.control_send, &ControlMessage::Done).await
    }

    /// Get the underlying connection.
    pub fn connection(&self) -> &Connection {
        &self.conn
    }
}
