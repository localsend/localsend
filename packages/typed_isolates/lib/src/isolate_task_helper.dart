import 'dart:async';

import 'package:typed_isolates/src/id_provider.dart';
import 'package:typed_isolates/src/isolate_helper.dart';
import 'package:typed_isolates/src/isolate_task.dart';
import 'package:typed_isolates/src/isolate_task_result.dart';

/// Helpers for connectors whose child isolate replies with
/// [IsolateTaskStreamResult]s (the request / streamed-response pattern).
extension IsolateTaskStreamConnector<R, S> on IsolateConnector<IsolateTaskStreamResult<R>, S> {
  /// Listens to the responses of an already-sent task with [taskId] and
  /// transforms the [IsolateTaskStreamResult]s into a plain [Stream].
  Stream<R> convertResponseToStream({
    required int taskId,
  }) {
    final controller = StreamController<R>();
    late StreamSubscription subscription;
    subscription = receiveFromIsolate.listen((result) {
      if (result.id == taskId) {
        if (result.data != null) {
          controller.add(result.data as R);
        } else if (result.done) {
          if (result.error != null) {
            controller.addError(result.error!);
          } else {
            subscription.cancel(); // ignore: discarded_futures
            controller.close(); // ignore: discarded_futures
          }
        }
      }
    });

    return controller.stream;
  }
}

/// Helpers for connectors that send bare [IsolateTask]s (no envelope).
extension IsolateTaskConnector<R, T> on IsolateConnector<IsolateTaskStreamResult<R>, IsolateTask<T>> {
  /// Sends a [task] to the isolate and transforms the responded
  /// [IsolateTaskStreamResult]s into a plain [Stream].
  ///
  /// The [task] is wrapped in an [IsolateTask] with a unique id (taken from
  /// [IdProvider.instance], or [taskId] if provided).
  ///
  /// If the connector sends a custom envelope instead of a bare [IsolateTask],
  /// wrap and send the task yourself and use [convertResponseToStream].
  Stream<R> sendTaskAndListenStream({
    required T task,
    int? taskId,
  }) {
    final isolateTask = IsolateTask(
      id: taskId ?? IdProvider.instance.getNextId(),
      data: task,
    );

    // ignore: discarded_futures
    Future.microtask(() {
      sendToIsolate(isolateTask);
    });

    return convertResponseToStream(taskId: isolateTask.id);
  }
}
