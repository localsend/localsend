import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:localsend_app/model/file_type.dart';

part 'receive_history_entry.freezed.dart';
part 'receive_history_entry.g.dart';

@freezed
class ReceiveHistoryEntry with _$ReceiveHistoryEntry {
  const ReceiveHistoryEntry._(); // allow custom getters

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

  /// Format string using the intl package.
  /// Because the raw timestamp is saved in UTC, we need to transform it to local time zone first.
  String get timestampString {
    final localTimestamp = timestamp.toLocal();
    return '${DateFormat.yMd().format(localTimestamp)} ${DateFormat.jm().format(localTimestamp)}';
  }
}
