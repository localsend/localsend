use crate::crypto;
use bytes::Bytes;
use http_body_util::BodyExt;
use hyper::body::Incoming;
use hyper::Request;
use std::future::Future;
use std::path::PathBuf;
use tokio::sync::{mpsc, oneshot};

/// Channel capacity for file upload chunks (provides backpressure).
const UPLOAD_CHANNEL_CAPACITY: usize = 16;

/// Size of the write buffer that coalesces incoming body chunks (typically one
/// TLS record, ~16 KiB) into larger file writes.
const WRITE_BUFFER_SIZE: usize = 512 * 1024;

/// Where the content of an uploaded file should go, decided by the application.
#[derive(Debug)]
pub enum FileUploadTarget {
    /// The application consumes the binary chunks itself.
    ///
    /// The server forwards chunks into `binary_tx` and closes it at end of file.
    /// The application should compare the number of received bytes with `file.size`
    /// and report the result on the sender side of `result_rx` which determines
    /// the HTTP response (200 on `Ok`, 500 on `Err` or when the sender is dropped).
    ///
    /// Note: the checksum is only verified after the application reported its
    /// result, so a checksum mismatch is not observable by the application here
    /// (unlike [FileUploadTarget::Path] and [FileUploadTarget::Fd]).
    Stream {
        /// Channel the server sends the binary chunks of the file into.
        binary_tx: mpsc::Sender<Bytes>,

        /// Channel on which the application reports whether the file was
        /// processed successfully.
        result_rx: oneshot::Receiver<Result<(), String>>,
    },

    /// The server writes the file to this path (created or truncated) without
    /// following a symlink at the final path component, and reports the result
    /// on `result_tx`.
    ///
    /// This guards the leaf filename (`O_NOFOLLOW` on Unix / reparse checks on
    /// Windows), but does not validate intermediate directories. Prefer
    /// [`FileUploadTarget::ContainedPath`] when saving an untrusted relative
    /// path under a destination directory.
    ///
    /// Timestamps provided in the sender's file metadata are applied to the
    /// written file, so the application does not need to set them itself.
    Path {
        /// The path to write the file to.
        path: PathBuf,

        /// Channel on which the server reports whether the file was saved
        /// successfully, including the checksum verification if one was given.
        result_tx: oneshot::Sender<Result<(), String>>,

        /// Optional channel on which the server reports the number of bytes
        /// written so far. Events are dropped when the channel is full.
        progress_tx: Option<mpsc::Sender<u64>>,
    },

    /// The server resolves `relative` step-by-step under `root`, creating any
    /// missing intermediate directories without following symlinks at any
    /// segment or at the final leaf, and writes the file there (created or
    /// truncated).
    ///
    /// Symlinks in `root` itself are allowed so user-configured symlinked
    /// destination folders continue to work, while `relative` must be a
    /// non-empty relative path made solely of normal components.
    ///
    /// Timestamps provided in the sender's file metadata are applied to the
    /// written file, so the application does not need to set them itself.
    ContainedPath {
        /// Trusted base destination directory (may itself contain symlinks).
        root: PathBuf,

        /// Relative sub-path within `root` (must not escape or contain `.` / `..` / prefixes).
        relative: PathBuf,

        /// Channel on which the server reports whether the file was saved
        /// successfully, including the checksum verification if one was given.
        result_tx: oneshot::Sender<Result<(), String>>,

        /// Optional channel on which the server reports the number of bytes
        /// written so far. Events are dropped when the channel is full.
        progress_tx: Option<mpsc::Sender<u64>>,
    },

    /// The server writes the file to this raw file descriptor (Android only)
    /// and reports the result on `result_tx`.
    ///
    /// Timestamps provided in the sender's file metadata are applied through
    /// the descriptor, which also covers SAF documents that have no path.
    #[cfg(target_os = "android")]
    Fd {
        /// The raw file descriptor to write the file to.
        /// Ownership is transferred; the descriptor is closed after writing.
        fd: std::os::fd::RawFd,

        /// Channel on which the server reports whether the file was saved
        /// successfully, including the checksum verification if one was given.
        result_tx: oneshot::Sender<Result<(), String>>,

        /// Optional channel on which the server reports the number of bytes
        /// written so far. Events are dropped when the channel is full.
        progress_tx: Option<mpsc::Sender<u64>>,
    },
}

/// The sender-provided timestamps of an uploaded file, applied to the written
/// file for [FileUploadTarget::Path] and [FileUploadTarget::Fd].
#[derive(Debug, Clone, Copy, Default)]
pub(crate) struct FileTimestamps {
    pub modified: Option<std::time::SystemTime>,
    pub accessed: Option<std::time::SystemTime>,
}

impl FileTimestamps {
    fn is_empty(&self) -> bool {
        self.modified.is_none() && self.accessed.is_none()
    }
}

/// Outcome of receiving an uploaded file.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub(crate) enum SaveResult {
    /// The file has been received and, if a checksum was given, it matched.
    Success,

    /// The body could not be read or the target failed to process it.
    Failed,

    /// The received bytes do not match the expected SHA-256 checksum.
    HashMismatch,
}

