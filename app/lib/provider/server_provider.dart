// lib/provider/server_provider.dart
// Fix Windows 11 Google Drive conflict (#3106)
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Server provider - resolves Google Drive path conflict on Windows 11
class ServerProvider {
  static final ServerProvider _instance = ServerProvider._internal();
  factory ServerProvider() => _instance;
  ServerProvider._internal();

  static const String _kCustomSaveDirectoryKey = 'custom_save_directory';

  SharedPreferences? _prefs;

  Future<SharedPreferences> _getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  /// Get a safe storage path that avoids cloud sync directories
  Future<String> getSafeStoragePath() async {
    debugPrint('[ServerProvider] Getting safe storage path');

    // Check custom save directory first
    final customDir = await getCustomSaveDirectory();
    if (customDir != null) {
      final dir = Directory(customDir);
      if (await dir.exists()) {
        try {
          final testFile = File(p.join(customDir, '.localsend_test'));
          await testFile.writeAsString('test');
          await testFile.delete();
          debugPrint('[ServerProvider] Using custom save path: $customDir');
          return customDir;
        } catch (e) {
          debugPrint('[ServerProvider] Custom save path unavailable: $customDir, error: $e');
        }
      } else {
        debugPrint('[ServerProvider] Custom save path does not exist: $customDir');
      }
    }

    final possibleDirs = await _getPossibleStorageDirs();

    for (final dir in possibleDirs) {
      try {
        final path = dir.path;

        // Skip if this path is inside a cloud sync directory
        if (_isCloudSyncPath(path)) {
          debugPrint('[ServerProvider] Skipping cloud sync path: $path');
          continue;
        }

        // Verify the directory is writable
        final testFile = File(p.join(path, '.localsend_test'));
        await testFile.writeAsString('test');
        await testFile.delete();

        debugPrint('[ServerProvider] Using safe path: $path');
        return path;
      } catch (e) {
        debugPrint('[ServerProvider] Path unavailable: ${dir.path}, error: $e');
      }
    }

    // Fallback to temp directory if all paths fail
    final tempDir = await getTemporaryDirectory();
    debugPrint('[ServerProvider] Using temp directory: ${tempDir.path}');
    return tempDir.path;
  }

