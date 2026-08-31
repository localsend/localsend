//! The client for the LocalAPI of the Tailscale daemon running on this device.
//!
//! Every platform serves the same HTTP API on a different local transport,
//! because each has a different way of proving that the caller is the user
//! who owns the daemon:
//!
//! - Linux, and macOS installs that run `tailscaled` themselves: a unix
//!   socket, world-readable for the read-only endpoints used here.
//! - Windows: a named pipe, whose ACL is the access check.
//! - The sandboxed macOS builds: a loopback port guarded by a token, since a
//!   sandboxed app cannot publish a unix socket. Port and token are the name
//!   of a file the app leaves in its group container.
//!
//! Only `GET /localapi/v0/status` is used, which reads the daemon's in-memory
//! netmap and changes nothing.

use anyhow::{anyhow, Context};
use base64::engine::general_purpose::STANDARD;
use base64::Engine;
use bytes::Bytes;
use http_body_util::{BodyExt, Empty};
use hyper::header::{AUTHORIZATION, HOST};
use hyper::Request;
use hyper_util::rt::TokioIo;
use std::time::Duration;
use tokio::io::{AsyncRead, AsyncWrite};

/// The endpoint that returns the netmap, including every peer.
const STATUS_PATH: &str = "/localapi/v0/status";

/// The `Host` header tailscaled requires. It is never resolved: the transport
/// already decides which process is talked to.
const HOST_HEADER: &str = "local-tailscaled.sock";

/// Bounds a wedged daemon. The LocalAPI answers out of memory, so a healthy
/// tailscaled is orders of magnitude below this; discovery must not stall on
/// one that is not.
const TIMEOUT: Duration = Duration::from_secs(2);

/// Fetches the status document from the local daemon.
///
/// Tries every transport the platform can offer and reports the last failure
/// when none worked, which is the normal outcome when Tailscale is simply not
/// installed.
pub(super) async fn status() -> anyhow::Result<Vec<u8>> {
    let mut last_error = None;

    for endpoint in endpoints() {
        match tokio::time::timeout(TIMEOUT, request_status(&endpoint)).await {
            Ok(Ok(body)) => return Ok(body),
            Ok(Err(err)) => last_error = Some(err.context(format!("{endpoint} failed"))),
            Err(_) => last_error = Some(anyhow!("{endpoint} did not answer within {TIMEOUT:?}")),
        }
    }

    Err(last_error.unwrap_or_else(|| anyhow!("This platform exposes no Tailscale LocalAPI")))
}

/// One way of reaching the local daemon, in the order they are tried.
enum Endpoint {
    #[cfg(unix)]
    UnixSocket(&'static str),

    /// The loopback listener of a sandboxed macOS build, with the token that
    /// authenticates against it.
    #[cfg(target_os = "macos")]
    Loopback { port: u16, token: String },

    #[cfg(windows)]
    NamedPipe(&'static str),
}

impl std::fmt::Display for Endpoint {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            #[cfg(unix)]
            Endpoint::UnixSocket(path) => write!(f, "The Tailscale socket {path}"),
            // The token is a credential and never logged.
            #[cfg(target_os = "macos")]
            Endpoint::Loopback { port, .. } => {
                write!(f, "The Tailscale loopback API on port {port}")
            }
            #[cfg(windows)]
            Endpoint::NamedPipe(path) => write!(f, "The Tailscale pipe {path}"),
        }
    }
}

fn endpoints() -> Vec<Endpoint> {
    #[allow(unused_mut)]
    let mut endpoints = Vec::new();

    #[cfg(unix)]
    {
        // Linux, and macOS installs managed by the Tailscale CLI.
        endpoints.push(Endpoint::UnixSocket("/var/run/tailscale/tailscaled.sock"));
        // The same socket where /var/run is not a symlink to /run.
        endpoints.push(Endpoint::UnixSocket("/run/tailscale/tailscaled.sock"));
        // The open-source tailscaled on macOS, e.g. from Homebrew.
        endpoints.push(Endpoint::UnixSocket("/var/run/tailscaled.socket"));
    }

    #[cfg(target_os = "macos")]
    if let Some((port, token)) = loopback_credentials() {
        endpoints.push(Endpoint::Loopback { port, token });
    }

    #[cfg(windows)]
    endpoints.push(Endpoint::NamedPipe(
        r"\\.\pipe\ProtectedPrefix\Administrators\Tailscale\tailscaled",
    ));

    endpoints
}

