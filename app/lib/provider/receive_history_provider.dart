import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/model/persistence/receive_history_entry.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// This provider stores the history of received files.
/// It automatically saves the history to the device's storage.
final receiveHistoryProvider = ReduxProvider<ReceiveHistoryService, List<ReceiveHistoryEntry>>((ref) {
  return ReceiveHistoryService(ref.read(persistenceProvider));
});

class ReceiveHistoryService extends ReduxNotifier<List<ReceiveHistoryEntry>> {
  final PersistenceService _persistence;

  ReceiveHistoryService(this._persistence);

  @override
  List<ReceiveHistoryEntry> init() => _persistence.getReceiveHistory();
}

/// Adds a history entry.
class AddHistoryEntryAction extends AsyncReduxAction<ReceiveHistoryService, List<ReceiveHistoryEntry>> {
  final String entryId;
  final String fileName;
  final FileType fileType;
  final String? path;
  final bool savedToGallery;
  final int fileSize;
  final String senderAlias;
  final DateTime timestamp;

  AddHistoryEntryAction({
    required this.entryId,
    required this.fileName,
    required this.fileType,
    required this.path,
    required this.savedToGallery,
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
        fileSize: fileSize,
        senderAlias: senderAlias,
        timestamp: timestamp,
      ),
      ...state,
    ].take(200).toList();
    await notifier._persistence.setReceiveHistory(updated);
    return updated;
  }
}

/// Removes a history entry.
class RemoveHistoryEntryAction extends AsyncReduxAction<ReceiveHistoryService, List<ReceiveHistoryEntry>> {
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
class RemoveAllHistoryEntriesAction extends AsyncReduxAction<ReceiveHistoryService, List<ReceiveHistoryEntry>> {
  @override
  Future<List<ReceiveHistoryEntry>> reduce() async {
    await notifier._persistence.setReceiveHistory([]);
    return [];
  }
}
