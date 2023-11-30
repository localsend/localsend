// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'file_type.dart';

class FileTypeMapper extends EnumMapper<FileType> {
  FileTypeMapper._();

  static FileTypeMapper? _instance;
  static FileTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileTypeMapper._());
    }
    return _instance!;
  }

  static FileType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  FileType decode(dynamic value) {
    switch (value) {
      case 'image':
        return FileType.image;
      case 'video':
        return FileType.video;
      case 'pdf':
        return FileType.pdf;
      case 'text':
        return FileType.text;
      case 'apk':
        return FileType.apk;
      case 'other':
        return FileType.other;
      default:
        return FileType.values[5];
    }
  }

  @override
  dynamic encode(FileType self) {
    switch (self) {
      case FileType.image:
        return 'image';
      case FileType.video:
        return 'video';
      case FileType.pdf:
        return 'pdf';
      case FileType.text:
        return 'text';
      case FileType.apk:
        return 'apk';
      case FileType.other:
        return 'other';
    }
  }
}

extension FileTypeMapperExtension on FileType {
  String toValue() {
    FileTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FileType>(this) as String;
  }
}
