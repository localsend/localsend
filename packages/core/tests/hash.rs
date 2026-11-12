#![cfg(feature = "crypto")]

use localsend::crypto::hash::{sha256_file_content, sha256_hex, HashError};
use localsend::model::transfer::FileContent;
use tokio_util::sync::CancellationToken;

/// SHA-256 of "hello world".
const HELLO_WORLD_HASH: &str = "b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9";

/// File hashing must leave the async runtime available to service other work,
/// including cancellation and network requests.
#[tokio::test(flavor = "current_thread")]
async fn file_hash_does_not_block_the_runtime() {
    let path = std::env::temp_dir().join(format!("localsend-hash-{}", uuid::Uuid::new_v4()));
    tokio::fs::write(&path, b"hello world").await.unwrap();
    let (started_tx, started_rx) = tokio::sync::oneshot::channel();
    let (resume_tx, resume_rx) = std::sync::mpsc::channel();
    let other_work = tokio::spawn(async move {
        started_rx.await.unwrap();
        let _ = resume_tx.send(());
    });
    let started_tx = std::sync::Mutex::new(Some(started_tx));
    let responsive = std::sync::Arc::new(std::sync::atomic::AtomicBool::new(false));
    let observed = responsive.clone();
    let hash = sha256_file_content(
        FileContent::Path(path.clone()),
        &CancellationToken::new(),
        move |_| {
            if let Some(tx) = started_tx.lock().unwrap().take() {
                let _ = tx.send(());
                observed.store(
                    resume_rx
                        .recv_timeout(std::time::Duration::from_secs(1))
                        .is_ok(),
                    std::sync::atomic::Ordering::SeqCst,
                );
            }
        },
    )
    .await
    .unwrap();
    other_work.await.unwrap();
    tokio::fs::remove_file(&path).await.unwrap();

    assert_eq!(hash, HELLO_WORLD_HASH);
    assert!(responsive.load(std::sync::atomic::Ordering::SeqCst));
}

#[tokio::test]
async fn hash_file_from_path() {
    let path = std::env::temp_dir().join(format!("localsend-hash-{}", uuid::Uuid::new_v4()));
    tokio::fs::write(&path, b"hello world").await.unwrap();

    let hash = sha256_file_content(
        FileContent::Path(path.clone()),
        &CancellationToken::new(),
        |_| {},
    )
    .await
    .unwrap();

    assert_eq!(hash, HELLO_WORLD_HASH);
    tokio::fs::remove_file(&path).await.unwrap();
}

/// A file larger than the internal buffer must be hashed across multiple reads,
/// reporting the cumulative progress after each of them.
#[tokio::test]
async fn hash_large_file_from_path() {
    let content: Vec<u8> = (0..2_000_000).map(|i| (i % 251) as u8).collect();
    let path = std::env::temp_dir().join(format!("localsend-hash-{}", uuid::Uuid::new_v4()));
    tokio::fs::write(&path, &content).await.unwrap();

    let progress = std::sync::Arc::new(std::sync::Mutex::new(Vec::new()));
    let observed = progress.clone();
    let hash = sha256_file_content(
        FileContent::Path(path.clone()),
        &CancellationToken::new(),
        move |hashed| observed.lock().unwrap().push(hashed),
    )
    .await
    .unwrap();

    assert_eq!(hash, sha256_hex(&content));
    {
        let progress = progress.lock().unwrap();
        assert!(progress.len() > 1);
        assert!(progress.windows(2).all(|pair| pair[0] < pair[1]));
        assert_eq!(*progress.last().unwrap(), content.len() as u64);
    }
    tokio::fs::remove_file(&path).await.unwrap();
}

/// Hashing must stop when the token is cancelled while the file is being read.
#[tokio::test]
async fn hash_cancelled_while_reading() {
    let (tx, rx) = tokio::sync::mpsc::channel(1);
    let cancel_token = CancellationToken::new();

    let handle = tokio::spawn({
        let token = cancel_token.clone();
        async move { sha256_file_content(FileContent::Stream(rx), &token, |_| {}).await }
    });

    // The sender stays alive, so hashing only ends because of the cancellation.
    tx.send(bytes::Bytes::from_static(b"hello ")).await.unwrap();
    cancel_token.cancel();

    let result = handle.await.unwrap();

    assert!(matches!(result, Err(HashError::Cancelled)));
}

/// A token that is already cancelled must not start reading at all.
#[tokio::test]
async fn hash_cancelled_before_start() {
    let path = std::env::temp_dir().join(format!("localsend-hash-{}", uuid::Uuid::new_v4()));
    tokio::fs::write(&path, b"hello world").await.unwrap();
    let cancel_token = CancellationToken::new();
    cancel_token.cancel();

    let result = sha256_file_content(FileContent::Path(path.clone()), &cancel_token, |_| {}).await;

    assert!(matches!(result, Err(HashError::Cancelled)));
    tokio::fs::remove_file(&path).await.unwrap();
}

