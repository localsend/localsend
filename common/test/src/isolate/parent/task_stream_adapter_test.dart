import 'dart:isolate';

import 'package:common/src/isolate/dto/isolate_task_result.dart';
import 'package:common/src/isolate/parent/task_stream_adapter.dart';
import 'package:common/src/util/isolate_helper.dart';
import 'package:test/test.dart';

Future<void> _taskEmitter(
  Stream<String> receiveFromMain,
  void Function(IsolateTaskStreamResult<double>) sendToMain,
  int _,
) async {
  await for (final command in receiveFromMain) {
    switch (command) {
      case 'success':
        sendToMain(IsolateTaskStreamResult.event(id: 1, data: 0.25));
        sendToMain(IsolateTaskStreamResult.done(id: 1));
        break;
      case 'error':
        sendToMain(IsolateTaskStreamResult.error(id: 2, error: 'boom'));
        break;
      case 'duplicate-terminal':
        sendToMain(IsolateTaskStreamResult.error(id: 3, error: 'boom'));
        sendToMain(IsolateTaskStreamResult.done(id: 3));
        sendToMain(IsolateTaskStreamResult.error(id: 3, error: 'later'));
        break;
    }
  }
}

Future<IsolateConnector<IsolateTaskStreamResult<double>, String>> _startConnection() {
  return startIsolate<IsolateTaskStreamResult<double>, String, int>(
    task: _taskEmitter,
    param: 0,
  );
}

void main() {
  test('forwards data events and closes on completion', () async {
    final connection = await _startConnection();
    addTearDown(() => connection.isolate.kill(priority: Isolate.immediate));

    final stream = adaptIsolateTaskStream<double, String>(
      taskId: 1,
      connection: connection,
    );

    connection.sendToIsolate('success');

    await expectLater(stream, emitsInOrder([0.25, emitsDone]));
  });

  test('emits terminal errors and closes the stream', () async {
    final connection = await _startConnection();
    addTearDown(() => connection.isolate.kill(priority: Isolate.immediate));

    final stream = adaptIsolateTaskStream<double, String>(
      taskId: 2,
      connection: connection,
    );

    connection.sendToIsolate('error');

    await expectLater(stream, emitsInOrder([emitsError('boom'), emitsDone]));
  });

  test('ignores duplicate terminal events', () async {
    final connection = await _startConnection();
    addTearDown(() => connection.isolate.kill(priority: Isolate.immediate));

    final stream = adaptIsolateTaskStream<double, String>(
      taskId: 3,
      connection: connection,
    );

    connection.sendToIsolate('duplicate-terminal');

    await expectLater(stream, emitsInOrder([emitsError('boom'), emitsDone]));
  });
}
