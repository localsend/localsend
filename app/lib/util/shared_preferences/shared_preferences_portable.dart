import 'dart:io';

import 'package:localsend_app/util/shared_preferences/shared_preferences_file.dart';
import 'package:path/path.dart' as path;

/// Custom implementation of SharedPreferencesStorePlatform
/// that uses a file named settings.json located next to the executable.
/// This is used to for portable mode.
class SharedPreferencesPortable extends SharedPreferencesFile {
  SharedPreferencesPortable() : super(filePath: _getSettingsPathFromExecutable(), beautify: true);
}

/// Returns the absolute path to the settings.json file next to the executable.
String _getSettingsPathFromExecutable() {
  final executablePath = Platform.resolvedExecutable;
  final executableParentPath = File(executablePath).parent.path;
  return path.join(executableParentPath, 'settings.json');
}