async fn request_status(endpoint: &Endpoint) -> anyhow::Result<Vec<u8>> {
    match endpoint {
        #[cfg(unix)]
        Endpoint::UnixSocket(path) => {
            let stream = tokio::net::UnixStream::connect(path)
                .await
                .context("Could not connect")?;
            get(stream, None).await
        }

        #[cfg(target_os = "macos")]
        Endpoint::Loopback { port, token } => {
            let stream = tokio::net::TcpStream::connect(("127.0.0.1", *port))
                .await
                .context("Could not connect")?;
            get(stream, Some(token)).await
        }

        #[cfg(windows)]
        Endpoint::NamedPipe(path) => {
            use tokio::net::windows::named_pipe::ClientOptions;

            // tailscaled refuses connections opened at the anonymous
            // impersonation level, because it cannot then tell who is
            // calling. These are the flags that ask for an identification
            // token; they are Tokio's default, but the request depends on
            // them, so they are spelled out.
            const SECURITY_SQOS_PRESENT: u32 = 0x0010_0000;
            const SECURITY_IDENTIFICATION: u32 = 0x0001_0000;

            let stream = ClientOptions::new()
                .security_qos_flags(SECURITY_SQOS_PRESENT | SECURITY_IDENTIFICATION)
                .open(path)
                .context("Could not connect")?;
            get(stream, None).await
        }
    }
}

/// Sends `GET /localapi/v0/status` over an already connected transport and
/// returns the response body.
async fn get<S>(stream: S, token: Option<&str>) -> anyhow::Result<Vec<u8>>
where
    S: AsyncRead + AsyncWrite + Send + Unpin + 'static,
{
    let (mut sender, connection) = hyper::client::conn::http1::handshake(TokioIo::new(stream))
        .await
        .context("Could not speak HTTP")?;

    // Drives the transport until the response has been read; ends by itself
    // once `sender` is dropped at the end of this function.
    tokio::spawn(async move {
        if let Err(err) = connection.await {
            tracing::trace!("The Tailscale LocalAPI connection ended: {err}");
        }
    });

    let mut request = Request::builder()
        .uri(STATUS_PATH)
        .header(HOST, HOST_HEADER);
    if let Some(token) = token {
        // The daemon expects the token as the password of an otherwise empty
        // basic-auth pair.
        let credentials = STANDARD.encode(format!(":{token}"));
        request = request.header(AUTHORIZATION, format!("Basic {credentials}"));
    }

    let response = sender
        .send_request(request.body(Empty::<Bytes>::new())?)
        .await
        .context("The request failed")?;

    let status = response.status();
    let body = response.into_body().collect().await?.to_bytes();
    if !status.is_success() {
        return Err(anyhow!("The LocalAPI answered {status}"));
    }

    Ok(body.to_vec())
}

/// The loopback port and token of a sandboxed macOS build, when one is
/// installed.
///
/// The app writes a file whose *name* carries both, in the group container it
/// shares with its network extension: `sameuserproof-<port>-<token>`. Being
/// able to read that name is the proof that the caller runs as the same user.
#[cfg(target_os = "macos")]
fn loopback_credentials() -> Option<(u16, String)> {
    for container in tailscale_group_containers() {
        let Ok(files) = std::fs::read_dir(&container) else {
            continue;
        };
        for file in files.filter_map(Result::ok) {
            let name = file.file_name();
            let Some(name) = name.to_str() else {
                continue;
            };
            let Some(suffix) = name.strip_prefix("sameuserproof-") else {
                continue;
            };
            // The token may itself contain `-`, so split only once.
            if let Some((port, token)) = suffix.split_once('-') {
                if let Ok(port) = port.parse() {
                    return Some((port, token.to_owned()));
                }
            }
        }
    }

    None
}

