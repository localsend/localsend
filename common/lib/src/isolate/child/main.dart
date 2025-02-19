import 'dart:async';

import 'package:common/src/isolate/child/sync_provider.dart';
import 'package:common/src/isolate/dto/send_to_isolate_data.dart';
import 'package:common/util/logger.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:refena/refena.dart';

final _logger = Logger('ChildIsolateMain');

/// The container for the child isolate.
final _isolateContainer = RefenaContainer();

class InitialData {
  final SyncState syncState;
  final Level logLevel;

  InitialData({
    required this.syncState,
    required this.logLevel,
  });
}

/// A helper to setup the child isolate,
/// constructing an endless running task that listens to [receiveFromMain]
/// and calls [handler] for each message (usually calling [sendToMain] in the [handler]).
///
/// The provided [Ref]s in the [handler] and [init] functions are instance of the child isolate [RefenaContainer],
/// therefore, they can be safely used to call providers in the task directory.
///
/// An optional [init] function can be provided to run before the endless loop.
@internal
Future<void> setupChildIsolateHelper<S, R>({
  required String debugLabel,
  required Stream<SendToIsolateData<S>> receiveFromMain,
  required void Function(R) sendToMain,
  required InitialData initialData,
  Future<void> Function(Ref ref)? init,
  required Future<void> Function(Ref ref, S data) handler,
}) async {
  initLogger(initialData.logLevel);

  _isolateContainer.set(
    syncProvider.overrideWithNotifier(
      (ref) => SyncService(
        initial: initialData.syncState,
      ),
    ),
  );

  await initialData.syncState.init();

  if (init != null) {
    await init(_isolateContainer);
  }

  _logger.info('Child isolate is ready: $debugLabel (logLevel: ${initialData.logLevel})');

  await for (final message in receiveFromMain) {
    _handleMessage(debugLabel, message, handler);
  }
}

// separate function to avoid blocking the for loop
void _handleMessage<S>(String debugLabel, SendToIsolateData<S> message, Future<void> Function(Ref ref, S data) handler) async {
  final syncState = message.syncState;
  if (syncState != null) {
    _isolateContainer.redux(syncProvider).dispatch(UpdateSyncStateAction(syncState));
  }

  final data = message.data;
  if (data != null) {
    try {
      await handler(_isolateContainer, data);
    } catch (e, st) {
      _logger.severe('Error in $debugLabel: $e', e, st);
    }
  }
}
