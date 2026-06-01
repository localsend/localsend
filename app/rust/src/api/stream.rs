use tokio::sync::mpsc;

pub struct Dart2RustStreamSink {
    sender: mpsc::Sender<Vec<u8>>,
}

pub struct Dart2RustStreamReceiver {
    pub(crate) receiver: mpsc::Receiver<Vec<u8>>,
}

pub fn create_stream() -> (Dart2RustStreamSink, Dart2RustStreamReceiver) {
    // We don't need to have a buffer because we already buffer on Dart side.
    // However, a buffer of 1 seems to improve performance.
    let (sender, receiver) = mpsc::channel(1);
    (
        Dart2RustStreamSink { sender },
        Dart2RustStreamReceiver { receiver },
    )
}

impl Dart2RustStreamSink {
    pub async fn add(&mut self, data: Vec<u8>) -> Result<(), String> {
        self.sender
            .send(data)
            .await
            .map_err(|_| "Failed to send data".to_string())
    }
}
