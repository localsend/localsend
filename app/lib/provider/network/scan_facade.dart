import 'dart:async';

import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/provider/tailnet_peers_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// Discovers devices in stages, cheapest first: multicast announcement and
/// favorite probes right away, http-based discovery on the subnets only when
/// nothing was confirmed within 1 second.
class StartSmartScan extends AsyncGlobalAction {
  /// Maximum number of interfaces to scan.
  /// If there are more interfaces, the first ones will be used or the user needs to select one.
  static const maxInterfaces = 3;

  @override
  Future<void> reduce() async {
    final favorites = ref.read(favoritesProvider);
    final tailnetPeers = ref.read(tailnetPeersProvider);
    final settings = ref.read(settingsProvider);
    final networkInterfaces = ref.read(localIpProvider).localIps.take(maxInterfaces).toList();

    await ref
        .redux(nearbyDevicesProvider)
        .dispatchAsync(
          StartStagedScan(
            favorites: favorites,
            tailnetChannels: tailnetPeers.map((e) => (e.ip, e.port)).toList(),
            interfaces: networkInterfaces,
            port: settings.port,
            https: settings.https,
            grace: const Duration(seconds: 1),
          ),
        );
  }
}

/// HTTP based discovery on a fixed set of subnets.
class StartLegacySubnetScan extends AsyncGlobalAction {
  final List<String> subnets;

  StartLegacySubnetScan({
    required this.subnets,
  });

  @override
  Future<void> reduce() async {
    final settings = ref.read(settingsProvider);
    final tailnetPeers = ref.read(tailnetPeersProvider);
    final port = settings.port;
    final https = settings.https;

    await Future.wait<void>([
      // The announcement runs inside the staged scan, which also probes the
      // tailnet: the user picked one subnet to scan, but the tailnet is
      // reachable regardless of which interface that is, and skipping it
      // here would silently lose exactly the peers no subnet scan can find.
      // No favorites and no interfaces: the selected subnet is scanned below.
      ref
          .redux(nearbyDevicesProvider)
          .dispatchAsync(
            StartStagedScan(
              favorites: const [],
              tailnetChannels: tailnetPeers.map((e) => (e.ip, e.port)).toList(),
              interfaces: const [],
              port: port,
              https: https,
              grace: Duration.zero,
            ),
          ),
      for (final subnet in subnets) ref.redux(nearbyDevicesProvider).dispatchAsync(StartLegacyScan(port: port, localIp: subnet, https: https)),
    ]);
  }
}
