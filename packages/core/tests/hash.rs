#![cfg(feature = "crypto")]

use localsend::crypto::hash::{sha256_file_content, sha256_hex, HashError};
use localsend::model::transfer::FileContent;
use tokio_util::sync::CancellationToken;

/// SHA-256 of "hello world".
const HELLO_WORLD_HASH: &str = "b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9";

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

    let progress = std::sync::Mutex::new(Vec::new());
    let hash = sha256_file_content(
        FileContent::Path(path.clone()),
        &CancellationToken::new(),
        |hashed| progress.lock().unwrap().push(hashed),
    )
    .await
    .unwrap();

    assert_eq!(hash, sha256_hex(&content));
    let progress = progress.into_inner().unwrap();
    assert!(progress.len() > 1);
    assert!(progress.windows(2).all(|pair| pair[0] < pair[1]));
    assert_eq!(*progress.last().unwrap(), content.len() as u64);
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
