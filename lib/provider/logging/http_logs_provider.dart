import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/log_entry.dart';

/// Contains the discovery logs for debugging purposes.
final httpLogsProvider = NotifierProvider<HttpLogsNotifier, List<LogEntry>>(() {
  return HttpLogsNotifier();
});

class HttpLogsNotifier extends Notifier<List<LogEntry>> {
  HttpLogsNotifier();

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
