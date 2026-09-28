import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/util/transfer_preview.dart';
import 'package:localsend_isolates/model/file_type.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  CrossFile file({required FileType type, required List<int> bytes}) => CrossFile(
    name: 'photo.png',
    fileType: type,
    size: bytes.length,
    thumbnail: null,
    asset: null,
    path: null,
    bytes: bytes,
    lastModified: null,
    lastAccessed: null,
  );

  test('creates a bounded image preview from an image file', () async {
    final source = img.encodePng(img.Image(width: 320, height: 160));
    final preview = await createTransferImagePreview(file(type: FileType.image, bytes: source));
    expect(preview, isNotNull);
    final decoded = decodeTransferImagePreview(preview);
    expect(decoded, isNotNull);
    final image = img.decodePng(decoded!);
    expect(image?.width, 96);
    expect(image?.height, 48);
  });

  test('ignores file types without an image thumbnail', () async {
    expect(await createTransferImagePreview(file(type: FileType.pdf, bytes: [1, 2, 3])), isNull);
  });

  test('rejects text, malformed data, and oversized dimensions', () {
    expect(decodeTransferImagePreview('hello'), isNull);
    expect(decodeTransferImagePreview('data:image/png;base64,???'), isNull);

    final bytes = Uint8List.fromList(img.encodePng(img.Image(width: 2, height: 2)));
    bytes.buffer.asByteData().setUint32(16, 257);
    expect(decodeTransferImagePreview('data:image/png;base64,${base64Encode(bytes)}'), isNull);
    expect(decodeTransferImagePreview('data:image/png;base64,${base64Encode(Uint8List(65 * 1024))}'), isNull);
  });
}
