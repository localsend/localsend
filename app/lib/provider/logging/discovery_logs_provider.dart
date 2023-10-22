import 'package:localsend_app/model/log_entry.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('Discovery');

/// Contains the discovery logs for debugging purposes.
final discoveryLogsProvider = NotifierProvider<DiscoveryLogsNotifier, List<LogEntry>>((ref) {
  return DiscoveryLogsNotifier();
});

class DiscoveryLogsNotifier extends Notifier<List<LogEntry>> {
  DiscoveryLogsNotifier();

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
