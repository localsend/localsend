import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/file_type.dart';

part 'receive_history_entry.freezed.dart';
part 'receive_history_entry.g.dart';

@freezed
class ReceiveHistoryEntry with _$ReceiveHistoryEntry {
  const factory ReceiveHistoryEntry({
    required String id,
    required String fileName,
    required FileType fileType,
    required String? path,
    required bool savedToGallery,
    required int fileSize,
    required String senderAlias,
    required DateTime timestamp,
  }) = _ReceiveHistoryEntry;

  factory ReceiveHistoryEntry.fromJson(Map<String, Object?> json) => _$ReceiveHistoryEntryFromJson(json);
}
