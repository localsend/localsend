import 'dart:io';

import 'package:localsend_app/util/directory_walk_guard.dart';
import 'package:localsend_app/util/send_ignore.dart';
import 'package:path/path.dart' as p;

/// Walks a directory tree and collects the files that should be sent.
///
/// The walk is deliberately performed manually instead of relying on
/// `Directory.list(recursive: true)`, because hidden entries must be pruned
/// *before* their content is traversed: a hidden directory is not descended
/// into at all, so the files inside it are never even read.
///
/// The walk is also resilient:
///
/// * A symlink that points back to one of its own ancestors would make the
///   walk descend forever, so such a directory is skipped
///   (see [DirectoryWalkGuard]).
/// * A directory that cannot be listed (permission error, broken symlink,
///   ...) is skipped instead of aborting the whole selection.
class DirectoryWalker {
  final SendIgnore sendIgnore;

  /// Called for every skipped entry, with a human readable reason.
  final void Function(String message)? onSkip;

  DirectoryWalker({
    SendIgnore? sendIgnore,
    this.onSkip,
  }) : sendIgnore = sendIgnore ?? SendIgnore();

  /// Returns the paths of all non-hidden files inside [rootPath], relative
  /// to [rootPath], using `/` as the separator.
  ///
  /// The returned paths are relative to the selected directory itself (not
  /// including its name), so the name sent over the wire stays
  /// `$directoryName/$relativePath`.
  Future<List<String>> listFiles(String rootPath) async {
    final result = <String>[];
    final guard = DirectoryWalkGuard();

    // The root directory itself is part of the descent: a symlink that
    // points back to it must be detected as a cycle. When the root cannot
    // be resolved (e.g. it does not exist), the walk simply yields nothing.
    if (guard.enter(rootPath)) {
      try {
        await _collect(Directory(rootPath), rootPath, result, guard);
      } finally {
        guard.leave(rootPath);
      }
    } else {
      _skip('Skipped directory that would cause a symlink cycle: $rootPath');
    }

    return result;
  }

  Future<void> _collect(
    Directory dir,
    String rootPath,
    List<String> result,
    DirectoryWalkGuard guard,
  ) async {
    final List<FileSystemEntity> entities;
    try {
      entities = await dir.list().toList();
    } on FileSystemException catch (e) {
      _skip('Could not read directory ${dir.path}: $e');
      return;
    }

    for (final entity in entities) {
      final fileName = p.basename(entity.path);
      if (sendIgnore.isHidden(fileName)) {
        _skip('Skipped hidden file or directory: $fileName');
        continue;
      }

      if (entity is Directory) {
        if (!guard.enter(entity.path)) {
          _skip('Skipped directory that would cause a symlink cycle: ${entity.path}');
          continue;
        }
        try {
          await _collect(entity, rootPath, result, guard);
        } finally {
          guard.leave(entity.path);
        }
        continue;
      }

      if (entity is! File) {
        continue;
      }

      result.add(p.relative(entity.path, from: rootPath).replaceAll('\\', '/'));
    }
  }

  void _skip(String message) => onSkip?.call(message);
}
