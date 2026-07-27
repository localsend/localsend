import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/src/task/discovery/http_target_discovery.dart';
import 'package:logging/logging.dart';
import 'package:pool/pool.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('HttpScanDiscovery');

const _concurrency = 50;

final httpScanDiscoveryProvider = ViewProvider((ref) {
  return HttpScanDiscoveryService(
    targetedDiscoveryService: ref.accessor(httpTargetDiscoveryProvider),
  );
});

class _CancelToken {
  bool cancelled = false;
}

/// The token of the currently running scan per network interface.
Map<String, _CancelToken> _cancelTokens = {};

class HttpScanDiscoveryService {
  final StateAccessor<HttpTargetDiscoveryService> _targetedDiscoveryService;

  HttpScanDiscoveryService({
    required StateAccessor<HttpTargetDiscoveryService> targetedDiscoveryService,
  }) : _targetedDiscoveryService = targetedDiscoveryService;

  Stream<Device> getStream({required String networkInterface, required int port, required bool https}) {
    final ipList = List.generate(256, (i) => '${networkInterface.split('.').take(3).join('.')}.$i').where((ip) => ip != networkInterface).toList();

    // Let the previous scan of this interface skip its remaining requests, so its stream ends.
    _cancelTokens[networkInterface]?.cancelled = true;
    final token = _cancelTokens[networkInterface] = _CancelToken();

    final stream = Pool(_concurrency).forEach<String, Device?>(ipList, (ip) async => token.cancelled ? null : _doRequest(ip, port, https));
    return stream.where((device) => device != null).cast<Device>();
  }

  Stream<Device> getFavoriteStream({required List<(String, int)> devices, required bool https}) {
    final stream = Pool(_concurrency).forEach<(String, int), Device?>(devices, (device) => _doRequest(device.$1, device.$2, https));
    return stream.where((device) => device != null).cast<Device>();
  }

  Future<Device?> _doRequest(String currentIp, int port, bool https) async {
    _logger.fine('Requesting $currentIp');
    final device = await _targetedDiscoveryService.state.discover(
      ip: currentIp,
      port: port,
      https: https,
      onError: null,
    );
    if (device != null) {
      _logger.info('[DISCOVER/TCP] ${device.alias} (${device.ip}, model: ${device.deviceModel})');
    }

    return device;
  }
}
