# typed_isolates

Create isolates and communicate with them in a **type-safe** manner.

Dart's raw `Isolate` / `SendPort` API is untyped — every message is `dynamic`.
This package wraps the boilerplate and gives you a connector with statically-typed
send and receive channels.

## Concept

Three type parameters describe the isolate:

- `R` — the type of messages the main isolate **receives** from the child.
- `S` — the type of messages the main isolate **sends** to the child.
- `P` — the type of the parameter passed to the child on startup.

## Usage

Spawn an isolate with `TypedIsolates.startIsolate`. It returns an
`IsolateConnector<R, S>` for talking to the child.

```dart
import 'package:typed_isolates/typed_isolates.dart';

Future<void> main() async {
  // R = int (received), S = String (sent), P = String (start param)
  final connector = await TypedIsolates.startIsolate<int, String, String>(
    param: 'greeting',
    task: _childTask,
  );

  // Listen to messages coming back from the isolate.
  connector.receiveFromIsolate.listen((value) {
    print('main received: $value');
  });

  // Send messages to the isolate.
  connector.sendToIsolate('hello');
  connector.sendToIsolate('world');

  // Shut it down when done.
  await Future.delayed(const Duration(seconds: 1));
  connector.isolate.kill();
}

// Runs inside the spawned isolate.
Future<void> _childTask(
  Stream<String> receiveFromMain,
  void Function(int) sendToMain,
  String param,
) async {
  print('child started with param: $param');
  await for (final message in receiveFromMain) {
    sendToMain(message.length); // reply with the length of each message
  }
}
```

`IsolateConnector` exposes:

- `receiveFromIsolate` — a broadcast `Stream<R>` of messages from the child.
- `sendToIsolate(S message)` — send a typed message to the child.
- `isolate` — the underlying `Isolate` (e.g. call `.kill()` to stop it).

## Request / response tasks

For a request-and-reply pattern (correlating each response with its request),
the package ships a small set of DTOs you can use as your `S` / `R` payloads:

- `IsolateTask<T>` — a request carrying an `id` and a `data` payload.
- `IsolateTaskResult<T>` (`IsolateTaskSuccessResult` / `IsolateTaskErrorResult`) —
  a single response matched to the request `id`.
- `IsolateTaskStreamResult<T>` — a streamed response (`.event`, `.done`, `.error`)
  for tasks that emit multiple values over time, plus `IsolateTaskStreamAckResult`
  to acknowledge receipt of an event.

When your connector sends bare `IsolateTask`s and receives
`IsolateTaskStreamResult`s, `sendTaskAndListenStream` does the whole round-trip —
it assigns an id, sends the task, and returns a `Stream` of the results:

```dart
// connection: IsolateConnector<IsolateTaskStreamResult<int>, IsolateTask<MyTask>>
final Stream<int> results = connection.sendTaskAndListenStream(
  task: MyTask('my input'),
);
```
