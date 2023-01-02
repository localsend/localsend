import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/util/api_route_builder.dart';

final targetedDiscoveryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider(2 * 1000));
  return TargetedDiscoveryService(dio);
});

/// Try to discover a single device using the given IP and port.
class TargetedDiscoveryService {
  final Dio _dio;

  TargetedDiscoveryService(this._dio);

  Future<Device?> discover(String ip, int port) async {
    final url = ApiRoute.info.targetRaw(ip, port);
    Device? device;
    try {
      final response = await _dio.get(url);
      final dto = InfoDto.fromJson(response.data);
      device = dto.toDevice(ip, port);
    } on DioError catch (e) {
      device = null;
      print('$url: ${e.error}');
    } catch (e) {
      device = null;
      print(e);
    }
    return device;
  }
}
