import 'dart:async';
import 'dart:collection';

// https://stackoverflow.com/questions/62878704/how-to-implement-an-async-task-queue-with-multiple-concurrent-workers-async-in
class TaskRunner<A, B> {
  final Queue<A> _input = Queue();
  final StreamController<B> _streamController = StreamController();
  final Future<B> Function(A) task;

  final int maxConcurrentTasks;
  int runningTasks = 0;

  TaskRunner({
    required this.task,
    required this.maxConcurrentTasks,
  });

  Stream<B> get stream => _streamController.stream;

  void add(A value) {
    _input.add(value);
    _startExecution();
  }

  void addAll(Iterable<A> iterable) {
    _input.addAll(iterable);
    _startExecution();
  }

  void _startExecution() {
    if (runningTasks == maxConcurrentTasks || _input.isEmpty) {
      return;
    }

    while (_input.isNotEmpty && runningTasks < maxConcurrentTasks) {
      runningTasks++;

      task(_input.removeFirst()).then((value) async {
        _streamController.add(value);

        while (_input.isNotEmpty) {
          _streamController.add(await task(_input.removeFirst()));
        }

        runningTasks--;
      });
    }
  }
}