#[tokio::test]
async fn hash_path_cancelled_after_first_chunk() {
    let path = std::env::temp_dir().join(format!("localsend-hash-{}", uuid::Uuid::new_v4()));
    tokio::fs::write(&path, vec![42; 2_000_000]).await.unwrap();
    let cancel = CancellationToken::new();
    let progress = std::sync::Arc::new(std::sync::Mutex::new(Vec::new()));
    let observed = progress.clone();
    let token = cancel.clone();

    let result = sha256_file_content(FileContent::Path(path.clone()), &cancel, move |hashed| {
        observed.lock().unwrap().push(hashed);
        token.cancel();
    })
    .await;
    tokio::fs::remove_file(&path).await.unwrap();

    assert!(matches!(result, Err(HashError::Cancelled)));
    let progress = progress.lock().unwrap();
    assert_eq!(progress.len(), 1);
    assert!(progress[0] > 0 && progress[0] < 2_000_000);
}

#[tokio::test]
async fn hash_empty_path() {
    let path = std::env::temp_dir().join(format!("localsend-hash-{}", uuid::Uuid::new_v4()));
    tokio::fs::write(&path, []).await.unwrap();
    let hash = sha256_file_content(
        FileContent::Path(path.clone()),
        &CancellationToken::new(),
        |_| {},
    )
    .await
    .unwrap();
    tokio::fs::remove_file(&path).await.unwrap();

    assert_eq!(
        hash,
        "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    );
}

/// Dropping an async caller must not leave its blocking worker hashing the
/// rest of a large file. Synchronize at the first chunk rather than racing a
/// timer against the disk.
#[tokio::test(flavor = "current_thread")]
async fn aborting_file_hash_stops_the_worker() {
    struct Finished(Option<tokio::sync::oneshot::Sender<()>>);
    impl Drop for Finished {
        fn drop(&mut self) {
            let _ = self.0.take().unwrap().send(());
        }
    }

    let path = std::env::temp_dir().join(format!("localsend-hash-{}", uuid::Uuid::new_v4()));
    tokio::fs::write(&path, vec![42; 2_000_000]).await.unwrap();
    let cancel = CancellationToken::new();
    let token = cancel.clone();
    let (started_tx, started_rx) = tokio::sync::oneshot::channel();
    let started = std::sync::Mutex::new(Some(started_tx));
    let (resume_tx, resume_rx) = std::sync::mpsc::channel();
    let (finished_tx, finished_rx) = tokio::sync::oneshot::channel();
    let finished = Finished(Some(finished_tx));
    let chunks = std::sync::Arc::new(std::sync::atomic::AtomicUsize::new(0));
    let observed = chunks.clone();
    let file_path = path.clone();
    let task = tokio::spawn(async move {
        sha256_file_content(FileContent::Path(file_path), &token, move |_| {
            let _keep_until_worker_exits = &finished;
            observed.fetch_add(1, std::sync::atomic::Ordering::SeqCst);
            if let Some(tx) = started.lock().unwrap().take() {
                let _ = tx.send(());
                let _ = resume_rx.recv_timeout(std::time::Duration::from_secs(5));
            }
        })
        .await
    });

    started_rx.await.unwrap();
    task.abort();
    assert!(task.await.unwrap_err().is_cancelled());
    resume_tx.send(()).unwrap();
    tokio::time::timeout(std::time::Duration::from_secs(2), finished_rx)
        .await
        .unwrap()
        .unwrap();
    tokio::fs::remove_file(&path).await.unwrap();

    assert_eq!(chunks.load(std::sync::atomic::Ordering::SeqCst), 1);
    assert!(!cancel.is_cancelled());
}

#[tokio::test]
async fn hash_missing_file_fails() {
    let path = std::env::temp_dir().join(format!("localsend-hash-{}", uuid::Uuid::new_v4()));

    let result =
        sha256_file_content(FileContent::Path(path), &CancellationToken::new(), |_| {}).await;

    assert!(result.is_err());
}

#[tokio::test]
async fn hash_stream() {
    let (tx, rx) = tokio::sync::mpsc::channel(4);
    tokio::spawn(async move {
        tx.send(bytes::Bytes::from_static(b"hello ")).await.unwrap();
        tx.send(bytes::Bytes::from_static(b"world")).await.unwrap();
    });

    let hash = sha256_file_content(FileContent::Stream(rx), &CancellationToken::new(), |_| {})
        .await
        .unwrap();

    assert_eq!(hash, HELLO_WORLD_HASH);
}
