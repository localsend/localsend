import 'package:common/model/device.dart';
import 'package:common/src/discovery/http_target_discovery.dart';
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

class HttpScanDiscoveryService {
  final StateAccessor<HttpTargetDiscoveryService> _targetedDiscoveryService;

  HttpScanDiscoveryService({
    required StateAccessor<HttpTargetDiscoveryService> targetedDiscoveryService,
  }) : _targetedDiscoveryService = targetedDiscoveryService;

  Stream<Device> getStream({required String networkInterface, required int port, required bool https}) {
    final ipList = List.generate(256, (i) => '${networkInterface.split('.').take(3).join('.')}.$i').where((ip) => ip != networkInterface).toList();
    _runners[networkInterface]?.stop();
    _runners[networkInterface] = TaskRunner<Device?>(
      initialTasks: List.generate(
        ipList.length,
        (index) => () async => _doRequest(ipList[index], port, https),
      ),
      concurrency: 50,
    );

    return _runners[networkInterface]!.stream.where((device) => device != null).cast<Device>();
  }

  Stream<Device> getFavoriteStream({required List<(String, int)> devices, required bool https}) {
    final runner = TaskRunner<Device?>(
      initialTasks: List.generate(
        devices.length,
        (index) => () async {
          final device = devices[index];
          return _doRequest(device.$1, device.$2, https);
        },
      ),
      concurrency: 50,
    );

    return runner.stream.where((device) => device != null).cast<Device>();
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
