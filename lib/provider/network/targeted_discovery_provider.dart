import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/util/api_route_builder.dart';

final targetedDiscoveryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider(DioType.discovery));
  final fingerprint = ref.watch(securityProvider).certificateHash;
  return TargetedDiscoveryService(dio, fingerprint);
});

/// Try to discover a single device using the given IP and port.
class TargetedDiscoveryService {
  final Dio _dio;
  final String _fingerprint;

  TargetedDiscoveryService(this._dio, this._fingerprint);

  Future<Device?> discover(String ip, int port, bool https) async {
    final url = ApiRoute.info.targetRaw(ip, port, https, peerProtocolVersion);
    Device? device;
    try {
      final response = await _dio.get(url, queryParameters: {
        'fingerprint': _fingerprint,
      });
      final dto = InfoDto.fromJson(response.data);
      device = dto.toDevice(ip, port, https);
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
