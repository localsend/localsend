import 'package:common/src/isolate/dto/isolate_task.dart';

class IsolateTaskStreamResult<T> {
  /// The id of the task.
  /// Corresponds to [IsolateTask.id] that started the stream.
  final int id;

  /// If true, the stream is done.
  final bool done;

  /// A single data event from the stream.
  final T? data;

  IsolateTaskStreamResult({
    required this.id,
    required this.done,
    required this.data,
  });
}
