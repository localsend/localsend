use bytes::Bytes;
use flutter_rust_bridge::frb;
use tokio::sync::mpsc;

#[frb(opaque)]
pub struct Dart2RustStreamSink {
    sender: Option<mpsc::Sender<Bytes>>,
}

pub struct Dart2RustStreamReceiver {
    pub(crate) receiver: mpsc::Receiver<Bytes>,
}

pub fn create_stream() -> (Dart2RustStreamSink, Dart2RustStreamReceiver) {
    // We don't need to have a buffer because we already buffer on Dart side.
    // However, a buffer of 1 seems to improve performance.
    let (sender, receiver) = mpsc::channel(1);
    (
        Dart2RustStreamSink {
            sender: Some(sender),
        },
        Dart2RustStreamReceiver { receiver },
    )
}

impl Dart2RustStreamSink {
    pub async fn add(&mut self, data: Vec<u8>) -> Result<(), String> {
        self.sender
            .as_ref()
            .ok_or_else(|| "Stream already closed".to_string())?
            .send(Bytes::from(data))
            .await
            .map_err(|_| "Failed to send data".to_string())
    }

    /// Closes the stream, signaling the end of data to the Rust side.
    #[frb(sync)]
    pub fn close(&mut self) {
        self.sender = None;
    }
}
