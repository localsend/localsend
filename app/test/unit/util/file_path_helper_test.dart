import 'package:localsend_isolates/util/file_path_helper.dart';
import 'package:test/test.dart';

void main() {
  test('rename a file without an extension does not add a trailing dot', () {
    expect('README'.withFileNameKeepExtension('renamed'), 'renamed');
  });

  test('rename a file preserves its extension', () {
    expect('photo.jpg'.withFileNameKeepExtension('renamed'), 'renamed.jpg');
  });

  test('fileName with counter', () async {
    expect('myFile'.withCount(1), 'myFile (1)');
    expect('myFile (1)'.withCount(2), 'myFile (2)');
  });
}
