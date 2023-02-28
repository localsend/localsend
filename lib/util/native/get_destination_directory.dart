import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path;

Future<String> getDefaultDestinationDirectory() async {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return '/storage/emulated/0/Download';
    case TargetPlatform.iOS:
      return (await path.getApplicationDocumentsDirectory()).path;
    case TargetPlatform.linux:
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
    case TargetPlatform.fuchsia:
      return (await path.getDownloadsDirectory())!.path.replaceAll('\\', '/');
  }
}
