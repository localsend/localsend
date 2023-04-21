import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/model/state/nearby_devices_state.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/provider/logging/discovery_logs_provider.dart';
import 'package:localsend_app/provider/network/multicast_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/task_runner.dart';

/// This provider is responsible for:
/// - Scanning the network for other LocalSend instances
/// - Keeping track of all found devices (they are only stored in RAM)
///
/// Use [scanProvider] to have a high-level API to perform discovery operations.
final nearbyDevicesProvider = NotifierProvider<NearbyDevicesNotifier, NearbyDevicesState>(() {
  return NearbyDevicesNotifier();
});

Map<String, TaskRunner> _runners = {};

class NearbyDevicesNotifier extends Notifier<NearbyDevicesState> {
  late Dio _dio;
  late String _fingerprint;
  late MulticastService _multicastService;

  NearbyDevicesNotifier();

  @override
  NearbyDevicesState build() {
    _dio = ref.watch(dioProvider(DioType.discovery));
    _fingerprint = ref.watch(securityProvider).certificateHash;
    _multicastService = ref.watch(multicastProvider);
    return const NearbyDevicesState(
      runningIps: {},
      devices: {},
    );
  }

  /// Binds the UDP port and listens for incoming announcements.
  /// This should run forever as long as the app is running.
  void startMulticastListener() async {
    await for (final device in _multicastService.startListener()) {
      registerDevice(device);
      ref.read(discoveryLogsProvider.notifier).addLog('[DISCOVER/UDP] ${device.alias} (${device.ip}, model: ${device.deviceModel})');
    }
  }

  /// It does not really "scan".
  /// It just sends an announcement which will cause a response on every other LocalSend member of the network.
  void startMulticastScan() {
    _multicastService.sendAnnouncement(); // ignore: discarded_futures
  }

  /// Scans one particular subnet with traditional HTTP/TCP discovery.
  /// This method awaits until the scan is finished.
  Future<void> startScan({required int port, required String localIp, required bool https}) async {
    if (state.runningIps.contains(localIp)) {
      // already running for the same localIp
      return;
    }

    state = state.copyWith(runningIps: {...state.runningIps, localIp});

    await for (final device in _getStream(localIp, port, https, _fingerprint)) {
      registerDevice(device);
    }

    state = state.copyWith(runningIps: state.runningIps.where((ip) => ip != localIp).toSet());
  }

  Stream<Device> _getStream(String networkInterface, int port, bool https, String fingerprint) {
    final ipList = List.generate(256, (i) => '${networkInterface.split('.').take(3).join('.')}.$i').where((ip) => ip != networkInterface).toList();
    _runners[networkInterface]?.stop();
    _runners[networkInterface] = TaskRunner<Device?>(
      initialTasks: List.generate(
        ipList.length,
        (index) => () async => _doRequest(ipList[index], port, https, fingerprint),
      ),
      concurrency: 50,
    );

    return _runners[networkInterface]!.stream.where((device) => device != null).cast<Device>();
  }

  void registerDevice(Device device) {
    state = state.copyWith(
      devices: {...state.devices}..update(device.ip, (_) => device, ifAbsent: () => device),
    );
  }

  Future<Device?> _doRequest(String currentIp, int port, bool https, String fingerprint) async {
    print('Requesting $currentIp');
    // We use the legacy route to make it less breaking for older versions
    final url = ApiRoute.info.targetRaw(currentIp, port, https, peerProtocolVersion);
    Device? device;
    try {
      final response = await _dio.get(url, queryParameters: {
        'fingerprint': fingerprint,
      });
      final dto = InfoDto.fromJson(response.data);
      device = dto.toDevice(currentIp, port, https);
      ref.read(discoveryLogsProvider.notifier).addLog('[DISCOVER/TCP] ${device.alias} (${device.ip}, model: ${device.deviceModel})');
    } on DioError catch (_) {
      device = null;
    } catch (e) {
      device = null;
    }
    return device;
  }
}
