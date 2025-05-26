import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/animation_provider.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
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
  try {
    if (checkPlatform([TargetPlatform.windows])) {
      await tm.trayManager.setIcon(Assets.img.logo);
    } else if (checkPlatform([TargetPlatform.macOS])) {
      // The menu bar icon will created in AppDelegate.swift
      return;
    } else if (checkPlatform([TargetPlatform.linux])) {
      String icon;
      if (await File('/.flatpak-info').exists()) {
        // Icon for Flatpak, which must exist in /app/share/icons/hicolor/*x*/apps.
        icon = 'org.localsend.localsend_app-tray';
      } else {
        icon = Assets.img.logo32White.path;
      }
      _logger.info('Using "$icon" as path of system tray icon');
      await tm.trayManager.setIcon(icon);
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
        label: defaultTargetPlatform == TargetPlatform.windows ? t.tray.closeWindows : t.tray.close,
      ),
    ];
    await tm.trayManager.setContextMenu(tm.Menu(items: items));
    // No Linux implementation for setToolTip available as of tray_manager 0.2.2
    // https://pub.dev/packages/tray_manager#api
    if (!checkPlatform([TargetPlatform.linux])) {
      await tm.trayManager.setToolTip(t.appName);
    }
  } catch (e) {
    _logger.warning('Failed to init tray', e);
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
    appWindow.show();
  }

  // Enable animations
  RefenaScope.defaultRef.notifier(sleepProvider).setState((_) => false);
}

Future<void> destroyTray() async {
  if (!checkPlatform([TargetPlatform.linux])) {
    await tm.trayManager.destroy();
  }
}
