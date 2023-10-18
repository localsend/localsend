import 'dart:async';

import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/model/state/nearby_devices_state.dart';
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
final nearbyDevicesProvider = NotifierProvider<NearbyDevicesNotifier, NearbyDevicesState>((ref) {
  return NearbyDevicesNotifier(
    targetedDiscoveryService: ref.read(targetedDiscoveryProvider),
    multicastService: ref.read(multicastProvider),
  );
});

Map<String, TaskRunner> _runners = {};

class NearbyDevicesNotifier extends Notifier<NearbyDevicesState> {
  final TargetedDiscoveryService _targetedDiscoveryService;
  final MulticastService _multicastService;

  NearbyDevicesNotifier({
    required TargetedDiscoveryService targetedDiscoveryService,
    required MulticastService multicastService,
  })  : _targetedDiscoveryService = targetedDiscoveryService,
        _multicastService = multicastService;

  @override
  NearbyDevicesState init() => const NearbyDevicesState(
        runningIps: {},
        devices: {},
      );

  /// Binds the UDP port and listens for incoming announcements.
  /// This should run forever as long as the app is running.
  void startMulticastListener() async {
    await for (final device in _multicastService.startListener()) {
      registerDevice(device);
      ref.notifier(discoveryLogsProvider).addLog('[DISCOVER/UDP] ${device.alias} (${device.ip}, model: ${device.deviceModel})');
    }
  }

  /// It does not really "scan".
  /// It just sends an announcement which will cause a response on every other LocalSend member of the network.
  void startMulticastScan() {
    _multicastService.sendAnnouncement(); // ignore: discarded_futures
  }

  /// Scans one particular subnet with traditional HTTP/TCP discovery.
  /// This method awaits until the scan is finished.
  Future<void> startLegacyScan({required int port, required String localIp, required bool https}) async {
    if (state.runningIps.contains(localIp)) {
      // already running for the same localIp
      return;
    }

    state = state.copyWith(runningIps: {...state.runningIps, localIp});

    await for (final device in _getStream(localIp, port, https)) {
      registerDevice(device);
    }

    state = state.copyWith(runningIps: state.runningIps.where((ip) => ip != localIp).toSet());
  }

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

  Future<void> startFavoriteScan({required List<FavoriteDevice> devices, required bool https}) async {
    if (devices.isEmpty) {
      return;
    }
    await for (final device in _getFavoriteStream(devices: devices, https: https)) {
      registerDevice(device);
    }
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

  void registerDevice(Device device) {
    state = state.copyWith(
      devices: {...state.devices}..update(device.ip, (_) => device, ifAbsent: () => device),
    );
  }

  void clearFoundDevices() {
    state = state.copyWith(devices: {});
  }

  Future<Device?> _doRequest(String currentIp, int port, bool https) async {
    _logger.fine('Requesting $currentIp');
    final device = await _targetedDiscoveryService.discover(
      ip: currentIp,
      port: port,
      https: https,
      onError: null,
    );
    if (device != null) {
      ref.notifier(discoveryLogsProvider).addLog('[DISCOVER/TCP] ${device.alias} (${device.ip}, model: ${device.deviceModel})');
    }

    return device;
  }
}
