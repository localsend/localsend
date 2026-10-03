import 'dart:io';

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
      await setTrayIcon(Brightness.dark);
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

/// Applies the tray icon that suits [brightness] on Linux.
///
/// The icon used to be hardcoded to the white variant, which is invisible in a
/// light panel. Both a black and a white asset already exist, so the tray follows
/// the system brightness like the rest of the app does.
/// https://github.com/localsend/localsend/issues/3312
Future<void> setTrayIcon(Brightness brightness) async {
  if (!checkPlatform([TargetPlatform.linux])) {
    return;
  }

  // Flatpak icons must exist under /app/share/icons/hicolor/*x*/apps, so the
  // themed assets cannot be used there.
  if (await File('/.flatpak-info').exists()) {
    _logger.info('Using "org.localsend.localsend_app-tray" as path of system tray icon');
    await tm.trayManager.setIcon('org.localsend.localsend_app-tray');
    return;
  }

  final icon = trayIconForBrightness(brightness);
  _logger.info('Using "${icon.path}" as path of system tray icon');
  await tm.trayManager.setIcon(icon.path);
}

/// The tray asset matching [brightness]: a dark panel needs the light icon and a
/// light panel needs the dark one.
AssetGenImage trayIconForBrightness(Brightness brightness) {
  return brightness == Brightness.dark ? Assets.img.logo32White : Assets.img.logo32Black;
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

Future<void> destroyTray() async {
  if (!checkPlatform([TargetPlatform.linux])) {
    await tm.trayManager.destroy();
  }
}
