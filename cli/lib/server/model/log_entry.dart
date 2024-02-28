import 'package:dart_mappable/dart_mappable.dart';

part 'log_entry.mapper.dart';

@MappableClass()
class LogEntry with LogEntryMappable {
  final DateTime timestamp;
  final String log;

  const LogEntry({
    required this.timestamp,
    required this.log,
  });

  @override
  String toString() {
    return 'LogEntry(timestamp: $timestamp, log: $log)';
  }
}
