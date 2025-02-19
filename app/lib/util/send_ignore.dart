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

  void loadIgnoreContent({
    required String? parentPath,
    required List<String> ignoreContents,
  }) {
    _globs.addAll(ignoreContents.map((line) {
      if (line.startsWith('/')) {
        return Glob('$parentPath$line');
      } else {
        if (parentPath == null) {
          return Glob(line);
        } else {
          return Glob('$parentPath/**/$line');
        }
      }
    }));
  }

  bool isIgnored(String relativePath) {
    return _globs.any((glob) => glob.matches('/$relativePath'));
  }
}
