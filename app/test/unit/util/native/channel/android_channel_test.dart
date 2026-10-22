import 'package:localsend_app/util/native/channel/android_channel.dart';
import 'package:test/test.dart';

void main() {
  group('parsePickDirectoryFiles', () {
    test('should correctly parse list format (compact array representation)', () {
      final rawList = [
        ['file1.txt', 1024, 'content://com.android.externalstorage.documents/document/file1', '2026-10-21T12:00:00Z'],
        ['file2.png', 2048576, 'content://com.android.externalstorage.documents/document/file2', null],
      ];

      final files = parsePickDirectoryFiles(rawList);

      expect(files.length, 2);
      expect(files[0].name, 'file1.txt');
      expect(files[0].size, 1024);
      expect(files[0].uri, 'content://com.android.externalstorage.documents/document/file1');
      expect(files[0].lastModified, '2026-10-21T12:00:00Z');

      expect(files[1].name, 'file2.png');
      expect(files[1].size, 2048576);
      expect(files[1].uri, 'content://com.android.externalstorage.documents/document/file2');
      expect(files[1].lastModified, isNull);
    });

    test('should correctly parse legacy map format', () {
      final rawList = [
        {
          'name': 'document.pdf',
          'size': 4096,
          'uri': 'content://com.android.externalstorage.documents/document/pdf1',
          'lastModified': '2026-10-22T08:00:00Z',
        },
      ];

      final files = parsePickDirectoryFiles(rawList);

      expect(files.length, 1);
      expect(files[0].name, 'document.pdf');
      expect(files[0].size, 4096);
      expect(files[0].uri, 'content://com.android.externalstorage.documents/document/pdf1');
      expect(files[0].lastModified, '2026-10-22T08:00:00Z');
    });

    test('should handle empty input list', () {
      final files = parsePickDirectoryFiles([]);
      expect(files, isEmpty);
    });
  });
}
