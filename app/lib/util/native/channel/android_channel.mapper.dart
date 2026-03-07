// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'android_channel.dart';

class PickDirectoryResultMapper extends ClassMapperBase<PickDirectoryResult> {
  PickDirectoryResultMapper._();

  static PickDirectoryResultMapper? _instance;
  static PickDirectoryResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PickDirectoryResultMapper._());
      FileInfoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PickDirectoryResult';

  static String _$directoryUri(PickDirectoryResult v) => v.directoryUri;
  static const Field<PickDirectoryResult, String> _f$directoryUri = Field(
    'directoryUri',
    _$directoryUri,
  );
  static List<FileInfo> _$files(PickDirectoryResult v) => v.files;
  static const Field<PickDirectoryResult, List<FileInfo>> _f$files = Field(
    'files',
    _$files,
  );

  @override
  final MappableFields<PickDirectoryResult> fields = const {
    #directoryUri: _f$directoryUri,
    #files: _f$files,
  };

  static PickDirectoryResult _instantiate(DecodingData data) {
    return PickDirectoryResult(
      directoryUri: data.dec(_f$directoryUri),
      files: data.dec(_f$files),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PickDirectoryResult fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PickDirectoryResult>(map);
  }

  static PickDirectoryResult deserialize(String json) {
    return ensureInitialized().decodeJson<PickDirectoryResult>(json);
  }
}

mixin PickDirectoryResultMappable {
  String serialize() {
    return PickDirectoryResultMapper.ensureInitialized()
        .encodeJson<PickDirectoryResult>(this as PickDirectoryResult);
  }

  Map<String, dynamic> toJson() {
    return PickDirectoryResultMapper.ensureInitialized()
        .encodeMap<PickDirectoryResult>(this as PickDirectoryResult);
  }

  PickDirectoryResultCopyWith<
    PickDirectoryResult,
    PickDirectoryResult,
    PickDirectoryResult
  >
  get copyWith =>
      _PickDirectoryResultCopyWithImpl<
        PickDirectoryResult,
        PickDirectoryResult
      >(this as PickDirectoryResult, $identity, $identity);
  @override
  String toString() {
    return PickDirectoryResultMapper.ensureInitialized().stringifyValue(
      this as PickDirectoryResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return PickDirectoryResultMapper.ensureInitialized().equalsValue(
      this as PickDirectoryResult,
      other,
    );
  }

  @override
  int get hashCode {
    return PickDirectoryResultMapper.ensureInitialized().hashValue(
      this as PickDirectoryResult,
    );
  }
}

extension PickDirectoryResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PickDirectoryResult, $Out> {
  PickDirectoryResultCopyWith<$R, PickDirectoryResult, $Out>
  get $asPickDirectoryResult => $base.as(
    (v, t, t2) => _PickDirectoryResultCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class PickDirectoryResultCopyWith<
  $R,
  $In extends PickDirectoryResult,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, FileInfo, FileInfoCopyWith<$R, FileInfo, FileInfo>>
  get files;
  $R call({String? directoryUri, List<FileInfo>? files});
  PickDirectoryResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PickDirectoryResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PickDirectoryResult, $Out>
    implements PickDirectoryResultCopyWith<$R, PickDirectoryResult, $Out> {
  _PickDirectoryResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PickDirectoryResult> $mapper =
      PickDirectoryResultMapper.ensureInitialized();
  @override
  ListCopyWith<$R, FileInfo, FileInfoCopyWith<$R, FileInfo, FileInfo>>
  get files => ListCopyWith(
    $value.files,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(files: v),
  );
  @override
  $R call({String? directoryUri, List<FileInfo>? files}) => $apply(
    FieldCopyWithData({
      if (directoryUri != null) #directoryUri: directoryUri,
      if (files != null) #files: files,
    }),
  );
  @override
  PickDirectoryResult $make(CopyWithData data) => PickDirectoryResult(
    directoryUri: data.get(#directoryUri, or: $value.directoryUri),
    files: data.get(#files, or: $value.files),
  );

  @override
  PickDirectoryResultCopyWith<$R2, PickDirectoryResult, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PickDirectoryResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FileInfoMapper extends ClassMapperBase<FileInfo> {
  FileInfoMapper._();

  static FileInfoMapper? _instance;
  static FileInfoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileInfoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FileInfo';

  static String _$name(FileInfo v) => v.name;
  static const Field<FileInfo, String> _f$name = Field('name', _$name);
  static int _$size(FileInfo v) => v.size;
  static const Field<FileInfo, int> _f$size = Field('size', _$size);
  static String _$uri(FileInfo v) => v.uri;
  static const Field<FileInfo, String> _f$uri = Field('uri', _$uri);
  static int _$lastModified(FileInfo v) => v.lastModified;
  static const Field<FileInfo, int> _f$lastModified = Field(
    'lastModified',
    _$lastModified,
  );

  @override
  final MappableFields<FileInfo> fields = const {
    #name: _f$name,
    #size: _f$size,
    #uri: _f$uri,
    #lastModified: _f$lastModified,
  };

  static FileInfo _instantiate(DecodingData data) {
    return FileInfo(
      name: data.dec(_f$name),
      size: data.dec(_f$size),
      uri: data.dec(_f$uri),
      lastModified: data.dec(_f$lastModified),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FileInfo fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileInfo>(map);
  }

  static FileInfo deserialize(String json) {
    return ensureInitialized().decodeJson<FileInfo>(json);
  }
}

mixin FileInfoMappable {
  String serialize() {
    return FileInfoMapper.ensureInitialized().encodeJson<FileInfo>(
      this as FileInfo,
    );
  }

  Map<String, dynamic> toJson() {
    return FileInfoMapper.ensureInitialized().encodeMap<FileInfo>(
      this as FileInfo,
    );
  }

  FileInfoCopyWith<FileInfo, FileInfo, FileInfo> get copyWith =>
      _FileInfoCopyWithImpl<FileInfo, FileInfo>(
        this as FileInfo,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return FileInfoMapper.ensureInitialized().stringifyValue(this as FileInfo);
  }

  @override
  bool operator ==(Object other) {
    return FileInfoMapper.ensureInitialized().equalsValue(
      this as FileInfo,
      other,
    );
  }

  @override
  int get hashCode {
    return FileInfoMapper.ensureInitialized().hashValue(this as FileInfo);
  }
}

extension FileInfoValueCopy<$R, $Out> on ObjectCopyWith<$R, FileInfo, $Out> {
  FileInfoCopyWith<$R, FileInfo, $Out> get $asFileInfo =>
      $base.as((v, t, t2) => _FileInfoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FileInfoCopyWith<$R, $In extends FileInfo, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, int? size, String? uri, int? lastModified});
  FileInfoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FileInfoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FileInfo, $Out>
    implements FileInfoCopyWith<$R, FileInfo, $Out> {
  _FileInfoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileInfo> $mapper =
      FileInfoMapper.ensureInitialized();
  @override
  $R call({String? name, int? size, String? uri, int? lastModified}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (size != null) #size: size,
      if (uri != null) #uri: uri,
      if (lastModified != null) #lastModified: lastModified,
    }),
  );
  @override
  FileInfo $make(CopyWithData data) => FileInfo(
    name: data.get(#name, or: $value.name),
    size: data.get(#size, or: $value.size),
    uri: data.get(#uri, or: $value.uri),
    lastModified: data.get(#lastModified, or: $value.lastModified),
  );

  @override
  FileInfoCopyWith<$R2, FileInfo, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FileInfoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

