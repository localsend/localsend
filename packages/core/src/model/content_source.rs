//! Replayable sources of bytes for transfers and hashing.

use super::transfer::FileStream;
use bytes::Bytes;
use futures_util::stream;
use std::{fmt, io, path::PathBuf, sync::Arc};

/// Opens an independent stream each time it is called.
pub trait ContentSource: fmt::Debug + Send + Sync {
    fn open_stream(&self) -> io::Result<FileStream>;
}

#[derive(Debug, Clone)]
pub struct FileSource {
    pub path: PathBuf,
}

impl ContentSource for FileSource {
    fn open_stream(&self) -> io::Result<FileStream> {
        Ok(super::transfer::FileContent::Path(self.path.clone()).into_stream())
    }
}

#[derive(Debug, Clone)]
pub struct BytesSource {
    pub bytes: Bytes,
}

impl ContentSource for BytesSource {
    fn open_stream(&self) -> io::Result<FileStream> {
        Ok(Box::pin(stream::once(std::future::ready(Ok(self
            .bytes
            .clone())))))
    }
}

/// A replayable source backed by a factory, such as a platform archive.
#[derive(Clone)]
pub struct StreamSource {
    factory: Arc<dyn Fn() -> io::Result<FileStream> + Send + Sync>,
}

impl StreamSource {
    pub fn new(factory: Arc<dyn Fn() -> io::Result<FileStream> + Send + Sync>) -> Self {
        Self { factory }
    }
}

impl fmt::Debug for StreamSource {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str("StreamSource")
    }
}

impl ContentSource for StreamSource {
    fn open_stream(&self) -> io::Result<FileStream> {
        (self.factory)()
    }
}
