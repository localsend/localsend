import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/sleep.dart';

final scanProvider = Provider((ref) => ScanFacade(ref));

/// Provides a simple API to make discovery operations.
class ScanFacade {
  /// Maximum number of interfaces to scan.
  /// If there are more interfaces, the first ones will be used or the user needs to select one.
  static const maxInterfaces = 3;

  final Ref _ref;

  const ScanFacade(this._ref);

  /// Scans the network via multicast first,
  /// if no devices has been found, try http-based discovery on the first subnet
  Future<void> startSmartScan({required bool forceLegacy}) async {
    // Try performant Multicast/UDP method first
    _ref.read(nearbyDevicesProvider.notifier).startMulticastScan();

    if (!forceLegacy) {
      await sleepAsync(1000);
    }

    // If no devices has been found, then switch to legacy discovery mode
    // which is purely HTTP/TCP based.
    if (forceLegacy || _ref.read(nearbyDevicesProvider).devices.isEmpty) {
      final networkInterfaces = _ref.read(networkStateProvider).localIps.take(maxInterfaces).toList();
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
    _ref.read(nearbyDevicesProvider.notifier).startMulticastScan();

    await Future.wait<void>([
      for (final subnet in subnets) _ref.read(nearbyDevicesProvider.notifier).startScan(port: port, localIp: subnet, https: https),
    ]);
  }
}
