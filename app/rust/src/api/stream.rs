use tokio::sync::mpsc;

pub struct Dart2RustStreamSink {
    sender: mpsc::Sender<Vec<u8>>,
}

pub struct Dart2RustStreamReceiver {
    pub(crate) receiver: mpsc::Receiver<Vec<u8>>,
}

pub fn create_stream() -> (Dart2RustStreamSink, Dart2RustStreamReceiver) {
    let (sender, receiver) = mpsc::channel(64);
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
