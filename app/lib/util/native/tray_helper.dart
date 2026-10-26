import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/animation_provider.dart';
import 'package:localsend_app/util/native/linux_tray.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:tray_kit/tray_kit.dart';
import 'package:tray_manager/tray_manager.dart' as tm;
import 'package:window_manager/window_manager.dart';

final _logger = Logger('TrayHelper');

enum TrayEntry {
  open,
  close,
}

/// Initializes the system tray for the current desktop platform.
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
      final shown = await showLinuxTray(
        platform: TrayKitPlatform.instance,
        icon: await TrayIcon.asset(Assets.img.logo32White.path),
        tooltip: t.appName,
        openLabel: t.tray.open,
        closeLabel: t.tray.close,
        onOpen: () => unawaited(showFromTray()),
        onClose: () => exit(0),
      );
      if (!shown) {
        _logger.warning('No StatusNotifierItem host found');
      }
      return;
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
    await tm.trayManager.setToolTip(t.appName);
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
  try {
    RefenaScope.defaultRef.notifier(sleepProvider).setState((_) => true);
  } catch (e) {
    _logger.warning('Failed to update sleep state (Refena not yet initialized)', e);
  }
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
  try {
    RefenaScope.defaultRef.notifier(sleepProvider).setState((_) => false);
  } catch (e) {
    _logger.warning('Failed to update sleep state (Refena not yet initialized)', e);
  }
}

/// Removes the system tray icon when the application exits.
Future<void> destroyTray() async {
  if (checkPlatform([TargetPlatform.linux])) {
    await hideLinuxTray(TrayKitPlatform.instance);
    return;
  }
  await tm.trayManager.destroy();
}
