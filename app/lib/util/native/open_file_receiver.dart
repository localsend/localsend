import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

const _methodChannel = MethodChannel('main-delegate-channel');

/// Returns a list of files the app was opened with.
/// This happens:
/// - on macOS when files are dropped onto the app icon
/// - on macOS when files are opened with the app via Finder
Future<List<String>> getOpenedFiles() async {
  if (defaultTargetPlatform != TargetPlatform.macOS) {
    return <String>[];
  }

  final files = await _methodChannel.invokeMethod<List>('getFiles');
  if (files == null) {
    throw PlatformException(
      code: 'UNKNOWN',
      message: 'Unable to get files',
    );
  }

  return files.cast<String>();
}

Stream<List<String>> getOpenedFilesStream() {
  if (defaultTargetPlatform != TargetPlatform.macOS) {
    return Stream.value(<String>[]).asBroadcastStream();
  }

  final controller = StreamController<List<String>>();
  _methodChannel.setMethodCallHandler((call) async {
    if (call.method == 'onFiles') {
      controller.add((call.arguments as List).cast<String>());
    }
  });

  return controller.stream.asBroadcastStream();
}
