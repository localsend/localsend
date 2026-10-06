//! Support for connecting to scoped IPv6 addresses (`fe80::1%3`).
//!
//! Link-local IPv6 peers are only reachable together with their scope (the
//! interface index), but URLs cannot carry a zone identifier.
//!
//! [`encode`] therefore turns `fe80::1%3` into the synthetic host name
//! `fe80--1s3.scoped.localsend.internal`, and [`decode`], called by the custom
//! DNS resolver of the reqwest client, turns it back into a scoped address.
//! The name is also a valid TLS server name; certificates are verified by
//! fingerprint, never by name.

use std::net::{Ipv6Addr, SocketAddr, SocketAddrV6};

/// Marks a synthetic host name produced by [`encode`]. The `.internal` TLD is
/// reserved for private use and never resolves in public DNS.
const SUFFIX: &str = ".scoped.localsend.internal";

/// Encodes a `<IPv6 address>%<scope>` host into a synthetic host name.
/// Returns `None` for every host that URLs can represent directly.
///
/// `:` becomes `-` and `s` separates the scope, both unambiguous because IPv6
/// addresses consist of hex digits and colons only.
pub(crate) fn encode(host: &str) -> Option<String> {
    let (address, scope) = host.split_once('%')?;

    // Only accept what [decode] can reverse.
    let address: Ipv6Addr = address.parse().ok()?;
    let scope: u32 = scope.parse().ok()?;
    if address.to_string().contains('.') {
        // An IPv4-mapped address; those never carry a scope in practice.
        return None;
    }

    Some(format!(
        "{}s{scope}{SUFFIX}",
        address.to_string().replace(':', "-")
    ))
}

/// Decodes a host name produced by [`encode`] back into a scoped socket
/// address. Returns `None` for every other host name.
pub(crate) fn decode(name: &str) -> Option<SocketAddr> {
    let encoded = name.strip_suffix(SUFFIX)?;
    let (address, scope) = encoded.split_once('s')?;

    let address: Ipv6Addr = address.replace('-', ":").parse().ok()?;
    let scope: u32 = scope.parse().ok()?;

    // Port 0 is a placeholder; reqwest replaces it with the port of the URL.
    Some(SocketAddr::from(SocketAddrV6::new(address, 0, 0, scope)))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_encode_scoped_host() {
        assert_eq!(
            encode("fe80::1%3").as_deref(),
            Some("fe80--1s3.scoped.localsend.internal")
        );
        assert_eq!(
            encode("fe80::abcd:ef12:3456:789a%4294967295").as_deref(),
            Some("fe80--abcd-ef12-3456-789as4294967295.scoped.localsend.internal")
        );
    }

    #[test]
    fn test_encode_rejects_unscoped_and_invalid_hosts() {
        assert_eq!(encode("192.168.1.1"), None);
        assert_eq!(encode("fe80::1"), None);
        assert_eq!(encode("example.com"), None);
        assert_eq!(encode("fe80::1%eth0"), None); // only numeric scopes
        assert_eq!(encode("not-an-address%3"), None);
        assert_eq!(encode("::ffff:192.168.1.1%3"), None); // IPv4-mapped
    }

    #[test]
    fn test_decode_reverses_encode() {
        let encoded = encode("fe80::1%3").unwrap();
        let decoded = decode(&encoded).unwrap();
        assert_eq!(
            decoded,
            SocketAddr::from(SocketAddrV6::new("fe80::1".parse().unwrap(), 0, 0, 3))
        );
    }

    #[test]
    fn test_decode_rejects_other_names() {
        assert_eq!(decode("example.com"), None);
        assert_eq!(decode("fe80--1.scoped.localsend.internal"), None); // no scope
        assert_eq!(decode("fe80--1sx.scoped.localsend.internal"), None); // bad scope
        assert_eq!(decode("s3.scoped.localsend.internal"), None); // no address
    }
}
