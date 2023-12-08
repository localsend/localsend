import 'dart:async';

import 'package:collection/collection.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/model/state/nearby_devices_state.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/logging/discovery_logs_provider.dart';
import 'package:localsend_app/provider/network/multicast_provider.dart';
import 'package:localsend_app/provider/network/targeted_discovery_provider.dart';
import 'package:localsend_app/util/task_runner.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('NearbyDevices');

/// This provider is responsible for:
/// - Scanning the network for other LocalSend instances
/// - Keeping track of all found devices (they are only stored in RAM)
///
/// Use [scanProvider] to have a high-level API to perform discovery operations.
final nearbyDevicesProvider = ReduxProvider<NearbyDevicesService, NearbyDevicesState>((ref) {
  return NearbyDevicesService(
    discoveryLogs: ref.notifier(discoveryLoggerProvider),
    targetedDiscoveryService: ref.accessor(targetedDiscoveryProvider),
    multicastService: ref.accessor(multicastProvider),
    favoriteService: ref.notifier(favoritesProvider),
  );
});

Map<String, TaskRunner> _runners = {};

class NearbyDevicesService extends ReduxNotifier<NearbyDevicesState> {
  final DiscoveryLogger _discoveryLogs;
  final StateAccessor<TargetedDiscoveryService> _targetedDiscoveryService;
  final StateAccessor<MulticastService> _multicastService;
  final FavoritesService _favoriteService;

  NearbyDevicesService({
    required DiscoveryLogger discoveryLogs,
    required StateAccessor<TargetedDiscoveryService> targetedDiscoveryService,
    required StateAccessor<MulticastService> multicastService,
    required FavoritesService favoriteService,
  })  : _discoveryLogs = discoveryLogs,
        _targetedDiscoveryService = targetedDiscoveryService,
        _multicastService = multicastService,
        _favoriteService = favoriteService;

  @override
  NearbyDevicesState init() => const NearbyDevicesState(
        runningFavoriteScan: false,
        runningIps: {},
        devices: {},
      );

  Stream<Device> _getStream(String networkInterface, int port, bool https) {
    final ipList = List.generate(256, (i) => '${networkInterface.split('.').take(3).join('.')}.$i').where((ip) => ip != networkInterface).toList();
    _runners[networkInterface]?.stop();
    _runners[networkInterface] = TaskRunner<Device?>(
      initialTasks: List.generate(
        ipList.length,
        (index) => () async => _doRequest(ipList[index], port, https),
      ),
      concurrency: 50,
    );

    return _runners[networkInterface]!.stream.where((device) => device != null).cast<Device>();
  }

  Stream<Device> _getFavoriteStream({required List<FavoriteDevice> devices, required bool https}) {
    final runner = TaskRunner<Device?>(
      initialTasks: List.generate(
        devices.length,
        (index) => () async {
          final device = devices[index];
          return _doRequest(device.ip, device.port, https);
        },
      ),
      concurrency: 50,
    );

    return runner.stream.where((device) => device != null).cast<Device>();
  }

  Future<Device?> _doRequest(String currentIp, int port, bool https) async {
    _logger.fine('Requesting $currentIp');
    final device = await _targetedDiscoveryService.state.discover(
      ip: currentIp,
      port: port,
      https: https,
      onError: null,
    );
    if (device != null) {
      _discoveryLogs.addLog('[DISCOVER/TCP] ${device.alias} (${device.ip}, model: ${device.deviceModel})');
    }

    return device;
  }
}

/// Binds the UDP port and listens for incoming announcements.
/// This should run forever as long as the app is running.
class StartMulticastListener extends AsyncReduxAction<NearbyDevicesService, NearbyDevicesState> {
  @override
  Future<NearbyDevicesState> reduce() async {
    await for (final device in notifier._multicastService.state.startListener()) {
      await dispatchAsync(RegisterDeviceAction(device));
      notifier._discoveryLogs.addLog('[DISCOVER/UDP] ${device.alias} (${device.ip}, model: ${device.deviceModel})');
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
    final favoriteDevice = notifier._favoriteService.state.firstWhereOrNull((e) => e.fingerprint == device.fingerprint);
    if (favoriteDevice != null && !favoriteDevice.customAlias) {
      // Update existing favorite with new alias
      await external(notifier._favoriteService).dispatchAsync(UpdateFavoriteAction(favoriteDevice.copyWith(alias: device.alias)));
    }
    return state.copyWith(
      devices: {...state.devices}..update(device.ip, (_) => device, ifAbsent: () => device),
    );
  }
}

/// It does not really "scan".
/// It just sends an announcement which will cause a response on every other LocalSend member of the network.
class StartMulticastScan extends ReduxAction<NearbyDevicesService, NearbyDevicesState> {
  @override
  NearbyDevicesState reduce() {
    notifier._multicastService.state.sendAnnouncement(); // ignore: discarded_futures
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
      return state;
    }

    dispatch(_SetRunningIpsAction({...state.runningIps, localIp}));

    await for (final device in notifier._getStream(localIp, port, https)) {
      await dispatchAsync(RegisterDeviceAction(device));
    }

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
    await for (final device in notifier._getFavoriteStream(devices: devices, https: https)) {
      await dispatchAsync(RegisterDeviceAction(device));
    }
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
