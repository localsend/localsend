import 'package:localsend_isolates/model/file_status.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// A provider holding the live per-file transfer state (status and progress).
/// It is implemented as [ChangeNotifier] for performance reasons:
/// a status or progress update does not need to copy the whole session state.
final fileTransferProvider = ChangeNotifierProvider((ref) => FileTransferNotifier());

class FileTransfer {
  FileStatus status;
  double progress; // 0..1

  FileTransfer(this.status) : progress = 0;

  @override
  String toString() => '($status, $progress)';
}

class FileTransferNotifier extends ChangeNotifier {
  final _sessionMap = <String, Map<String, FileTransfer>>{}; // session id -> (file id -> live transfer state)

  void setStatus({required String sessionId, required String fileId, required FileStatus status}) {
    _sessionMap.putIfAbsent(sessionId, () => {}).putIfAbsent(fileId, () => FileTransfer(status)).status = status;
    notifyListeners();
  }

  /// Sets the status of multiple files at once, notifying listeners only once.
  void setStatuses({required String sessionId, required Map<String, FileStatus> statuses}) {
    final files = _sessionMap.putIfAbsent(sessionId, () => {});
    for (final entry in statuses.entries) {
      files.putIfAbsent(entry.key, () => FileTransfer(entry.value)).status = entry.value;
    }
    notifyListeners();
  }

  void setProgress({required String sessionId, required String fileId, required double progress}) {
    _sessionMap.putIfAbsent(sessionId, () => {}).putIfAbsent(fileId, () => FileTransfer(FileStatus.queue)).progress = progress;
    notifyListeners();
  }

  FileStatus getStatus({required String sessionId, required String fileId}) {
    return _sessionMap[sessionId]?[fileId]?.status ?? FileStatus.queue;
  }

  Iterable<FileStatus> getStatuses(String sessionId) {
    return _sessionMap[sessionId]?.values.map((file) => file.status) ?? const [];
  }

  double getProgress({required String sessionId, required String fileId}) {
    return _sessionMap[sessionId]?[fileId]?.progress ?? 0.0;
  }

  void removeSession(String sessionId) {
    _sessionMap.remove(sessionId);
    notifyListeners();
  }

  void removeAllSessions() {
    _sessionMap.clear();
    notifyListeners();
  }

  /// Only for debug purposes
  Map<String, Map<String, FileTransfer>> getData() {
    return _sessionMap;
  }
}