  /// Get a list of possible storage directories (sorted by priority)
  Future<List<Directory>> _getPossibleStorageDirs() async {
    final dirs = <Directory>[];

    // 1. Application support directory (highest priority, usually not in cloud sync)
    try {
      final appSupport = await getApplicationSupportDirectory();
      dirs.add(appSupport);
    } catch (e) {
      debugPrint('[ServerProvider] Cannot get application support directory: $e');
    }

    // 2. Application documents directory
    try {
      final appDoc = await getApplicationDocumentsDirectory();
      dirs.add(appDoc);
    } catch (e) {
      debugPrint('[ServerProvider] Cannot get application documents directory: $e');
    }

    // 3. Downloads directory (mobile only)
    if (Platform.isAndroid || Platform.isIOS) {
      try {
        final downloads = await getDownloadsDirectory();
        if (downloads != null) {
          dirs.add(downloads);
        }
      } catch (e) {
        debugPrint('[ServerProvider] Cannot get downloads directory: $e');
      }
    }

    // 4. Common directories on desktop platforms
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      final home = Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];
      if (home != null) {
        // Downloads directory
        final downloads = Directory(p.join(home, 'Downloads'));
        if (await downloads.exists()) {
          dirs.add(downloads);
        }

        // Desktop directory
        final desktop = Directory(p.join(home, 'Desktop'));
        if (await desktop.exists()) {
          dirs.add(desktop);
        }
      }
    }

    // 5. External storage (Android)
    if (Platform.isAndroid) {
      try {
        final external = await getExternalStorageDirectory();
        if (external != null) {
          dirs.add(external);
        }
      } catch (e) {
        debugPrint('[ServerProvider] Cannot get external storage: $e');
      }
    }

    return dirs;
  }

  /// Check whether a path is inside a cloud sync directory
  bool _isCloudSyncPath(String path) {
    final lowerPath = path.toLowerCase();

    // Common cloud storage directory names
    final cloudDirs = [
      'google drive',
      'googledrive',
      'onedrive',
      'dropbox',
      'icloud',
      'box',
      'nextcloud',
      'mega',
    ];

    // Check if path contains any cloud storage directory name
    for (final dir in cloudDirs) {
      if (lowerPath.contains(dir)) {
        debugPrint('[ServerProvider] Detected cloud storage dir: $dir');
        return true;
      }
    }

    // Windows: check against known cloud storage root paths
    if (Platform.isWindows) {
      final knownCloudPaths = _getWindowsCloudPaths();
      for (final cloudPath in knownCloudPaths) {
        if (lowerPath.startsWith(cloudPath.toLowerCase())) {
          debugPrint('[ServerProvider] Detected Windows cloud path: $cloudPath');
          return true;
        }
      }
    }

    return false;
  }

  /// Get known cloud storage paths on Windows
  List<String> _getWindowsCloudPaths() {
    final paths = <String>[];
    final userProfile = Platform.environment['USERPROFILE'] ?? '';

    // Google Drive
    paths.add(p.join(userProfile, 'Google Drive'));
    paths.add(p.join(userProfile, 'GoogleDrive'));

    // OneDrive
    paths.add(p.join(userProfile, 'OneDrive'));

    // Dropbox
    paths.add(p.join(userProfile, 'Dropbox'));

    return paths;
  }

  /// Save file with duplicate name handling (improved - avoids conflicts)
  Future<String> saveFile(List<int> bytes, String fileName) async {
    debugPrint('[ServerProvider] Saving file: $fileName, size: ${bytes.length} bytes');

    // Get safe storage path
    final saveDir = await getSafeStoragePath();
    final savePath = p.join(saveDir, fileName);

    // Append a counter suffix if file already exists
    var finalPath = savePath;
    var counter = 1;
    while (await File(finalPath).exists()) {
      final nameWithoutExt = p.basenameWithoutExtension(fileName);
      final ext = p.extension(fileName);
      finalPath = p.join(saveDir, '${nameWithoutExt}_$counter$ext');
      counter++;
    }

    try {
      final file = File(finalPath);
      await file.writeAsBytes(bytes);
      debugPrint('[ServerProvider] File saved successfully: $finalPath');
      return finalPath;
    } catch (e, stackTrace) {
      debugPrint('[ServerProvider] Failed to save file: $e');
      debugPrint('[ServerProvider] Stack trace: $stackTrace');

      // Attempt fallback save
      return await _saveFileFallback(bytes, fileName);
    }
  }

  /// Fallback save method using temp directory
  Future<String> _saveFileFallback(List<int> bytes, String fileName) async {
    debugPrint('[ServerProvider] Using fallback method to save file');

    try {
      final tempDir = await getTemporaryDirectory();
      final tempPath = p.join(tempDir.path, fileName);

      final file = File(tempPath);
      await file.writeAsBytes(bytes);

      debugPrint('[ServerProvider] File saved to temp directory: $tempPath');

      // TODO: notify user that file was saved to temp directory
      return tempPath;
    } catch (e) {
      debugPrint('[ServerProvider] Fallback save also failed: $e');
      rethrow;
    }
  }

  /// Get default save directory (for settings page)
  Future<String> getDefaultSaveDirectory() async {
    final path = await getSafeStoragePath();
    return path;
  }

  /// Get custom save directory from SharedPreferences
  Future<String?> getCustomSaveDirectory() async {
    try {
      final prefs = await _getPrefs();
      final path = prefs.getString(_kCustomSaveDirectoryKey);
      debugPrint('[ServerProvider] Loaded custom save directory: $path');
      return path;
    } catch (e) {
      debugPrint('[ServerProvider] Failed to load custom save directory: $e');
      return null;
    }
  }

  /// Set custom save directory
  Future<void> setCustomSaveDirectory(String? path) async {
    try {
      final prefs = await _getPrefs();
      if (path != null) {
        await prefs.setString(_kCustomSaveDirectoryKey, path);
      } else {
        await prefs.remove(_kCustomSaveDirectoryKey);
      }
      debugPrint('[ServerProvider] Setting custom save directory: $path');
    } catch (e) {
      debugPrint('[ServerProvider] Failed to save custom save directory: $e');
    }
  }
}
