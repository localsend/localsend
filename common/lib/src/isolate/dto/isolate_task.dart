import 'package:common/src/isolate/dto/isolate_task_result.dart';

/// A data structure that can be sent to an isolate.
/// This is used to represent the following schemas:
///
/// Main sends an [IsolateTask] -> Isolate responds with an [IsolateTaskResult]
/// Main sends an [IsolateTask] -> Isolate responds with an [IsolateTaskStreamResult]
///
/// Generally speaking, we need an exact request-response pair.
class IsolateTask<T> {
  /// The id of the task to be matched with [IsolateTaskResult.id] or [IsolateTaskStreamResult.id].
  final int id;

  /// The payload of the request.
  final T data;

  IsolateTask({
    required this.id,
    required this.data,
  });
}
