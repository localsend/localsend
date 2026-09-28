import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/animation_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:tray_manager/tray_manager.dart' as tm;
import 'package:window_manager/window_manager.dart';

final _logger = Logger('TrayHelper');

enum TrayEntry {
  open,
  receiving,
  close,
}

bool _receiving = false;
bool _receivingBusy = false;

Future<void> toggleDesktopReceiving() async {
  if (!checkPlatformIsDesktop()) return;
  final ref = RefenaScope.defaultRef;
  final current = ref.read(serverProvider);
  if (current?.web != null || current?.session?.status == SessionStatus.waiting || current?.session?.status == SessionStatus.sending) return;
  try {
    if (current == null) {
      await ref.notifier(serverProvider).startServerFromSettings();
    } else {
      await ref.notifier(serverProvider).stopServer();
    }
  } catch (e) {
    _logger.warning('Could not toggle desktop receiving', e);
    await showFromTray();
  }
}

Future<void> updateDesktopTray({required bool receiving, required bool busy}) async {
  if (!checkPlatformIsDesktop() || (_receiving == receiving && _receivingBusy == busy)) return;
  final previousReceiving = _receiving;
  final previousBusy = _receivingBusy;
  _receiving = receiving;
  _receivingBusy = busy;
  try {
    if (checkPlatform([TargetPlatform.macOS])) {
      await const MethodChannel('main-delegate-channel').invokeMethod<void>('setReceivingControlState', {
        'receiving': receiving,
        'busy': busy,
      });
    } else {
      await _setTrayMenu();
    }
  } catch (e) {
    _receiving = previousReceiving;
    _receivingBusy = previousBusy;
    _logger.warning('Could not update receiving menu', e);
  }
}

Future<void> _setTrayMenu() async {
  await tm.trayManager.setContextMenu(
    tm.Menu(
      items: [
        tm.MenuItem(key: TrayEntry.open.name, label: t.tray.open),
        tm.MenuItem(
          key: TrayEntry.receiving.name,
          label: _receiving ? t.tray.stopReceiving : t.tray.startReceiving,
          disabled: _receivingBusy,
        ),
        tm.MenuItem(key: TrayEntry.close.name, label: defaultTargetPlatform == TargetPlatform.windows ? t.tray.closeWindows : t.tray.close),
      ],
    ),
  );
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

    await _setTrayMenu();
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
