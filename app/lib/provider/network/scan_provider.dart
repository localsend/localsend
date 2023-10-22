import 'dart:async';

import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/sleep.dart';
import 'package:refena_flutter/refena_flutter.dart';

final scanProvider = Provider((ref) => ScanFacade(ref));

/// Provides a simple API to make discovery operations.
class ScanFacade {
  /// Maximum number of interfaces to scan.
  /// If there are more interfaces, the first ones will be used or the user needs to select one.
  static const maxInterfaces = 3;

  final Ref _ref;

  const ScanFacade(this._ref);

  /// Scans the network via multicast first,
  /// if no devices has been found, try http-based discovery on the first subnet.
  /// If [forceLegacy] is true, then the http-based discovery runs in parallel.
  /// Otherwise, it runs after a delay of 1 second and only if no devices has been found.
  Future<void> startSmartScan({required bool forceLegacy}) async {
    // Try performant Multicast/UDP method first
    _ref.notifier(nearbyDevicesProvider).startMulticastScan();

    // At the same time, try to discover favorites
    final favorites = _ref.read(favoritesProvider);
    final https = _ref.read(settingsProvider).https;
    await _ref.notifier(nearbyDevicesProvider).startFavoriteScan(devices: favorites, https: https);

    if (!forceLegacy && favorites.isEmpty) {
      // Wait a bit before trying the legacy method.
      // Skip waiting if [forceLegacy] is true.
      // Also skip waiting if there are favorites.
      await sleepAsync(1000);
    }

    // If no devices has been found, then switch to legacy discovery mode
    // which is purely HTTP/TCP based.
    if (forceLegacy || _ref.read(nearbyDevicesProvider).devices.isEmpty) {
      final networkInterfaces = _ref.read(localIpProvider).localIps.take(maxInterfaces).toList();
      if (networkInterfaces.isNotEmpty) {
        await startLegacySubnetScan(networkInterfaces);
      }
    }
  }

  /// HTTP based discovery on a fixed set of subnets.
  Future<void> startLegacySubnetScan(List<String> subnets) async {
    final settings = _ref.read(settingsProvider);
    final port = settings.port;
    final https = settings.https;

    // send announcement in parallel
    _ref.notifier(nearbyDevicesProvider).startMulticastScan();

    await Future.wait<void>([
      for (final subnet in subnets) _ref.notifier(nearbyDevicesProvider).startLegacyScan(port: port, localIp: subnet, https: https),
    ]);
  }
}
