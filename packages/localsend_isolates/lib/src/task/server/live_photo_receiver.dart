import 'dart:io';

import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

final _logger = Logger('LivePhotoReceiver');

class LivePhotoFile {
  final String id;
  final String path;
  final String name;
  final bool isImage;

  const LivePhotoFile({
    required this.id,
    required this.path,
    required this.name,
    required this.isImage,
  });
}

class LivePhotoResult {
  final String id;
  final bool savedToGallery;
  final String? path;
  final String? error;

  const LivePhotoResult({
    required this.id,
    required this.savedToGallery,
    required this.path,
    this.error,
  });
}

/// Collects completed components for one receive session. It never waits for a
/// second upload inside the first upload's handler (senders may be sequential).
/// Pairing is by accepted IDs, so cache filename suffixes cannot mix photos.
class LivePhotoReceiver {
  final Map<String, String> pairs;
  final Future<void> Function(String image, String video) savePair;
  final Future<(bool, String?)> Function(LivePhotoFile file) saveSingle;
  final _pending = <String, LivePhotoFile>{};
  final _failed = <String>{};
  bool _closed = false;

  LivePhotoReceiver({
    required this.pairs,
    required this.saveSingle,
    this.savePair = saveNativeLivePhoto,
  });

  bool contains(String id) => pairs.containsKey(id) || pairs.containsValue(id);

  String _partner(String id) => pairs[id] ?? pairs.entries.firstWhere((entry) => entry.value == id).key;

  Future<List<LivePhotoResult>> receive(LivePhotoFile file) async {
    if (_closed || !contains(file.id) || _failed.contains(file.id) || _failed.contains(_partner(file.id))) {
      return [await _saveSingle(file)];
    }
    final partner = _pending.remove(_partner(file.id));
    if (partner == null) {
      _pending[file.id] = file;
      return [];
    }

    final image = file.isImage ? file : partner;
    final video = file.isImage ? partner : file;
    try {
      await savePair(image.path, video.path);
    } catch (e, st) {
      // Both uploads already succeeded. Preserve them through the same gallery
      // fallback used for ordinary media instead of deleting received data.
      _logger.warning(
        'Could not save Live Photo; saving components separately',
        e,
        st,
      );
      return [await _saveSingle(image), await _saveSingle(video)];
    }
    for (final component in [image, video]) {
      try {
        await File(component.path).delete();
      } catch (e) {
        _logger.warning('Could not delete exported Live Photo component', e);
      }
    }
    return [
      LivePhotoResult(id: image.id, savedToGallery: true, path: null),
      LivePhotoResult(id: video.id, savedToGallery: true, path: null),
    ];
  }

  Future<List<LivePhotoResult>> failed(String id) async {
    if (!contains(id)) return [];
    _failed.add(id);
    final partner = _pending.remove(_partner(id));
    return partner == null ? [] : [await _saveSingle(partner)];
  }

  /// Cancellation must preserve any fully received, unmatched components.
  /// In-flight uploads that finish after this call are saved separately too.
  Future<List<LivePhotoResult>> close() async {
    _closed = true;
    final pending = _pending.values.toList();
    _pending.clear();
    return [for (final file in pending) await _saveSingle(file)];
  }

  Future<LivePhotoResult> _saveSingle(LivePhotoFile file) async {
    try {
      final (saved, path) = await saveSingle(file);
      return LivePhotoResult(id: file.id, savedToGallery: saved, path: path);
    } catch (e) {
      // Leave the cached file intact if even the destination fallback fails.
      return LivePhotoResult(
        id: file.id,
        savedToGallery: false,
        path: file.path,
        error: e.toString(),
      );
    }
  }
}

Future<void> saveNativeLivePhoto(String image, String video) async {
  await const MethodChannel(
    'org.localsend.localsend_app/live_photo',
  ).invokeMethod<void>('putLivePhoto', {
    'imagePath': image,
    'videoPath': video,
  });
}
