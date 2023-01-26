import 'package:flutter/foundation.dart';
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:tray_manager/tray_manager.dart';

enum TrayEntry {
  open,
  close,
}

Future<void> initTray() async {
  if (!checkPlatform([TargetPlatform.windows, TargetPlatform.macOS])) {
    return;
  }
  try {
    if (checkPlatform([TargetPlatform.windows])) {
      await trayManager.setIcon(Assets.img.logo32Ico,);
    } else if (checkPlatform([TargetPlatform.macOS])) {
      await trayManager.setIcon(Assets.img.logo32BlackWhite.path, isTemplate: true);
    } else {
      await trayManager.setIcon(Assets.img.logo32Png.path);
    }

    final items = [
      MenuItem(
        key: TrayEntry.open.name,
        label: t.general.open,
      ),
      MenuItem(
        key: TrayEntry.close.name,
        label: t.general.close,
      ),
    ];
    await trayManager.setContextMenu(Menu(items: items));
    await trayManager.setToolTip(t.appName);
  } catch (e) {
    print(e);
  }
}
