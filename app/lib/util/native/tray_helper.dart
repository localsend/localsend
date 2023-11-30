import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/animation_provider.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:system_tray/system_tray.dart';
import 'package:tray_manager/tray_manager.dart' as tm;
import 'package:window_manager/window_manager.dart';

final _logger = Logger('TrayHelper');

enum TrayEntry {
  open,
  close,
}

Future<void> initTray() async {
  if (!checkPlatformHasTray()) {
    return;
  }
  if (!checkPlatform([TargetPlatform.linux])) {
    try {
      if (checkPlatform([TargetPlatform.windows])) {
        await tm.trayManager.setIcon(
          Assets.img.logo,
        );
      } else if (checkPlatform([TargetPlatform.macOS])) {
        await tm.trayManager.setIcon(Assets.img.logo32Black.path, isTemplate: true);
      } else {
        await tm.trayManager.setIcon(Assets.img.logo32.path);
      }

      final items = [
        tm.MenuItem(
          key: TrayEntry.open.name,
          label: t.tray.open,
        ),
        tm.MenuItem(
          key: TrayEntry.close.name,
          label: t.tray.close,
        ),
      ];
      await tm.trayManager.setContextMenu(tm.Menu(items: items));
      await tm.trayManager.setToolTip(t.appName);
    } catch (e) {
      _logger.warning('Failed to init tray', e);
    }
  } else {
    // The Linux tray display is handled by systemTray instead
    final SystemTray systemTray = SystemTray();

    await systemTray.initSystemTray(
      title: t.appName,
      iconPath: Assets.img.logo32White.path,
    );

    final Menu menu = Menu();
    await menu.buildFrom([
      MenuItemLabel(
        label: t.tray.open,
        onClicked: (menuItem) async {
          await windowManager.show();
          await windowManager.focus();
        },
      ),
      MenuItemLabel(label: t.tray.close, onClicked: (menuItem) => exit(0)),
    ]);

    await systemTray.setContextMenu(menu);

    systemTray.registerSystemTrayEventHandler((eventName) {
      if (eventName == kSystemTrayEventClick) {
        systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventRightClick) {
        WindowManager.instance.show();
      }
    });
  }
}

Future<void> hideToTray() async {
  await windowManager.hide();
  if (checkPlatform([TargetPlatform.macOS])) {
    // This will crash on Windows
    // https://github.com/localsend/localsend/issues/32
    await windowManager.setSkipTaskbar(true);
  }

  // Disable animations
  RefenaScope.defaultRef.notifier(sleepProvider).setState((_) => true);
}

Future<void> showFromTray() async {
  await windowManager.show();
  await windowManager.focus();
  if (checkPlatform([TargetPlatform.macOS])) {
    // This will crash on Windows
    // https://github.com/localsend/localsend/issues/32
    await windowManager.setSkipTaskbar(false);
  }

  // Enable animations
  RefenaScope.defaultRef.notifier(sleepProvider).setState((_) => false);
}
