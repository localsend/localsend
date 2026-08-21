//! Discovery of the peers in this device's tailnet.
//!
//! Neither of LocalSend's discovery mechanisms finds anything over a
//! [Tailscale](https://tailscale.com) tailnet. A tailnet carries no multicast,
//! so announcements are never seen, and it hands out addresses from
//! `100.64.0.0/10` — four million hosts, far past what a subnet scan can walk.
//! Devices on the same tailnet but on different physical networks therefore
//! stay invisible to each other, even though every one of them is directly
//! reachable.
//!
//! The peer list has to come from the one process that already knows it: the
//! Tailscale daemon running on this device. It is asked over its LocalAPI (see
//! [`local_api`]) and the answer is turned into the addresses discovery then
//! probes exactly like a favorite.
//!
//! Nothing here talks to Tailscale's servers, and no credential, key or node
//! identity is read — only the addresses of the peers, which the device can
//! dial anyway.
//!
//! This works the same way for a self-hosted control plane such as Headscale,
//! because the daemon and its LocalAPI are the same. It cannot work on Android
//! and iOS, where Tailscale runs as a VPN service that exposes no API to other
//! apps — but it does not need to: a probe is a register request, so a desktop
//! that enumerates the tailnet also makes itself visible to the phone it
//! probes.

mod local_api;
mod status;

pub use status::TailnetPeer;

use status::Status;
use std::net::IpAddr;
use thiserror::Error;

/// Whether `host` is an address a tailnet handed out, i.e. one that can only
/// be reached through the tunnel.
///
/// Discovery uses this to decide how patient to be with a peer: a tailnet
/// address may need a NAT to be punched or a relay on another continent, so
/// the LAN timeout would drop it, while a LAN address must not be given the
/// tailnet timeout or a subnet scan would take half a minute.
///
/// Accepts the scoped form `fe80::1%3` that [`crate::http::server::PeerIp`]
/// renders, and answers `false` for a host that is not an address at all.
pub fn is_tailnet_address(host: &str) -> bool {
    // `100.64.0.0/10`, the range a tailnet assigns to its nodes. It is
    // shared carrier-grade NAT space rather than Tailscale's own, so a LAN
    // behind a CGNAT ISP lands in it too; being slower with such a peer is
    // the harmless direction of that ambiguity.
    const TAILNET_V4: u32 = 100 << 24 | 64 << 16;
    const TAILNET_V4_MASK: u32 = !0 << 22;

    // The first three groups of `fd7a:115c:a1e0::/48`. Unlike the IPv4 range
    // this one is Tailscale's alone, being a fixed prefix it picked inside
    // the private `fc00::/7` space.
    const TAILNET_V6: [u16; 3] = [0xfd7a, 0x115c, 0xa1e0];

    // Strip the scope of a link-local address, which never is a tailnet one
    // but has to parse rather than fall through as a malformed host.
    let host = host.split('%').next().unwrap_or(host);

    match host.parse::<IpAddr>() {
        Ok(IpAddr::V4(ip)) => u32::from(ip) & TAILNET_V4_MASK == TAILNET_V4,
        Ok(IpAddr::V6(ip)) => ip.segments()[..3] == TAILNET_V6,
        Err(_) => false,
    }
}

#[derive(Debug, Error)]
pub enum TailscaleError {
    /// The local Tailscale daemon could not be reached: Tailscale is not
    /// installed, not running, or its API is not readable by this process —
    /// which is the case under a sandbox that hides the socket, e.g. some
    /// Snap and Flatpak confinements.
    ///
    /// The expected outcome on a device without Tailscale, so callers treat
    /// it as "no peers" rather than as a failure.
    #[error("The local Tailscale daemon is not reachable: {0:#}")]
    Unreachable(#[source] anyhow::Error),

    /// The daemon answered with a document this version cannot read.
    #[error("The Tailscale status could not be read: {0}")]
    Malformed(#[source] serde_json::Error),
}

/// The peers in this device's tailnet that are worth probing: the ones that
/// are online and hold an address.
///
/// Empty — not an error — when Tailscale is installed but not logged in or
/// stopped, and when this device is the only node in its tailnet.
pub async fn peers() -> Result<Vec<TailnetPeer>, TailscaleError> {
    let body = local_api::status()
        .await
        .map_err(TailscaleError::Unreachable)?;

    let status: Status = serde_json::from_slice(&body).map_err(TailscaleError::Malformed)?;

    Ok(status.peers())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn recognises_the_ranges_a_tailnet_assigns() {
        assert!(is_tailnet_address("100.64.0.0"), "the first address");
        assert!(is_tailnet_address("100.90.62.40"));
        assert!(is_tailnet_address("100.127.255.255"), "the last address");
        assert!(is_tailnet_address("fd7a:115c:a1e0::d933:3e28"));
    }

    #[test]
    fn rejects_addresses_outside_them() {
        assert!(!is_tailnet_address("100.63.255.255"), "just below the range");
        assert!(!is_tailnet_address("100.128.0.0"), "just above the range");
        assert!(!is_tailnet_address("192.168.1.42"));
        assert!(!is_tailnet_address("127.0.0.1"));
        assert!(!is_tailnet_address("fd7a:115c:a1e1::1"), "a neighbouring /48");
        assert!(!is_tailnet_address("2001:db8::1"));
    }

    #[test]
    fn accepts_a_scoped_address_and_rejects_a_host_that_is_not_one() {
        assert!(
            !is_tailnet_address("fe80::1%3"),
            "a scoped link-local address must parse, not be mistaken for one"
        );
        assert!(!is_tailnet_address("desktop.tail8182b8.ts.net"));
        assert!(!is_tailnet_address(""));
    }

    /// Talks to the Tailscale daemon actually installed on the machine
    /// running the test, which is the only way to cover the transport: the
    /// LocalAPI is a real socket, not something that can be faked.
    ///
    /// Ignored by default, since most machines have no Tailscale. Run with
    /// `cargo test --features tailscale -- --ignored --nocapture`.
    #[tokio::test]
    #[ignore = "requires a running Tailscale daemon"]
    async fn reads_the_peers_of_the_local_tailnet() {
        let peers = peers().await.expect("the local daemon should answer");

        println!("{} online tailnet peers", peers.len());
        for peer in &peers {
            println!("  {} ({})", peer.name, peer.host);
        }
    }
}
