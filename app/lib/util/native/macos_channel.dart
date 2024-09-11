import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/native/tray_helper.dart';

const _methodChannel = MethodChannel('main-delegate-channel');

Future<void> setupStatusBar() async {
  if (defaultTargetPlatform != TargetPlatform.macOS) {
    return;
  }

  await _methodChannel.invokeMethod('setupStatusBar', {
    'open': t.tray.open,
    'quit': t.tray.close,
  });
}

// This happens:
/// - on macOS when text is dropped onto the app Dock icon
/// - on macOS when text is dropped onto the app menu bar icon
/// - on macOS when text\web link are shared to the app using the share extension (i.e. the system share menu)
final _pendingFilesStreamController = StreamController<List<String>>.broadcast();
Stream<List<String>> get pendingFilesStream => _pendingFilesStreamController.stream;

/// This happens:
/// - on macOS when text is dropped onto the app Dock icon
/// - on macOS when text is dropped onto the app menu bar icon
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
      case 'showLocalSendFromMenuBar':
        await showFromTray();
        break;
    }
  });

  await _methodChannel.invokeMethod('methodChannelInitialized');
}