/// Forwards the body of `req` to `target`.
pub(crate) async fn save_req_to_target(
    req: Request<Incoming>,
    target: FileUploadTarget,
    file_size: u64,
    expected_sha256: Option<&str>,
    timestamps: FileTimestamps,
) -> SaveResult {
    use sha2::{Digest, Sha256};

    // Resolve the target into a chunk sender and a result receiver.
    // For [FileUploadTarget::Path] and [FileUploadTarget::Fd], the application's
    // result channel is answered by this function once the complete outcome
    // (including the checksum verification) is known.
    let (binary_tx, result_rx, app_result_tx) = match target {
        FileUploadTarget::Stream {
            binary_tx,
            result_rx,
        } => (binary_tx, result_rx, None),
        FileUploadTarget::Path {
            path,
            result_tx,
            progress_tx,
        } => {
            let (binary_tx, result_rx) = spawn_blocking_file_writer(
                move || safe_open::open_path_no_follow(&path),
                file_size,
                progress_tx,
                timestamps,
            );
            (binary_tx, result_rx, Some(result_tx))
        }
        FileUploadTarget::ContainedPath {
            root,
            relative,
            result_tx,
            progress_tx,
        } => {
            let (binary_tx, result_rx) = spawn_blocking_file_writer(
                move || safe_open::open_contained(&root, &relative),
                file_size,
                progress_tx,
                timestamps,
            );
            (binary_tx, result_rx, Some(result_tx))
        }
        #[cfg(target_os = "android")]
        FileUploadTarget::Fd {
            fd,
            result_tx,
            progress_tx,
        } => {
            let (binary_tx, result_rx) = spawn_file_writer(
                async move {
                    use std::os::fd::FromRawFd;

                    // SAFETY: the descriptor is owned by this transfer; wrapping it in
                    // a File transfers that ownership so it is closed once writing finishes.
                    let std_file = unsafe { std::fs::File::from_raw_fd(fd) };
                    Ok(tokio::fs::File::from_std(std_file))
                },
                file_size,
                progress_tx,
                timestamps,
            );
            (binary_tx, result_rx, Some(result_tx))
        }
    };

    // Forward the request body to the target, hashing it on the way if requested.
    let mut hasher = expected_sha256.map(|_| Sha256::new());
    let mut body = req.into_body();
    let mut stream_error = false;
    while let Some(frame) = body.frame().await {
        match frame {
            Ok(frame) => {
                let Ok(data) = frame.into_data() else {
                    continue; // ignore non-data frames (e.g. trailers)
                };
                if data.is_empty() {
                    continue;
                }
                if let Some(hasher) = &mut hasher {
                    hasher.update(&data);
                }
                if binary_tx.send(data).await.is_err() {
                    // The receiver is gone (dropped by the application or
                    // closed by the file writer after an error).
                    stream_error = true;
                    break;
                }
            }
            Err(err) => {
                tracing::warn!("Error reading upload body of file: {err:#}");
                stream_error = true;
                break;
            }
        }
    }

    // Signal end of file to the receiving side.
    drop(binary_tx);

    // Determine the outcome; `error` carries the reason for the application.
    let (result, error): (SaveResult, Option<String>) = 'outcome: {
        if stream_error {
            // The file writer (if any) fails with a size mismatch or its own
            // write error once the channel is closed; collect that reason.
            let error = match app_result_tx.is_some() {
                true => match result_rx.await {
                    Ok(Err(err)) => Some(err),
                    _ => None,
                },
                false => None,
            };
            break 'outcome (
                SaveResult::Failed,
                error.or(Some("Upload aborted".to_string())),
            );
        }

        match result_rx.await {
            Ok(Ok(())) => (),
            Ok(Err(err)) => {
                tracing::warn!("Failed to process file: {err}");
                break 'outcome (SaveResult::Failed, Some(err));
            }
            Err(_) => break 'outcome (SaveResult::Failed, Some("Upload aborted".to_string())),
        }

        if let (Some(hasher), Some(expected)) = (hasher, expected_sha256) {
            let actual = crypto::hash::to_hex(&hasher.finalize());
            if !actual.eq_ignore_ascii_case(expected) {
                tracing::warn!("Checksum mismatch: expected {expected}, got {actual}");
                break 'outcome (
                    SaveResult::HashMismatch,
                    Some("Checksum mismatch".to_string()),
                );
            }
        }

        (SaveResult::Success, None)
    };

    if let Some(app_result_tx) = app_result_tx {
        let _ = app_result_tx.send(match error {
            None => Ok(()),
            Some(err) => Err(err),
        });
    }

    result
}

/// Spawns a task that writes incoming chunks to a file provided by `open`.
///
/// Returns the sender for the binary chunks and a receiver for the final result.
fn spawn_file_writer(
    open: impl Future<Output = Result<tokio::fs::File, String>> + Send + 'static,
    expected_size: u64,
    progress_tx: Option<mpsc::Sender<u64>>,
    timestamps: FileTimestamps,
) -> (mpsc::Sender<Bytes>, oneshot::Receiver<Result<(), String>>) {
    let (binary_tx, mut binary_rx) = mpsc::channel::<Bytes>(UPLOAD_CHANNEL_CAPACITY);
    let (internal_tx, internal_rx) = oneshot::channel::<Result<(), String>>();

    tokio::spawn(async move {
        let result =
            write_file_from_receiver(open, expected_size, &mut binary_rx, progress_tx, timestamps)
                .await;
        // Unblock the request handler if it is still sending chunks.
        binary_rx.close();
        let _ = internal_tx.send(result);
    });

    (binary_tx, internal_rx)
}

