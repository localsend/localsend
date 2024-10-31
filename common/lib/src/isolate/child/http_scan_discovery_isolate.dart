import 'package:common/model/device.dart';
import 'package:common/src/isolate/child/main.dart';
import 'package:common/src/isolate/dto/isolate_task.dart';
import 'package:common/src/isolate/dto/isolate_task_result.dart';
import 'package:common/src/isolate/dto/send_to_isolate_data.dart';
import 'package:common/src/task/discovery/http_scan_discovery.dart';
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
    handler: (ref, task) async {
      final stream = switch (task.data) {
        HttpInterfaceScanTask data => ref.read(httpScanDiscoveryProvider).getStream(
              networkInterface: data.networkInterface,
              port: data.port,
              https: data.https,
            ),
        HttpFavoriteScanTask data => ref.read(httpScanDiscoveryProvider).getFavoriteStream(
              devices: data.favorites,
              https: data.https,
            ),
      };
      await for (final device in stream) {
        sendToMain(IsolateTaskStreamResult.event(
          id: task.id,
          data: device,
        ));
      }
      sendToMain(IsolateTaskStreamResult.done(
        id: task.id,
      ));
    },
  );
}
