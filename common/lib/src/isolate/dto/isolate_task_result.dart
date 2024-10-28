import 'package:common/src/isolate/dto/isolate_task.dart';

/// The response data structure from an [IsolateTask].
class IsolateTaskResult<T> {
  /// The id of the task to be matched with [IsolateTask.id].
  final int id;

  /// The payload of the response.
  final T data;

  IsolateTaskResult({
    required this.id,
    required this.data,
  });
}
