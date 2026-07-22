import 'package:localsend_isolates/api_route_builder.dart';
import 'package:localsend_isolates/constants.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/rust/api/http.dart';
import 'package:localsend_isolates/rust/api/model.dart' as rust_model;
import 'package:localsend_isolates/src/isolate/child/http_provider.dart';
import 'package:localsend_isolates/src/isolate/child/sync_provider.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('TargetedDiscovery');

final httpTargetDiscoveryProvider = ViewProvider((ref) {
  final client = ref.watch(httpProvider).discovery;
  final syncState = ref.watch(syncProvider);
  return HttpTargetDiscoveryService(
    client,
    syncState.toRegisterDto(),
    syncState.securityContext.certificateHash,
  );
});

/// Try to discover a single device using the given IP and port.
class HttpTargetDiscoveryService {
  final RsHttpClient _client;
  final rust_model.RegisterDto _registerDto;
  final String _fingerprint;

  HttpTargetDiscoveryService(this._client, this._registerDto, this._fingerprint);

  Future<Device?> discover({
    required String ip,
    required int port,
    required bool https,
    void Function(String url, Object? error)? onError = defaultErrorPrinter,
  }) async {
    final url = ApiRoute.register.targetRaw(ip, port, https, protocolVersion);
    try {
      final response = await _client.register(
        protocol: https ? rust_model.ProtocolType.https : rust_model.ProtocolType.http,
        ip: ip,
        port: port,
        payload: _registerDto,
      );
      if (response.body.token == _fingerprint) {
        // discovered itself
        return null;
      }
      return response.body.toDevice(ip, port, https, HttpDiscovery(ip: ip));
    } catch (e) {
      onError?.call(url, e);
      return null;
    }
  }

  static void defaultErrorPrinter(String url, Object? error) {
    _logger.warning('$url: $error');
  }
}
