import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:refena_flutter/addons.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// Clears a completed foreground send before a new selection is received.
class PrepareSendSelectionAction extends GlobalAction {
  final Set<String> preserveCachePaths;

  PrepareSendSelectionAction({this.preserveCachePaths = const {}});

  @override
  void reduce() {
    final completedSessions = ref
        .read(sendProvider)
        .values
        .where(
          (session) => !session.background && (session.status == SessionStatus.finished || session.status == SessionStatus.finishedWithErrors),
        )
        .toList();
    if (completedSessions.isEmpty) {
      return;
    }

    for (final session in completedSessions) {
      ref.notifier(sendProvider).closeSession(session.sessionId, clearSelection: false);
    }
    ref.redux(selectedSendingFilesProvider).dispatch(ClearSelectionAction(preserveCachePaths: preserveCachePaths));
    ref.global.dispatch(NavigateAction.popUntilRoot());
  }
}
