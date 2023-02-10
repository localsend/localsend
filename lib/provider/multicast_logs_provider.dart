import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/log_entry.dart';

/// Contains the multicast logs for debugging purposes.
final multicastLogsProvider = StateNotifierProvider<MulticastLogsNotifier, List<LogEntry>>((ref) => MulticastLogsNotifier());

class MulticastLogsNotifier extends StateNotifier<List<LogEntry>> {
  MulticastLogsNotifier() : super([]);

  void addLog(String log) {
    print(log);
    state = [
      ...state,
      LogEntry(timestamp: DateTime.now(), log: log),
    ].take(200).toList();
  }
}