/// Writes all chunks received on `rx` to the file provided by `open`.
///
/// Fails if the total number of written bytes does not match `expected_size`
/// (e.g. the sender disconnected mid-transfer).
///
/// The file is truncated to the written size, so that a target that pointed at
/// a longer, pre-existing file cannot keep a tail of the old content.
///
/// The sender-provided `timestamps` are applied to the completely written
/// file. This happens on the still-open handle: an Android file descriptor has
/// no path to address the file by afterwards.
async fn write_file_from_receiver(
    open: impl Future<Output = Result<tokio::fs::File, String>>,
    expected_size: u64,
    rx: &mut mpsc::Receiver<Bytes>,
    progress_tx: Option<mpsc::Sender<u64>>,
    timestamps: FileTimestamps,
) -> Result<(), String> {
    use tokio::io::AsyncWriteExt;

    let mut file = tokio::io::BufWriter::with_capacity(WRITE_BUFFER_SIZE, open.await?);
    let mut written: u64 = 0;
    while let Some(chunk) = rx.recv().await {
        written += chunk.len() as u64;
        if written > expected_size {
            return Err(format!(
                "Expected {expected_size} bytes, received at least {written}"
            ));
        }
        file.write_all(&chunk)
            .await
            .map_err(|e| format!("Failed to write file: {e}"))?;
        if let Some(progress_tx) = &progress_tx {
            // Progress is best-effort: drop the event when the consumer lags.
            let _ = progress_tx.try_send(written);
        }
    }
    file.flush()
        .await
        .map_err(|e| format!("Failed to flush file: {e}"))?;
    let file = file.into_inner();

    if written != expected_size {
        return Err(format!(
            "Expected {expected_size} bytes, received {written}"
        ));
    }

    // Drops content beyond the file that was just written, in case the target
    // pointed at a longer, pre-existing file: opening truncates for paths and
    // for descriptors opened with the SAF "wt" mode, but a document provider is
    // free to ignore that mode. Retries of the same upload are covered by the
    // exact size check above either way.
    //
    // Best-effort: a provider may back the descriptor by something that cannot
    // be truncated (e.g. a pipe), which must not fail the completed transfer.
    if let Err(e) = file.set_len(written).await {
        tracing::warn!("Could not truncate file to {written} bytes: {e}");
    }

    // The timestamps are applied last because the writes and the truncation
    // above update the modification time themselves.
    //
    // Best-effort: the provider backing an Android file descriptor may not
    // support changing timestamps, which must not fail the completed transfer.
    if !timestamps.is_empty() {
        let mut times = std::fs::FileTimes::new();
        if let Some(modified) = timestamps.modified {
            times = times.set_modified(modified);
        }
        if let Some(accessed) = timestamps.accessed {
            times = times.set_accessed(accessed);
        }
        let file = file.into_std().await;
        // Also closes the file, off the async runtime like tokio::fs does.
        let result = tokio::task::spawn_blocking(move || file.set_times(times)).await;
        if let Ok(Err(e)) = result {
            tracing::warn!("Could not set file timestamps: {e}");
        }
    }

    Ok(())
}

fn spawn_blocking_file_writer<F>(
    open: F,
    expected_size: u64,
    progress_tx: Option<mpsc::Sender<u64>>,
    timestamps: FileTimestamps,
) -> (mpsc::Sender<Bytes>, oneshot::Receiver<Result<(), String>>)
where
    F: FnOnce() -> Result<std::fs::File, String> + Send + 'static,
{
    spawn_file_writer(
        async move {
            let std_file = tokio::task::spawn_blocking(open)
                .await
                .map_err(|e| format!("Failed to join file open task: {e}"))??;
            Ok(tokio::fs::File::from_std(std_file))
        },
        expected_size,
        progress_tx,
        timestamps,
    )
}

mod safe_open {
    use std::ffi::OsStr;
    use std::path::{Component, Path};

    /// Validates that `relative` is a non-empty relative path made strictly of normal segments.
    fn collect_relative_components(relative: &Path) -> Result<Vec<&OsStr>, String> {
        collect_relative_components_for(relative, cfg!(windows))
    }

    pub(super) fn collect_relative_components_for(
        relative: &Path,
        windows_rules: bool,
    ) -> Result<Vec<&OsStr>, String> {
        let bytes = relative.as_os_str().as_encoded_bytes();
        if bytes.is_empty() {
            return Err("Relative upload path must not be empty".to_string());
        }
        // Reject trailing separators so `"dir/"` cannot resolve to a file named `"dir"`,
        // and reject explicit `.` segments (including interior `a/./b`, which `Path::components` skips).
        if bytes.ends_with(b"/") || (windows_rules && bytes.ends_with(b"\\")) {
            return Err(format!(
                "Relative upload path must refer to a file, not a directory: {}",
                relative.display()
            ));
        }
        for raw_segment in bytes.split(|b| *b == b'/' || (windows_rules && *b == b'\\')) {
            if raw_segment == b"." {
                return Err(format!(
                    "Relative upload path must not contain `.` segments: {}",
                    relative.display()
                ));
            }
            if raw_segment == b".." {
                return Err(format!(
                    "Relative upload path must stay within destination root: {}",
                    relative.display()
                ));
            }
            // Reject Windows drive-letter prefixes (e.g. `C:foo`, even mid-path where
            // `Path::components` treats `C:foo` as `Normal`) and NTFS alternate data streams (`foo:ads`).
            if windows_rules && raw_segment.contains(&b':') {
                return Err(format!(
                    "Relative upload path must not contain drive prefixes or alternate data streams: {}",
                    relative.display()
                ));
            }
        }

        let mut segments = Vec::new();
        for component in relative.components() {
            match component {
                Component::Normal(part) => {
                    let part_bytes = part.as_encoded_bytes();
                    if part_bytes.is_empty()
                        || part_bytes == b"."
                        || part_bytes == b".."
                        || (windows_rules && part_bytes.contains(&b':'))
                    {
                        return Err(format!(
                            "Invalid segment in relative upload path: {}",
                            relative.display()
                        ));
                    }
                    segments.push(part);
                }
                Component::CurDir
                | Component::ParentDir
                | Component::RootDir
                | Component::Prefix(_) => {
                    return Err(format!(
                        "Relative upload path must stay within destination root: {}",
                        relative.display()
                    ));
                }
            }
        }

        if segments.is_empty() {
            return Err("Relative upload path must not be empty".to_string());
        }
        Ok(segments)
    }

    #[cfg(unix)]
    fn retry_eintr<F>(mut f: F) -> std::io::Result<libc::c_int>
    where
        F: FnMut() -> libc::c_int,
    {
        loop {
            let rc = f();
            if rc >= 0 {
                return Ok(rc);
            }
            let err = std::io::Error::last_os_error();
            if err.kind() != std::io::ErrorKind::Interrupted {
                return Err(err);
            }
        }
    }

    #[cfg(unix)]
    fn to_cstring(part: &OsStr, context: &Path) -> Result<std::ffi::CString, String> {
        use std::os::unix::ffi::OsStrExt;

        std::ffi::CString::new(part.as_bytes())
            .map_err(|_| format!("Path contains an interior NUL byte: {}", context.display()))
    }

