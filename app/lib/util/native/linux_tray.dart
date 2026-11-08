import 'package:flutter/foundation.dart';
import 'package:tray_kit/tray_kit.dart';

/// Shows the Linux tray item with [icon], [tooltip], and open/close actions.
///
/// Returns `false` when no StatusNotifierItem host is available.
Future<bool> showLinuxTray({
  required TrayKitPlatform platform,
  required TrayIcon icon,
  required String tooltip,
  required String openLabel,
  required String closeLabel,
  required VoidCallback onOpen,
  required VoidCallback onClose,
}) async {
  if (!await platform.isSupported()) {
    return false;
  }

  await platform.show(
    icon: icon,
    tooltip: tooltip,
    onActivate: onOpen,
    menu: [
      TrayMenuAction(openLabel, onSelected: onOpen),
      TrayMenuAction(closeLabel, onSelected: onClose),
    ],
  );
  return true;
}

/// Removes the Linux tray item, if it is currently shown.
Future<void> hideLinuxTray(TrayKitPlatform platform) => platform.hide();
