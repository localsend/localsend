import 'dart:async';

import 'package:common/model/file_type.dart';
import 'package:localsend_app/model/persistence/receive_history_entry.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

const _maxHistoryEntries = 30;

/// Serializes receive-history updates.
///
/// The lock is acquired in `before()` and released in `after()` because Refena
/// applies the state transition after `reduce()` returns. Locking only inside
/// `reduce()` can allow the next action to observe the pre-transition state.
///
/// This lock is not re-entrant.
class _AsyncLock {
  Future<void> _tail = Future.value();

  Future<_LockGuard> acquire() async {
    final gate = Completer<void>();
    final previous = _tail;
    _tail = previous.then((_) => gate.future);
    await previous;

    return _LockGuard._(gate);
  }
}

class _LockGuard {
  final Completer<void> _gate;
  bool _released = false;

  _LockGuard._(this._gate);

  void release() {
    if (_released) {
      return;
    }
    _released = true;
    if (!_gate.isCompleted) {
      _gate.complete();
    }
  }
}

abstract class _ReceiveHistoryWriteAction extends AsyncReduxAction<ReceiveHistoryService, List<ReceiveHistoryEntry>> {
  _LockGuard? _guard;

  @override
  Future<void> before() async {
    _guard = await notifier._lock.acquire();
  }

  @override
  void after() {
    _guard?.release();
    _guard = null;
  }
}

/// This provider stores the history of received files.
/// It automatically saves the history to the device's storage.
final receiveHistoryProvider = ReduxProvider<ReceiveHistoryService, List<ReceiveHistoryEntry>>((ref) {
  return ReceiveHistoryService(ref.read(persistenceProvider));
});

class ReceiveHistoryService extends ReduxNotifier<List<ReceiveHistoryEntry>> {
  final PersistenceService _persistence;
  final _AsyncLock _lock = _AsyncLock();

  ReceiveHistoryService(this._persistence);

  @override
  List<ReceiveHistoryEntry> init() => _persistence.getReceiveHistory();
}

/// Adds a history entry.
class AddHistoryEntryAction extends _ReceiveHistoryWriteAction {
  final String entryId;
  final String fileName;
  final FileType fileType;
  final String? path;
  final bool savedToGallery;
  final bool isMessage;
  final int fileSize;
  final String senderAlias;
  final DateTime timestamp;

  AddHistoryEntryAction({
    required this.entryId,
    required this.fileName,
    required this.fileType,
    required this.path,
    required this.savedToGallery,
    required this.isMessage,
    required this.fileSize,
    required this.senderAlias,
    required this.timestamp,
  });

  @override
  Future<List<ReceiveHistoryEntry>> reduce() async {
    if (!notifier._persistence.isSaveToHistory()) {
      return state;
    }

    final updated = [
      ReceiveHistoryEntry(
        id: entryId,
        fileName: fileName,
        fileType: fileType,
        path: path,
        savedToGallery: savedToGallery,
        isMessage: isMessage,
        fileSize: fileSize,
        senderAlias: senderAlias,
        timestamp: timestamp,
      ),
      ...state,
    ].take(_maxHistoryEntries).toList();
    await notifier._persistence.setReceiveHistory(updated);
    return updated;
  }
}

/// Removes a history entry.
class RemoveHistoryEntryAction extends _ReceiveHistoryWriteAction {
  final String entryId;

  RemoveHistoryEntryAction(this.entryId);

  @override
  Future<List<ReceiveHistoryEntry>> reduce() async {
    final index = state.indexWhere((e) => e.id == entryId);
    if (index == -1) {
      return state;
    }
    final updated = [...state]..removeAt(index);
    await notifier._persistence.setReceiveHistory(updated);
    return updated;
  }
}

/// Removes all history entries.
class RemoveAllHistoryEntriesAction extends _ReceiveHistoryWriteAction {
  @override
  Future<List<ReceiveHistoryEntry>> reduce() async {
    await notifier._persistence.setReceiveHistory([]);
    return [];
  }
}
