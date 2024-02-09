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

/// Starts an isolate and setups the [SendPort] and [ReceivePort] to communicate with it.
/// [R] is the type of the messages that the main isolate will **receive** from the spawned isolate.
/// [S] is the type of the messages that the main isolate will **send** to the spawned isolate.
Future<IsolateCommunication<R, S>> startIsolate<R, S>({
  required Future<void> Function(Stream<S> receiveFromMain, void Function(R) sendToMain) task,
}) async {
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn((param) => _isolateRunner<R, S>(param), _IsolateParam<R, S>(receivePort.sendPort, task));

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

  // Transform SendPort to Sink for more type-safety
  final sendToIsolateSink = StreamController<S>();
  sendToIsolateSink.stream.listen((message) {
    sendToIsolate.send(message);
  });

  // Callback to signal that the [SendPort] is ready
  sendToIsolate.send(_SendToIsolateReceived());

  return IsolateCommunication._(
    receiveFromIsolateController.stream,
    sendToIsolate,
    isolate,
  );
}

class _IsolateParam<R, S> {
  final SendPort _sendToMain;
  final Future<void> Function(Stream<S>, void Function(R) sendToMain) task;

  _IsolateParam(this._sendToMain, this.task);
}

/// A message that is sent to the isolate to signal that the [SendPort] is ready.
class _SendToIsolateReceived {}

Future<void> _isolateRunner<R, S>(_IsolateParam<R, S> params) async {
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
  );
}
