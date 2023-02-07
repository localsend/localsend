import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/model/receive_history_entry.dart';
import 'package:localsend_app/provider/persistence_provider.dart';

final receiveHistoryProvider = StateNotifierProvider<ReceiveHistoryNotifier, List<ReceiveHistoryEntry>>((ref) {
  final persistenceService = ref.watch(persistenceProvider);
  return ReceiveHistoryNotifier(persistenceService);
});

class ReceiveHistoryNotifier extends StateNotifier<List<ReceiveHistoryEntry>> {
  final PersistenceService _service;

  ReceiveHistoryNotifier(this._service) : super(_service.getReceiveHistory());

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
}
