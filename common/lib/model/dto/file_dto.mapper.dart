// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'file_dto.dart';

class FileMetadataMapper extends ClassMapperBase<FileMetadata> {
  FileMetadataMapper._();

  static FileMetadataMapper? _instance;
  static FileMetadataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileMetadataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FileMetadata';

  static DateTime? _$lastModified(FileMetadata v) => v.lastModified;
  static const Field<FileMetadata, DateTime> _f$lastModified = Field('lastModified', _$lastModified, key: 'modified');
  static DateTime? _$lastAccessed(FileMetadata v) => v.lastAccessed;
  static const Field<FileMetadata, DateTime> _f$lastAccessed = Field('lastAccessed', _$lastAccessed, key: 'accessed');

  @override
  final MappableFields<FileMetadata> fields = const {
    #lastModified: _f$lastModified,
    #lastAccessed: _f$lastAccessed,
  };
  @override
  final bool ignoreNull = true;

  static FileMetadata _instantiate(DecodingData data) {
    return FileMetadata(lastModified: data.dec(_f$lastModified), lastAccessed: data.dec(_f$lastAccessed));
  }

  @override
  final Function instantiate = _instantiate;

  static FileMetadata fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileMetadata>(map);
  }

  static FileMetadata deserialize(String json) {
    return ensureInitialized().decodeJson<FileMetadata>(json);
  }
}

mixin FileMetadataMappable {
  String serialize() {
    return FileMetadataMapper.ensureInitialized().encodeJson<FileMetadata>(this as FileMetadata);
  }

  Map<String, dynamic> toJson() {
    return FileMetadataMapper.ensureInitialized().encodeMap<FileMetadata>(this as FileMetadata);
  }

  FileMetadataCopyWith<FileMetadata, FileMetadata, FileMetadata> get copyWith =>
      _FileMetadataCopyWithImpl(this as FileMetadata, $identity, $identity);
  @override
  String toString() {
    return FileMetadataMapper.ensureInitialized().stringifyValue(this as FileMetadata);
  }

  @override
  bool operator ==(Object other) {
    return FileMetadataMapper.ensureInitialized().equalsValue(this as FileMetadata, other);
  }

  @override
  int get hashCode {
    return FileMetadataMapper.ensureInitialized().hashValue(this as FileMetadata);
  }
}

extension FileMetadataValueCopy<$R, $Out> on ObjectCopyWith<$R, FileMetadata, $Out> {
  FileMetadataCopyWith<$R, FileMetadata, $Out> get $asFileMetadata => $base.as((v, t, t2) => _FileMetadataCopyWithImpl(v, t, t2));
}

abstract class FileMetadataCopyWith<$R, $In extends FileMetadata, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({DateTime? lastModified, DateTime? lastAccessed});
  FileMetadataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FileMetadataCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, FileMetadata, $Out> implements FileMetadataCopyWith<$R, FileMetadata, $Out> {
  _FileMetadataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileMetadata> $mapper = FileMetadataMapper.ensureInitialized();
  @override
  $R call({Object? lastModified = $none, Object? lastAccessed = $none}) =>
      $apply(FieldCopyWithData({if (lastModified != $none) #lastModified: lastModified, if (lastAccessed != $none) #lastAccessed: lastAccessed}));
  @override
  FileMetadata $make(CopyWithData data) =>
      FileMetadata(lastModified: data.get(#lastModified, or: $value.lastModified), lastAccessed: data.get(#lastAccessed, or: $value.lastAccessed));

  @override
  FileMetadataCopyWith<$R2, FileMetadata, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _FileMetadataCopyWithImpl($value, $cast, t);
}
