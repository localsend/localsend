import 'dart:io';

import 'package:common/api_route_builder.dart';
import 'package:common/common.dart';
import 'package:common/isolate/isolate_child_controller.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:logging/logging.dart';
import 'package:refena/refena.dart';

final _logger = Logger('TcpDiscovery');

final targetedDiscoveryProvider = ViewProvider((ref) {
  final commonState = ref.watch(isolateChildProvider.select((state) => state.commonState));

  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: defaultDiscoveryTimeout),
      sendTimeout: Duration(milliseconds: defaultDiscoveryTimeout),
    ),
  );

  // Allow any self signed certificate
  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient(
        context: SecurityContext()
          ..usePrivateKeyBytes(commonState.securityContext.privateKey.codeUnits)
          ..useCertificateChainBytes(securityContext.certificate.codeUnits),
      );
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    },
  );
  final fingerprint = ref.watch(securityProvider).certificateHash;
  return TargetedDiscoveryService(dio, fingerprint);
});

/// Try to discover a single device using the given IP and port.
class TargetedDiscoveryService {
  final Dio _dio;
  final String _fingerprint;

  TargetedDiscoveryService(this._dio, this._fingerprint);

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
