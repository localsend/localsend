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

  /// Returns whether [relativePath] contains at least one hidden path
  /// component.
  ///
  /// The path may use `/` or `\` as separator. A path is considered hidden
  /// when any of its components is hidden according to [isHidden], so
  /// `sub/.git/config`, `.ssh/id_rsa` and `.DS_Store` are all hidden.
  ///
  /// This is used for platforms that hand out a flat list of files with
  /// their path relative to the selected folder (e.g. Android's Storage
  /// Access Framework), where the hidden directories are already traversed
  /// by the platform and therefore cannot be pruned while walking the tree.
  bool isHiddenPath(String relativePath) {
    for (final component in relativePath.split(RegExp(r'[/\\]'))) {
      if (component.isEmpty) {
        continue;
      }
      if (isHidden(component)) {
        return true;
      }
    }
    return false;
  }

  /// Returns whether the file at [relativePath] must be skipped.
  ///
  /// [relativePath] is the path of the file relative to the selected
  /// folder, prefixed with the name of that folder (e.g. `Office/.ssh/id_rsa`
  /// for a file `.ssh/id_rsa` inside the folder `Office`).
  ///
  /// The name of the selected folder itself is never treated as hidden,
  /// because the user selected it explicitly. Every component below it is
  /// checked, so a file is skipped when it is hidden itself or when it is
  /// located inside (or below) a hidden directory.
  bool isHiddenFileInFolder({
    required String folderName,
    required String relativePath,
  }) {
    final innerRelative = relativePath.startsWith('$folderName/') ? relativePath.substring(folderName.length + 1) : relativePath;
    return isHiddenPath(innerRelative);
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
