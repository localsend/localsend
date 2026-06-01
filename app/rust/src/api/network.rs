/// A single non-loopback IPv4 address attached to a local interface, plus the
/// CIDR prefix length of its subnet (e.g. 24 for `/24`, 21 for `/21`).
///
/// Used by the address-input dialog to prefer in-subnet IPs during the wide
/// hashtag scan. Sourced from `getifaddrs(3)` on Unix/Apple/Android and
/// `GetAdaptersAddresses` on Windows via the `if-addrs` crate, so masks are
/// reported for every interface that has an IP — Ethernet, WiFi, VPN, etc.
pub struct LocalInterface {
    pub ip: String,
    pub prefix_length: u8,
}

/// Lists all non-loopback IPv4 interfaces with their subnet prefix lengths.
/// Returns an empty list rather than an error if the underlying system call
/// fails; callers should treat that as "no mask info available".
pub fn list_local_interfaces() -> Vec<LocalInterface> {
    let Ok(ifs) = if_addrs::get_if_addrs() else {
        return Vec::new();
    };
    ifs.into_iter()
        .filter_map(|i| match i.addr {
            if_addrs::IfAddr::V4(v4) if !v4.ip.is_loopback() => Some(LocalInterface {
                ip: v4.ip.to_string(),
                prefix_length: u32::from(v4.netmask).count_ones() as u8,
            }),
            _ => None,
        })
        .collect()
}
