import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/model/nearby_devices_state.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/provider/fingerprint_provider.dart';
import 'package:localsend_app/provider/network/multicast_provider.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/task_runner.dart';

final nearbyDevicesProvider = StateNotifierProvider<NearbyDevicesNotifier, NearbyDevicesState>((ref) {
  final dio = ref.watch(dioProvider(DioType.discovery));
  final fingerprint = ref.watch(fingerprintProvider);
  final multicastService = ref.watch(multicastProvider);
  return NearbyDevicesNotifier(dio, fingerprint, multicastService);
});

Map<String, TaskRunner> _runners = {};

class NearbyDevicesNotifier extends StateNotifier<NearbyDevicesState> {
  final Dio _dio;
  final String _fingerprint;
  final MulticastService _multicastService;

  NearbyDevicesNotifier(this._dio, this._fingerprint, this._multicastService) : super(const NearbyDevicesState(runningIps: {}, devices: {}));

  void startMulticastListener() {
    _multicastService.startListener().listen(_addDevice);
  }

  /// It does not really "scan".
  /// It just sends an announcement which will cause a response on every other LocalSend member of the network.
  /// The responses have to be listened to by calling [startMulticastListener] first.
  void startMulticastScan() {
    _multicastService.sendAnnouncement();
  }

  Future<void> startScan({required int port, required String localIp, required bool https}) async {
    if (state.runningIps.contains(localIp)) {
      // already running for the same localIp
      return;
    }

    state = state.copyWith(runningIps: {...state.runningIps, localIp});

    await _getStream(localIp, port, https, _fingerprint).forEach(_addDevice);

    state = state.copyWith(runningIps: state.runningIps.where((ip) => ip != localIp).toSet());
  }

  Stream<Device> _getStream(String localIp, int port, bool https, String fingerprint) {
    final ipList = List.generate(256, (i) => '${localIp.split('.').take(3).join('.')}.$i').where((ip) => ip != localIp).toList();
    _runners[localIp]?.stop();
    _runners[localIp] = TaskRunner<Device?>(
      initialTasks: List.generate(
        ipList.length,
        (index) => () => _doRequest(_dio, ipList[index], port, https, fingerprint),
      ),
      concurrency: 50,
    );

    return _runners[localIp]!.stream.where((device) => device != null).cast<Device>();
  }

  void _addDevice(Device device) {
    state = state.copyWith(
      devices: {...state.devices}..update(device.ip, (_) => device, ifAbsent: () => device),
    );
  }
}

Future<Device?> _doRequest(Dio dio, String currentIp, int port, bool https, String fingerprint) async {
  print('Requesting $currentIp');
  final url = ApiRoute.info.targetRaw(currentIp, port, https);
  Device? device;
  try {
    final response = await dio.get(url, queryParameters: {
      'fingerprint': fingerprint,
    });
    final dto = InfoDto.fromJson(response.data);
    device = dto.toDevice(currentIp, port, https);
  } on DioError catch (_) {
    device = null;
    // print('$url: ${e.error}');
  } catch (e) {
    device = null;
    // print(e);
  }
  return device;
}
