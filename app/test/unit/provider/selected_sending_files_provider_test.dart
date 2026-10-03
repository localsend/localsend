import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';

void main() {
  // https://github.com/localsend/localsend/issues/3417
  //
  // Desktop entries declare `Exec=localsend %U`, so a file argument arrives as
  // a file:// URI. Flatpak's `--file-forwarding @@u` delivers it in exactly that
  // form: the same file arrives as `/run/user/1000/doc/<id>/test.txt` in path
  // mode but as `file:///run/user/1000/doc/<id>/test.txt` in URI mode.

  group('resolveArgPath', () {
    test('resolves a file URI to a path', () {
      expect(
        resolveArgPath('file:///home/user/Documents/test.txt'),
        '/home/user/Documents/test.txt',
      );
    });

    test('unescapes percent-encoded characters', () {
      expect(resolveArgPath('file:///home/user/My%20Files/a%2Bb.txt'), '/home/user/My Files/a+b.txt');
    });

    test('leaves a plain path untouched', () {
      expect(resolveArgPath('/home/user/Documents/test.txt'), '/home/user/Documents/test.txt');
    });

    test('leaves a relative path untouched', () {
      expect(resolveArgPath('test.txt'), 'test.txt');
    });

    test('resolves a localhost authority', () {
      expect(resolveArgPath('file://localhost/home/user/test.txt'), '/home/user/test.txt');
    });

    test('rejects a URI pointing at another host', () {
      expect(resolveArgPath('file://remote-host/share/test.txt'), isNull);
    });

    test('rejects a non-file URI scheme', () {
      expect(resolveArgPath('https://example.com/test.txt'), 'https://example.com/test.txt');
    });

    test('rejects a file URI with a fragment', () {
      expect(resolveArgPath('file:///home/user/test.txt#section'), isNull);
    });

    test('resolves a Windows drive letter URI on Windows', () {
      final expected = Platform.isWindows ? r'C:\Users\test.txt' : '/C:/Users/test.txt';
      expect(resolveArgPath('file:///C:/Users/test.txt'), expected);
    });
  });
}
