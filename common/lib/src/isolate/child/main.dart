import 'dart:async';

import 'package:common/src/isolate/child/sync_provider.dart';
import 'package:common/src/isolate/dto/send_to_isolate_data.dart';
import 'package:common/util/logger.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:refena/refena.dart';

@internal
final isolateContainer = RefenaContainer();

final _logger = Logger('ChildIsolateMain');

class InitialData {
  final SyncState syncState;
  final Level logLevel;

  InitialData({
    required this.syncState,
    required this.logLevel,
  });
}

/// A helper to setup the child isolate.
@internal
Future<void> setupChildIsolateHelper<S, R>({
  required String debugLabel,
  required Stream<SendToIsolateData<S>> receiveFromMain,
  required void Function(R) sendToMain,
  required InitialData initialData,
  Future<void> Function()? init,
  required Future<void> Function(S data) handler,
}) async {
  initLogger(initialData.logLevel);

  isolateContainer.set(
    syncProvider.overrideWithNotifier(
      (ref) => SyncService(
        initial: initialData.syncState,
      ),
    ),
  );

  if (init != null) {
    await init();
  }

  _logger.info('Child isolate is ready: $debugLabel (logLevel: ${initialData.logLevel})');

  await for (final message in receiveFromMain) {
    _handleMessage(debugLabel, message, handler);
  }
}

// separate function to avoid blocking the for loop
void _handleMessage<S>(String debugLabel, SendToIsolateData<S> message, Future<void> Function(S data) handler) async {
  final syncState = message.syncState;
  if (syncState != null) {
    isolateContainer.redux(syncProvider).dispatch(UpdateSyncStateAction(syncState));
  }

  final data = message.data;
  if (data != null) {
    try {
      await handler(data);
    } catch (e) {
      _logger.severe('Error in $debugLabel: $e', e);
    }
  }
}
