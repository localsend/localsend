import 'dart:io';

import 'package:localsend_app/util/native/software_rendering_helper.dart';

/// Quits the app. Use this instead of [exit] so that platform-specific cleanup runs first.
Future<Never> exitApp() async {
  await releaseRenderCheck();
  exit(0);
}
