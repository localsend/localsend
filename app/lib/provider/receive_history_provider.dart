import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/model/persistence/receive_history_entry.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

final receiveHistoryProvider = NotifierProvider<ReceiveHistoryNotifier, List<ReceiveHistoryEntry>>((ref) {
  return ReceiveHistoryNotifier();
});

class ReceiveHistoryNotifier extends Notifier<List<ReceiveHistoryEntry>> {
  late PersistenceService _service;

  ReceiveHistoryNotifier();

  @override
  List<ReceiveHistoryEntry> init() {
    _service = ref.read(persistenceProvider);
    return _service.getReceiveHistory();
  }

  Future<void> addEntry({
    required String id,
    required String fileName,
    required FileType fileType,
    required String? path,
    required bool savedToGallery,
    required int fileSize,
    required String senderAlias,
    required DateTime timestamp,
  }) async {
    if (!_service.isSaveToHistory()) {
      return;
    }

    final updated = [
      ReceiveHistoryEntry(
        id: id,
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
    await _service.setReceiveHistory(updated);
    state = updated;
  }

  Future<void> removeEntry(String id) async {
    final updated = [...state]..removeWhere((e) => e.id == id);
    await _service.setReceiveHistory(updated);
    state = updated;
  }

  Future<void> removeAll() async {
    await _service.setReceiveHistory([]);
    state = [];
  }
}
