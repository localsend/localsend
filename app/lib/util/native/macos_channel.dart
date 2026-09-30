import 'dart:async';

import 'package:flutter/services.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/util/native/desktop_notifications.dart';
import 'package:localsend_app/util/native/taskbar_helper.dart';
import 'package:localsend_app/util/native/tray_helper.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:refena_flutter/refena_flutter.dart';

const _methodChannel = MethodChannel('main-delegate-channel');

Future<void> removeExistingDestinationAccess() async {
  await _methodChannel.invokeMethod('removeExistingDestinationAccess');
}

Future<void> persistDestinationFolderAccess(String path) async {
  await _methodChannel.invokeMethod('persistDestinationFolderAccess', path);
}

Future<void> updateDockProgress(double progress) async {
  await _methodChannel.invokeMethod('updateDockProgress', progress);
}

Future<void> setLaunchAtLogin(bool value) async {
  await _methodChannel.invokeMethod('setLaunchAtLogin', value);
}

Future<bool> getLaunchAtLogin() async {
  return await _methodChannel.invokeMethod('getLaunchAtLogin');
}

Future<void> setLaunchAtLoginMinimized(bool value) async {
  await _methodChannel.invokeMethod('setLaunchAtLoginMinimized', value);
}

Future<bool> getLaunchAtLoginMinimized() async {
  return await _methodChannel.invokeMethod('getLaunchAtLoginMinimized');
}

Future<bool> isLaunchedAsLoginItem() async {
  return await _methodChannel.invokeMethod('isLaunchedAsLoginItem');
}

Future<void> setDockIcon(TaskbarIcon icon) async {
  await _methodChannel.invokeMethod('setDockIcon', icon.index);
}

Future<bool> isReduceMotionEnabledMacOs() async {
  return await _methodChannel.invokeMethod('isReduceMotionEnabled') ?? false;
}

Future<void> openFirewallSettings() async {
  await _methodChannel.invokeMethod('openFirewallSettings');
}

// This happens:
/// - on macOS when text is dropped onto the app Dock icon
/// - on macOS when text\web link are shared to the app using the share extension (i.e. the system share menu)
final _pendingFilesStreamController = StreamController<List<String>>.broadcast();
Stream<List<String>> get pendingFilesStream => _pendingFilesStreamController.stream;

/// This happens:
/// - on macOS when text is dropped onto the app Dock icon
/// - on macOS when text\web link are shared to the app using the share extension (i.e. the system share menu)
final _pendingStringsStreamController = StreamController<List<String>>.broadcast();
Stream<List<String>> get pendingStringsStream => _pendingStringsStreamController.stream;

/// Sets up the method call handler.
/// Any call from swift native code is dropped until this method is called.
Future<void> setupMethodCallHandler() async {
  _methodChannel.setMethodCallHandler((call) async {
    switch (call.method) {
      case 'onPendingFiles':
        _pendingFilesStreamController.add((call.arguments as List).cast<String>());
        break;
      case 'onPendingStrings':
        _pendingStringsStreamController.add((call.arguments as List).cast<String>());
        break;
      case 'showLocalSend':
        await showFromTray();
        break;
      case 'incomingTransferPanelAction':
        final args = (call.arguments as Map).cast<String, Object?>();
        final sessionId = args['sessionId'] as String?;
        final action = args['action'] as String?;
        if (sessionId != null && (action == 'accept' || action == 'decline')) {
          await DesktopNotifications.onRequestAction?.call(sessionId, action);
        }
        break;
      case 'setReceivingFromControlCenter':
        final enabled = call.arguments == true;
        final ref = RefenaScope.defaultRef;
        final current = ref.read(serverProvider);
        if (current?.web != null || current?.session?.status == SessionStatus.waiting || current?.session?.status == SessionStatus.sending) {
          return current != null;
        }
        if (enabled && current == null) {
          await ref.notifier(serverProvider).startServerFromSettings();
        } else if (!enabled && current != null) {
          await ref.notifier(serverProvider).stopServer();
        }
        return ref.read(serverProvider) != null;
    }
  });

  await _methodChannel.invokeMethod('methodChannelInitialized');
}
