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

/// Returns a list of files the app was opened with.
/// This happens:
/// - on macOS when files are dropped onto the app Dock icon
/// - on macOS when files are dropped onto the app menu bar icon
/// - on macOS when files are opened with the app via Finder
/// - on macOS when files are shared to the app using the share extension (i.e. the system share menu)
Future<List<String>> getPendingFiles() async {
  if (defaultTargetPlatform != TargetPlatform.macOS) {
    return <String>[];
  }

  final files = await _methodChannel.invokeMethod<List>('getPendingFiles');
  if (files == null) {
    throw PlatformException(
      code: 'UNKNOWN',
      message: 'Unable to get files',
    );
  }

  return files.cast<String>();
}

/// Returns a list of pending strings from the native swift runner.
/// This happens:
/// - on macOS when text is dropped onto the app Dock icon
/// - on macOS when text is dropped onto the app menu bar icon
/// - on macOS when text\web link are shared to the app using the share extension (i.e. the system share menu)
Future<List<String>> getPendingStrings() async {
  if (defaultTargetPlatform != TargetPlatform.macOS) {
    return <String>[];
  }

  final strings = await _methodChannel.invokeMethod<List>('getPendingStrings');
  if (strings == null) {
    throw PlatformException(
      code: 'UNKNOWN',
      message: 'Unable to get strings',
    );
  }

  return strings.cast<String>();
}

final _pendingFilesStreamController = StreamController<List<String>>.broadcast();
Stream<List<String>> get pendingFilesStream => _pendingFilesStreamController.stream;

final _pendingStringsStreamController = StreamController<List<String>>.broadcast();
Stream<List<String>> get pendingStringsStream => _pendingStringsStreamController.stream;

void setupMethodCallHandler() {
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
}
