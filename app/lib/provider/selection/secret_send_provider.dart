import 'package:refena_flutter/refena_flutter.dart';

/// Whether the selected files are sent as a secret:
/// the receiver is asked not to keep them in its receive history.
/// It belongs to the current selection and is reset when the selection is cleared.
final secretSendProvider = StateProvider<bool>((ref) {
  return false;
}, debugLabel: 'secretSendProvider');

class ResetSecretSendAction extends GlobalAction {
  @override
  void reduce() {
    ref.notifier(secretSendProvider).setState((_) => false);
  }
}
