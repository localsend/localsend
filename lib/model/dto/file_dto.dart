import 'package:collection/collection.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:mime/mime.dart';

/// The file DTO that is sent between server and client.
/// Custom implementation of freezed & json_serializable to handle legacy enums.
/// The copyWith method is not implemented.
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

  factory FileDto.fromJson(Map<String, Object?> json) => _parseFileDto(json);

  Map<String, dynamic> toJson() => _fileDtoToJson(this);

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

/// This deserializer handles both legacy and mime types.
FileDto _parseFileDto(Map<String, Object?> json) {
  final String rawFileType = json['fileType'] as String;
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
    id: json['id'] as String,
    fileName: json['fileName'] as String,
    size: json['size'] as int,
    fileType: fileType,
    hash: json['hash'] as String?,
    preview: json['preview'] as String?,
    legacy: false,
  );
}

/// This serializer checks the legacy flag and serializes the file type accordingly.
Map<String, dynamic> _fileDtoToJson(FileDto instance) {
  return {
    'id': instance.id,
    'fileName': instance.fileName,
    'size': instance.size,
    'fileType': instance.legacy ? instance.fileType.name : instance.lookupMime(),
    if (instance.hash != null)
      'hash': instance.hash,
    if (instance.preview != null)
      'preview': instance.preview,
  };
}
