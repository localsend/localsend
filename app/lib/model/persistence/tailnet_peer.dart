import 'package:dart_mappable/dart_mappable.dart';

part 'tailnet_peer.mapper.dart';

/// A peer this device has seen at a tailnet address, persisted so that a
/// device which cannot enumerate the tailnet (Android, iOS) can still probe
/// its known peers after an app restart.
///
/// Without this list such a device depends on being probed first: a tailnet
/// carries no announcements and cannot be scanned, so a restart would lose
/// every peer until one of them happens to probe this device again.
@MappableClass()
class TailnetPeer with TailnetPeerMappable {
  final String fingerprint;

  /// The alias the device most recently carried, for display and debugging;
  /// the probe itself only needs the address.
  final String alias;

  /// The tailnet address the peer was last confirmed on.
  final String ip;

  /// The port of the peer's HTTP server.
  final int port;

  const TailnetPeer({
    required this.fingerprint,
    required this.alias,
    required this.ip,
    required this.port,
  });

  static const fromJson = TailnetPeerMapper.fromJson;
}
