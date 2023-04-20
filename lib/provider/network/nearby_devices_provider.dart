import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/model/state/nearby_devices_state.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/provider/fingerprint_provider.dart';
import 'package:localsend_app/provider/network/multicast_provider.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/task_runner.dart';

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
    _fingerprint = ref.watch(fingerprintProvider);
    _multicastService = ref.watch(multicastProvider);
    return const NearbyDevicesState(
      runningIps: {},
      devices: {},
    );
  }

  void startMulticastListener() {
    _multicastService.startListener().listen(registerDevice);
  }

  /// It does not really "scan".
  /// It just sends an announcement which will cause a response on every other LocalSend member of the network.
  /// The responses have to be listened to by calling [startMulticastListener] first.
  void startMulticastScan() {
    unawaited(_multicastService.sendAnnouncement());
  }

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
        (index) => () async => _doRequest(_dio, ipList[index], port, https, fingerprint),
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
}

Future<Device?> _doRequest(Dio dio, String currentIp, int port, bool https, String fingerprint) async {
  print('Requesting $currentIp');
  // We use the legacy route to make it less breaking for older versions
  final url = ApiRoute.info.targetRaw(currentIp, port, https, peerProtocolVersion);
  Device? device;
  try {
    final response = await dio.get(url, queryParameters: {
      'fingerprint': fingerprint,
    });
    final dto = InfoDto.fromJson(response.data);
    device = dto.toDevice(currentIp, port, https);
  } on DioError catch (_) {
    device = null;
  } catch (e) {
    device = null;
  }
  return device;
}
