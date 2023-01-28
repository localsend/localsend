import 'package:flutter/foundation.dart';
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

enum TrayEntry {
  open,
  close,
}

Future<void> initTray() async {
  if (!checkPlatformHasTray()) {
    return;
  }
  try {
    if (checkPlatform([TargetPlatform.windows])) {
      await trayManager.setIcon(
        Assets.img.logo32Ico,
      );
    } else if (checkPlatform([TargetPlatform.macOS])) {
      await trayManager.setIcon(Assets.img.logo32BlackWhite.path, isTemplate: true);
    } else {
      await trayManager.setIcon(Assets.img.logo32Png.path);
    }

    final items = [
      MenuItem(
        key: TrayEntry.open.name,
        label: t.tray.open,
      ),
      MenuItem(
        key: TrayEntry.close.name,
        label: t.tray.close,
      ),
    ];
    await trayManager.setContextMenu(Menu(items: items));
    await trayManager.setToolTip(t.appName);
  } catch (e) {
    print(e);
  }
}

Future<void> hideToTray() async {
  await windowManager.hide();
  if (checkPlatform([TargetPlatform.macOS])) {
    // This will crash on Windows
    // https://github.com/localsend/localsend/issues/32
    await windowManager.setSkipTaskbar(true);
  }
}

Future<void> showFromTray() async {
  await windowManager.show();
  if (checkPlatform([TargetPlatform.macOS])) {
    // This will crash on Windows
    // https://github.com/localsend/localsend/issues/32
    await windowManager.setSkipTaskbar(false);
  }
}
