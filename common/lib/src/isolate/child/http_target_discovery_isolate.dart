import 'package:common/model/device.dart';
import 'package:common/src/isolate/child/main.dart';
import 'package:common/src/isolate/dto/isolate_task.dart';
import 'package:common/src/isolate/dto/isolate_task_result.dart';
import 'package:common/src/isolate/dto/send_to_isolate_data.dart';
import 'package:common/src/task/discovery/http_target_discovery.dart';
import 'package:meta/meta.dart';

class HttpTargetTask {
  final String ip;
  final int port;
  final bool https;

  HttpTargetTask({
    required this.ip,
    required this.port,
    required this.https,
  });
}

@internal
Future<void> setupHttpTargetDiscoveryIsolate(
  Stream<SendToIsolateData<IsolateTask<HttpTargetTask>>> receiveFromMain,
  void Function(IsolateTaskResult<Device>) sendToMain,
  InitialData initialData,
) async {
  await setupChildIsolateHelper(
    debugLabel: 'HttpTargetDiscoveryIsolate',
    receiveFromMain: receiveFromMain,
    sendToMain: sendToMain,
    initialData: initialData,
    handler: (ref, task) async {
      Object? error;
      final device = await ref.read(httpTargetDiscoveryProvider).discover(
            ip: task.data.ip,
            port: task.data.port,
            https: task.data.https,
            onError: (url, e) => error = e,
          );

      if (error != null || device == null) {
        return sendToMain(IsolateTaskErrorResult(
          id: task.id,
          error: error?.toString() ?? 'Unknown error',
        ));
      }

      sendToMain(IsolateTaskSuccessResult(
        id: task.id,
        data: device,
      ));
    },
  );
}
