import 'package:localsend_app/model/log_entry.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('Discovery');

/// Contains the discovery logs for debugging purposes.
final discoveryLoggerProvider = NotifierProvider<DiscoveryLogger, List<LogEntry>>((ref) {
  return DiscoveryLogger();
});

class DiscoveryLogger extends Notifier<List<LogEntry>> {
  DiscoveryLogger();

  @override
  List<LogEntry> init() {
    return [];
  }

  void addLog(String log) {
    _logger.info(log);
    state = [
      ...state,
      LogEntry(timestamp: DateTime.now(), log: log),
    ].take(200).toList();
  }

  void clear() {
    state = [];
  }
}
