import 'package:common/src/isolate/dto/isolate_task_result.dart';

sealed class BaseIsolateTask<T> {}

/// A data structure that can be sent to an isolate.
/// This is used to represent the following schemas:
///
/// Main sends an [IsolateTask] -> Isolate responds with an [IsolateTaskResult]
/// Main sends an [IsolateTask] -> Isolate responds with an [IsolateTaskStreamResult]
///
/// Generally speaking, we need an exact request-response pair.
class IsolateTask<T> implements BaseIsolateTask<T> {
  /// The id of the task to be matched with [IsolateTaskResult.id] or [IsolateTaskStreamResult.id].
  final int id;

  /// The payload of the request.
  final T data;

  IsolateTask({
    required this.id,
    required this.data,
  });
}

/// Stream version of [IsolateTask].
class IsolateStreamTask<T> implements BaseIsolateTask<T> {
  /// The id of the task to be matched with [IsolateTaskResult.id] or [IsolateTaskStreamResult.id].
  final int id;

  /// If true, the stream is done.
  final bool done;

  /// The payload of the request.
  final T? data;

  IsolateStreamTask.event({
    required this.id,
    required this.data,
  }) : done = false;

  IsolateStreamTask.done({
    required this.id,
  })  : done = true,
        data = null;
}
