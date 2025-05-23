import 'dart:async';
import 'dart:io';

import 'package:common/model/file_type.dart';
import 'package:localsend_app/util/native/live_photo_helper.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

final _logger = Logger('LivePhotoCacheProvider');

/// A cache provider for managing Live Photo pairs.
/// Handles temporary storage and pairing of image and video files for Live Photos.
class LivePhotoCacheProvider {
  static final LivePhotoCacheProvider _instance = LivePhotoCacheProvider._internal();
  factory LivePhotoCacheProvider() => _instance;
  LivePhotoCacheProvider._internal();

  final Map<String, _LivePhotoEntry> _cache = {};
  final Duration _timeout = const Duration(minutes: 5);
  Directory? _cacheDir;

  /// Initialize the cache directory and cleanup stale files
  Future<void> init() async {
    if (_cacheDir != null) return; // Already initialized

    try {
      final tempDir = await getTemporaryDirectory();
      _cacheDir = Directory(path.join(tempDir.path, 'live_photo_cache'));

      if (!await _cacheDir!.exists()) {
        await _cacheDir!.create(recursive: true);
      }

      await _cleanupStaleFiles();
      _logger.info('LivePhotoCache initialized: ${_cacheDir!.path}');
    } catch (e, st) {
      _logger.severe('Failed to initialize cache directory', e, st);
      rethrow;
    }
  }

  /// Add a file to the cache and attempt to pair it
  /// The file should already be in a temporary/cache location
  Future<void> addFile(FileType fileType, String cachedFilePath) async {
    await _ensureInitialized();

    final fileName = path.basenameWithoutExtension(cachedFilePath);

    _logger.info('Adding ${fileType.name} file to cache: $fileName');

    try {
      await _processFile(fileName, cachedFilePath, fileType);
    } catch (e, st) {
      _logger.severe('Failed to add file to cache: $cachedFilePath', e, st);
      rethrow;
    }
  }

  /// Clear cache for a specific file
  Future<void> clearCache(String fileName) async {
    final baseName = path.basenameWithoutExtension(fileName);
    final entry = _cache.remove(baseName);
    if (entry != null) {
      await _cleanupEntry(entry);
      _logger.info('Cleared cache for: $baseName');
    }
  }

  /// Clear all cache entries and files
  Future<void> clearAllCache() async {
    // Cleanup all entries
    final entries = List.from(_cache.values);
    _cache.clear();

    await Future.wait(entries.map((entry) => _cleanupEntry(entry)));

    // Cleanup cache directory (if we created any files there)
    if (_cacheDir?.existsSync() == true) {
      try {
        await for (final entity in _cacheDir!.list()) {
          if (entity is File) {
            await entity.delete();
          }
        }
        _logger.info('Cache directory cleaned');
      } catch (e) {
        _logger.warning('Failed to cleanup cache directory', e);
      }
    }
  }

  // Private methods

  Future<void> _ensureInitialized() async {
    if (_cacheDir == null) {
      await init();
    }
  }

  Future<void> _cleanupStaleFiles() async {
    if (_cacheDir == null || !await _cacheDir!.exists()) return;

    try {
      await for (final entity in _cacheDir!.list()) {
        if (entity is File) {
          final stat = await entity.stat();
          final age = DateTime.now().difference(stat.modified);
          if (age > _timeout) {
            await entity.delete();
            _logger.info('Deleted stale cache file: ${entity.path}');
          }
        }
      }
    } catch (e) {
      _logger.warning('Failed to cleanup stale files', e);
    }
  }

  Future<void> _processFile(
    String fileName,
    String cachedFilePath,
    FileType fileType,
  ) async {
    final entry = _cache[fileName] ?? _LivePhotoEntry();

    // Update entry based on file type
    switch (fileType) {
      case FileType.image:
        entry.imagePath = cachedFilePath;
        break;
      case FileType.video:
        entry.videoPath = cachedFilePath;
        break;
      default:
        return;
    }

    _cache[fileName] = entry;

    // Check if pair is complete
    if (entry.isComplete) {
      _logger.info('Live Photo pair completed: $fileName');
      await _processLivePhotoPair(fileName, entry);
    } else {
      // Set timeout for incomplete pairs
      _setTimeoutForEntry(fileName, entry);
    }
  }

  void _setTimeoutForEntry(String fileName, _LivePhotoEntry entry) {
    Timer(_timeout, () {
      final currentEntry = _cache[fileName];
      if (currentEntry == entry && !entry.isComplete) {
        _logger.warning('Live Photo pair timeout: $fileName');
        _cleanupEntry(entry); // ignore 
        _cache.remove(fileName);
      }
    });
  }

  Future<void> _processLivePhotoPair(String fileName, _LivePhotoEntry entry) async {
    if (!entry.isComplete) {
      _logger.warning('Attempted to process incomplete pair: $fileName');
      return;
    }

    try {
      _logger.info('Processing Live Photo pair: $fileName');

      await LivePhotoHelper.putLivePhoto(
        imagePath: entry.imagePath!,
        videoPath: entry.videoPath!,
      );

      _logger.info('Live Photo saved successfully: $fileName');
    } catch (e, st) {
      _logger.severe('Failed to save Live Photo: $fileName', e, st);
    } finally {
      // Cleanup cache files (they were temporary files that should be deleted)
      await _cleanupEntry(entry);
      _cache.remove(fileName);
    }
  }

  Future<void> _cleanupEntry(_LivePhotoEntry entry) async {
    final futures = <Future<void>>[];

    if (entry.imagePath != null) {
      futures.add(_deleteFileIfExists(entry.imagePath!, 'live photo image'));
    }

    if (entry.videoPath != null) {
      futures.add(_deleteFileIfExists(entry.videoPath!, 'live photo video'));
    }

    await Future.wait(futures);
  }

  Future<void> _deleteFileIfExists(String filePath, String fileType) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        _logger.info('Deleted $fileType file: $filePath');
      }
    } catch (e) {
      _logger.warning('Failed to delete $fileType file: $filePath', e);
    }
  }
}

// Private classes

class _LivePhotoEntry {
  String? imagePath;
  String? videoPath;

  bool get isComplete => imagePath != null && videoPath != null;
}
