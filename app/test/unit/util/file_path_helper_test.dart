import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/util/file_path_helper.dart';
import 'package:test/test.dart';

void main() {
  test('rename a file without an extension does not add a trailing dot', () {
    expect('README'.withFileNameKeepExtension('renamed'), 'renamed');
  });

  test('rename a file preserves its extension', () {
    expect('photo.jpg'.withFileNameKeepExtension('renamed'), 'renamed.jpg');
    expect('book.epub'.withFileNameKeepExtension('renamed'), 'renamed.epub');
  });

  test('fileName with counter', () async {
    expect('myFile'.withCount(1), 'myFile (1)');
    expect('myFile (1)'.withCount(2), 'myFile (2)');
  });

  test('fileName with counter keeps the extension', () {
    expect('photo.jpg'.withCount(2), 'photo (2).jpg');
    expect('photo (1).jpg'.withCount(3), 'photo (3).jpg');
    expect('book.epub'.withCount(2), 'book (2).epub');
  });

  test('fileName with counter keeps the case of the extension', () {
    expect('Photo.JPG'.withCount(2), 'Photo (2).JPG');
    expect('Book.EPUB'.withCount(2), 'Book (2).EPUB');
  });

  test('fileName with counter treats a leading dot as part of the name', () {
    expect('.bashrc'.withCount(2), '.bashrc (2)');
    expect('.config.json'.withCount(2), '.config (2).json');
  });

  test('guessFileType classifies epub as FileType.other', () {
    expect('book.epub'.guessFileType(), FileType.other);
    expect('book.EPUB'.guessFileType(), FileType.other);
  });

  test('decodeFromMime classifies application/epub+zip as FileType.other', () {
    expect(decodeFromMime('application/epub+zip'), FileType.other);
  });

  test('FileDto lookupMime identifies epub MIME type', () {
    const file = FileDto(
      id: '1',
      fileName: 'book.epub',
      size: 1024,
      fileType: FileType.other,
      hash: null,
      preview: null,
      metadata: null,
    );
    expect(file.lookupMime(), 'application/epub+zip');

    const upperFile = FileDto(
      id: '2',
      fileName: 'book.EPUB',
      size: 1024,
      fileType: FileType.other,
      hash: null,
      preview: null,
      metadata: null,
    );
    expect(upperFile.lookupMime(), 'application/epub+zip');
  });

  test('FileDtoMapper roundtrips epub files with application/epub+zip MIME', () {
    const mapper = FileDtoMapper();
    const original = FileDto(
      id: 'epub-1',
      fileName: 'sample.epub',
      size: 2048,
      fileType: FileType.other,
      hash: 'abc',
      preview: null,
      metadata: null,
    );

    final encoded = mapper.encode(original) as Map<String, dynamic>;
    expect(encoded['fileType'], 'application/epub+zip');
    expect(encoded['fileName'], 'sample.epub');

    final decoded = mapper.decode(encoded);
    expect(decoded.id, 'epub-1');
    expect(decoded.fileName, 'sample.epub');
    expect(decoded.size, 2048);
    expect(decoded.fileType, FileType.other);
    expect(decoded.hash, 'abc');
  });
}
