import 'dart:io';

/// Guards a directory walk against symlink cycles.
///
/// [Directory.list] follows directory symlinks, so a symlink that points
/// back to one of its own ancestors would make the walk descend forever:
/// the path keeps growing until the platform rejects it with a path length
/// error.
///
/// This guard keeps track of the resolved (real) paths of the directories
/// that are currently being descended into. A directory whose real path is
/// already active on the current descent is skipped. The path is removed
/// again when the descent unwinds, so a symlink that points to a directory
/// outside of the current chain is still traversed normally.
class DirectoryWalkGuard {
  /// Resolved paths of the directories that are currently being descended into.
  final Set<String> _activePaths = {};

  /// Returns whether [path] may be descended into.
  ///
  /// [resolve] is used to obtain the real path of [path]. It defaults to
  /// [Directory.resolveSymbolicLinksSync] and may be replaced in tests.
  ///
  /// When the real path of [path] is already active on the current descent,
  /// `false` is returned and the directory is not entered. Otherwise the real
  /// path is remembered and `true` is returned; call [leave] once the
  /// directory has been processed.
  bool enter(String path, {String Function(String path)? resolve}) {
    final resolver = resolve ?? _defaultResolve;
    final String realPath;
    try {
      realPath = resolver(path);
    } on FileSystemException {
      // The path cannot be resolved (e.g. broken symlink or missing
      // directory). It is not a cycle, so it may be entered; listing it
      // will most likely fail and is handled by the caller.
      return true;
    }

    if (!_activePaths.add(realPath)) {
      // Already active on the current descent -> cycle.
      return false;
    }
    return true;
  }

  /// Forgets that [path] is being descended into.
  ///
  /// The real path is resolved again so that the same path that was added
  /// by [enter] is removed. Paths that cannot be resolved are ignored.
  void leave(String path, {String Function(String path)? resolve}) {
    final resolver = resolve ?? _defaultResolve;
    try {
      _activePaths.remove(resolver(path));
    } on FileSystemException {
      // Nothing was remembered for this path.
    }
  }

  /// Number of directories that are currently being descended into.
  int get activeCount => _activePaths.length;

  static String _defaultResolve(String path) => Directory(path).resolveSymbolicLinksSync();
}