    #[cfg(unix)]
    fn open_dir(
        name: &std::ffi::CStr,
        parent: Option<&std::os::fd::OwnedFd>,
        nofollow: bool,
    ) -> std::io::Result<std::os::fd::OwnedFd> {
        use std::os::fd::{AsRawFd, FromRawFd, OwnedFd};

        // On Linux/Android, `O_PATH` only requires search (`x`) permission on the directory
        // rather than read (`r`), matching direct path opening semantics on `0300` directories.
        #[cfg(any(target_os = "linux", target_os = "android"))]
        let mut flags = libc::O_PATH | libc::O_DIRECTORY | libc::O_CLOEXEC;
        #[cfg(not(any(target_os = "linux", target_os = "android")))]
        let mut flags = libc::O_RDONLY | libc::O_DIRECTORY | libc::O_CLOEXEC;

        if nofollow {
            flags |= libc::O_NOFOLLOW;
        }
        let fd = retry_eintr(|| match parent {
            Some(dir) => {
                // SAFETY: `dir` is a valid open directory fd and `name` is NUL-terminated.
                unsafe { libc::openat(dir.as_raw_fd(), name.as_ptr(), flags) }
            }
            None => {
                // SAFETY: `name` is NUL-terminated.
                unsafe { libc::open(name.as_ptr(), flags) }
            }
        })?;
        // SAFETY: `fd` was just returned by `open`/`openat` as a valid owned file descriptor.
        Ok(unsafe { OwnedFd::from_raw_fd(fd) })
    }

    #[cfg(unix)]
    fn finalize_opened_regular_file(
        file: std::fs::File,
        display: &Path,
    ) -> Result<std::fs::File, String> {
        use std::os::fd::AsRawFd;

        let meta = file
            .metadata()
            .map_err(|e| format!("Failed to inspect {}: {e}", display.display()))?;
        if !meta.is_file() {
            return Err(format!(
                "Refusing to write to non-regular file {}",
                display.display()
            ));
        }

        // Clear `O_NONBLOCK` used to reject FIFOs without blocking before returning to callers.
        let fd = file.as_raw_fd();
        let flags = retry_eintr(|| {
            // SAFETY: `fd` is an open file descriptor owned by `file`.
            unsafe { libc::fcntl(fd, libc::F_GETFL) }
        })
        .map_err(|e| format!("Failed to inspect flags for {}: {e}", display.display()))?;
        if flags & libc::O_NONBLOCK != 0 {
            retry_eintr(|| {
                // SAFETY: `fd` is an open file descriptor owned by `file`.
                unsafe { libc::fcntl(fd, libc::F_SETFL, flags & !libc::O_NONBLOCK) }
            })
            .map_err(|e| format!("Failed to clear O_NONBLOCK on {}: {e}", display.display()))?;
        }

        // Defer truncation until after verifying `meta.is_file()` so special files are untouched.
        file.set_len(0)
            .map_err(|e| format!("Failed to truncate {}: {e}", display.display()))?;
        Ok(file)
    }

    #[cfg(unix)]
    pub(super) fn open_path_no_follow(path: &Path) -> Result<std::fs::File, String> {
        use std::os::unix::fs::OpenOptionsExt;

        let file = std::fs::OpenOptions::new()
            .write(true)
            .create(true)
            .custom_flags(libc::O_NOFOLLOW | libc::O_NONBLOCK)
            .open(path)
            .map_err(|e| format!("Failed to create {}: {e}", path.display()))?;
        finalize_opened_regular_file(file, path)
    }

    #[cfg(unix)]
    pub(super) fn open_contained(root: &Path, relative: &Path) -> Result<std::fs::File, String> {
        use std::os::fd::{AsRawFd, FromRawFd, OwnedFd};

        // POSIX `openat` with `O_CREAT` expects the creation mode promoted to `c_uint`.
        const FILE_CREATE_MODE: libc::c_uint = 0o666;

        let segments = collect_relative_components(relative)?;
        let display_path = root.join(relative);

        std::fs::create_dir_all(root)
            .map_err(|e| format!("Failed to create destination root {}: {e}", root.display()))?;

        let root_c = to_cstring(root.as_os_str(), root)?;
        // Allow symlinks on `root` itself (e.g., `/tmp -> /private/tmp` or symlinked Downloads),
        // then enforce `O_NOFOLLOW` on every segment inside `relative`.
        let mut dir_fd = open_dir(&root_c, None, false)
            .map_err(|e| format!("Failed to open destination root {}: {e}", root.display()))?;

        let (leaf, parents) = segments
            .split_last()
            .ok_or_else(|| "Relative upload path must not be empty".to_string())?;

        for segment in parents {
            let seg_c = to_cstring(segment, &display_path)?;
            let mkdir_res = retry_eintr(|| {
                // SAFETY: `dir_fd` is a valid open directory fd and `seg_c` is NUL-terminated.
                unsafe { libc::mkdirat(dir_fd.as_raw_fd(), seg_c.as_ptr(), 0o777) }
            });
            if let Err(err) = mkdir_res {
                if err.kind() != std::io::ErrorKind::AlreadyExists {
                    return Err(format!(
                        "Failed to create directory {}: {err}",
                        display_path.display()
                    ));
                }
            }

            dir_fd = open_dir(&seg_c, Some(&dir_fd), true).map_err(|e| {
                format!(
                    "Failed to open directory {} safely: {e}",
                    display_path.display()
                )
            })?;
        }

        let leaf_c = to_cstring(leaf, &display_path)?;
        // Open without `O_TRUNC` and with `O_NONBLOCK` first so a pre-existing FIFO fails without
        // blocking and non-regular files are rejected before truncation.
        let file_flags =
            libc::O_WRONLY | libc::O_CREAT | libc::O_NOFOLLOW | libc::O_CLOEXEC | libc::O_NONBLOCK;
        let file_fd = retry_eintr(|| {
            // SAFETY: `dir_fd` is a valid open directory fd and `leaf_c` is NUL-terminated.
            unsafe {
                libc::openat(
                    dir_fd.as_raw_fd(),
                    leaf_c.as_ptr(),
                    file_flags,
                    FILE_CREATE_MODE,
                )
            }
        })
        .map_err(|e| format!("Failed to create {}: {e}", display_path.display()))?;

        // SAFETY: `file_fd` was just returned by `openat` as a valid owned file descriptor.
        let owned_fd = unsafe { OwnedFd::from_raw_fd(file_fd) };
        finalize_opened_regular_file(std::fs::File::from(owned_fd), &display_path)
    }

