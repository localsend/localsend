import 'dart:io';

/// Whether [host] is an address a tailnet handed out, i.e. one that can only
/// be reached through the tunnel.
///
/// The Dart mirror of `is_tailnet_address` in `packages/core/src/tailscale/`,
/// for the app-side decisions (persisting a tailnet peer, feeding a transfer
/// sender into discovery) that happen before Rust is involved. Keep the two
/// in sync.
///
/// The IPv4 range `100.64.0.0/10` is shared carrier-grade NAT space rather
/// than Tailscale's own, so a LAN behind a CGNAT ISP matches too; treating
/// such a peer as a tailnet one is the harmless direction of that ambiguity.
/// `fd7a:115c:a1e0::/48` is Tailscale's fixed IPv6 prefix. Accepts the scoped
/// form `fe80::1%3` and answers `false` for a host that is not an address.
bool isTailnetAddress(String host) {
  // Strip the scope of a link-local address, which never is a tailnet one
  // but has to parse rather than fall through as a malformed host.
  final bare = host.split('%').first;
  final address = InternetAddress.tryParse(bare);
  if (address == null) {
    return false;
  }

  final bytes = address.rawAddress;
  return switch (address.type) {
    InternetAddressType.IPv4 => bytes[0] == 100 && (bytes[1] & 0xc0) == 0x40,
    InternetAddressType.IPv6 => bytes[0] == 0xfd && bytes[1] == 0x7a && bytes[2] == 0x11 && bytes[3] == 0x5c && bytes[4] == 0xa1 && bytes[5] == 0xe0,
    _ => false,
  };
}
