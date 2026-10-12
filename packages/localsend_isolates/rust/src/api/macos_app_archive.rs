use crate::api::cancel::RsCancellationToken;
use crate::api::content_source::ContentSource;
use localsend::model::transfer::FileContent;
use localsend::platform::macos::MacosAppArchive;
use std::{io, sync::Arc};

pub(crate) fn decode_source(descriptor: &str) -> io::Result<FileContent> {
    let archive = MacosAppArchive::decode(descriptor)?;
    Ok(FileContent::Source(Arc::new(archive.into_source())))
}

pub struct RsMacosAppArchiveInfo {
    pub source: ContentSource,
    pub size: u64,
    pub sha256: String,
}

/// Measures a replayable application ZIP without storing the archive.
pub async fn prepare_macos_app_archive(
    path: String,
    cancel_token: &RsCancellationToken,
) -> anyhow::Result<RsMacosAppArchiveInfo> {
    let archive = MacosAppArchive::prepare(path.into(), cancel_token.inner.clone()).await?;
    let size = archive.size();
    let sha256 = archive.sha256();
    Ok(RsMacosAppArchiveInfo {
        source: ContentSource::Generated {
            descriptor: archive.encode()?,
        },
        size,
        sha256,
    })
}
