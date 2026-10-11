use std::fmt;
use std::net::{IpAddr, SocketAddr};

/// The IP address of a connected peer.
///
/// Unlike a bare [`IpAddr`], it keeps the scope the connection was accepted
/// with, without which a link-local IPv6 peer cannot be dialed back. Renders
/// as `fe80::1%3`, which the HTTP client accepts as a host.
#[derive(Clone, Copy, Debug, Eq, Hash, PartialEq)]
pub struct PeerIp {
    pub ip: IpAddr,

    /// The scope (interface index) of the connection. Only set for IPv6 peers
    /// that carry one, i.e. link-local addresses.
    pub scope_id: Option<u32>,
}

impl PeerIp {
    pub(crate) fn from_remote_addr(remote_addr: &SocketAddr) -> Self {
        PeerIp {
            ip: remote_addr.ip(),
            scope_id: match remote_addr {
                SocketAddr::V6(remote_addr) if remote_addr.scope_id() != 0 => {
                    Some(remote_addr.scope_id())
                }
                _ => None,
            },
        }
    }
}

impl fmt::Display for PeerIp {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self.scope_id {
            Some(scope_id) => write!(f, "{}%{scope_id}", self.ip),
            None => write!(f, "{}", self.ip),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::net::SocketAddrV6;

    #[test]
    fn test_ipv4_has_no_scope() {
        let peer = PeerIp::from_remote_addr(&"192.168.1.42:50000".parse().unwrap());
        assert_eq!(peer.scope_id, None);
        assert_eq!(peer.to_string(), "192.168.1.42");
    }

    #[test]
    fn test_scoped_ipv6_keeps_the_scope() {
        let addr = SocketAddrV6::new("fe80::1".parse().unwrap(), 50000, 0, 3);
        let peer = PeerIp::from_remote_addr(&addr.into());
        assert_eq!(peer.scope_id, Some(3));
        assert_eq!(peer.to_string(), "fe80::1%3");
    }

    #[test]
    fn test_unscoped_ipv6_has_no_scope() {
        let addr = SocketAddrV6::new("2001:db8::1".parse().unwrap(), 50000, 0, 0);
        let peer = PeerIp::from_remote_addr(&addr.into());
        assert_eq!(peer.scope_id, None);
        assert_eq!(peer.to_string(), "2001:db8::1");
    }
}
