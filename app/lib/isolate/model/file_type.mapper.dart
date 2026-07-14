// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
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
      case r'image':
        return FileType.image;
      case r'video':
        return FileType.video;
      case r'pdf':
        return FileType.pdf;
      case r'text':
        return FileType.text;
      case r'apk':
        return FileType.apk;
      case r'other':
        return FileType.other;
      default:
        return FileType.values[5];
    }
  }

  @override
  dynamic encode(FileType self) {
    switch (self) {
      case FileType.image:
        return r'image';
      case FileType.video:
        return r'video';
      case FileType.pdf:
        return r'pdf';
      case FileType.text:
        return r'text';
      case FileType.apk:
        return r'apk';
      case FileType.other:
        return r'other';
    }
  }
}

extension FileTypeMapperExtension on FileType {
  String toValue() {
    FileTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FileType>(this) as String;
  }
}

