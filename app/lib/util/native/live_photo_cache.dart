import 'dart:async';
import 'dart:io';

import 'package:localsend_app/util/native/live_photo_helper.dart';
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

  /// init cache
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
    _logger.info(
        'File type: ${_isImageExtension(extension) ? 'image' : _isVideoExtension(extension) ? 'video' : 'unknown'}');

    // 检查是否已存在配对文件
    if (_cache.containsKey(fileName)) {
      final entry = _cache[fileName]!;
      _logger.info('Found existing entry for $fileName');
      _logger.info(
          'Current state - image: ${entry.imagePath != null}, video: ${entry.videoPath != null}');

      // 根据扩展名确定是图片还是视频
      if (_isImageExtension(extension)) {
        entry.imagePath = cachedPath;
        entry.originalImagePath = filePath;
        _logger.info('Updated image path for $fileName');
      } else if (_isVideoExtension(extension)) {
        entry.videoPath = cachedPath;
        entry.originalVideoPath = filePath;
        _logger.info('Updated video path for $fileName');
      }

      // 如果配对完成，处理 Live Photo
      if (entry.isComplete) {
        _logger.info('Live photo pair complete: $fileName');
        // 处理 Live Photo
        await _processLivePhotoPair(fileName, entry);
      } else {
        _logger.info('Pair not complete yet for $fileName');
      }
    } else {
      // 创建新条目
      _logger.info('Creating new entry for $fileName');
      final entry = _LivePhotoEntry();
      if (_isImageExtension(extension)) {
        entry.imagePath = cachedPath;
        entry.originalImagePath = filePath;
        _logger.info('Set image path for new entry');
      } else if (_isVideoExtension(extension)) {
        entry.videoPath = cachedPath;
        entry.originalVideoPath = filePath;
        _logger.info('Set video path for new entry');
      }
      _cache[fileName] = entry;

      // 设置超时
      Timer(_timeout, () {
        if (_cache.containsKey(fileName)) {
          _logger.warning('Live photo pair timeout: $fileName');
          _logger.warning(
              'Timeout state - image: ${entry.imagePath != null}, video: ${entry.videoPath != null}');
          _cleanupEntry(entry);
          _cache.remove(fileName);
        }
      });
    }
  }

  // 处理 Live Photo 配对
  Future<void> _processLivePhotoPair(
      String fileName, _LivePhotoEntry entry) async {
    _logger.info('处理 Live Photo 配对: $fileName');

    if (entry.imagePath == null || entry.videoPath == null) {
      _logger.warning('配对不完整，无法处理 Live Photo');
      return;
    }

    try {
      _logger.info('调用 LivePhotoSaver.putLivePhoto');
      _logger.info('图片路径: ${entry.imagePath}');
      _logger.info('视频路径: ${entry.videoPath}');

      await LivePhotoHelper.putLivePhoto(
        imagePath: entry.imagePath!,
        videoPath: entry.videoPath!,
      );

      _logger.info('Live Photo 保存成功');

      // 如果原始文件还存在，删除它们
      if (entry.originalImagePath != null) {
        try {
          final imageFile = File(entry.originalImagePath!);
          if (imageFile.existsSync()) {
            imageFile.deleteSync();
            _logger.info('删除原始图片文件: ${entry.originalImagePath}');
          }
        } catch (e) {
          _logger.warning('删除原始图片文件失败', e);
        }
      }

      if (entry.originalVideoPath != null) {
        try {
          final videoFile = File(entry.originalVideoPath!);
          if (videoFile.existsSync()) {
            videoFile.deleteSync();
            _logger.info('删除原始视频文件: ${entry.originalVideoPath}');
          }
        } catch (e) {
          _logger.warning('删除原始视频文件失败', e);
        }
      }
    } catch (e, st) {
      _logger.severe('保存 Live Photo 失败', e, st);

      // 不再尝试分别保存图片和视频
      // 只记录错误信息
      _logger.info('Live Photo 保存失败，不再尝试分别保存图片和视频');
    } finally {
      // 清理缓存
      _cleanupEntry(entry);
      _cache.remove(fileName);
    }
  }

  Future<LivePhotoPair?> waitForPair(String filePath) async {
    final fileName = path.basenameWithoutExtension(filePath);
    _logger.info('Waiting for pair for file: $fileName');
    _logger.info('Current cache entries: ${_cache.keys.join(', ')}');

    // 如果已经有完整的配对，直接返回
    if (_cache.containsKey(fileName) && _cache[fileName]!.isComplete) {
      _logger.info('Found complete pair for $fileName');
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
      _logger.info('No entry found for $fileName, creating new entry');
      final cachedPath = await _copyToCache(filePath);
      final entry = _LivePhotoEntry();
      final extension = path.extension(filePath).toLowerCase();

      if (_isImageExtension(extension)) {
        _logger.info('Adding image file to cache: $cachedPath');
        entry.imagePath = cachedPath;
        entry.originalImagePath = filePath;
      } else if (_isVideoExtension(extension)) {
        _logger.info('Adding video file to cache: $cachedPath');
        entry.videoPath = cachedPath;
        entry.originalVideoPath = filePath;
      }

      _cache[fileName] = entry;

      // 设置超时
      Timer(_timeout, () {
        if (_cache.containsKey(fileName)) {
          _logger.warning('Live photo pair timeout in waitForPair: $fileName');
          _logger.warning(
              'Timeout state - image: ${entry.imagePath != null}, video: ${entry.videoPath != null}');
          if (!entry.completer.isCompleted) {
            _logger.warning('Completing with null due to timeout');
            entry.completer.complete(null);
          }
          _cleanupEntry(entry);
          _cache.remove(fileName);
        }
      });
    } else {
      _logger
          .info('Found existing entry for $fileName, waiting for completion');
      _logger.info(
          'Current state - image: ${_cache[fileName]!.imagePath != null}, video: ${_cache[fileName]!.videoPath != null}');

      // 添加一个短暂的等待，然后检查是否有配对文件
      // 如果没有，则手动完成配对过程
      Timer(const Duration(seconds: 2), () {
        if (_cache.containsKey(fileName) &&
            !_cache[fileName]!.isComplete &&
            !_cache[fileName]!.completer.isCompleted) {
          _logger
              .warning('No pair found after 2 seconds, completing with null');
          _cache[fileName]!.completer.complete(null);
        }
      });
    }

    _logger.info('Returning future for $fileName');
    return _cache[fileName]!.completer.future;
  }

  void _cleanupEntry(_LivePhotoEntry entry) {
    try {
      if (entry.imagePath != null) {
        final imageFile = File(entry.imagePath!);
        if (imageFile.existsSync()) {
          imageFile.deleteSync();
        }
      }
      if (entry.videoPath != null) {
        final videoFile = File(entry.videoPath!);
        if (videoFile.existsSync()) {
          videoFile.deleteSync();
        }
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
