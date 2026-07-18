import 'package:local_notifier/local_notifier.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';

final _logger = Logger('Notification');

/// Shows a native desktop notification.
/// No-op on platforms where [local_notifier] is not supported (mobile/web).
///
/// When [actionLabel] and [onAction] are provided, the notification exposes a
/// clickable action. On Linux, clicking the notification body is not delivered
/// by the platform plugin, so an explicit action button is required; on
/// macOS/Windows the body click ([onClick]) is wired to the same callback.
Future<void> showDesktopNotification({
  required String title,
  required String body,
  String? actionLabel,
  void Function()? onAction,
}) async {
  if (!checkPlatformIsDesktop()) {
    return;
  }
  try {
    final notification = LocalNotification(
      title: title,
      body: body,
      actions: actionLabel != null && onAction != null ? [LocalNotificationAction(text: actionLabel)] : null,
    );
    if (onAction != null) {
      notification.onClick = onAction;
      notification.onClickAction = (_) => onAction();
    }
    await notification.show();
  } catch (e) {
    _logger.warning('Showing desktop notification failed', e);
  }
}