/// The group containers a Tailscale build may have left its loopback
/// credentials in, the ones that are named outright first.
///
/// LocalSend is itself sandboxed on macOS, and that decides the shape of this
/// search: `~/Library/Group Containers` cannot be listed from inside the App
/// Sandbox at all — `opendir` answers `EPERM`, because a group container
/// belongs to the applications entitled to it and LocalSend is not entitled
/// to Tailscale's. A named path is a different check and does succeed, given
/// the read-only exception in `Runner/*.entitlements`, so the two names
/// Tailscale actually ships under are addressed directly rather than found.
///
/// The listing is still attempted afterwards, for the callers that are not
/// sandboxed — the CLI, and the tests — so that a build signed under a team
/// this code does not know about keeps working there.
#[cfg(target_os = "macos")]
fn tailscale_group_containers() -> Vec<std::path::PathBuf> {
    // The App Store build lives under Tailscale's own team identifier; the
    // standalone one carries no prefix. Neither has changed since the builds
    // existed, and a wrong guess here costs nothing but the fallback below.
    const WELL_KNOWN: [&str; 2] = [
        "W5364U7YZB.group.io.tailscale.ipn.macos",
        "io.tailscale.ipn.macsys",
    ];

    let Some(home) = real_home() else {
        return Vec::new();
    };
    let containers = home.join("Library/Group Containers");

    let mut candidates: Vec<std::path::PathBuf> =
        WELL_KNOWN.iter().map(|name| containers.join(name)).collect();

    let listed = std::fs::read_dir(&containers)
        .into_iter()
        .flatten()
        .filter_map(|entry| {
            let path = entry.ok()?.path();
            let name = path.file_name()?.to_str()?;
            (name.ends_with("io.tailscale.ipn.macos") || name.ends_with("io.tailscale.ipn.macsys"))
                .then_some(path)
        });
    for path in listed {
        if !candidates.contains(&path) {
            candidates.push(path);
        }
    }

    candidates
}

/// The home directory of the user running this process, read from the
/// password database rather than from the environment.
///
/// The App Sandbox rewrites `HOME` to the calling application's own
/// container, so `$HOME/Library/Group Containers` would name a directory
/// inside LocalSend's data folder that holds only LocalSend's own groups, and
/// the Tailscale container would never be looked at. `getpwuid` is not
/// rewritten and still reports the real home.
#[cfg(target_os = "macos")]
fn real_home() -> Option<std::path::PathBuf> {
    use std::ffi::{CStr, OsStr};
    use std::os::unix::ffi::OsStrExt;

    // SAFETY: `getpwuid` returns a pointer into a buffer libc owns, valid
    // until this thread calls it again; the path is copied out before this
    // function returns, so nothing borrows it afterwards.
    let entry = unsafe { libc::getpwuid(libc::getuid()) };
    if entry.is_null() {
        return None;
    }

    let directory = unsafe { (*entry).pw_dir };
    if directory.is_null() {
        return None;
    }

    let directory = unsafe { CStr::from_ptr(directory) };
    Some(std::path::PathBuf::from(OsStr::from_bytes(
        directory.to_bytes(),
    )))
}

#[cfg(all(test, target_os = "macos"))]
mod tests {
    use super::*;

    /// The regression guard for the bug that made the macOS app blind to its
    /// own tailnet: the container has to be named, because inside the App
    /// Sandbox its parent cannot be listed.
    #[test]
    fn names_the_tailscale_containers_instead_of_searching_for_them() {
        let containers = tailscale_group_containers();
        let home = real_home().expect("the password database should report a home directory");

        for name in [
            "W5364U7YZB.group.io.tailscale.ipn.macos",
            "io.tailscale.ipn.macsys",
        ] {
            let expected = home.join("Library/Group Containers").join(name);
            assert!(
                containers.contains(&expected),
                "{name} must be addressed directly, since the App Sandbox denies listing its parent"
            );
        }
    }

    /// `HOME` is what the App Sandbox rewrites, so reading it would have
    /// pointed the search at LocalSend's own container.
    #[test]
    fn does_not_take_the_home_directory_from_the_environment() {
        std::env::set_var("HOME", "/nowhere/that/exists");

        let home = real_home().expect("the password database should report a home directory");

        assert_ne!(home, std::path::Path::new("/nowhere/that/exists"));
        assert!(
            tailscale_group_containers()
                .iter()
                .all(|path| !path.starts_with("/nowhere/that/exists")),
            "the container search must not follow HOME"
        );
    }
}
