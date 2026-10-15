//! A reproducible, bounded-memory ZIP stream for a macOS application bundle.
//! `ditto` writes the archive to stdout; only ZIP headers are retained while
//! preparing the size and checksum used by the transfer protocol.

use crate::model::{content_source::StreamSource, transfer::FileStream};
use bytes::Bytes;
use flate2::{Decompress, FlushDecompress, Status};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};
use std::{io, path::PathBuf, sync::Arc};
use tokio::{io::AsyncReadExt, process::Command, sync::mpsc};
use tokio_stream::wrappers::ReceiverStream;
use tokio_util::sync::CancellationToken;

const BLOCK: usize = 64 * 1024;
const SYNTHETIC_TIME: u32 = 946_684_800;
const MAX_HEADER: usize = 1024 * 1024;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MacosAppArchive {
    path: PathBuf,
    entries: Vec<Entry>,
    size: u64,
    sha256: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
struct Entry {
    name: Vec<u8>,
    atime: Option<u32>,
    local_sha256: String,
    data_sha256: String,
    central_sha256: String,
}

impl MacosAppArchive {
    pub async fn prepare(path: PathBuf, cancel: CancellationToken) -> io::Result<Self> {
        let mut archive = Self {
            path,
            entries: Vec::new(),
            size: 0,
            sha256: String::new(),
        };
        let (size, sha256) = run(&mut archive, false, None, cancel).await?;
        archive.size = size;
        archive.sha256 = sha256;
        Ok(archive)
    }

    pub fn size(&self) -> u64 {
        self.size
    }

    pub fn sha256(&self) -> String {
        self.sha256.clone()
    }

    pub fn encode(&self) -> io::Result<String> {
        serde_json::to_string(self).map_err(|e| invalid(format!("Invalid archive descriptor: {e}")))
    }

    pub fn decode(value: &str) -> io::Result<Self> {
        let archive: Self = serde_json::from_str(value)
            .map_err(|e| invalid(format!("Invalid archive descriptor: {e}")))?;
        if archive.sha256.len() != 64 || archive.entries.is_empty() {
            return Err(invalid("Incomplete archive descriptor"));
        }
        Ok(archive)
    }

    pub fn into_stream(mut self) -> FileStream {
        let (tx, rx) = mpsc::channel(4);
        tokio::spawn(async move {
            let result = run(&mut self, true, Some(tx.clone()), CancellationToken::new()).await;
            if let Err(error) = result {
                let _ = tx.send(Err(error)).await;
            }
        });
        Box::pin(ReceiverStream::new(rx))
    }

    /// Build a repeatable transfer source from the measured archive plan.
    pub fn into_source(self) -> StreamSource {
        StreamSource::new(Arc::new(move || Ok(self.clone().into_stream())))
    }
}

/// Prepare a macOS application bundle as a repeatable transfer source.
pub async fn app_bundle_source(
    path: PathBuf,
    cancel: CancellationToken,
) -> io::Result<(StreamSource, u64, String)> {
    let archive = MacosAppArchive::prepare(path, cancel).await?;
    let size = archive.size();
    let sha256 = archive.sha256();
    Ok((archive.into_source(), size, sha256))
}

fn invalid(message: impl Into<String>) -> io::Error {
    io::Error::new(io::ErrorKind::InvalidData, message.into())
}

fn short() -> io::Error {
    io::Error::new(io::ErrorKind::UnexpectedEof, "Truncated ditto ZIP stream")
}

fn u16le(data: &[u8], offset: usize) -> u16 {
    u16::from_le_bytes(data[offset..offset + 2].try_into().unwrap())
}
fn u32le(data: &[u8], offset: usize) -> u32 {
    u32::from_le_bytes(data[offset..offset + 4].try_into().unwrap())
}
fn u64le(data: &[u8], offset: usize) -> u64 {
    u64::from_le_bytes(data[offset..offset + 8].try_into().unwrap())
}

fn hex(data: &[u8]) -> String {
    const DIGITS: &[u8; 16] = b"0123456789abcdef";
    let mut out = String::with_capacity(data.len() * 2);
    for b in data {
        out.push(DIGITS[(b >> 4) as usize] as char);
        out.push(DIGITS[(b & 15) as usize] as char);
    }
    out
}

fn digest(data: &[u8]) -> String {
    hex(&Sha256::digest(data))
}

struct Input {
    reader: tokio::process::ChildStdout,
    pending: Vec<u8>,
}

impl Input {
    async fn chunk(&mut self, limit: usize) -> io::Result<Vec<u8>> {
        if !self.pending.is_empty() {
            let amount = limit.min(self.pending.len());
            return Ok(self.pending.drain(..amount).collect());
        }
        let mut data = vec![0; limit];
        let amount = self.reader.read(&mut data).await?;
        data.truncate(amount);
        Ok(data)
    }

    async fn exact(&mut self, length: usize) -> io::Result<Vec<u8>> {
        if length > MAX_HEADER {
            return Err(invalid("Oversized ZIP header"));
        }
        let mut result = Vec::with_capacity(length);
        while result.len() < length {
            let part = self.chunk(length - result.len()).await?;
            if part.is_empty() {
                return Err(short());
            }
            result.extend_from_slice(&part);
        }
        Ok(result)
    }

    fn unread(&mut self, extra: &[u8]) {
        let mut next = extra.to_vec();
        next.extend_from_slice(&self.pending);
        self.pending = next;
    }
}

struct Output {
    tx: Option<mpsc::Sender<io::Result<Bytes>>>,
    pending: Vec<u8>,
    hash: Sha256,
    size: u64,
}

impl Output {
    fn new(tx: Option<mpsc::Sender<io::Result<Bytes>>>) -> Self {
        Self {
            tx,
            pending: Vec::new(),
            hash: Sha256::new(),
            size: 0,
        }
    }

    async fn write(&mut self, data: &[u8]) -> io::Result<()> {
        self.hash.update(data);
        self.size = self
            .size
            .checked_add(data.len() as u64)
            .ok_or_else(|| invalid("ZIP size overflow"))?;
        if let Some(tx) = &self.tx {
            self.pending.extend_from_slice(data);
            // Retain the last block until ditto has exited and the complete
            // checksum has been verified. No successful EOF can precede that.
            while self.pending.len() > BLOCK * 2 {
                let rest = self.pending.split_off(BLOCK);
                let block = std::mem::replace(&mut self.pending, rest);
                tx.send(Ok(Bytes::from(block))).await.map_err(|_| {
                    io::Error::new(io::ErrorKind::BrokenPipe, "Archive stream closed")
                })?;
            }
        }
        Ok(())
    }

    async fn finish(self) -> io::Result<(u64, String)> {
        let checksum = hex(&self.hash.finalize());
        if let Some(tx) = self.tx {
            if !self.pending.is_empty() {
                tx.send(Ok(Bytes::from(self.pending))).await.map_err(|_| {
                    io::Error::new(io::ErrorKind::BrokenPipe, "Archive stream closed")
                })?;
            }
        }
        Ok((self.size, checksum))
    }
}

// Returns whether the entry uses a ZIP64 data descriptor. The field is
// interpreted before header normalization, which changes timestamps only.
fn zip64_size(
    header: &[u8],
    extra_start: usize,
    extra_len: usize,
) -> io::Result<(Option<u64>, bool)> {
    let uncompressed64 = u32le(header, 22) == u32::MAX;
    let compressed64 = u32le(header, 18) == u32::MAX;
    let needs = uncompressed64 || compressed64;
    let mut cursor = extra_start;
    let end = extra_start + extra_len;
    while cursor < end {
        if end - cursor < 4 {
            return Err(invalid("Malformed ZIP extra field"));
        }
        let len = u16le(header, cursor + 2) as usize;
        if len > end - cursor - 4 {
            return Err(invalid("Malformed ZIP extra field length"));
        }
        if u16le(header, cursor) == 1 && needs {
            let compressed_offset = cursor + 4 + if uncompressed64 { 8 } else { 0 };
            if compressed64 && compressed_offset + 8 > cursor + 4 + len {
                return Err(invalid("Missing ZIP64 compressed size"));
            }
            if uncompressed64 && len < 8 {
                return Err(invalid("Missing ZIP64 uncompressed size"));
            }
            return Ok((compressed64.then(|| u64le(header, compressed_offset)), true));
        }
        cursor += 4 + len;
    }
    if needs {
        Err(invalid("Missing ZIP64 extra field"))
    } else {
        Ok((None, false))
    }
}

fn normalize(
    header: &mut [u8],
    name: &[u8],
    extra_start: usize,
    extra_len: usize,
    dos_offset: usize,
    atime: &mut Option<u32>,
    replay: bool,
) -> io::Result<()> {
    let synthetic = name.starts_with(b"__MACOSX/") && name.ends_with(b"/");
    if synthetic {
        header[dos_offset..dos_offset + 4].copy_from_slice(&[0, 0, 0x21, 0x28]);
    }
    let mut cursor = extra_start;
    let end = extra_start + extra_len;
    while cursor < end {
        if end - cursor < 4 {
            return Err(invalid("Malformed ZIP extra field"));
        }
        let kind = u16le(header, cursor);
        let len = u16le(header, cursor + 2) as usize;
        if len > end - cursor - 4 {
            return Err(invalid("Malformed ZIP extra field length"));
        }
        let data = cursor + 4;
        if kind == 0x5855 {
            if len < 8 {
                return Err(invalid("Malformed InfoZIP Unix times"));
            }
            replace_atime(header, data, atime, replay, synthetic);
            if synthetic {
                header[data + 4..data + 8].copy_from_slice(&SYNTHETIC_TIME.to_le_bytes());
            }
        } else if kind == 0x5455 {
            if len == 0 {
                return Err(invalid("Malformed extended timestamp"));
            }
            let flags = header[data];
            let mut position = data + 1;
            for bit in [1, 2, 4] {
                if flags & bit == 0 {
                    continue;
                }
                if position + 4 > data + len {
                    break;
                }
                if synthetic {
                    header[position..position + 4].copy_from_slice(&SYNTHETIC_TIME.to_le_bytes());
                } else if bit == 2 {
                    replace_atime(header, position, atime, replay, false);
                }
                position += 4;
            }
        }
        cursor = data + len;
    }
    Ok(())
}

fn replace_atime(
    header: &mut [u8],
    position: usize,
    atime: &mut Option<u32>,
    replay: bool,
    synthetic: bool,
) {
    if synthetic {
        header[position..position + 4].copy_from_slice(&SYNTHETIC_TIME.to_le_bytes());
    } else if let Some(saved) = atime {
        header[position..position + 4].copy_from_slice(&saved.to_le_bytes());
    } else if !replay {
        *atime = Some(u32le(header, position));
    }
}

async fn data(input: &mut Input, output: &mut Output, header: &[u8]) -> io::Result<String> {
    let flags = u16le(header, 6);
    let method = u16le(header, 8);
    if flags & 1 != 0 {
        return Err(invalid("Encrypted ZIP entry"));
    }
    let name_len = u16le(header, 26) as usize;
    let extra_len = u16le(header, 28) as usize;
    let (zip64_size, zip64_descriptor) = zip64_size(header, 30 + name_len, extra_len)?;
    let mut hash = Sha256::new();
    if flags & 8 == 0 {
        let mut remaining = zip64_size.unwrap_or_else(|| u32le(header, 18) as u64);
        while remaining > 0 {
            let part = input.chunk(remaining.min(BLOCK as u64) as usize).await?;
            if part.is_empty() {
                return Err(short());
            }
            hash.update(&part);
            output.write(&part).await?;
            remaining -= part.len() as u64;
        }
    } else {
        if method != 8 {
            return Err(invalid("Unsupported ZIP data descriptor method"));
        }
        let mut inflater = Decompress::new(false);
        loop {
            let part = input.chunk(8192).await?;
            if part.is_empty() {
                return Err(short());
            }
            let mut decoded = [0u8; 8192];
            let before = inflater.total_in();
            let before_out = inflater.total_out();
            let status = inflater
                .decompress(&part, &mut decoded, FlushDecompress::None)
                .map_err(|e| invalid(format!("Invalid ZIP deflate stream: {e}")))?;
            let used = (inflater.total_in() - before) as usize;
            hash.update(&part[..used]);
            output.write(&part[..used]).await?;
            if used < part.len() {
                input.unread(&part[used..]);
            }
            if status == Status::StreamEnd {
                break;
            }
            if used == 0 && inflater.total_out() == before_out {
                return Err(invalid("Stalled ZIP deflate stream"));
            }
        }
        let first = input.exact(4).await?;
        let signed = u32le(&first, 0) == 0x0807_4b50;
        let mut descriptor = first;
        descriptor.extend(input.exact(if signed { 4 } else { 0 }).await?);
        let size64 = zip64_descriptor
            || inflater.total_in() > u32::MAX as u64
            || inflater.total_out() > u32::MAX as u64;
        descriptor.extend(input.exact(if size64 { 16 } else { 8 }).await?);
        let size_offset = if signed { 8 } else { 4 };
        let compressed = if size64 {
            u64le(&descriptor, size_offset)
        } else {
            u32le(&descriptor, size_offset) as u64
        };
        let uncompressed = if size64 {
            u64le(&descriptor, size_offset + 8)
        } else {
            u32le(&descriptor, size_offset + 4) as u64
        };
        if compressed != inflater.total_in() || uncompressed != inflater.total_out() {
            return Err(invalid("ZIP data descriptor size mismatch"));
        }
        hash.update(&descriptor);
        output.write(&descriptor).await?;
    }
    Ok(hex(&hash.finalize()))
}

async fn parse(
    input: &mut Input,
    output: &mut Output,
    archive: &mut MacosAppArchive,
    replay: bool,
) -> io::Result<()> {
    let mut local_count = 0usize;
    let mut central_count = 0usize;
    let mut central_started = false;
    let mut zip64_count = None;
    loop {
        let signature = input.exact(4).await?;
        match u32le(&signature, 0) {
            0x0403_4b50 if !central_started => {
                let mut header = signature;
                header.extend(input.exact(26).await?);
                let name_len = u16le(&header, 26) as usize;
                let extra_len = u16le(&header, 28) as usize;
                header.extend(input.exact(name_len + extra_len).await?);
                let name = header[30..30 + name_len].to_vec();
                let mut entry = if replay {
                    let saved = archive
                        .entries
                        .get(local_count)
                        .ok_or_else(|| invalid("New ZIP entry during replay"))?;
                    if saved.name != name {
                        return Err(invalid("ZIP entry changed during replay"));
                    }
                    saved.clone()
                } else {
                    Entry {
                        name: name.clone(),
                        atime: None,
                        local_sha256: String::new(),
                        data_sha256: String::new(),
                        central_sha256: String::new(),
                    }
                };
                normalize(
                    &mut header,
                    &name,
                    30 + name_len,
                    extra_len,
                    10,
                    &mut entry.atime,
                    replay,
                )?;
                let header_hash = digest(&header);
                if replay && entry.local_sha256 != header_hash {
                    return Err(invalid("ZIP entry metadata changed during replay"));
                }
                entry.local_sha256 = header_hash;
                output.write(&header).await?;
                let data_hash = data(input, output, &header).await?;
                if replay && entry.data_sha256 != data_hash {
                    return Err(invalid("ZIP entry contents changed during replay"));
                }
                entry.data_sha256 = data_hash;
                if !replay {
                    archive.entries.push(entry);
                }
                local_count += 1;
            }
            0x0201_4b50 => {
                central_started = true;
                let mut header = signature;
                header.extend(input.exact(42).await?);
                let name_len = u16le(&header, 28) as usize;
                let extra_len = u16le(&header, 30) as usize;
                let comment_len = u16le(&header, 32) as usize;
                header.extend(input.exact(name_len + extra_len + comment_len).await?);
                let name = header[46..46 + name_len].to_vec();
                let entry = archive
                    .entries
                    .get_mut(central_count)
                    .ok_or_else(|| invalid("Unexpected ZIP central entry"))?;
                if entry.name != name {
                    return Err(invalid("ZIP central entry order changed"));
                }
                normalize(
                    &mut header,
                    &name,
                    46 + name_len,
                    extra_len,
                    12,
                    &mut entry.atime,
                    replay,
                )?;
                let header_hash = digest(&header);
                if replay && entry.central_sha256 != header_hash {
                    return Err(invalid("ZIP central metadata changed during replay"));
                }
                entry.central_sha256 = header_hash;
                output.write(&header).await?;
                central_count += 1;
            }
            0x0606_4b50 if central_started => {
                let length = input.exact(8).await?;
                let size = u64le(&length, 0);
                if !(44..=MAX_HEADER as u64).contains(&size) {
                    return Err(invalid("Invalid ZIP64 end record"));
                }
                let body = input.exact(size as usize).await?;
                zip64_count = Some(u64le(&body, 20));
                output.write(&signature).await?;
                output.write(&length).await?;
                output.write(&body).await?;
            }
            0x0706_4b50 if central_started => {
                let rest = input.exact(16).await?;
                output.write(&signature).await?;
                output.write(&rest).await?;
            }
            0x0605_4b50 if central_started => {
                let mut footer = signature;
                footer.extend(input.exact(18).await?);
                footer.extend(input.exact(u16le(&footer, 20) as usize).await?);
                let declared = zip64_count.unwrap_or(u16le(&footer, 10) as u64);
                if local_count != central_count
                    || declared != local_count as u64
                    || (replay && local_count != archive.entries.len())
                {
                    return Err(invalid("ZIP entry count mismatch"));
                }
                output.write(&footer).await?;
                if !input.chunk(1).await?.is_empty() {
                    return Err(invalid("Trailing ZIP data"));
                }
                return Ok(());
            }
            _ => return Err(invalid("Unsupported ZIP record")),
        }
    }
}

async fn run(
    archive: &mut MacosAppArchive,
    replay: bool,
    tx: Option<mpsc::Sender<io::Result<Bytes>>>,
    cancel: CancellationToken,
) -> io::Result<(u64, String)> {
    if !archive.path.is_dir() {
        return Err(invalid(format!(
            "Application bundle unavailable: {}",
            archive.path.display()
        )));
    }
    let mut child = Command::new("/usr/bin/ditto")
        .args([
            "-c",
            "-k",
            "--rsrc",
            "--extattr",
            "--qtn",
            "--sequesterRsrc",
            "--zlibCompressionLevel",
            "0",
            "--keepParent",
        ])
        .arg(&archive.path)
        .arg("-")
        .stdout(std::process::Stdio::piped())
        .stderr(std::process::Stdio::piped())
        .kill_on_drop(true)
        .spawn()?;
    let stderr = child
        .stderr
        .take()
        .ok_or_else(|| invalid("Missing ditto stderr"))?;
    let stderr_task = tokio::spawn(async move {
        let mut stderr = stderr;
        let mut message = Vec::new();
        let mut block = [0u8; 4096];
        loop {
            let read = stderr.read(&mut block).await?;
            if read == 0 {
                break;
            }
            if message.len() < 16 * 1024 {
                message.extend_from_slice(&block[..read.min(16 * 1024 - message.len())]);
            }
        }
        io::Result::Ok(String::from_utf8_lossy(&message).into_owned())
    });
    let mut input = Input {
        reader: child
            .stdout
            .take()
            .ok_or_else(|| invalid("Missing ditto stdout"))?,
        pending: Vec::new(),
    };
    let mut output = Output::new(tx.clone());
    let work = async {
        parse(&mut input, &mut output, archive, replay).await?;
        let status = child.wait().await?;
        let stderr = stderr_task.await.map_err(io::Error::other)??;
        if !status.success() {
            return Err(invalid(format!("ditto failed: {stderr}")));
        }
        let checksum = hex(&output.hash.clone().finalize());
        if replay && (output.size != archive.size || checksum != archive.sha256) {
            return Err(invalid("Application archive changed during replay"));
        }
        output.finish().await
    };
    tokio::select! {
        result = work => result,
        _ = cancel.cancelled() => Err(io::Error::new(io::ErrorKind::Interrupted, "Archive preparation cancelled")),
        _ = async { if let Some(tx) = &tx { tx.closed().await } }, if tx.is_some() => Err(io::Error::new(io::ErrorKind::BrokenPipe, "Archive stream closed")),
    }
}
