import 'package:common/model/device.dart';
import 'package:common/src/discovery/http_scan_discovery.dart';
import 'package:common/src/isolate/child/main.dart';
import 'package:common/src/isolate/dto/isolate_task.dart';
import 'package:common/src/isolate/dto/isolate_task_stream_result.dart';
import 'package:common/src/isolate/dto/send_to_isolate_data.dart';
import 'package:meta/meta.dart';

sealed class HttpScanTask {}

class HttpInterfaceScanTask implements HttpScanTask {
  final String networkInterface;
  final int port;
  final bool https;

  HttpInterfaceScanTask({
    required this.networkInterface,
    required this.port,
    required this.https,
  });
}

class HttpFavoriteScanTask implements HttpScanTask {
  final List<(String, int)> favorites;
  final bool https;

  HttpFavoriteScanTask({
    required this.favorites,
    required this.https,
  });
}

@internal
Future<void> setupHttpScanDiscoveryIsolate(
  Stream<SendToIsolateData<IsolateTask<HttpScanTask>>> receiveFromMain,
  void Function(IsolateTaskStreamResult<Device>) sendToMain,
  InitialData initialData,
) async {
  await setupChildIsolateHelper(
    debugLabel: 'HttpScanDiscoveryIsolate',
    receiveFromMain: receiveFromMain,
    sendToMain: sendToMain,
    initialData: initialData,
    handler: (task) async {
      final stream = switch (task.data) {
        HttpInterfaceScanTask data => isolateContainer.read(httpScanDiscoveryProvider).getStream(
              networkInterface: data.networkInterface,
              port: data.port,
              https: data.https,
            ),
        HttpFavoriteScanTask data => isolateContainer.read(httpScanDiscoveryProvider).getFavoriteStream(
              devices: data.favorites,
              https: data.https,
            ),
      };
      await for (final device in stream) {
        sendToMain(IsolateTaskStreamResult(
          id: task.id,
          done: false,
          data: device,
        ));
      }
      sendToMain(IsolateTaskStreamResult(
        id: task.id,
        done: true,
        data: null,
      ));
    },
  );
}
