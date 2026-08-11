import 'dart:async';

import 'package:collection/collection.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/model/state/nearby_devices_state.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/logging/discovery_logs_provider.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:localsend_isolates/model/device.dart';
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
    discoveryLogs: ref.notifier(discoveryLoggerProvider),
  );
});

class NearbyDevicesService extends ReduxNotifier<NearbyDevicesState> {
  final IsolateController _isolateController;
  final FavoritesService _favoriteService;
  final DiscoveryLogger _discoveryLogger;

  NearbyDevicesService({
    required IsolateController isolateController,
    required FavoritesService favoriteService,
    required DiscoveryLogger discoveryLogs,
  }) : _discoveryLogger = discoveryLogs,
       _isolateController = isolateController,
       _favoriteService = favoriteService;

  @override
  NearbyDevicesState init() => const NearbyDevicesState(
    runningFavoriteScan: false,
    runningIps: {},
    devices: {},
    signalingDevices: {},
  );
}

/// Starts the discovery (which binds the UDP port) and registers every
/// confirmed device: answered announcements, scan results and devices fed in
/// via [IsolateDiscoveryAddDeviceAction] all arrive on this one stream.
/// This should run forever as long as the app is running.
class StartDiscoveryListener extends AsyncReduxAction<NearbyDevicesService, NearbyDevicesState> {
  @override
  Future<NearbyDevicesState> reduce() async {
    final stream = external(notifier._isolateController).dispatchTakeResult(IsolateDiscoveryListenAction());
    await for (final device in stream) {
      await dispatchAsync(RegisterDeviceAction(device));
      notifier._discoveryLogger.addLog('[DISCOVER] ${device.alias} (${device.ip}, model: ${device.deviceModel})');
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
/// It will override any existing device with the same fingerprint: the
/// incoming device is the merged store state, so it already carries every
/// address the device was confirmed on.
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
    return state.copyWith(
      devices: {...state.devices}..update(device.fingerprint, (_) => device, ifAbsent: () => device),
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
    external(notifier._isolateController).dispatch(IsolateDiscoveryAnnouncementAction());
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

    // The found devices arrive on the [StartDiscoveryListener] stream;
    // this stream only signals when the scan is finished.
    await external(notifier._isolateController)
        .dispatchTakeResult(
          IsolateDiscoverySubnetScanAction(
            networkInterface: localIp,
            port: port,
            https: https,
          ),
        )
        .drain<void>();

    return state.copyWith(
      runningIps: state.runningIps.where((ip) => ip != localIp).toSet(),
    );
  }
}

/// Discovers devices in stages, cheapest first: multicast announcement and
/// favorite probes right away, a subnet scan of [interfaces] only when
/// nothing was confirmed within the grace period.
/// This method awaits until every stage is finished.
class StartStagedScan extends AsyncReduxAction<NearbyDevicesService, NearbyDevicesState> {
  final List<FavoriteDevice> favorites;
  final List<String> interfaces;
  final int port;
  final bool https;
  final Duration grace;

  StartStagedScan({
    required this.favorites,
    required this.interfaces,
    required this.port,
    required this.https,
    required this.grace,
  });

  @override
  Future<NearbyDevicesState> reduce() async {
    dispatch(_SetRunningFavoriteScanAction(true));

    // The found devices arrive on the [StartDiscoveryListener] stream;
    // this stream only signals when every stage has finished.
    await external(notifier._isolateController)
        .dispatchTakeResult(
          IsolateDiscoveryStagedScanAction(
            favorites: favorites.map((e) => (e.ip, e.port)).toList(),
            networkInterfaces: interfaces,
            port: port,
            https: https,
            grace: grace,
          ),
        )
        .drain<void>();

    return state.copyWith(
      runningFavoriteScan: false,
    );
  }
}

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
