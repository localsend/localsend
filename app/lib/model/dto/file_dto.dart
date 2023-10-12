import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:mime/mime.dart';

/// The file DTO that is sent between server and client.
class FileDto {
  final String id; // unique inside session
  final String fileName;
  final int size;
  final FileType fileType;
  final String? hash;
  final String? preview;

  /// This is only used internally to determine if fileType is a mime type or a legacy enum.
  /// It is not serialized.
  final bool legacy;

  const FileDto({
    required this.id,
    required this.fileName,
    required this.size,
    required this.fileType,
    required this.hash,
    required this.preview,
    required this.legacy,
  });

  String lookupMime() => lookupMimeType(fileName) ?? 'application/octet-stream';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          fileName == other.fileName &&
          size == other.size &&
          fileType == other.fileType &&
          hash == other.hash &&
          preview == other.preview &&
          legacy == other.legacy;

  @override
  int get hashCode => Object.hash(id, fileName, size, fileType, hash, preview, legacy);
}

class FileDtoMapper extends SimpleMapper<FileDto> {
  const FileDtoMapper();

  @override
  FileDto decode(dynamic value) {
    final map = value as Map<String, dynamic>;
    final String rawFileType = map['fileType'] as String;
    final FileType fileType;
    if (rawFileType.contains('/')) {
      // parse mime
      if (rawFileType.startsWith('image/')) {
        fileType = FileType.image;
      } else if (rawFileType.startsWith('video/')) {
        fileType = FileType.video;
      } else if (rawFileType == 'application/pdf') {
        fileType = FileType.pdf;
      } else if (rawFileType.startsWith('text/')) {
        fileType = FileType.text;
      } else if (rawFileType == 'application/vnd.android.package-archive') {
        fileType = FileType.apk;
      } else {
        fileType = FileType.other;
      }
    } else {
      // parse legacy enum to internal internal enum
      fileType = FileType.values.firstWhereOrNull((e) => e.name == rawFileType) ?? FileType.other;
    }

    return FileDto(
      id: map['id'] as String,
      fileName: map['fileName'] as String,
      size: map['size'] as int,
      fileType: fileType,
      hash: map['hash'] as String?,
      preview: map['preview'] as String?,
      legacy: false,
    );
  }

  @override
  dynamic encode(FileDto self) {
    return {
      'id': self.id,
      'fileName': self.fileName,
      'size': self.size,
      'fileType': self.legacy ? self.fileType.name : self.lookupMime(),
      if (self.hash != null) 'hash': self.hash,
      if (self.preview != null) 'preview': self.preview,
    };
  }
}
