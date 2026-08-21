//! The subset of the Tailscale status document that peer discovery reads.
//!
//! Both sources produce the same document — Tailscale's `ipnstate.Status` —
//! so the LocalAPI response and the output of `tailscale status --json` are
//! parsed by the same code. Only the handful of fields needed to dial a peer
//! are modelled; everything else is ignored, so a tailscaled that is newer or
//! older than this code still parses.

use serde::Deserialize;
use std::collections::BTreeMap;
use std::net::IpAddr;

/// The value of `BackendState` while the local node is logged in and up.
/// Anything else (`NeedsLogin`, `Stopped`, `NoState`, ...) means there is no
/// usable tailnet, and the peer list is then stale or empty.
const RUNNING: &str = "Running";

/// A peer in the local node's tailnet, reduced to what is needed to send it
/// a register request.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct TailnetPeer {
    /// The tailnet address to dial.
    pub host: String,

    /// The peer's MagicDNS name without its trailing dot, its hostname when
    /// MagicDNS is off, and its address when it has neither. Only used for
    /// logging: devices are identified by their LocalSend fingerprint, never
    /// by anything Tailscale reports.
    pub name: String,
}

/// The status document of the local Tailscale daemon.
#[derive(Debug, Deserialize)]
pub(super) struct Status {
    #[serde(rename = "BackendState", default)]
    backend_state: String,

    /// Every other node in the tailnet, keyed by public key. `null` while
    /// the local node is alone in its tailnet.
    #[serde(rename = "Peer", default)]
    peer: Option<BTreeMap<String, Node>>,
}

/// One node in the tailnet.
#[derive(Debug, Deserialize)]
struct Node {
    /// The MagicDNS name including a trailing dot, e.g. `phone.tail1234.ts.net.`.
    /// Empty when MagicDNS is disabled for the tailnet.
    #[serde(rename = "DNSName", default)]
    dns_name: String,

    #[serde(rename = "HostName", default)]
    host_name: String,

    /// Every address the node holds inside the tailnet, IPv4 first.
    /// Empty for a node that has not been assigned any yet.
    #[serde(rename = "TailscaleIPs", default)]
    tailscale_ips: Vec<IpAddr>,

    /// Whether the peer currently holds a session with the control plane.
    /// An offline peer cannot answer, so it is not probed.
    #[serde(rename = "Online", default)]
    online: bool,
}

impl Status {
    /// The peers worth sending a register request: the online ones that hold
    /// a tailnet address.
    ///
    /// Skipping the offline peers is what keeps this cheap — a tailnet of a
    /// hundred mostly-idle nodes costs only as many probes as there are nodes
    /// actually up, and an offline peer could not answer anyway.
    ///
    /// Empty while the local node is not up: the peer list is then stale, and
    /// nothing in the tailnet is reachable regardless.
    pub(super) fn peers(&self) -> Vec<TailnetPeer> {
        if self.backend_state != RUNNING {
            return Vec::new();
        }

        self.peer
            .iter()
            .flatten()
            .filter(|(_, node)| node.online)
            .filter_map(|(_, node)| node.to_peer())
            .collect()
    }
}

impl Node {
    fn to_peer(&self) -> Option<TailnetPeer> {
        let host = self.dial_address()?;
        Some(TailnetPeer {
            host: host.to_string(),
            name: self.name(host),
        })
    }

    /// The address to dial, preferring IPv4.
    ///
    /// A tailnet always assigns an IPv4 address from `100.64.0.0/10`, while
    /// the IPv6 one is only routable when the local node has IPv6 enabled,
    /// so IPv4 is the address that works in every setup.
    fn dial_address(&self) -> Option<IpAddr> {
        self.tailscale_ips
            .iter()
            .find(|ip| ip.is_ipv4())
            .or_else(|| self.tailscale_ips.first())
            .copied()
    }

    fn name(&self, host: IpAddr) -> String {
        let dns_name = self.dns_name.trim_end_matches('.');
        if !dns_name.is_empty() {
            return dns_name.to_owned();
        }
        if !self.host_name.is_empty() {
            return self.host_name.clone();
        }
        host.to_string()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// A status document shaped like the real one, with a peer per case that
    /// the filtering has to get right.
    const STATUS: &str = r#"{
        "Version": "1.102.2-t6cac91817-g6ff0ddc72",
        "BackendState": "Running",
        "TailscaleIPs": ["100.90.62.40", "fd7a:115c:a1e0::d933:3e28"],
        "Self": {
            "HostName": "desktop",
            "DNSName": "desktop.tail8182b8.ts.net.",
            "TailscaleIPs": ["100.90.62.40", "fd7a:115c:a1e0::d933:3e28"],
            "Online": true
        },
        "Peer": {
            "nodekey:aaa": {
                "HostName": "phone",
                "DNSName": "phone.tail8182b8.ts.net.",
                "OS": "android",
                "TailscaleIPs": ["100.110.244.93", "fd7a:115c:a1e0::ca36:f45d"],
                "Online": true,
                "Active": false
            },
            "nodekey:bbb": {
                "HostName": "server",
                "DNSName": "server.tail8182b8.ts.net.",
                "TailscaleIPs": ["100.64.0.7"],
                "Online": false
            },
            "nodekey:ccc": {
                "HostName": "v6only",
                "DNSName": "",
                "TailscaleIPs": ["fd7a:115c:a1e0::1234:5678"],
                "Online": true
            },
            "nodekey:ddd": {
                "HostName": "",
                "DNSName": "",
                "TailscaleIPs": [],
                "Online": true
            }
        }
    }"#;

    fn parse(json: &str) -> Status {
        serde_json::from_str(json).expect("the status document should parse")
    }

    #[test]
    fn takes_the_ipv4_address_and_the_magic_dns_name() {
        let peers = parse(STATUS).peers();

        assert!(peers.contains(&TailnetPeer {
            host: "100.110.244.93".to_owned(),
            name: "phone.tail8182b8.ts.net".to_owned(),
        }));
    }

    #[test]
    fn skips_offline_peers() {
        let peers = parse(STATUS).peers();

        assert!(!peers.iter().any(|peer| peer.host == "100.64.0.7"));
    }

    #[test]
    fn falls_back_to_ipv6_and_to_the_hostname() {
        let peers = parse(STATUS).peers();

        assert!(peers.contains(&TailnetPeer {
            host: "fd7a:115c:a1e0::1234:5678".to_owned(),
            name: "v6only".to_owned(),
        }));
    }

    #[test]
    fn skips_peers_without_an_address() {
        assert_eq!(parse(STATUS).peers().len(), 2);
    }

    #[test]
    fn ignores_the_peers_of_a_node_that_is_not_up() {
        let json = STATUS.replace(
            r#""BackendState": "Running""#,
            r#""BackendState": "NeedsLogin""#,
        );

        assert!(parse(&json).peers().is_empty());
    }

    #[test]
    fn accepts_a_node_that_is_alone_in_its_tailnet() {
        let json = r#"{"BackendState": "Running", "Peer": null}"#;

        assert!(parse(json).peers().is_empty());
    }

    #[test]
    fn ignores_unknown_and_missing_fields() {
        let json = r#"{
            "BackendState": "Running",
            "SomethingAddedLater": {"nested": true},
            "Peer": {"nodekey:aaa": {"TailscaleIPs": ["100.1.2.3"], "Online": true}}
        }"#;

        assert_eq!(
            parse(json).peers(),
            vec![TailnetPeer {
                host: "100.1.2.3".to_owned(),
                name: "100.1.2.3".to_owned(),
            }]
        );
    }
}
