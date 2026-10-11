import 'dart:async';
import 'dart:collection';

/// Runs asynchronous actions one after another, in the order they were added.
class FutureQueue {
  FutureQueue({this.onError});

  /// Called when an action throws. The queue continues with the next action either way.
  /// When omitted, errors are silently swallowed.
  final void Function(Object error, StackTrace stackTrace)? onError;

  final Queue<Future<void> Function()> _queue = Queue();
  bool _draining = false;

  /// Adds [action] to the end of the queue.
  /// It starts once every action added before it has finished.
  void add(Future<void> Function() action) {
    _queue.add(action);
    if (!_draining) {
      // ignore: discarded_futures
      _drain();
    }
  }

  /// Drops all actions that have not started yet. A running action is not interrupted.
  void clear() {
    _queue.clear();
  }

  /// Processes the queue one by one until it runs empty.
  Future<void> _drain() async {
    _draining = true;
    while (_queue.isNotEmpty) {
      final action = _queue.removeFirst();
      try {
        await action();
      } catch (e, st) {
        onError?.call(e, st);
      }
    }
    _draining = false;
  }
}
