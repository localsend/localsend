import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/log_entry.dart';

/// Contains the discovery logs for debugging purposes.
final discoveryLogsProvider = NotifierProvider<DiscoveryLogsNotifier, List<LogEntry>>(() {
  return DiscoveryLogsNotifier();
});

class DiscoveryLogsNotifier extends Notifier<List<LogEntry>> {
  DiscoveryLogsNotifier();

  @override
  List<LogEntry> build() {
    return [];
  }

  void addLog(String log) {
    print(log);
    state = [
      ...state,
      LogEntry(timestamp: DateTime.now(), log: log),
    ].take(200).toList();
  }

  void clear() {
    state = [];
  }
}
