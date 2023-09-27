import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_entry.freezed.dart';

@freezed
class LogEntry with _$LogEntry {
  const factory LogEntry({
    required DateTime timestamp,
    required String log,
  }) = _LogEntry;
}
