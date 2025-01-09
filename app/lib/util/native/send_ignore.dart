import 'dart:io';

import 'package:glob/glob.dart';
import 'package:path/path.dart' as p;

const String ignoreName = '.sendignore';
const String globalIgnoreDirectory = '';

Future<bool> checkIgnoreValidity(String relativePath, Set<Glob> globs) async {
  return globs.any((glob) => glob.matches(relativePath));
}

class IgnoreManager {
  final String directoryPath;

  const IgnoreManager(this.directoryPath);

  Future<Set<Glob>> getGlobs() async {
    final availablePaths = ignorePathCandidates.skipWhile((ignorePath) => !File('$ignorePath/$ignoreName').existsSync()).toList();
    if (availablePaths.isEmpty) {
      return {};
    }
    final firstCandidate = availablePaths.first;
    // final String projectIgnorePath = '$directoryPath/$ignoreName';
    // if (!await File(projectIgnorePath).exists()) {
    //   final String globalIgnorePath = '$globalIgnoreDirectory/$ignoreName';
    //   if (!await File(globalIgnorePath).exists()) {
    //     return {};
    //   }
    //   return SendIgnore(globalIgnorePath).globs;
    // }
    return SendIgnore(firstCandidate).globs;
  }

  List<String> get ignorePathCandidates {
    return [directoryPath, globalIgnoreDirectory];
  }
}

class SendIgnore {
  final String directoryPath;

  const SendIgnore(this.directoryPath);

  Future<Set<Glob>> get globs async {
    File ignoreFile = File('$directoryPath/$ignoreName');
    return makeGlobs(ignoreFile);
  }

  Future<Set<Glob>> makeGlobs(File ignoreFile) async {
    // if (!await ignoreFile.exists()) {
    //   return {};
    // }
    final List<String> ignoreContents = await ignoreFile.readAsLines();
    final Set<Glob> ignoreGlobs = ignoreContents.map((line) => Glob('$directoryBaseName/$line')).toSet();
    return ignoreGlobs;
  }

  String get directoryBaseName {
    return p.basename(directoryPath);
  }
}
