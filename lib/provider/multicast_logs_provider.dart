import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/log_entry.dart';

/// Contains the multicast logs for debugging purposes.
final multicastLogsProvider = NotifierProvider<MulticastLogsNotifier, List<LogEntry>>(() {
  return MulticastLogsNotifier();
});

class MulticastLogsNotifier extends Notifier<List<LogEntry>> {
  MulticastLogsNotifier();

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
