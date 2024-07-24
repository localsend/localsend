import 'dart:async';
import 'dart:isolate';

/// This instance lives in the main isolate and is used to communicate with the child isolate.
class IsolateConnector<R, S> {
  /// A broadcast stream that receives messages from the isolate.
  final Stream<R> receiveFromIsolate;

  /// The [SendPort] to send messages to the isolate.
  /// Since this is not type-safe, use [sendToIsolate] instead.
  final SendPort _sendToIsolate;

  /// The isolate that this connector is connected to.
  final Isolate isolate;

  IsolateConnector._(
    this.receiveFromIsolate,
    this._sendToIsolate,
    this.isolate,
  );

  /// Sends a message to the isolate.
  void sendToIsolate(S message) {
    _sendToIsolate.send(message);
  }
}

/// A helper function to easier work with isolates.
/// Starts an isolate and setups the [SendPort] and [ReceivePort] to communicate with it.
///
/// [R] is the type of the messages that the main isolate will **receive** from the spawned isolate.
/// [S] is the type of the messages that the main isolate will **send** to the spawned isolate.
/// [P] is the type of the parameter that is passed to the spawned isolate.
Future<IsolateConnector<R, S>> startIsolate<R, S, P>({
  required Future<void> Function(Stream<S> receiveFromMain, void Function(R) sendToMain, P param) task,
  required P param,
}) async {
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn(
    (param) => _isolateRunner<R, S, P>(param),
    _IsolateParam<R, S, P>(receivePort.sendPort, task, param),
  );

  final receiveFromIsolateController = StreamController<R>();
  final sendToIsolateCompleter = Completer<SendPort>();
  receivePort.listen((message) {
    switch (message) {
      case R():
        receiveFromIsolateController.add(message);
        break;
      case SendPort():
        sendToIsolateCompleter.complete(message);
        break;
      default:
        print('Unexpected type when receiving message from isolate: "$message" that has type <${message.runtimeType}> but only <$R> is expected.');
    }
  });
  final sendToIsolate = await sendToIsolateCompleter.future;

  // Callback to signal that the [SendPort] is ready
  sendToIsolate.send(_SendToIsolateReceived());

  return IsolateConnector._(
    receiveFromIsolateController.stream.asBroadcastStream(),
    sendToIsolate,
    isolate,
  );
}

class _IsolateParam<R, S, P> {
  /// The [SendPort] to send messages to the main isolate.
  final SendPort _sendToMain;

  /// The task that the isolate will run.
  final Future<void> Function(Stream<S> receiveFromMain, void Function(R) sendToMain, P param) task;

  /// The parameter that is passed to the task.
  final P param;

  _IsolateParam(this._sendToMain, this.task, this.param);
}

/// A message that is sent to the isolate to signal that the [SendPort] is ready.
class _SendToIsolateReceived {}

Future<void> _isolateRunner<R, S, P>(_IsolateParam<R, S, P> params) async {
  final receivePort = ReceivePort();

  // Send to the main isolate the [SendPort].
  // This will complete the [sendToIsolateCompleter].
  params._sendToMain.send(receivePort.sendPort);

  final receiveFromMainController = StreamController<S>();
  final setupFinished = Completer<void>();
  receivePort.listen((message) {
    switch (message) {
      case S():
        receiveFromMainController.add(message);
        break;
      case _SendToIsolateReceived():
        setupFinished.complete();
        break;
      default:
        print(
          'Unexpected type when receiving message from main isolate: "$message" that has type <${message.runtimeType}> but only <$S> is expected.',
        );
    }
  });

  await setupFinished.future;

  await params.task(
    receiveFromMainController.stream,
    (data) => params._sendToMain.send(data),
    params.param,
  );
}
