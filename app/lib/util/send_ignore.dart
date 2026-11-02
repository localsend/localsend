import 'package:glob/glob.dart';

// const _ignoreFileName = '.sendignore';

class SendIgnore {
  final List<Glob> _globs = [];

  SendIgnore();

  bool isIgnoreFile(String fileName) {
    // TODO: Glob does not provide the same gitignore experience
    return false;
    // return fileName == _ignoreFileName;
  }

  /// Returns whether [fileName] is a hidden file or directory name.
  ///
  /// A name is hidden when it starts with a dot (Unix/macOS convention).
  /// The special names `.` and `..` are never hidden because they refer to
  /// the current and the parent directory instead of an actual entry.
  bool isHidden(String fileName) {
    if (fileName == '.' || fileName == '..') {
      return false;
    }
    return fileName.startsWith('.');
  }

  void loadIgnoreContent({
    required String? parentPath,
    required List<String> ignoreContents,
  }) {
    _globs.addAll(
      ignoreContents.map((line) {
        if (line.startsWith('/')) {
          return Glob('$parentPath$line');
        } else {
          if (parentPath == null) {
            return Glob(line);
          } else {
            return Glob('$parentPath/**/$line');
          }
        }
      }),
    );
  }

  bool isIgnored(String relativePath) {
    return _globs.any((glob) => glob.matches('/$relativePath'));
  }
}
