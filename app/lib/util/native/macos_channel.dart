import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/gen/strings.g.dart';

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

Stream<List<String>> getPendingFilesStream() {
  if (defaultTargetPlatform != TargetPlatform.macOS) {
    return Stream.value(<String>[]).asBroadcastStream();
  }

  final controller = StreamController<List<String>>();
  _methodChannel.setMethodCallHandler((call) async {
    if (call.method == 'onPendingFiles') {
      controller.add((call.arguments as List).cast<String>());
    }
  });

  return controller.stream.asBroadcastStream();
}
