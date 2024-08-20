import 'package:common/api_route_builder.dart';
import 'package:common/constants.dart';
import 'package:common/model/device.dart';
import 'package:common/model/dto/info_dto.dart';
import 'package:common/src/isolate/child/dio_provider.dart';
import 'package:common/src/isolate/child/sync_provider.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:refena/refena.dart';

final _logger = Logger('TargetedDiscovery');

final httpTargetDiscoveryProvider = ViewProvider((ref) {
  final dio = ref.watch(dioProvider).discovery;
  final fingerprint = ref.watch(syncProvider).securityContext.certificateHash;
  return HttpTargetDiscoveryService(dio, fingerprint);
});

/// Try to discover a single device using the given IP and port.
class HttpTargetDiscoveryService {
  final Dio _dio;
  final String _fingerprint;

  HttpTargetDiscoveryService(this._dio, this._fingerprint);

  Future<Device?> discover({
    required String ip,
    required int port,
    required bool https,
    void Function(String url, Object? error)? onError = defaultErrorPrinter,
  }) async {
    // We use the legacy route to make it less breaking for older versions
    final url = ApiRoute.info.targetRaw(ip, port, https, peerProtocolVersion);
    try {
      final response = await _dio.get(url, queryParameters: {
        'fingerprint': _fingerprint,
      });
      final dto = InfoDto.fromJson(response.data);
      return dto.toDevice(ip, port, https);
    } on DioException catch (e) {
      onError?.call(url, e.error);
      return null;
    } catch (e) {
      onError?.call(url, e);
      return null;
    }
  }

  static void defaultErrorPrinter(String url, Object? error) {
    _logger.warning('$url: $error');
  }
}
