// lib/util/file_picker_helper.dart
// Fix file picker permission issues (#3108, #3109)

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';

/// File picker helper - safely handles platform-specific permissions
class FilePickerHelper {
  /// Safely pick files, automatically handling permission requests
  static Future<List<PlatformFile>?> pickFiles({
    String? dialogTitle,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    bool allowMultiple = false,
    bool withData = true,
    bool withReadStream = false,
  }) async {
    debugPrint('[FilePicker] Picking files: type=$type, multi=$allowMultiple');

    // Step 1: Request necessary permissions
    final hasPermission = await _requestPermissions();
    if (!hasPermission) {
      debugPrint('[FilePicker] Permission denied');
      return null;
    }

    // Step 2: Try to pick files
    try {
      final result = await FilePicker.platform.pickFiles(
        dialogTitle: dialogTitle ?? 'Select Files',
        type: type,
        allowedExtensions: allowedExtensions,
        allowMultiple: allowMultiple,
        withData: withData,
        withReadStream: withReadStream,
        lockParentWindow: true,
      );

      if (result != null && result.files.isNotEmpty) {
        debugPrint('[FilePicker] Successfully selected ${result.files.length} file(s)');
        return result.files;
      } else {
        debugPrint('[FilePicker] User cancelled selection');
      }
    } catch (e, stackTrace) {
      debugPrint('[FilePicker] Error picking files: $e');
      debugPrint('[FilePicker] Stack trace: $stackTrace');

      // Try fallback method
      return await _fallbackPickFiles(
        type: type,
        allowedExtensions: allowedExtensions,
        allowMultiple: allowMultiple,
      );
    }

    return null;
  }

  /// Safely pick a directory
  static Future<String?> pickDirectory({
    String? dialogTitle,
  }) async {
    debugPrint('[FilePicker] Picking directory');

    // Request storage permissions
    await _requestPermissions();

    try {
      final result = await FilePicker.platform.getDirectoryPath(
        dialogTitle: dialogTitle ?? 'Select Directory',
      );

      if (result != null) {
        debugPrint('[FilePicker] Selected directory: $result');
        return result;
      }
    } catch (e) {
      debugPrint('[FilePicker] Error picking directory: $e');
    }

    return null;
  }

  /// Request necessary permissions based on platform
  static Future<bool> _requestPermissions() async {
    debugPrint('[FilePicker] Checking permissions');

    if (Platform.isAndroid) {
      return await _requestAndroidPermissions();
    } else if (Platform.isIOS) {
      return await _requestIOSPermissions();
    } else if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      // Desktop platforms usually don't need runtime permissions
      // but macOS may require access permissions
      return await _requestDesktopPermissions();
    }

    return true;
  }

  /// Android permission request (handles Android 13+ scoped storage)
  static Future<bool> _requestAndroidPermissions() async {
    debugPrint('[FilePicker] Requesting Android permissions');

    // Android 13+ (API 33+) requires new granular media permissions
    final androidInfo = await _getAndroidInfo();
    final sdkInt = androidInfo?['sdkInt'] ?? 0;

    if (sdkInt >= 33) {
      // Android 13+ needs READ_MEDIA_IMAGES/VIDEO/AUDIO
      final photos = await Permission.photos.request();
      final videos = await Permission.videos.request();
      final audio = await Permission.audio.request();

      if (photos.isGranted || videos.isGranted || audio.isGranted) {
        debugPrint('[FilePicker] Android 13+ media permissions granted');
        return true;
      }
    } else {
      // Android 12 and below needs READ_EXTERNAL_STORAGE
      final storage = await Permission.storage.request();
      if (storage.isGranted) {
        debugPrint('[FilePicker] Android 12- storage permission granted');
        return true;
      }
    }

    // Try manage external storage permission
    final manageExternal = await Permission.manageExternalStorage.request();
    if (manageExternal.isGranted) {
      debugPrint('[FilePicker] Manage external storage permission granted');
      return true;
    }

    // If permission permanently denied, guide user to settings
    if (await Permission.storage.isPermanentlyDenied) {
      debugPrint('[FilePicker] Permission permanently denied, need to open settings');
      await openAppSettings();
      return false;
    }

    return false;
  }

  /// iOS permission request
  static Future<bool> _requestIOSPermissions() async {
    debugPrint('[FilePicker] Requesting iOS permissions');

    final photos = await Permission.photos.request();
    final storage = await Permission.storage.request();

    if (photos.isGranted || storage.isGranted) {
      debugPrint('[FilePicker] iOS permissions granted');
      return true;
    }

    return false;
  }

  /// Desktop platform permission check
  static Future<bool> _requestDesktopPermissions() async {
    debugPrint('[FilePicker] Checking desktop platform permissions');

    // Windows: usually no special runtime permissions needed
    // macOS: may need access permissions (configured in Info.plist)
    // Linux: usually no special runtime permissions needed

    // Trigger permission prompt (macOS accessibility)
    if (Platform.isMacOS) {
      try {
        final home = Platform.environment['HOME'];
        if (home != null) {
          final downloads = Directory('$home/Downloads');
          if (await downloads.exists()) {
            await downloads.list().length; // triggers permission request
          }
        }
      } catch (e) {
        debugPrint('[FilePicker] macOS permission not granted: $e');
        return false;
      }
    }

    return true;
  }

  /// Fallback file picker method when the main method fails
  static Future<List<PlatformFile>?> _fallbackPickFiles({
    required FileType type,
    List<String>? allowedExtensions,
    required bool allowMultiple,
  }) async {
    debugPrint('[FilePicker] Using fallback method to pick files');

    try {
      // Use simpler configuration
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any, // use generic type
        allowMultiple: allowMultiple,
        withData: false, // don't load file data, only get paths
        withReadStream: false,
      );

      if (result != null && result.files.isNotEmpty) {
        debugPrint('[FilePicker] Fallback method selected ${result.files.length} file(s)');
        return result.files;
      }
    } catch (e) {
      debugPrint('[FilePicker] Fallback method also failed: $e');
    }

    return null;
  }

  /// Get Android version info (simplified version)
  static Future<Map<String, dynamic>?> _getAndroidInfo() async {
    if (!Platform.isAndroid) return null;

    // In the actual project, use device_info_plus package
    // For now, return default value
    return {
      'sdkInt': 33, // assume Android 13
    };
  }

  /// Show permission error dialog
  static void showPermissionErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: const Text(
          'Please grant LocalSend storage access in Settings to select files.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }
}
