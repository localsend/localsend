//! Run with `cargo run --release --locked --package localsend --features full
//! --example hash_file -- <file>...` on each revision being compared.
//! Inputs should be synthetic files; each is hashed once to warm the cache,
//! then five times for measurement. This measures hashing, not transfer speed.

use localsend::crypto::hash::sha256_file_content;
use localsend::model::transfer::FileContent;
use std::{path::PathBuf, time::Instant};
use tokio_util::sync::CancellationToken;

#[tokio::main(flavor = "multi_thread", worker_threads = 1)]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let paths: Vec<PathBuf> = std::env::args_os().skip(1).map(PathBuf::from).collect();
    if paths.is_empty() {
        return Err("usage: hash_file <file>...".into());
    }
    let cancel = CancellationToken::new();
    let mut expected = Vec::new();
    let mut bytes = 0_u64;
    for path in &paths {
        bytes += std::fs::metadata(path)?.len();
        expected.push(sha256_file_content(FileContent::Path(path.clone()), &cancel, |_| {}).await?);
    }
    println!("files,bytes,iteration,milliseconds");
    for iteration in 1..=5 {
        let start = Instant::now();
        for (path, expected) in paths.iter().zip(&expected) {
            let hash =
                sha256_file_content(FileContent::Path(path.clone()), &cancel, |_| {}).await?;
            assert_eq!(&hash, expected, "file changed between iterations");
        }
        println!(
            "{},{bytes},{iteration},{:.3}",
            paths.len(),
            start.elapsed().as_secs_f64() * 1000.0
        );
        tokio::time::sleep(std::time::Duration::from_millis(200)).await;
    }
    for (index, hash) in expected.iter().enumerate() {
        println!("sha256[{index}]={hash}");
    }
    Ok(())
}