    #[cfg(windows)]
    pub(super) fn open_path_no_follow(path: &Path) -> Result<std::fs::File, String> {
        use std::os::windows::fs::OpenOptionsExt;

        const FILE_FLAG_OPEN_REPARSE_POINT: u32 = 0x0020_0000;

        match std::fs::OpenOptions::new()
            .write(true)
            .create_new(true)
            .custom_flags(FILE_FLAG_OPEN_REPARSE_POINT)
            .open(path)
        {
            Ok(file) => Ok(file),
            Err(err) if err.kind() == std::io::ErrorKind::AlreadyExists => {
                let meta = std::fs::symlink_metadata(path)
                    .map_err(|e| format!("Failed to inspect {}: {e}", path.display()))?;
                if meta.file_type().is_symlink() || !meta.is_file() {
                    return Err(format!(
                        "Refusing to open symlink or non-regular file at {}",
                        path.display()
                    ));
                }
                let file = std::fs::OpenOptions::new()
                    .write(true)
                    .custom_flags(FILE_FLAG_OPEN_REPARSE_POINT)
                    .open(path)
                    .map_err(|e| format!("Failed to open {}: {e}", path.display()))?;
                // Re-check before truncating in case a symlink swapped in between metadata and open.
                let post_meta = std::fs::symlink_metadata(path)
                    .map_err(|e| format!("Failed to inspect {}: {e}", path.display()))?;
                if post_meta.file_type().is_symlink() || !post_meta.is_file() {
                    return Err(format!(
                        "Refusing to open symlink or non-regular file at {}",
                        path.display()
                    ));
                }
                file.set_len(0)
                    .map_err(|e| format!("Failed to truncate {}: {e}", path.display()))?;
                Ok(file)
            }
            Err(err) => Err(format!("Failed to create {}: {err}", path.display())),
        }
    }

    #[cfg(windows)]
    pub(super) fn open_contained(root: &Path, relative: &Path) -> Result<std::fs::File, String> {
        let segments = collect_relative_components(relative)?;
        let display_path = root.join(relative);

        std::fs::create_dir_all(root)
            .map_err(|e| format!("Failed to create destination root {}: {e}", root.display()))?;
        let canonical_root = std::fs::canonicalize(root)
            .map_err(|e| format!("Failed to resolve destination root {}: {e}", root.display()))?;

        let mut current = canonical_root.clone();
        let (leaf, parents) = segments
            .split_last()
            .ok_or_else(|| "Relative upload path must not be empty".to_string())?;

        for segment in parents {
            current.push(segment);
            if let Err(err) = std::fs::create_dir(&current) {
                if err.kind() != std::io::ErrorKind::AlreadyExists {
                    return Err(format!(
                        "Failed to create directory {}: {err}",
                        display_path.display()
                    ));
                }
            }
            let meta = std::fs::symlink_metadata(&current)
                .map_err(|e| format!("Failed to inspect {}: {e}", display_path.display()))?;
            if meta.file_type().is_symlink() {
                return Err(format!(
                    "Refusing to traverse symlink directory in {}",
                    display_path.display()
                ));
            }
            if !meta.is_dir() {
                return Err(format!(
                    "Path segment is not a directory in {}",
                    display_path.display()
                ));
            }
            let canonical_seg = std::fs::canonicalize(&current).map_err(|e| {
                format!(
                    "Failed to resolve directory {}: {e}",
                    display_path.display()
                )
            })?;
            if !canonical_seg.starts_with(&canonical_root) {
                return Err(format!(
                    "Directory traversal escapes destination root: {}",
                    display_path.display()
                ));
            }
        }

        current.push(leaf);
        if let Some(parent) = current.parent() {
            let canonical_parent = std::fs::canonicalize(parent).map_err(|e| {
                format!(
                    "Failed to resolve parent of {}: {e}",
                    display_path.display()
                )
            })?;
            if !canonical_parent.starts_with(&canonical_root) {
                return Err(format!(
                    "Upload path escapes destination root: {}",
                    display_path.display()
                ));
            }
        }
        open_path_no_follow(&current)
    }

    #[cfg(not(any(unix, windows)))]
    pub(super) fn open_path_no_follow(path: &Path) -> Result<std::fs::File, String> {
        if let Ok(meta) = std::fs::symlink_metadata(path) {
            if meta.file_type().is_symlink() {
                return Err(format!("Refusing to follow symlink at {}", path.display()));
            }
        }
        std::fs::File::create(path).map_err(|e| format!("Failed to create {}: {e}", path.display()))
    }

