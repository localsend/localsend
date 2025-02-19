import 'package:common/src/isolate/dto/isolate_task.dart';

/// The response data structure from an [IsolateTask].
sealed class IsolateTaskResult<T> {
  /// The id of the task to be matched with [IsolateTask.id].
  final int id;

  IsolateTaskResult._({
    required this.id,
  });
}

class IsolateTaskSuccessResult<T> extends IsolateTaskResult<T> {
  /// The payload of the response.
  final T data;

  IsolateTaskSuccessResult({
    required int id,
    required this.data,
  }) : super._(id: id);
}

class IsolateTaskErrorResult<T> extends IsolateTaskResult<T> {
  /// The error.
  final String error;

  IsolateTaskErrorResult({
    required int id,
    required this.error,
  }) : super._(id: id);
}

/// Stream version of [IsolateTaskResult].
class IsolateTaskStreamResult<T> {
  /// The id of the task.
  /// Corresponds to [IsolateTask.id] that started the stream.
  final int id;

  /// If true, the stream is done.
  final bool done;

  /// The error.
  final Object? error;

  /// A single data event from the stream.
  final T? data;

  IsolateTaskStreamResult._({
    required this.id,
    required this.done,
    required this.data,
    required this.error,
  });

  IsolateTaskStreamResult.event({
    required this.id,
    required this.data,
  })  : done = false,
        error = null;

  IsolateTaskStreamResult.done({
    required this.id,
  })  : done = true,
        data = null,
        error = null;

  IsolateTaskStreamResult.error({
    required this.id,
    required this.error,
  })  : done = true,
        data = null;
}

/// A special data payload to acknowledge the reception of a stream event.
class IsolateTaskStreamAckResult<T> extends IsolateTaskStreamResult<T> {
  IsolateTaskStreamAckResult({
    required super.id,
  }) : super._(
          data: null,
          done: false,
          error: null,
        );
}
