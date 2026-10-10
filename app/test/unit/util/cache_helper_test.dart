import 'dart:io';

import 'package:localsend_app/util/native/cache_helper.dart';
import 'package:test/test.dart';

void main() {
  test('cache cleanup preserves an incoming file and directory contents while deleting other files', () async {
    final cacheDir = Directory.systemTemp.createTempSync('localsend-cache-test-');
    addTearDown(() => cacheDir.deleteSync(recursive: true));

    final incomingDir = Directory('${cacheDir.path}/incoming')..createSync();
    final incomingChild = File('${incomingDir.path}/child.txt')..writeAsStringSync('incoming');
    final incomingFile = File('${cacheDir.path}/single.txt')..writeAsStringSync('incoming');
    final oldFile = File('${cacheDir.path}/old.txt')..writeAsStringSync('old');
    final preservedPaths = {incomingDir.path, incomingFile.path};

    await deleteUnprotectedCacheFile(incomingChild, preservedPaths);
    await deleteUnprotectedCacheFile(incomingFile, preservedPaths);
    await deleteUnprotectedCacheFile(oldFile, preservedPaths);

    expect(incomingChild.readAsStringSync(), 'incoming');
    expect(incomingFile.readAsStringSync(), 'incoming');
    expect(oldFile.existsSync(), isFalse);
  });
}
