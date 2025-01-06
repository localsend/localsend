import 'dart:io';

import 'package:glob/glob.dart';

const String ignoreName = '.sendignore';
const String globalIgnoreDirectory = '';

Future<bool> checkIgnoreValidity(String relativePath, Set<Glob> globs) async {
  return globs.any((glob) => glob.matches(relativePath));
}

class IgnoreManager {
  final String directoryPath;

  const IgnoreManager(this.directoryPath);

  Future<Set<Glob>> getGlobs() async {
    final String projectIgnorePath = '$directoryPath/$ignoreName';
    if (!await File(projectIgnorePath).exists()) {
      final String globalIgnorePath = '$globalIgnoreDirectory/$ignoreName';
      if (!await File(globalIgnorePath).exists()) {
        return {};
      }
      return SendIgnore(globalIgnorePath).globs;
    }
    return SendIgnore(projectIgnorePath).globs;
  }
}

class SendIgnore {
  final String ignorePath;

  const SendIgnore(this.ignorePath);

  Future<Set<Glob>> get globs async {
    File ignoreFile = File(ignorePath);
    return makeGlobs(ignoreFile);
  }

  Future<Set<Glob>> makeGlobs(File ignoreFile) async {
    if (!await ignoreFile.exists()) {
      return {};
    }
    final List<String> ignoreContents = await ignoreFile.readAsLines();
    final Set<Glob> ignoreGlobs = ignoreContents.map((line) => Glob(line)).toSet();
    return ignoreGlobs;
  }
}