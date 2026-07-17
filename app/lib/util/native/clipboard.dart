import 'dart:async';
import 'dart:io';

import 'package:localsend_app/isolate/model/file_type.dart';
import 'package:pasteboard/pasteboard.dart';

bool canCopyImageToClipboard({
  required String? path,
  required FileType fileType,
  required bool isDesktop,
}) {
  if (!isDesktop) return false;
  if (path == null || path.isEmpty) return false;
  return fileType == FileType.image;
}

Future<bool> copyImageToClipboard(String filePath) async {
  try {
    await Pasteboard.writeFiles([filePath]);
    return true;
  } catch (_) {
    return false;
  }
}

void showDesktopNotification(String title, String body) {
  if (Platform.isMacOS) {
    final escapedTitle =
        title.replaceAll('\\', '\\\\').replaceAll('"', '\\"');
    final escapedBody =
        body.replaceAll('\\', '\\\\').replaceAll('"', '\\"');
    unawaited(Process.run('osascript', [
      '-e',
      'display notification "$escapedBody" with title "$escapedTitle"',
    ]));
  } else if (Platform.isLinux) {
    unawaited(Process.run('notify-send', [title, body]));
  } else if (Platform.isWindows) {
    unawaited(Process.run('powershell', [
      '-Command',
      '''
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
\$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText02)
\$textNodes = \$template.GetElementsByTagName('text')
\$textNodes.Item(0).AppendChild(\$template.CreateTextNode('$title')) | Out-Null
\$textNodes.Item(1).AppendChild(\$template.CreateTextNode('$body')) | Out-Null
\$toast = [Windows.UI.Notifications.ToastNotification]::new(\$template)
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('LocalSend').Show(\$toast)
''',
    ]));
  }
}