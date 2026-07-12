import 'dart:async';

import 'package:collection/collection.dart';
import 'package:common/isolate.dart';
import 'package:common/model/device.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/model/state/nearby_devices_state.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/known_peers_provider.dart';
import 'package:localsend_app/provider/logging/discovery_logs_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// This provider is responsible for:
/// - Scanning the network for other LocalSend instances
/// - Keeping track of all found devices (they are only stored in RAM)
///
/// Use [scanProvider] to have a high-level API to perform discovery operations.
final nearbyDevicesProvider = ReduxProvider<NearbyDevicesService, NearbyDevicesState>((ref) {
  return NearbyDevicesService(
    isolateController: ref.notifier(parentIsolateProvider),
    favoriteService: ref.notifier(favoritesProvider),
    knownPeersService: ref.notifier(knownPeersProvider),
    discoveryLogs: ref.notifier(discoveryLoggerProvider),
  );
});

class NearbyDevicesService extends ReduxNotifier<NearbyDevicesState> {
  final IsolateController _isolateController;
  final FavoritesService _favoriteService;
  final KnownPeersService _knownPeersService;
  final DiscoveryLogger _discoveryLogger;

  NearbyDevicesService({
    required IsolateController isolateController,
    required FavoritesService favoriteService,
    required KnownPeersService knownPeersService,
    required DiscoveryLogger discoveryLogs,
  }) : _discoveryLogger = discoveryLogs,
       _isolateController = isolateController,
       _knownPeersService = knownPeersService,
       _favoriteService = favoriteService;

  @override
  NearbyDevicesState init() => const NearbyDevicesState(
    runningFavoriteScan: false,
    runningIps: {},
    devices: {},
    signalingDevices: {},
  );
}

/// Binds the UDP port and listens for incoming announcements.
/// This should run forever as long as the app is running.
class StartMulticastListener extends AsyncReduxAction<NearbyDevicesService, NearbyDevicesState> {
  @override
  Future<NearbyDevicesState> reduce() async {
    await for (final device in notifier._isolateController.state.multicastDiscovery!.receiveFromIsolate) {
      await dispatchAsync(RegisterDeviceAction(device));
      notifier._discoveryLogger.addLog('[DISCOVER/UDP] ${device.alias} (${device.ip}, model: ${device.deviceModel})');
    }
    return state;
  }
}

/// Removes all found devices from the state.
class ClearFoundDevicesAction extends ReduxAction<NearbyDevicesService, NearbyDevicesState> {
  @override
  NearbyDevicesState reduce() {
    return state.copyWith(
      devices: {},
    );
  }
}

/// Registers a device in the state.
/// It will override any existing device with the same IP.
class RegisterDeviceAction extends AsyncReduxAction<NearbyDevicesService, NearbyDevicesState> {
  final Device device;

  RegisterDeviceAction(this.device);

  @override
  bool get trackOrigin => false;

  @override
  Future<NearbyDevicesState> reduce() async {
    assert(device.ip?.isNotEmpty ?? false, 'IP must not be empty');

    final favoriteDevice = notifier._favoriteService.state.firstWhereOrNull((e) => e.fingerprint == device.fingerprint);
    if (favoriteDevice != null && !favoriteDevice.customAlias) {
      // Update existing favorite with new alias
      await external(notifier._favoriteService).dispatchAsync(UpdateFavoriteAction(favoriteDevice.copyWith(alias: device.alias)));
    } else {
      await Future.microtask(() {});
    }
    await external(notifier._knownPeersService).dispatchAsync(UpdateKnownPeerAction(device));
    notifier._discoveryLogger.addLog('[KNOWN_PEERS] Cache update: ${device.alias} (${device.ip}:${device.port})');
    return state.copyWith(
      devices: {...state.devices}..update(device.ip!, (_) => device, ifAbsent: () => device),
    );
  }
}

/// Registers a new device found via signaling.
class RegisterSignalingDeviceAction extends ReduxAction<NearbyDevicesService, NearbyDevicesState> {
  final Device device;

