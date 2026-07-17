import 'package:localsend_app/isolate/model/file_type.dart';
import 'package:localsend_app/util/native/clipboard.dart';
import 'package:test/test.dart';

void main() {
  group('canCopyImageToClipboard', () {
    test('desktop + image + path → true', () {
      expect(
        canCopyImageToClipboard(
          path: '/tmp/photo.png',
          fileType: FileType.image,
          isDesktop: true,
        ),
        isTrue,
      );
    });

    test('mobile + image + path → false', () {
      expect(
        canCopyImageToClipboard(
          path: '/tmp/photo.png',
          fileType: FileType.image,
          isDesktop: false,
        ),
        isFalse,
      );
    });

    test('desktop + non-image + path → false', () {
      for (final type in [FileType.video, FileType.pdf, FileType.text, FileType.apk, FileType.other]) {
        expect(
          canCopyImageToClipboard(
            path: '/tmp/file',
            fileType: type,
            isDesktop: true,
          ),
          isFalse,
          reason: '$type must not match',
        );
      }
    });

    test('desktop + image + null path → false', () {
      expect(
        canCopyImageToClipboard(
          path: null,
          fileType: FileType.image,
          isDesktop: true,
        ),
        isFalse,
      );
    });

    test('desktop + image + empty path → false', () {
      expect(
        canCopyImageToClipboard(
          path: '',
          fileType: FileType.image,
          isDesktop: true,
        ),
        isFalse,
      );
    });
  });
}
