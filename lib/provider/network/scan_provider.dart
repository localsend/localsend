import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/sleep.dart';

final scanProvider = Provider((ref) => ScanFacade(ref));

/// Provides a simple API to make discovery operations.
class ScanFacade {
  final Ref _ref;

  const ScanFacade(this._ref);

  /// Scans the network via multicast first,
  /// if no devices has been found, try http-based discovery on the first subnet
  Future<void> startSmartScan() async {
    // Try performant Multicast/UDP method first
    _ref.read(nearbyDevicesProvider.notifier).startMulticastScan();
    await sleepAsync(1000);

    // If no devices has been found, then switch to legacy discovery mode
    // which is purely HTTP/TCP based.
    if (_ref.read(nearbyDevicesProvider).devices.isEmpty) {
      final localIp = _ref.read(networkStateProvider).localIps.firstOrNull;
      if (localIp != null) {
        await startLegacySubnetScan(localIp);
      }
    }
  }

  /// HTTP based discovery on a single subnet.
  Future<void> startLegacySubnetScan(String localIp) async {
    final settings = _ref.read(settingsProvider);
    final port = settings.port;
    final https = settings.https;

    _ref.read(nearbyDevicesProvider.notifier).startScan(port: port, localIp: localIp, https: https);

    // send announcement in parallel
    _ref.read(nearbyDevicesProvider.notifier).startMulticastScan();
  }
}
