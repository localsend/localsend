import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/model/nearby_devices_state.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/task_runner.dart';

final nearbyDevicesProvider = StateNotifierProvider<NearbyDevicesNotifier, NearbyDevicesState>((ref) {
  return NearbyDevicesNotifier();
});

class NearbyDevicesNotifier extends StateNotifier<NearbyDevicesState> {
  NearbyDevicesNotifier() : super(const NearbyDevicesState(running: false, devices: []));

  Future<void> startScan({required int port, required String localIp}) async {
    if (state.running) {
      return;
    }

    state = state.copyWith(running: true);

    await _getStream(localIp, port).forEach((device) {
      state = state.copyWith(
        devices: [...state.devices, device],
      );
    });

    state = state.copyWith(running: false);
  }

  Stream<Device> _getStream(String localIp, int port) {
    final ipList = List.generate(256, (i) => '${localIp.split('.').take(3).join('.')}.$i').where((ip) => ip != localIp).toList();
    final runner = TaskRunner<Device?>(
      initialTasks: List.generate(
        ipList.length,
        (index) => () => _doRequest(ipList[index], port),
      ),
      concurrency: 50,
    );

    return runner.stream.where((device) => device != null).cast<Device>();
  }
}

final _dio = Dio(
  BaseOptions(
    connectTimeout: 2000,
    sendTimeout: 2000,
  ),
);

Future<Device?> _doRequest(String currentIp, int port) async {
  print('Requesting $currentIp');
  final url = ApiRoute.info.targetRaw(currentIp, port);
  Device? device;
  try {
    final response = await _dio.get(url);
    final dto = InfoDto.fromJson(response.data);
    device = dto.toDevice(currentIp, port);
  } on DioError catch (_) {
    device = null;
    // print('$url: ${e.error}');
  } catch (e) {
    device = null;
    // print(e);
  }
  return device;
}
