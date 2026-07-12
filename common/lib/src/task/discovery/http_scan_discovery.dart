import 'package:common/model/device.dart';
import 'package:common/src/task/discovery/http_target_discovery.dart';
import 'package:common/util/task_runner.dart';
import 'package:logging/logging.dart';
import 'package:refena/refena.dart';

final _logger = Logger('HttpScanDiscovery');

final httpScanDiscoveryProvider = ViewProvider((ref) {
  return HttpScanDiscoveryService(
    targetedDiscoveryService: ref.accessor(httpTargetDiscoveryProvider),
  );
});

Map<String, TaskRunner> _runners = {};

class HttpDiscoveryTarget {
  final String ip;
  final int port;
  final bool https;

  const HttpDiscoveryTarget({
    required this.ip,
    required this.port,
    required this.https,
  });

  String get key => '$ip:$port:${https ? 'https' : 'http'}';

  @override
  String toString() => '${https ? 'https' : 'http'}://$ip:$port';
}

class HttpScanDiscoveryService {
  final StateAccessor<HttpTargetDiscoveryService> _targetedDiscoveryService;

  HttpScanDiscoveryService({
    required StateAccessor<HttpTargetDiscoveryService> targetedDiscoveryService,
  }) : _targetedDiscoveryService = targetedDiscoveryService;

  Stream<Device> getStream({
    required String networkInterface,
    required int port,
    required bool https,
  }) {
    final ipList = List.generate(
      256,
      (i) => '${networkInterface.split('.').take(3).join('.')}.$i',
    ).where((ip) => ip != networkInterface).toList();
    _runners[networkInterface]?.stop();
    _logger.info(
      '[DISCOVER/TCP] Start subnet scan: ${networkInterface.split('.').take(3).join('.')}.*:$port (${https ? 'HTTPS' : 'HTTP'})',
    );
    _runners[networkInterface] = TaskRunner<Device?>(
      initialTasks: List.generate(
        ipList.length,
        (index) =>
            () async => _doRequest(ipList[index], port, https),
      ),
      concurrency: 50,
      onFinish: () {
        _logger.info(
          '[DISCOVER/TCP] Finished subnet scan: ${networkInterface.split('.').take(3).join('.')}.*:$port',
        );
      },
    );

    return _runners[networkInterface]!.stream
        .where((device) => device != null)
        .cast<Device>();
  }

  Stream<Device> getFavoriteStream({
    required List<(String, int)> devices,
    required bool https,
  }) {
    final runner = TaskRunner<Device?>(
      initialTasks: List.generate(
        devices.length,
        (index) => () async {
          final device = devices[index];
          return _doRequest(device.$1, device.$2, https);
        },
      ),
      concurrency: 50,
      onFinish: () {
        _logger.info(
          '[DISCOVER/TCP] Finished favorite scan (${devices.length} targets)',
        );
      },
    );

    return runner.stream.where((device) => device != null).cast<Device>();
  }

  Stream<Device> getTargetStream({required List<HttpDiscoveryTarget> targets}) {
    final dedupedTargets = {
      for (final target in targets) target.key: target,
    }.values.toList();
    _logger.info(
      '[DISCOVER/TCP] Start target scan (${dedupedTargets.length} targets)',
    );
    final runner = TaskRunner<Device?>(
      initialTasks: List.generate(dedupedTargets.length, (index) {
        final target = dedupedTargets[index];
        return () async => _doRequest(target.ip, target.port, target.https);
      }),
      concurrency: 50,
      onFinish: () {
        _logger.info(
          '[DISCOVER/TCP] Finished target scan (${dedupedTargets.length} targets)',
        );
      },
    );

    return runner.stream.where((device) => device != null).cast<Device>();
  }

  Future<Device?> _doRequest(String currentIp, int port, bool https) async {
    _logger.fine('Requesting $currentIp');
    final device = await _targetedDiscoveryService.state.discover(
      ip: currentIp,
      port: port,
      https: https,
      onError: (url, error) {
        _logger.fine('[DISCOVER/TCP] Failed to discover $url: $error');
      },
    );
    if (device != null) {
      _logger.info(
        '[DISCOVER/TCP] ${device.alias} (${device.ip}, model: ${device.deviceModel})',
      );
    }

    return device;
  }
}
