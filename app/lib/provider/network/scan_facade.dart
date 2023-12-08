import 'dart:async';

import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/sleep.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// Scans the network via multicast first,
/// if no devices has been found, try http-based discovery on the first subnet.
/// If [forceLegacy] is true, then the http-based discovery runs in parallel.
/// Otherwise, it runs after a delay of 1 second and only if no devices has been found.
class StartSmartScan extends AsyncGlobalAction {
  /// Maximum number of interfaces to scan.
  /// If there are more interfaces, the first ones will be used or the user needs to select one.
  static const maxInterfaces = 3;

  final bool forceLegacy;

  StartSmartScan({required this.forceLegacy});

  @override
  Future<void> reduce() async {
    // Try performant Multicast/UDP method first
    ref.redux(nearbyDevicesProvider).dispatch(StartMulticastScan());

    // At the same time, try to discover favorites
    final favorites = ref.read(favoritesProvider);
    final https = ref.read(settingsProvider).https;
    await ref.redux(nearbyDevicesProvider).dispatchAsync(StartFavoriteScan(devices: favorites, https: https));

    if (!forceLegacy) {
      // Wait a bit before trying the legacy method.
      // Skip waiting if [forceLegacy] is true.
      await sleepAsync(1000);
    }

    // If no devices has been found, then switch to legacy discovery mode
    // which is purely HTTP/TCP based.
    if (forceLegacy || ref.read(nearbyDevicesProvider).devices.isEmpty) {
      final networkInterfaces = ref.read(localIpProvider).localIps.take(maxInterfaces).toList();
      if (networkInterfaces.isNotEmpty) {
        await dispatchAsync(StartLegacySubnetScan(subnets: networkInterfaces));
      }
    }
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
    final port = settings.port;
    final https = settings.https;

    // send announcement in parallel
    ref.redux(nearbyDevicesProvider).dispatch(StartMulticastScan());

    await Future.wait<void>([
      for (final subnet in subnets) ref.redux(nearbyDevicesProvider).dispatchAsync(StartLegacyScan(port: port, localIp: subnet, https: https)),
    ]);
  }
}