    #[cfg(not(any(unix, windows)))]
    pub(super) fn open_contained(root: &Path, relative: &Path) -> Result<std::fs::File, String> {
        let segments = collect_relative_components(relative)?;
        let display_path = root.join(relative);

        std::fs::create_dir_all(root)
            .map_err(|e| format!("Failed to create destination root {}: {e}", root.display()))?;
        let mut current = root.to_path_buf();
        let (leaf, parents) = segments
            .split_last()
            .ok_or_else(|| "Relative upload path must not be empty".to_string())?;

        for segment in parents {
            current.push(segment);
            if let Err(err) = std::fs::create_dir(&current) {
                if err.kind() != std::io::ErrorKind::AlreadyExists {
                    return Err(format!(
                        "Failed to create directory {}: {err}",
                        display_path.display()
                    ));
                }
            }
            let meta = std::fs::symlink_metadata(&current)
                .map_err(|e| format!("Failed to inspect {}: {e}", display_path.display()))?;
            if meta.file_type().is_symlink() || !meta.is_dir() {
                return Err(format!(
                    "Refusing unsafe directory segment in {}",
                    display_path.display()
                ));
            }
        }

        current.push(leaf);
        open_path_no_follow(&current)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::io::Write;
    use std::path::{Path, PathBuf};
    use std::time::{Duration, SystemTime};
    use tokio::sync::mpsc;

    struct TempDir(PathBuf);

    impl TempDir {
        fn new(name: &str) -> Self {
            let path = std::env::temp_dir()
                .join(format!("localsend-save-{name}-{}", uuid::Uuid::new_v4()));
            std::fs::create_dir_all(&path).unwrap();
            Self(path)
        }

        fn path(&self) -> &Path {
            &self.0
        }
    }

    impl Drop for TempDir {
        fn drop(&mut self) {
            let _ = std::fs::remove_dir_all(&self.0);
        }
    }

    #[test]
    fn contained_creates_nested_directories_and_writes_file() {
        let root = TempDir::new("nested");
        let mut file =
            safe_open::open_contained(root.path(), Path::new("deep/a/b/hello.txt")).unwrap();
        file.write_all(b"nested payload").unwrap();
        drop(file);

        assert_eq!(
            std::fs::read(root.path().join("deep/a/b/hello.txt")).unwrap(),
            b"nested payload"
        );
    }

    #[test]
    fn contained_creates_missing_root_and_overwrites_regular_file_on_retry() {
        let base = TempDir::new("missing-root");
        let root = base.path().join("new_dest/sub_root");

        let mut first = safe_open::open_contained(&root, Path::new("folder/retry.bin")).unwrap();
        first.write_all(b"corrupted longer content").unwrap();
        drop(first);

        let mut second = safe_open::open_contained(&root, Path::new("folder/retry.bin")).unwrap();
        second.write_all(b"clean").unwrap();
        drop(second);

        assert_eq!(
            std::fs::read(root.join("folder/retry.bin")).unwrap(),
            b"clean"
        );
    }

    #[test]
    fn contained_rejects_traversal_absolute_empty_and_trailing_slash_paths() {
        let root = TempDir::new("invalid-paths");
        let invalid = [
            "",
            ".",
            "..",
            "a/../b.txt",
            "a/./b.txt",
            "../outside.txt",
            "/etc/passwd",
            "subdir/",
        ];
        for rel in invalid {
            let err = safe_open::open_contained(root.path(), Path::new(rel)).unwrap_err();
            assert!(!err.is_empty(), "expected error for {rel:?}");
        }

        #[cfg(unix)]
        {
            use std::ffi::OsStr;
            use std::os::unix::ffi::OsStrExt;
            for raw in [b"bad\0name.txt".as_slice(), b"dir\0bad/file.txt".as_slice()] {
                let path = Path::new(OsStr::from_bytes(raw));
                assert!(safe_open::open_contained(root.path(), path).is_err());
            }
        }
    }

    #[test]
    fn contained_rejects_file_dir_collisions_cleanly() {
        let root = TempDir::new("collisions");
        std::fs::write(root.path().join("regular_file"), b"data").unwrap();
        std::fs::create_dir_all(root.path().join("real_dir")).unwrap();

        assert!(
            safe_open::open_contained(root.path(), Path::new("regular_file/child.txt")).is_err()
        );
        assert!(safe_open::open_contained(root.path(), Path::new("real_dir")).is_err());
    }

    #[cfg(unix)]
    #[test]
    fn contained_allows_symlinked_root_directory() {
        use std::os::unix::fs::symlink;

        let container = TempDir::new("symlink-root");
        let real_root = container.path().join("real");
        let alias_root = container.path().join("alias");
        std::fs::create_dir_all(&real_root).unwrap();
        symlink(&real_root, &alias_root).unwrap();

        let mut file = safe_open::open_contained(&alias_root, Path::new("nested/ok.txt")).unwrap();
        file.write_all(b"allowed via root symlink").unwrap();
        drop(file);

        assert_eq!(
            std::fs::read(real_root.join("nested/ok.txt")).unwrap(),
            b"allowed via root symlink"
        );

        // Dangling symlink at `root` itself must fail without creating target.
        let dangling_root_target = container.path().join("missing_root_target");
        let dangling_root = container.path().join("dangling_root");
        symlink(&dangling_root_target, &dangling_root).unwrap();
        assert!(safe_open::open_contained(&dangling_root, Path::new("sub/ok.txt")).is_err());
        assert!(!dangling_root_target.exists());
    }

    #[cfg(unix)]
    #[test]
    fn contained_blocks_symlinked_parent_dangling_and_chained_escapes() {
        use std::os::unix::fs::symlink;

        let root = TempDir::new("escape-root");
        let outside = TempDir::new("escape-outside");
        let outside_existing = outside.path().join("secret.txt");
        std::fs::write(&outside_existing, b"ORIGINAL").unwrap();

        // 1. Direct symlinked directory pointing outside.
        symlink(outside.path(), root.path().join("dir_link")).unwrap();
        assert!(safe_open::open_contained(root.path(), Path::new("dir_link/evil.txt")).is_err());
        assert!(
            safe_open::open_contained(root.path(), Path::new("dir_link/new_sub/evil.txt")).is_err()
        );
        assert!(!outside.path().join("evil.txt").exists());
        assert!(!outside.path().join("new_sub").exists());

        // 2. Nested symlinked directory inside a legitimate directory.
        std::fs::create_dir_all(root.path().join("legit")).unwrap();
        symlink(outside.path(), root.path().join("legit/hop")).unwrap();
        assert!(
            safe_open::open_contained(root.path(), Path::new("legit/hop/nested/pwn.txt")).is_err()
        );
        assert!(!outside.path().join("nested").exists());

        // 3. Chained symlinks inside root ending outside root.
        symlink(root.path().join("dir_link"), root.path().join("chain")).unwrap();
        assert!(safe_open::open_contained(root.path(), Path::new("chain/pwn.txt")).is_err());
        assert!(!outside.path().join("pwn.txt").exists());

        // 4. Dangling leaf symlink inside real subdirectory.
        let dangling_target = outside.path().join("created_via_dangling.txt");
        symlink(&dangling_target, root.path().join("legit/dangling.txt")).unwrap();
        assert!(safe_open::open_contained(root.path(), Path::new("legit/dangling.txt")).is_err());
        assert!(!dangling_target.exists());

        // 5. Existing leaf symlink pointing to an existing outside file.
        symlink(&outside_existing, root.path().join("legit/existing.txt")).unwrap();
        assert!(safe_open::open_contained(root.path(), Path::new("legit/existing.txt")).is_err());
        assert_eq!(std::fs::read(&outside_existing).unwrap(), b"ORIGINAL");
    }

    #[cfg(unix)]
    #[test]
    fn path_blocks_dangling_and_valid_leaf_symlinks_while_allowing_symlink_ancestors() {
        use std::os::unix::fs::symlink;

        let container = TempDir::new("path-leaf");
        let real_dir = container.path().join("real");
        let alias_dir = container.path().join("alias");
        let outside = TempDir::new("path-outside");
        std::fs::create_dir_all(&real_dir).unwrap();
        symlink(&real_dir, &alias_dir).unwrap();

        // Ancestor symlink still allowed for regular target path.
        let ok_path = alias_dir.join("ok.txt");
        let mut f = safe_open::open_path_no_follow(&ok_path).unwrap();
        f.write_all(b"fine").unwrap();
        drop(f);
        assert_eq!(std::fs::read(real_dir.join("ok.txt")).unwrap(), b"fine");

        // Dangling leaf symlink must be rejected.
        let dangling_target = outside.path().join("should_not_exist.txt");
        let dangling_link = real_dir.join("dangling.txt");
        symlink(&dangling_target, &dangling_link).unwrap();
        assert!(safe_open::open_path_no_follow(&dangling_link).is_err());
        assert!(!dangling_target.exists());

        // Existing leaf symlink must not overwrite outside file.
        let outside_existing = outside.path().join("keep.txt");
        std::fs::write(&outside_existing, b"SAFE").unwrap();
        let existing_link = real_dir.join("existing.txt");
        symlink(&outside_existing, &existing_link).unwrap();
        assert!(safe_open::open_path_no_follow(&existing_link).is_err());
        assert_eq!(std::fs::read(&outside_existing).unwrap(), b"SAFE");
    }

    #[tokio::test]
    async fn blocking_writer_reports_progress_and_applies_timestamps() {
        let root = TempDir::new("writer");
        let root_path = root.path().to_path_buf();
        let (progress_tx, mut progress_rx) = mpsc::channel(16);
        let modified = SystemTime::UNIX_EPOCH + Duration::from_secs(1_700_000_000);
        let timestamps = FileTimestamps {
            modified: Some(modified),
            accessed: None,
        };

        let (binary_tx, result_rx) = spawn_blocking_file_writer(
            move || safe_open::open_contained(&root_path, Path::new("sub/file.bin")),
            11,
            Some(progress_tx),
            timestamps,
        );

        binary_tx.send(Bytes::from_static(b"hello ")).await.unwrap();
        binary_tx.send(Bytes::from_static(b"world")).await.unwrap();
        drop(binary_tx);

        result_rx.await.unwrap().unwrap();
        let mut updates = Vec::new();
        while let Ok(bytes) = progress_rx.try_recv() {
            updates.push(bytes);
        }
        assert_eq!(updates.last().copied(), Some(11));

        let saved_path = root.path().join("sub/file.bin");
        assert_eq!(std::fs::read(&saved_path).unwrap(), b"hello world");
        assert_eq!(
            std::fs::metadata(&saved_path).unwrap().modified().unwrap(),
            modified
        );
    }

    #[cfg(unix)]
    #[tokio::test]
    async fn concurrent_contained_uploads_and_escape_attempts_stress() {
        use std::os::unix::fs::symlink;

        let root = TempDir::new("concurrent-root");
        let outside = TempDir::new("concurrent-outside");
        symlink(outside.path(), root.path().join("escape_dir")).unwrap();

        let mut handles = Vec::new();
        for i in 0..24usize {
            let root_path = root.path().to_path_buf();
            handles.push(tokio::spawn(async move {
                let rel = PathBuf::from(format!("batch/sub/file_{i}.bin"));
                let payload = format!("payload-{i:02}-{}", "x".repeat(i * 17));
                let (binary_tx, result_rx) = spawn_blocking_file_writer(
                    move || safe_open::open_contained(&root_path, &rel),
                    payload.len() as u64,
                    None,
                    FileTimestamps::default(),
                );
                binary_tx
                    .send(Bytes::from(payload.as_bytes().to_vec()))
                    .await
                    .unwrap();
                drop(binary_tx);
                result_rx.await.unwrap().unwrap();
                (i, payload)
            }));
        }

        for i in 0..8usize {
            let root_path = root.path().to_path_buf();
            handles.push(tokio::spawn(async move {
                let rel = PathBuf::from(format!("escape_dir/sub_{i}/evil_{i}.bin"));
                let (binary_tx, result_rx) = spawn_blocking_file_writer(
                    move || safe_open::open_contained(&root_path, &rel),
                    4,
                    None,
                    FileTimestamps::default(),
                );
                let _ = binary_tx.send(Bytes::from_static(b"evil")).await;
                drop(binary_tx);
                assert!(result_rx.await.unwrap().is_err());
                (usize::MAX, String::new())
            }));
        }

        for handle in handles {
            let (i, payload) = handle.await.unwrap();
            if i != usize::MAX {
                let path = root.path().join(format!("batch/sub/file_{i}.bin"));
                assert_eq!(std::fs::read(path).unwrap(), payload.as_bytes());
            }
        }

        assert_eq!(std::fs::read_dir(outside.path()).unwrap().count(), 0);
    }

    #[test]
    fn windows_validation_rejects_drive_prefixes_and_alternate_data_streams() {
        let invalid = [
            "C:evil.txt",
            "sub/C:evil.txt",
            "file.txt:stream",
            "sub/file.txt:stream",
            r"a\..\b.txt",
            r"a\.\b.txt",
            r"dir\",
        ];
        for raw in invalid {
            assert!(
                safe_open::collect_relative_components_for(Path::new(raw), true).is_err(),
                "expected Windows validation error for {raw:?}"
            );
        }

        // Standard Unix filenames containing `:` (e.g. timestamps) remain allowed on Unix.
        assert!(
            safe_open::collect_relative_components_for(Path::new("sub/14:42:00.png"), false)
                .is_ok()
        );
        assert!(safe_open::collect_relative_components_for(Path::new("sub/ok.txt"), true).is_ok());
    }

    #[cfg(unix)]
    #[test]
    fn unix_blocks_fifo_without_blocking() {
        use std::ffi::CString;
        use std::os::unix::ffi::OsStrExt;

        let root = TempDir::new("fifo");
        let fifo_path = root.path().join("pipe.txt");
        let fifo_c = CString::new(fifo_path.as_os_str().as_bytes()).unwrap();
        // SAFETY: `fifo_c` is a NUL-terminated path inside an existing temp directory.
        let rc = unsafe { libc::mkfifo(fifo_c.as_ptr(), 0o600) };
        assert_eq!(rc, 0, "mkfifo failed: {}", std::io::Error::last_os_error());

        // Must fail immediately instead of hanging waiting for a FIFO reader.
        assert!(safe_open::open_path_no_follow(&fifo_path).is_err());
        assert!(safe_open::open_contained(root.path(), Path::new("pipe.txt")).is_err());
    }

    #[cfg(any(target_os = "linux", target_os = "android"))]
    #[test]
    fn linux_allows_search_only_destination_directory() {
        use std::os::unix::fs::PermissionsExt;

        struct RestorePerms(PathBuf);
        impl Drop for RestorePerms {
            fn drop(&mut self) {
                let _ = std::fs::set_permissions(&self.0, std::fs::Permissions::from_mode(0o700));
            }
        }

        let root = TempDir::new("search-only");
        let sub = root.path().join("sub");
        std::fs::create_dir_all(&sub).unwrap();

        let _sub_guard = RestorePerms(sub.clone());
        let _root_guard = RestorePerms(root.path().to_path_buf());
        std::fs::set_permissions(&sub, std::fs::Permissions::from_mode(0o300)).unwrap();
        std::fs::set_permissions(root.path(), std::fs::Permissions::from_mode(0o300)).unwrap();

        let mut file = safe_open::open_contained(root.path(), Path::new("sub/ok.txt")).unwrap();
        file.write_all(b"written into 0300 dir").unwrap();
        drop(file);

        // Restore read permission before reading back to verify contents.
        std::fs::set_permissions(&sub, std::fs::Permissions::from_mode(0o700)).unwrap();
        std::fs::set_permissions(root.path(), std::fs::Permissions::from_mode(0o700)).unwrap();
        assert_eq!(
            std::fs::read(sub.join("ok.txt")).unwrap(),
            b"written into 0300 dir"
        );
    }

    #[cfg(windows)]
    #[test]
    fn windows_reparse_point_and_containment_behavior() {
        use std::os::windows::fs::{symlink_dir, symlink_file};

        const ERROR_PRIVILEGE_NOT_HELD: i32 = 1314;

        let container = TempDir::new("win-reparse");
        let outside = TempDir::new("win-outside");
        let real_root = container.path().join("real_root");
        std::fs::create_dir_all(&real_root).unwrap();

        // Ordinary existing regular file retry overwrites cleanly.
        let regular = real_root.join("regular.txt");
        std::fs::write(&regular, b"old longer data").unwrap();
        let mut f = safe_open::open_path_no_follow(&regular).unwrap();
        f.write_all(b"new").unwrap();
        drop(f);
        assert_eq!(std::fs::read(&regular).unwrap(), b"new");

        let outside_existing = outside.path().join("keep.txt");
        std::fs::write(&outside_existing, b"ORIGINAL").unwrap();
        let outside_dangling = outside.path().join("dangling_out.txt");

        let valid_leaf = real_root.join("valid_link.txt");
        if let Err(err) = symlink_file(&outside_existing, &valid_leaf) {
            if err.raw_os_error() == Some(ERROR_PRIVILEGE_NOT_HELD) {
                return;
            }
            panic!("failed to create valid file symlink: {err}");
        }
        let dangling_leaf = real_root.join("dangling_link.txt");
        symlink_file(&outside_dangling, &dangling_leaf).unwrap();

        assert!(safe_open::open_path_no_follow(&valid_leaf).is_err());
        assert!(safe_open::open_path_no_follow(&dangling_leaf).is_err());
        assert_eq!(std::fs::read(&outside_existing).unwrap(), b"ORIGINAL");
        assert!(!outside_dangling.exists());

        // Symlinked root itself is allowed, while a symlink directory inside root is rejected.
        let alias_root = container.path().join("alias_root");
        symlink_dir(&real_root, &alias_root).unwrap();
        let mut ok = safe_open::open_contained(&alias_root, Path::new("nested/ok.txt")).unwrap();
        ok.write_all(b"ok").unwrap();
        drop(ok);
        assert_eq!(
            std::fs::read(real_root.join("nested/ok.txt")).unwrap(),
            b"ok"
        );

        let bad_dir = real_root.join("escape_dir");
        symlink_dir(outside.path(), &bad_dir).unwrap();
        assert!(safe_open::open_contained(&alias_root, Path::new("escape_dir/evil.txt")).is_err());
        assert!(!outside.path().join("evil.txt").exists());
    }
}
