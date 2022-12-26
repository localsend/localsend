import 'package:dio/dio.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/sleep.dart';
import 'package:localsend_app/util/task_runner.dart';

final _dio = Dio(
  BaseOptions(
    connectTimeout: 2000,
    sendTimeout: 2000,
  ),
);

const _concurrentRequests = 50;

class PollingService {
  final List<String> _possibleIps;
  final int port;
  final String myIp;
  int _requestCount = 0;
  bool _running = false;

  PollingService(this.myIp, this.port)
      : _possibleIps = List.generate(256, (i) => '${myIp.split('.').take(3).join('.')}.$i').where((ip) => ip != myIp).toList();

  Stream<List<Device>> startPolling() async* {
    if (_running) {
      print('Already running poll.');
      return;
    }
    _running = true;
    final deviceMap = <String, Device>{}; // ip -> device
    final runner = TaskRunner<int, _RunnerResult>(
      task: _doRequest,
      maxConcurrentTasks: _concurrentRequests,
    );

    runner.addAll(List.generate(_concurrentRequests, (i) => i));

    await for (final result in runner.stream) {
      final device = result.device;
      if (device != null) {
        deviceMap[device.ip] = device;
        yield deviceMap.values.toList();
      }

      if (_requestCount >= 1024) {
        _running = false;
      }
      if (_running) {
        _requestCount++;
        // print('#$_requestCount');
        runner.add((result.index + _concurrentRequests) % _possibleIps.length);
      }
    }
  }

  Future<_RunnerResult> _doRequest(int index) async {
    if (_requestCount > _possibleIps.length * 2) {
      await sleepAsync(2000);
    } else if (_requestCount > _possibleIps.length) {
      await sleepAsync(1000);
    }

    final String currentIp = _possibleIps[index];
    // print('Requesting $currentIp');
    final url = ApiRoute.info.targetRaw(currentIp, port);
    Device? device;
    try {
      final response = await _dio.get(url);
      final dto = InfoDto.fromJson(response.data);
      device = dto.toDevice(currentIp, port);
    } on DioError catch (e) {
      device = null;
      // print('$url: ${e.error}');
    } catch (e) {
      device = null;
      // print(e);
    }
    return _RunnerResult(index, device);
  }

  void cancel() {
    _running = true;
  }
}

class _RunnerResult {
  final int index;
  final Device? device;

  _RunnerResult(this.index, this.device);
}
