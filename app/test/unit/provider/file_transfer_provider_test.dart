import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/provider/file_transfer_provider.dart';
import 'package:localsend_isolates/model/file_status.dart';

/// Records the progress seen at each notification.
class _RecordingNotifier extends FileTransferNotifier {
  final seen = <double>[];

  @override
  void notifyListeners() => seen.add(getProgress(sessionId: 's', fileId: 'f'));
}

void main() {
  // testWidgets uses fake timers.
  testWidgets('progress notifies at most once per interval with the latest value', (tester) async {
    final notifier = _RecordingNotifier();

    for (var i = 1; i <= 50; i++) {
      notifier.setProgress(sessionId: 's', fileId: 'f', progress: i / 50);
    }
    expect(notifier.seen, isEmpty);

    await tester.pump(const Duration(milliseconds: 100));
    expect(notifier.seen, [1.0]);

    await tester.pump(const Duration(milliseconds: 100));
    expect(notifier.seen, [1.0]);
  });

  testWidgets('status changes are not delayed by the progress interval', (tester) async {
    final notifier = _RecordingNotifier();

    notifier.setProgress(sessionId: 's', fileId: 'f', progress: 0.5);
    notifier.setStatus(sessionId: 's', fileId: 'f', status: FileStatus.finished);
    expect(notifier.seen, [0.5]);

    await tester.pump(const Duration(milliseconds: 100));
  });

  testWidgets('dispose cancels the pending progress notification', (tester) async {
    final notifier = _RecordingNotifier();

    notifier.setProgress(sessionId: 's', fileId: 'f', progress: 0.5);
    notifier.dispose();
    // no pump: fails if the timer is still pending
  });
}
