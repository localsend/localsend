import 'dart:async';
import 'dart:io';

import 'package:localsend_app/util/native/cache_helper.dart';
import 'package:test/test.dart';

void main() {
  test('cache cleanup completes only after temporary file deletion', () async {
    final file = _ControlledFile();
    var completed = false;
    final cleanup = clearTemporaryCacheFiles(_ControlledDirectory(Stream.value(file))).then((_) => completed = true);

    try {
      await file.deleteStarted.future;
      await Future<void>.delayed(Duration.zero);
      expect(completed, isFalse);
    } finally {
      file.deleteFinished.complete(file);
      await cleanup;
    }
    expect(completed, isTrue);
  });
}

class _ControlledDirectory implements Directory {
  final Stream<FileSystemEntity> entries;

  _ControlledDirectory(this.entries);

  @override
  Stream<FileSystemEntity> list({bool recursive = false, bool followLinks = true}) => entries;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _ControlledFile implements File {
  final deleteStarted = Completer<void>();
  final deleteFinished = Completer<File>();

  @override
  Future<File> delete({bool recursive = false}) {
    deleteStarted.complete();
    return deleteFinished.future;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
