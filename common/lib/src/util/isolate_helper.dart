import 'dart:async';
import 'dart:isolate';

class IsolateCommunication<R, S> {
  final Stream<R> receiveFromIsolate;
  final SendPort _sendToIsolate;
  final Isolate isolate;

  IsolateCommunication._(
    this.receiveFromIsolate,
    this._sendToIsolate,
    this.isolate,
  );

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
Future<IsolateCommunication<R, S>> startIsolate<R, S, P>({
  required Future<void> Function(Stream<S> receiveFromMain, void Function(R) sendToMain, P? param) task,
  P? param,
}) async {
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn(
    (param) => _isolateRunner<R, S, P>(param),
    _IsolateParam<R, S, P>(receivePort.sendPort, task, param),
  );

  final receiveFromIsolateController = StreamController<R>();
  final sendToIsolateCompleter = Completer<SendPort>();
  receivePort.listen((message) {
    if (message is R) {
      receiveFromIsolateController.add(message);
    } else if (message is SendPort) {
      sendToIsolateCompleter.complete(message);
    } else {
      print('Unexpected type when receiving message from isolate: "$message" that has type <${message.runtimeType}> but only <$R> is expected.');
    }
  });
  final sendToIsolate = await sendToIsolateCompleter.future;

  // Callback to signal that the [SendPort] is ready
  sendToIsolate.send(_SendToIsolateReceived());

  return IsolateCommunication._(
    receiveFromIsolateController.stream,
    sendToIsolate,
    isolate,
  );
}

class _IsolateParam<R, S, P> {
  final SendPort _sendToMain;
  final Future<void> Function(Stream<S>, void Function(R) sendToMain, P? param) task;
  final P? param;

  _IsolateParam(this._sendToMain, this.task, this.param);
}

/// A message that is sent to the isolate to signal that the [SendPort] is ready.
class _SendToIsolateReceived {}

Future<void> _isolateRunner<R, S, P>(_IsolateParam<R, S, P> params) async {
  final receivePort = ReceivePort();
  params._sendToMain.send(receivePort.sendPort);

  final receiveFromMainController = StreamController<S>();
  final setupFinished = Completer<void>();
  receivePort.listen((message) {
    if (message is S) {
      receiveFromMainController.add(message);
    } else if (message is _SendToIsolateReceived) {
      setupFinished.complete();
    } else {
      print('Unexpected type when receiving message from main isolate: "$message" that has type <${message.runtimeType}> but only <$S> is expected.');
    }
  });

  await setupFinished.future;

  await params.task(
    receiveFromMainController.stream,
    (data) => params._sendToMain.send(data),
    params.param,
  );
}
