import 'dart:async';

extension StreamExt<T> on Stream<T> {
  (StreamController<T>, StreamSubscription<T>) digested() {
    late StreamSubscription<T> subscription;
    final streamController = StreamController<T>(
      onListen: () => subscription.resume(),
      onPause: () => subscription.pause(),
      onResume: () => subscription.resume(),
      onCancel: () async => await subscription.cancel(),
    );

    subscription = listen(
      (data) => streamController.add(data),
      onError: (e, st) => streamController.addError(e, st),
      onDone: () async => await streamController.close(),
    );

    return (streamController, subscription);
  }
}
