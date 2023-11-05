import 'package:localsend_app/model/log_entry.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('HTTP');

/// Contains the discovery logs for debugging purposes.
final httpLogsProvider = NotifierProvider<HttpLogsService, List<LogEntry>>((ref) {
  return HttpLogsService();
});

class HttpLogsService extends Notifier<List<LogEntry>> {
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

  @override
  String describeState(List<LogEntry> state) => '${state.length} logs';
}
