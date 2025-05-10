import 'package:common/api_route_builder.dart';
import 'package:common/constants.dart';
import 'package:common/model/device.dart';
import 'package:common/model/dto/info_dto.dart';
import 'package:common/src/isolate/child/http_provider.dart';
import 'package:common/src/isolate/child/sync_provider.dart';
import 'package:logging/logging.dart';
import 'package:refena/refena.dart';

final _logger = Logger('TargetedDiscovery');

final httpTargetDiscoveryProvider = ViewProvider((ref) {
  final client = ref.watch(httpProvider).discovery;
  final fingerprint = ref.watch(syncProvider).securityContext.certificateHash;
  return HttpTargetDiscoveryService(client, fingerprint);
});

/// Try to discover a single device using the given IP and port.
class HttpTargetDiscoveryService {
  final CustomHttpClient _client;
  final String _fingerprint;

  HttpTargetDiscoveryService(this._client, this._fingerprint);

  Future<Device?> discover({
    required String ip,
    required int port,
    required bool https,
    void Function(String url, Object? error)? onError = defaultErrorPrinter,
  }) async {
    // We use the legacy route to make it less breaking for older versions
    final url = ApiRoute.info.targetRaw(ip, port, https, peerProtocolVersion);
    try {
      final response = await _client.get(uri: url, query: {
        'fingerprint': _fingerprint,
      });
      final dto = InfoDtoMapper.deserialize(response);
      return dto.toDevice(ip, port, https, HttpDiscovery(ip: ip));
    } catch (e) {
      onError?.call(url, e);
      return null;
    }
  }

  static void defaultErrorPrinter(String url, Object? error) {
    _logger.warning('$url: $error');
  }
}
