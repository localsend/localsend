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

  test('fileName with counter keeps the extension', () {
    expect('photo.jpg'.withCount(2), 'photo (2).jpg');
    expect('photo (1).jpg'.withCount(3), 'photo (3).jpg');
  });

  test('fileName with counter keeps the case of the extension', () {
    expect('Photo.JPG'.withCount(2), 'Photo (2).JPG');
  });

  test('fileName with counter treats a leading dot as part of the name', () {
    expect('.bashrc'.withCount(2), '.bashrc (2)');
    expect('.config.json'.withCount(2), '.config (2).json');
  });
}
