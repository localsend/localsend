import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

final _logger = Logger('LivePhotoCache');

class LivePhotoCache {
  static final LivePhotoCache _instance = LivePhotoCache._internal();
  factory LivePhotoCache() => _instance;
  LivePhotoCache._internal();

  final Map<String, _LivePhotoEntry> _cache = {};
  final Duration _timeout = const Duration(minutes: 5); // 5分钟超时
  Directory? _cacheDir;

  /// 初始化缓存系统
  Future<void> init() async {
    try {
      final tempDir = await getTemporaryDirectory();
      _cacheDir = Directory('${tempDir.path}/live_photo_cache');
      if (!_cacheDir!.existsSync()) {
        _cacheDir!.createSync();
      }

      // 清理可能存在的旧缓存文件
      await cleanupStaleFiles();
    } catch (e) {
      _logger.severe('Failed to initialize cache directory', e);
    }
  }

  /// 清理过期的缓存文件
  Future<void> cleanupStaleFiles() async {
    if (_cacheDir == null) return;

    try {
      final files = _cacheDir!.listSync();
      for (var file in files) {
        if (file is File) {
          final stat = file.statSync();
          final age = DateTime.now().difference(stat.modified);
          if (age > _timeout) {
            await file.delete();
            _logger.info('Deleted stale cache file: ${file.path}');
          }
        }
      }
    } catch (e) {
      _logger.warning('Failed to cleanup stale files', e);
    }
  }

  /// 将文件复制到缓存目录
  Future<String> _copyToCache(String originalPath) async {
    if (_cacheDir == null) {
      await init();
    }

    final fileName = path.basename(originalPath);
    final cachePath = path.join(_cacheDir!.path, fileName);
    await File(originalPath).copy(cachePath);
    return cachePath;
  }

  Future<void> addFile(String filePath) async {
    // 首先将文件复制到缓存目录
    final cachedPath = await _copyToCache(filePath);
    final fileName = path.basenameWithoutExtension(filePath);
    final extension = path.extension(filePath).toLowerCase();

    _logger.info('Adding file to cache: $cachedPath');

    // 检查是否已存在配对文件
    if (_cache.containsKey(fileName)) {
      final entry = _cache[fileName]!;

      // 根据扩展名确定是图片还是视频
      if (_isImageExtension(extension)) {
        entry.imagePath = cachedPath;
        entry.originalImagePath = filePath;
      } else if (_isVideoExtension(extension)) {
        entry.videoPath = cachedPath;
        entry.originalVideoPath = filePath;
      }

      // 如果配对完成，触发回调并清除缓存
      if (entry.isComplete) {
        _logger.info('Live photo pair complete: $fileName');
        entry.completer.complete(LivePhotoPair(
          imagePath: entry.originalImagePath!,
          videoPath: entry.originalVideoPath!,
          cachedImagePath: entry.imagePath!,
          cachedVideoPath: entry.videoPath!,
        ));
        _cache.remove(fileName);
      }
    } else {
      // 创建新条目
      final entry = _LivePhotoEntry();
      if (_isImageExtension(extension)) {
        entry.imagePath = cachedPath;
        entry.originalImagePath = filePath;
      } else if (_isVideoExtension(extension)) {
        entry.videoPath = cachedPath;
        entry.originalVideoPath = filePath;
      }
      _cache[fileName] = entry;

      // 设置超时
      Timer(_timeout, () {
        if (_cache.containsKey(fileName)) {
          _logger.warning('Live photo pair timeout: $fileName');
          _cleanupEntry(entry);
          _cache.remove(fileName);
        }
      });
    }
  }

  Future<LivePhotoPair?> waitForPair(String filePath) async {
    final fileName = path.basenameWithoutExtension(filePath);

    // 如果已经有完整的配对，直接返回
    if (_cache.containsKey(fileName) && _cache[fileName]!.isComplete) {
      final entry = _cache[fileName]!;
      final pair = LivePhotoPair(
        imagePath: entry.originalImagePath!,
        videoPath: entry.originalVideoPath!,
        cachedImagePath: entry.imagePath!,
        cachedVideoPath: entry.videoPath!,
      );
      _cache.remove(fileName);
      return pair;
    }

    // 如果缓存中没有，添加到缓存
    if (!_cache.containsKey(fileName)) {
      final cachedPath = await _copyToCache(filePath);
      final entry = _LivePhotoEntry();
      final extension = path.extension(filePath).toLowerCase();

      if (_isImageExtension(extension)) {
        entry.imagePath = cachedPath;
        entry.originalImagePath = filePath;
      } else if (_isVideoExtension(extension)) {
        entry.videoPath = cachedPath;
        entry.originalVideoPath = filePath;
      }

      _cache[fileName] = entry;
    }

    return _cache[fileName]!.completer.future;
  }

  void _cleanupEntry(_LivePhotoEntry entry) {
    try {
      if (entry.imagePath != null) {
        File(entry.imagePath!).deleteSync();
      }
      if (entry.videoPath != null) {
        File(entry.videoPath!).deleteSync();
      }
    } catch (e) {
      _logger.warning('Failed to cleanup cache entry', e);
    }
  }

  bool _isImageExtension(String extension) {
    return ['.jpg', '.jpeg', '.png', '.heic'].contains(extension.toLowerCase());
  }

  bool _isVideoExtension(String extension) {
    return ['.mp4', '.mov', '.m4v'].contains(extension.toLowerCase());
  }

  // 清理指定文件的缓存
  Future<void> clearCache(String fileName) async {
    final entry = _cache[path.basenameWithoutExtension(fileName)];
    if (entry != null) {
      _cleanupEntry(entry);
      _cache.remove(path.basenameWithoutExtension(fileName));
    }
  }

  // 清理所有缓存
  Future<void> clearAllCache() async {
    for (var entry in _cache.values) {
      _cleanupEntry(entry);
    }
    _cache.clear();

    // 清理缓存目录
    if (_cacheDir != null && _cacheDir!.existsSync()) {
      try {
        _cacheDir!.listSync().forEach((entity) {
          if (entity is File) {
            entity.deleteSync();
          }
        });
      } catch (e) {
        _logger.warning('Failed to cleanup cache directory', e);
      }
    }
  }
}

class _LivePhotoEntry {
  String? imagePath; // 缓存路径
  String? videoPath; // 缓存路径
  String? originalImagePath; // 原始路径
  String? originalVideoPath; // 原始路径
  final completer = Completer<LivePhotoPair>();

  bool get isComplete => imagePath != null && videoPath != null;
}

class LivePhotoPair {
  final String imagePath; // 原始路径
  final String videoPath; // 原始路径
  final String cachedImagePath; // 缓存路径
  final String cachedVideoPath; // 缓存路径

  LivePhotoPair({
    required this.imagePath,
    required this.videoPath,
    required this.cachedImagePath,
    required this.cachedVideoPath,
  });
}
