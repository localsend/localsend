use super::codec::{self, ControlMessage, FileAck, FileHeader};
use super::build_server_config;

use anyhow::Result;
use bytes::Bytes;
use quinn::{Connection, Endpoint, RecvStream};
use std::collections::HashMap;
use std::net::SocketAddr;
use tokio::sync::oneshot;
use tracing;

/// QUIC server that accepts incoming transfer connections.
pub struct QuicServer {
    endpoint: Endpoint,
    stop_tx: Option<oneshot::Sender<()>>,
}

impl QuicServer {
    /// Bind the QUIC server on the given port with the existing PEM cert/key.
    pub async fn bind(
        port: u16,
        cert_pem: String,
        key_pem: String,
    ) -> Result<Self> {
        let config = build_server_config(&cert_pem, &key_pem)?;
        let addr = SocketAddr::from(([0, 0, 0, 0], port));
        
        let socket = crate::quic::bind_udp_socket(addr)?;
        let endpoint = quinn::Endpoint::new(
            quinn::EndpointConfig::default(),
            Some(config),
            socket,
            quinn::default_runtime().ok_or_else(|| anyhow::anyhow!("no async runtime found"))?,
        )?;
        tracing::info!("QUIC server listening on UDP {addr}");

        Ok(Self {
            endpoint,
            stop_tx: None,
        })
    }

    /// Accept one incoming transfer connection.
    ///
    /// Returns the raw connection and the peer's address. The caller should
    /// then call `IncomingTransfer::accept` to run the protocol handshake.
    pub async fn accept(&self) -> Result<(Connection, SocketAddr)> {
        let incoming = self
            .endpoint
            .accept()
            .await
            .ok_or(anyhow::anyhow!("QUIC server closed"))?;
        let remote = incoming.remote_address();
        let conn = incoming.await?;
        tracing::info!("QUIC connection accepted from {remote}");
        Ok((conn, remote))
    }

    /// Gracefully shut down the server.
    pub fn shutdown(&mut self) {
        if let Some(tx) = self.stop_tx.take() {
            let _ = tx.send(());
        }
        self.endpoint.close(0u32.into(), b"shutdown");
    }

    /// The local address this server is bound to.
    pub fn local_addr(&self) -> Result<SocketAddr> {
        self.endpoint.local_addr().map_err(Into::into)
    }
}

/// Sender information extracted from the Hello handshake.
pub struct SenderInfo {
    pub version: String,
    pub alias: String,
    pub fingerprint: String,
}

/// State machine for an incoming transfer (receiver side).
pub struct IncomingTransfer {
    conn: Connection,
    control_send: quinn::SendStream,
    control_recv: RecvStream,
}

impl IncomingTransfer {

    /// Accept the control stream (bidi stream 0) and perform the Hello handshake.
    /// Returns the transfer handle and the sender's info.
    pub async fn accept(conn: Connection, server_alias: &str, server_fingerprint: &str) -> Result<(Self, SenderInfo)> {
        let (control_send, control_recv) = conn.accept_bi().await?;

        let mut transfer = Self {
            conn,
            control_send,
            control_recv,
        };

        // Read the sender's hello first.
        let hello = codec::read_frame::<ControlMessage>(&mut transfer.control_recv).await?;
        let ControlMessage::Hello { version, alias, fingerprint } = hello else {
            anyhow::bail!("expected Hello message, got a different message type");
        };

        tracing::info!("QUIC Hello from {alias} (version={version}, fp={fingerprint})");

        // Respond with our own hello.
        codec::write_frame(
            &mut transfer.control_send,
            &ControlMessage::Hello {
                version: "3.0".into(),
                alias: server_alias.to_string(),
                fingerprint: server_fingerprint.to_string(),
            },
        )
        .await?;

        Ok((transfer, SenderInfo { version, alias, fingerprint }))
    }

    /// Wait for the sender to send a PrepareUpload message.
    /// Returns the file map if accepted, or errors on cancel.
    pub async fn receive_file_list(
        &mut self,
    ) -> Result<HashMap<String, crate::model::transfer::FileDto>> {
        let msg = codec::read_frame::<ControlMessage>(&mut self.control_recv).await?;
        match msg {
            ControlMessage::PrepareUpload { files } => {
                tracing::info!("Received file list with {} files", files.len());
                Ok(files)
            }
            ControlMessage::Cancel { session_id } => {
                anyhow::bail!("transfer cancelled by sender (session={session_id})");
            }
            other => {
                anyhow::bail!("expected PrepareUpload, got {:?}", other);
            }
        }
    }

    /// Accept the proposed file list and send back tokens.
    pub async fn accept_files(
        &mut self,
        session_id: String,
        file_tokens: HashMap<String, String>,
    ) -> Result<()> {
        codec::write_frame(
            &mut self.control_send,
            &ControlMessage::PrepareUploadAccept {
                session_id,
                files: file_tokens,
            },
        )
        .await
    }

    /// Decline the transfer.
    pub async fn decline(&mut self) -> Result<()> {
        codec::write_frame(
            &mut self.control_send,
            &ControlMessage::PrepareUploadDecline,
        )
        .await
    }

    /// Accept the next incoming unidirectional file stream.
    ///
    /// Returns the file header and the raw recv stream so the caller
    /// can drain file bytes to the destination.
    pub async fn receive_file(&mut self) -> Result<(FileHeader, RecvStream)> {
        let mut stream = self.conn.accept_uni().await?;
        let header: FileHeader = codec::read_frame(&mut stream).await?;
        tracing::debug!("Receiving file {} (token={})", header.file_id, header.token);
        Ok((header, stream))
    }

    /// Acknowledge a received file on the control stream.
    pub async fn ack_file(&mut self, ack: FileAck) -> Result<()> {
        codec::write_frame(&mut self.control_send, &ControlMessage::FileAck(ack)).await
    }

    /// Cancel the transfer. Sends a Cancel frame to the sender so it
    /// stops sending data. The sender should abort in-flight streams.
    pub async fn cancel(&mut self, session_id: &str) -> Result<()> {
        tracing::info!("Sending cancel for session {session_id}");
        codec::write_frame(
            &mut self.control_send,
            &ControlMessage::Cancel {
                session_id: session_id.to_string(),
            },
        )
        .await
    }

    /// Close the QUIC connection entirely. This implicitly resets all
    /// in-flight streams (sender gets RST_STREAM / connection error).
    pub fn close_connection(&mut self) {
        self.conn.close(0u32.into(), b"cancelled");
    }

    /// Read file data from a recv stream into a writer callback.
    ///
    /// The caller provides a callback that writes chunks to the destination
    /// (file, buffer, etc). Returns total bytes received.
    pub async fn drain_file_stream(
        stream: &mut RecvStream,
        mut on_chunk: impl FnMut(Bytes) -> Result<()>,
    ) -> Result<u64> {
        let mut total: u64 = 0;
        loop {
            match stream.read_chunk(usize::MAX, true).await? {
                Some(chunk) => {
                    total += chunk.bytes.len() as u64;
                    on_chunk(chunk.bytes)?;
                }
                None => break, // stream FIN
            }
        }
        Ok(total)
    }

    /// Get the underlying connection for advanced usage.
    pub fn connection(&self) -> &Connection {
        &self.conn
    }
}

// -- Shutdown helpers --------------------------------------------------

impl Drop for QuicServer {
    fn drop(&mut self) {
        self.shutdown();
    }
}