  RegisterSignalingDeviceAction(this.device);

  @override
  NearbyDevicesState reduce() {
    final Set<Device> existingDevices = state.signalingDevices[device.fingerprint]?.toSet() ?? {};
    final existingDevice = existingDevices.firstWhereOrNull((e) => e.signalingId == device.signalingId);
    if (existingDevice != null) {
      existingDevices.remove(existingDevice);
    }
    existingDevices.add(device);

    return state.copyWith(
      signalingDevices: {
        ...state.signalingDevices,
        device.fingerprint: existingDevices,
      },
    );
  }
}

class UnregisterSignalingDeviceAction extends ReduxAction<NearbyDevicesService, NearbyDevicesState> {
  final String signalingId;

  UnregisterSignalingDeviceAction(this.signalingId);

  @override
  NearbyDevicesState reduce() {
    return state.copyWith(
      signalingDevices: {
        for (final entry in state.signalingDevices.entries) entry.key: entry.value.where((e) => e.signalingId != signalingId).toSet(),
      },
    );
  }
}

/// It does not really "scan".
/// It just sends an announcement which will cause a response on every other LocalSend member of the network.
class StartMulticastScan extends ReduxAction<NearbyDevicesService, NearbyDevicesState> {
  @override
  NearbyDevicesState reduce() {
    external(notifier._isolateController).dispatch(IsolateSendMulticastAnnouncementAction());
    return state;
  }
}

class StartKnownPeersScan extends AsyncReduxAction<NearbyDevicesService, NearbyDevicesState> {
  @override
  Future<NearbyDevicesState> reduce() async {
    final endpoints = notifier._knownPeersService.state.expand((peer) => peer.endpoints).toList();
    if (endpoints.isEmpty) {
      notifier._discoveryLogger.addLog('[KNOWN_PEERS] Cache miss: no remembered endpoints');
      return state;
    }

    notifier._discoveryLogger.addLog('[KNOWN_PEERS] Cache hit: probing ${endpoints.length} remembered endpoints');
    final targets = endpoints
        .map((endpoint) => HttpDiscoveryTarget(
              ip: endpoint.ip,
              port: endpoint.port,
              https: endpoint.https,
            ))
        .toList();
    final stream = external(notifier._isolateController).dispatchTakeResult(
      IsolateTargetHttpDiscoveryAction(targets: targets),
    );
    final foundKeys = <String>{};
    await for (final device in stream) {
      notifier._discoveryLogger.addLog('[DISCOVER/KNOWN] ${device.alias} (${device.ip}, model: ${device.deviceModel})');
      if (device.ip != null) {
        foundKeys.add(_targetKey(device.ip!, device.port, device.https));
      }
      await dispatchAsync(RegisterDeviceAction(device));
    }

    final failedKeys = endpoints.map((endpoint) => endpoint.key).where((key) => !foundKeys.contains(key)).toSet();
    if (failedKeys.isNotEmpty) {
      notifier._discoveryLogger.addLog('[KNOWN_PEERS] Cache miss: ${failedKeys.length} endpoints failed or timed out');
      await external(notifier._knownPeersService).dispatchAsync(RecordKnownPeerFailuresAction(failedKeys));
    }

    return state;
  }
}

class StartCrossSubnetScan extends AsyncReduxAction<NearbyDevicesService, NearbyDevicesState> {
  final List<HttpDiscoveryTarget> targets;
  final List<String> ranges;
  final bool truncated;

  StartCrossSubnetScan({
    required this.targets,
    required this.ranges,
    required this.truncated,
  });

