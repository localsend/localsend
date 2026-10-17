import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/util/rust.dart';

void main() {
  FileDto createDto({required bool secret}) {
    return FileDto(
      id: 'id',
      fileName: 'secret.pdf',
      size: 1024,
      fileType: FileType.pdf,
      hash: null,
      preview: null,
      metadata: null,
      secret: secret,
    );
  }

  test('Should omit secret when not set, so regular transfers stay unchanged on the wire', () {
    expect(createDto(secret: false).toRust().secret, null);
  });

  test('Should keep secret through the Rust conversion', () {
    final rust = createDto(secret: true).toRust();
    expect(rust.secret, true);
    expect(rust.toDart().secret, true);
  });

  test('Should treat a missing secret field as not secret', () {
    expect(const FileDtoMapper().decode({'id': 'id', 'fileName': 'a.txt', 'size': 1, 'fileType': 'text/plain'}).secret, false);
  });
}
