import 'dart:async';

import 'package:common/src/isolate/dto/isolate_task_result.dart';
import 'package:common/src/util/isolate_helper.dart';

Stream<R> adaptIsolateTaskStream<R, S>({
  required int taskId,
  required IsolateConnector<IsolateTaskStreamResult<R>, S> connection,
}) {
  late final StreamController<R> controller;
  late final StreamSubscription<IsolateTaskStreamResult<R>> subscription;
  var terminated = false;

  Future<void> terminate({Object? error, StackTrace? stackTrace}) async {
    if (terminated) {
      return;
    }

    terminated = true;
    if (error != null) {
      controller.addError(error, stackTrace);
    }

    await subscription.cancel();
    await controller.close();
  }

  controller = StreamController<R>(
    onCancel: () => terminate(),
  );

  subscription = connection.receiveFromIsolate.listen((result) {
    if (terminated || result.id != taskId) {
      return;
    }

    final data = result.data;
    if (data != null) {
      controller.add(data);
      return;
    }

    if (!result.done) {
      return;
    }

    if (result.error != null) {
      unawaited(terminate(error: result.error));
    } else {
      unawaited(terminate());
    }
  });

  return controller.stream;
}