  @override
  Future<NearbyDevicesState> reduce() async {
    if (targets.isEmpty) {
      notifier._discoveryLogger.addLog('[DISCOVER/CROSS_SUBNET] Skipped: no scan targets');
      return state;
    }

    notifier._discoveryLogger.addLog(
      '[DISCOVER/CROSS_SUBNET] Start scan: ${targets.length} targets in ${ranges.join(', ')}${truncated ? ' (truncated)' : ''}',
    );
    final stream = external(notifier._isolateController).dispatchTakeResult(
      IsolateTargetHttpDiscoveryAction(targets: targets),
    );
    var found = 0;
    await for (final device in stream) {
      found++;
      notifier._discoveryLogger.addLog('[DISCOVER/CROSS_SUBNET] ${device.alias} (${device.ip}, model: ${device.deviceModel})');
      await dispatchAsync(RegisterDeviceAction(device));
    }
    notifier._discoveryLogger.addLog('[DISCOVER/CROSS_SUBNET] Finished scan: found $found devices');

    return state;
  }
}

/// Scans one particular subnet with traditional HTTP/TCP discovery.
/// This method awaits until the scan is finished.
class StartLegacyScan extends AsyncReduxAction<NearbyDevicesService, NearbyDevicesState> {
  final int port;
  final String localIp;
  final bool https;

  StartLegacyScan({
    required this.port,
    required this.localIp,
    required this.https,
  });

  @override
  Future<NearbyDevicesState> reduce() async {
    if (state.runningIps.contains(localIp)) {
      // already running for the same localIp
      await Future.microtask(() {});
      return state;
    }

    dispatch(_SetRunningIpsAction({...state.runningIps, localIp}));
    notifier._discoveryLogger.addLog('[DISCOVER/TCP] Start subnet scan: ${localIp.split('.').take(3).join('.')}.*:$port');

    final stream = external(notifier._isolateController).dispatchTakeResult(
      IsolateInterfaceHttpDiscoveryAction(
        networkInterface: localIp,
        port: port,
        https: https,
      ),
    );

    await for (final device in stream) {
      notifier._discoveryLogger.addLog('[DISCOVER/TCP] ${device.alias} (${device.ip}, model: ${device.deviceModel})');
      await dispatchAsync(RegisterDeviceAction(device));
    }

    notifier._discoveryLogger.addLog('[DISCOVER/TCP] Finished subnet scan: ${localIp.split('.').take(3).join('.')}.*:$port');
    return state.copyWith(
      runningIps: state.runningIps.where((ip) => ip != localIp).toSet(),
    );
  }
}

class StartFavoriteScan extends AsyncReduxAction<NearbyDevicesService, NearbyDevicesState> {
  final List<FavoriteDevice> devices;
  final bool https;

  StartFavoriteScan({
    required this.devices,
    required this.https,
  });

  @override
  Future<NearbyDevicesState> reduce() async {
    if (devices.isEmpty) {
      return state;
    }
    dispatch(_SetRunningFavoriteScanAction(true));

    final stream = external(notifier._isolateController).dispatchTakeResult(
      IsolateFavoriteHttpDiscoveryAction(
        favorites: devices.map((e) => (e.ip, e.port)).toList(),
        https: https,
      ),
    );

    await for (final device in stream) {
      notifier._discoveryLogger.addLog('[DISCOVER/TCP] ${device.alias} (${device.ip}, model: ${device.deviceModel})');
      await dispatchAsync(RegisterDeviceAction(device));
    }

    return state.copyWith(
      runningFavoriteScan: false,
    );
  }
}

String _targetKey(String ip, int port, bool https) => '$ip:$port:${https ? 'https' : 'http'}';

class _SetRunningIpsAction extends ReduxAction<NearbyDevicesService, NearbyDevicesState> {
  final Set<String> runningIps;

  _SetRunningIpsAction(this.runningIps);

  @override
  NearbyDevicesState reduce() {
    return state.copyWith(
      runningIps: runningIps,
    );
  }
}

class _SetRunningFavoriteScanAction extends ReduxAction<NearbyDevicesService, NearbyDevicesState> {
  final bool running;

  _SetRunningFavoriteScanAction(this.running);

  @override
  NearbyDevicesState reduce() {
    return state.copyWith(
      runningFavoriteScan: running,
    );
  }
}
