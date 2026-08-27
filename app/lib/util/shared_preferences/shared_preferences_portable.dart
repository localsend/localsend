import 'dart:io';

import 'package:localsend_app/util/shared_preferences/shared_preferences_file.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

final _logger = Logger('SharedPreferencesPortable');

/// Custom implementation of SharedPreferencesStorePlatform
/// that uses a file named settings.json located next to the executable.
/// This is used to for portable mode.
class SharedPreferencesPortable extends SharedPreferencesFile {
  SharedPreferencesPortable() : super(filePath: _getSettingsPathFromExecutable(), beautify: true);
}

/// Returns the absolute path to the settings.json file next to the executable.
String _getSettingsPathFromExecutable() {
  return buildSettingsPath(
    executablePath: _resolveExecutable(),
    fallbackDirectory: () => Directory.current.path,
  );
}

/// Returns [Platform.resolvedExecutable], or null when the VM cannot resolve it.
/// The getter throws a [TypeError] on some virtual disks (e.g. an ImDisk RAM disk),
/// where reading it would crash the app before it even starts.
/// See https://github.com/localsend/localsend/issues/3021
/// and https://github.com/dart-lang/sdk/issues/53424
String? _resolveExecutable() {
  try {
    final executablePath = Platform.resolvedExecutable;
    return executablePath.isEmpty ? null : executablePath;
  } catch (e) {
    _logger.warning('Could not resolve the executable path', e);
    return null;
  }
}

/// Returns the absolute path to the settings.json file next to [executablePath],
/// falling back to [fallbackDirectory] when the executable path is unknown.
/// [fallbackDirectory] is only called when the fallback is actually taken.
@visibleForTesting
String buildSettingsPath({
  required String? executablePath,
  required String Function() fallbackDirectory,
}) {
  final directory = executablePath == null ? fallbackDirectory() : File(executablePath).parent.path;
  return path.join(directory, 'settings.json');
}
