import 'dart:async';

import 'package:common/constants.dart';
import 'package:common/isolate.dart';
import 'package:common/util/sleep.dart';
import 'package:flutter/foundation.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/pages/home_page_controller.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
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

    // At the same time, try to discover known peers and favorites
    final nearbyDevices = ref.redux(nearbyDevicesProvider);
    final favorites = ref.read(favoritesProvider);
    final https = ref.read(settingsProvider).https;
    await Future.wait<void>([
      nearbyDevices.dispatchAsync(StartKnownPeersScan()),
      nearbyDevices.dispatchAsync(StartFavoriteScan(devices: favorites, https: https)),
    ]);

    if (!forceLegacy) {
      // Wait a bit before trying the legacy method.
      // Skip waiting if [forceLegacy] is true.
      await sleepAsync(1000);
    }

    // If no devices has been found, then switch to legacy discovery mode
    // which is purely HTTP/TCP based.
    final stillEmpty = ref.read(nearbyDevicesProvider).devices.isEmpty;
    final stillInSendTab = ref.read(homePageControllerProvider).currentTab == HomeTab.send;
    if (forceLegacy || (stillEmpty && stillInSendTab)) {
      final networkInterfaces = ref.read(localIpProvider).localIps.take(maxInterfaces).toList();
      if (networkInterfaces.isNotEmpty) {
        await dispatchAsync(StartLegacySubnetScan(subnets: networkInterfaces));
        await _maybeStartCrossSubnetScan(networkInterfaces, forceLegacy: forceLegacy);
      }
    } else {
      if (!stillEmpty) {
        emitMessage('Already found devices. This network seem to work, no need to start legacy scan.');
      }
      if (!stillInSendTab) {
        emitMessage('User left the send tab. No need to start legacy scan.');
      }
    }
  }

  Future<void> _maybeStartCrossSubnetScan(List<String> networkInterfaces, {required bool forceLegacy}) async {
    final settings = ref.read(settingsProvider);
    if (!settings.crossSubnetScan) {
      emitMessage('Cross-subnet scan is disabled.');
      return;
    }

    final stillInSendTab = ref.read(homePageControllerProvider).currentTab == HomeTab.send;
    if (!stillInSendTab) {
      emitMessage('User left the send tab. No need to start cross-subnet scan.');
      return;
    }

    final hasCustomRanges = settings.customSubnetScanRanges.isNotEmpty;
    final stillEmpty = ref.read(nearbyDevicesProvider).devices.isEmpty;
    if (!forceLegacy && !stillEmpty && !hasCustomRanges) {
      emitMessage('Already found devices. Skipping automatic neighbouring subnet scan.');
      return;
    }

    final plan = buildCrossSubnetScanPlan(
      localIps: networkInterfaces,
      port: settings.port,
      https: settings.https,
      depth: settings.crossSubnetScanDepth,
      customRanges: settings.customSubnetScanRanges,
    );
    await ref.redux(nearbyDevicesProvider).dispatchAsync(
          StartCrossSubnetScan(
            targets: plan.targets,
            ranges: plan.ranges,
            truncated: plan.truncated,
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
    final port = settings.port;
    final https = settings.https;

    // send announcement in parallel
    ref.redux(nearbyDevicesProvider).dispatch(StartMulticastScan());

    await Future.wait<void>([
      for (final subnet in subnets) ref.redux(nearbyDevicesProvider).dispatchAsync(StartLegacyScan(port: port, localIp: subnet, https: https)),
    ]);
  }
}

class CrossSubnetScanPlan {
  final List<HttpDiscoveryTarget> targets;
  final List<String> ranges;
  final bool truncated;

  const CrossSubnetScanPlan({
    required this.targets,
    required this.ranges,
    required this.truncated,
  });
}

@visibleForTesting
CrossSubnetScanPlan buildCrossSubnetScanPlan({
  required List<String> localIps,
  required int port,
  required bool https,
  required int depth,
  required List<String> customRanges,
  int maxHosts = maxCrossSubnetScanHosts,
}) {
  final localIpSet = localIps.toSet();
  final ranges = <String>[];
  final ips = <String>{};
  var truncated = false;

  void addIp(String ip) {
    if (ips.length >= maxHosts) {
      truncated = true;
      return;
    }
    if (!localIpSet.contains(ip)) {
      ips.add(ip);
    }
  }

  final safeDepth = depth.clamp(0, maxCrossSubnetScanDepth).toInt();
  for (final localIp in localIps) {
    final octets = _parseIpv4(localIp);
    if (octets == null) {
      continue;
    }
    for (var offset = 1; offset <= safeDepth; offset++) {
      for (final thirdOctet in [octets[2] - offset, octets[2] + offset]) {
        if (thirdOctet < 0 || thirdOctet > 255) {
          continue;
        }
        final prefix = '${octets[0]}.${octets[1]}.$thirdOctet';
        ranges.add('$prefix.0/24');
        for (var host = 1; host <= 254; host++) {
          addIp('$prefix.$host');
        }
      }
    }
  }

  for (final range in customRanges) {
    final expanded = _expandCidr(range, maxHosts - ips.length);
    if (expanded == null) {
      ranges.add('$range (invalid)');
      continue;
    }
    ranges.add(range);
    if (expanded.truncated) {
      truncated = true;
    }
    for (final ip in expanded.ips) {
      addIp(ip);
    }
  }

  return CrossSubnetScanPlan(
    targets: ips.map((ip) => HttpDiscoveryTarget(ip: ip, port: port, https: https)).toList(),
    ranges: ranges,
    truncated: truncated,
  );
}

({List<String> ips, bool truncated})? _expandCidr(String cidr, int remainingHosts) {
  if (remainingHosts <= 0) {
    return (ips: const [], truncated: true);
  }
  final parts = cidr.trim().split('/');
  if (parts.length != 2) {
    return null;
  }
  final ip = _ipv4ToInt(parts[0]);
  final prefix = int.tryParse(parts[1]);
  if (ip == null || prefix == null || prefix < 0 || prefix > 32) {
    return null;
  }

  final hostBits = 32 - prefix;
  final mask = prefix == 0 ? 0 : (0xffffffff << hostBits) & 0xffffffff;
  final network = ip & mask;
  final broadcast = network | (~mask & 0xffffffff);
  final first = prefix >= 31 ? network : network + 1;
  final last = prefix >= 31 ? broadcast : broadcast - 1;
  final ips = <String>[];
  var truncated = false;
  for (var current = first; current <= last; current++) {
    if (ips.length >= remainingHosts) {
      truncated = true;
      break;
    }
    ips.add(_intToIpv4(current));
  }

  return (ips: ips, truncated: truncated);
}

int? _ipv4ToInt(String ip) {
  final octets = _parseIpv4(ip);
  if (octets == null) {
    return null;
  }
  return (octets[0] << 24) | (octets[1] << 16) | (octets[2] << 8) | octets[3];
}

List<int>? _parseIpv4(String ip) {
  final parts = ip.trim().split('.');
  if (parts.length != 4) {
    return null;
  }
  final octets = <int>[];
  for (final part in parts) {
    final value = int.tryParse(part);
    if (value == null || value < 0 || value > 255) {
      return null;
    }
    octets.add(value);
  }
  return octets;
}

String _intToIpv4(int value) {
  return [
    (value >> 24) & 0xff,
    (value >> 16) & 0xff,
    (value >> 8) & 0xff,
    value & 0xff,
  ].join('.');
}
