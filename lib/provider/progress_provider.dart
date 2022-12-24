import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider holding the progress of the send process.
/// It is implemented as [ChangeNotifier] for performance reasons.
final progressProvider = ChangeNotifierProvider((ref) => ProgressNotifier());

class ProgressNotifier extends ChangeNotifier  {
  final _progressMap = <String, double>{}; // file id -> 0..1

  void setProgress(String fileId, double progress) {
    _progressMap[fileId] = progress;
    notifyListeners();
  }

  double getProgress(String fileId) {
    return _progressMap[fileId] ?? 0.0;
  }

  void reset() {
    _progressMap.clear();
    notifyListeners();
  }
}
