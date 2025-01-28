use bytes::{Bytes, BytesMut};
use tokio::sync::mpsc;

/// Converts a stream of Bytes into a stream of Vec<u8>.
/// Also buffers the incoming data to reduce the number of
/// messages sent to the receiver.
pub(crate) async fn buffer_receiver(
    mut rx_input: mpsc::Receiver<Bytes>,
) -> mpsc::Receiver<Vec<u8>> {
    const BUFFER_SIZE: usize = 1024 * 1024; // 1 MB
    let mut buffer = BytesMut::with_capacity(BUFFER_SIZE);

    let (tx, rx) = mpsc::channel(1);

    tokio::spawn(async move {
        while let Some(data) = rx_input.recv().await {
            buffer.extend_from_slice(&data);

            if buffer.len() >= BUFFER_SIZE {
                let data = buffer.to_vec();
                buffer.clear();
                tx.send(data).await?;
            }
        }

        if !buffer.is_empty() {
            let data = buffer.to_vec();
            tx.send(data).await?;
        }

        Ok::<(), anyhow::Error>(())
    });

    rx
}
