//! Bounded bridge between Dart-created streams and the Rust transfer layer.

use crate::frb_generated::RustOpaque;
use crate::api::content_source::RsContentSource;
use bytes::Bytes;
use localsend::model::{
    transfer::{FileContent, FileStream},
};
use std::io;
use tokio::sync::{Mutex, mpsc};
use tokio_util::sync::CancellationToken;

pub struct RsContentStreamSink {
    sender: Mutex<Option<mpsc::Sender<Bytes>>>,
    closed: CancellationToken,
}

pub struct RsContentStreamReceiver {
    receiver: Mutex<Option<mpsc::Receiver<Bytes>>>,
}

impl RsContentStreamReceiver {
    pub(crate) async fn take_content(&self) -> io::Result<FileContent> {
        self.receiver
            .lock()
            .await
            .take()
            .map(FileContent::Stream)
            .ok_or_else(|| {
                io::Error::new(
                    io::ErrorKind::InvalidInput,
                    "Content stream already consumed",
                )
            })
    }
}

pub fn create_content_stream() -> (RsContentStreamSink, RustOpaque<RsContentStreamReceiver>) {
    let (sender, receiver) = mpsc::channel(1);
    (
        RsContentStreamSink {
            sender: Mutex::new(Some(sender)),
            closed: CancellationToken::new(),
        },
        RustOpaque::new(RsContentStreamReceiver {
            receiver: Mutex::new(Some(receiver)),
        }),
    )
}

impl RsContentStreamSink {
    pub async fn add(&self, data: Vec<u8>) -> anyhow::Result<()> {
        let sender = self
            .sender
            .lock()
            .await
            .clone()
            .ok_or_else(|| anyhow::anyhow!("Content stream closed"))?;
        tokio::select! {
            biased;
            _ = self.closed.cancelled() => Err(anyhow::anyhow!("Content stream closed")),
            result = sender.send(Bytes::from(data)) => result.map_err(|_| anyhow::anyhow!("Content stream receiver closed")),
        }
    }

    /// Returns true when the transfer drops its receiver, or false when this
    /// sink is closed by its producer.
    pub async fn wait_closed(&self) -> bool {
        let Some(sender) = self.sender.lock().await.clone() else {
            return false;
        };
        tokio::select! {
            biased;
            _ = self.closed.cancelled() => false,
            _ = sender.closed() => true,
        }
    }

    pub async fn close(&self) {
        self.closed.cancel();
        self.sender.lock().await.take();
    }
}

/// Pulls a native source on demand, without materializing its entire content.
pub struct RsContentReader {
    stream: Mutex<Option<FileStream>>,
    cancel: CancellationToken,
}

pub async fn open_content_source(source: RsContentSource) -> io::Result<RsContentReader> {
    Ok(RsContentReader {
        stream: Mutex::new(Some(source.into_content().await?.into_stream())),
        cancel: CancellationToken::new(),
    })
}

impl RsContentReader {
    pub async fn next_chunk(&self) -> anyhow::Result<Option<Vec<u8>>> {
        if self.cancel.is_cancelled() {
            return Ok(None);
        }
        let mut guard = self.stream.lock().await;
        let Some(stream) = guard.as_mut() else {
            return Ok(None);
        };
        tokio::select! {
            biased;
            _ = self.cancel.cancelled() => Ok(None),
            chunk = std::future::poll_fn(|cx| stream.as_mut().poll_next(cx)) => match chunk {
                Some(Ok(bytes)) => Ok(Some(bytes.to_vec())),
                Some(Err(error)) => Err(error.into()),
                None => { guard.take(); Ok(None) },
            },
        }
    }

    pub async fn close(&self) {
        self.cancel.cancel();
        self.stream.lock().await.take();
    }
}
