// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cross_file.dart';

class CrossFileMapper extends ClassMapperBase<CrossFile> {
  CrossFileMapper._();

  static CrossFileMapper? _instance;
  static CrossFileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CrossFileMapper._());
      FileTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CrossFile';

  static String _$name(CrossFile v) => v.name;
  static const Field<CrossFile, String> _f$name = Field('name', _$name);
  static FileType _$fileType(CrossFile v) => v.fileType;
  static const Field<CrossFile, FileType> _f$fileType = Field(
    'fileType',
    _$fileType,
  );
  static int _$size(CrossFile v) => v.size;
  static const Field<CrossFile, int> _f$size = Field('size', _$size);
  static Uint8List? _$thumbnail(CrossFile v) => v.thumbnail;
  static const Field<CrossFile, Uint8List> _f$thumbnail = Field(
    'thumbnail',
    _$thumbnail,
  );
  static AssetEntity? _$asset(CrossFile v) => v.asset;
  static const Field<CrossFile, AssetEntity> _f$asset = Field('asset', _$asset);
  static String? _$path(CrossFile v) => v.path;
  static const Field<CrossFile, String> _f$path = Field('path', _$path);
  static List<int>? _$bytes(CrossFile v) => v.bytes;
  static const Field<CrossFile, List<int>> _f$bytes = Field('bytes', _$bytes);
  static DateTime? _$lastModified(CrossFile v) => v.lastModified;
  static const Field<CrossFile, DateTime> _f$lastModified = Field(
    'lastModified',
    _$lastModified,
  );
  static DateTime? _$lastAccessed(CrossFile v) => v.lastAccessed;
  static const Field<CrossFile, DateTime> _f$lastAccessed = Field(
    'lastAccessed',
    _$lastAccessed,
  );

  @override
  final MappableFields<CrossFile> fields = const {
    #name: _f$name,
    #fileType: _f$fileType,
    #size: _f$size,
    #thumbnail: _f$thumbnail,
    #asset: _f$asset,
    #path: _f$path,
    #bytes: _f$bytes,
    #lastModified: _f$lastModified,
    #lastAccessed: _f$lastAccessed,
  };

  static CrossFile _instantiate(DecodingData data) {
    return CrossFile(
      name: data.dec(_f$name),
      fileType: data.dec(_f$fileType),
      size: data.dec(_f$size),
      thumbnail: data.dec(_f$thumbnail),
      asset: data.dec(_f$asset),
      path: data.dec(_f$path),
      bytes: data.dec(_f$bytes),
      lastModified: data.dec(_f$lastModified),
      lastAccessed: data.dec(_f$lastAccessed),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CrossFile fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CrossFile>(map);
  }

  static CrossFile deserialize(String json) {
    return ensureInitialized().decodeJson<CrossFile>(json);
  }
}

mixin CrossFileMappable {
  String serialize() {
    return CrossFileMapper.ensureInitialized().encodeJson<CrossFile>(
      this as CrossFile,
    );
  }

  Map<String, dynamic> toJson() {
    return CrossFileMapper.ensureInitialized().encodeMap<CrossFile>(
      this as CrossFile,
    );
  }

  CrossFileCopyWith<CrossFile, CrossFile, CrossFile> get copyWith =>
      _CrossFileCopyWithImpl<CrossFile, CrossFile>(
        this as CrossFile,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CrossFileMapper.ensureInitialized().stringifyValue(
      this as CrossFile,
    );
  }

  @override
  bool operator ==(Object other) {
    return CrossFileMapper.ensureInitialized().equalsValue(
      this as CrossFile,
      other,
    );
  }

  @override
  int get hashCode {
    return CrossFileMapper.ensureInitialized().hashValue(this as CrossFile);
  }
}

extension CrossFileValueCopy<$R, $Out> on ObjectCopyWith<$R, CrossFile, $Out> {
  CrossFileCopyWith<$R, CrossFile, $Out> get $asCrossFile =>
      $base.as((v, t, t2) => _CrossFileCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CrossFileCopyWith<$R, $In extends CrossFile, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get bytes;
  $R call({
    String? name,
    FileType? fileType,
    int? size,
    Uint8List? thumbnail,
    AssetEntity? asset,
    String? path,
    List<int>? bytes,
    DateTime? lastModified,
    DateTime? lastAccessed,
  });
  CrossFileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CrossFileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CrossFile, $Out>
    implements CrossFileCopyWith<$R, CrossFile, $Out> {
  _CrossFileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CrossFile> $mapper =
      CrossFileMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get bytes =>
      $value.bytes != null
      ? ListCopyWith(
          $value.bytes!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(bytes: v),
        )
      : null;
  @override
  $R call({
    String? name,
    FileType? fileType,
    int? size,
    Object? thumbnail = $none,
    Object? asset = $none,
    Object? path = $none,
    Object? bytes = $none,
    Object? lastModified = $none,
    Object? lastAccessed = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (fileType != null) #fileType: fileType,
      if (size != null) #size: size,
      if (thumbnail != $none) #thumbnail: thumbnail,
      if (asset != $none) #asset: asset,
      if (path != $none) #path: path,
      if (bytes != $none) #bytes: bytes,
      if (lastModified != $none) #lastModified: lastModified,
      if (lastAccessed != $none) #lastAccessed: lastAccessed,
    }),
  );
  @override
  CrossFile $make(CopyWithData data) => CrossFile(
    name: data.get(#name, or: $value.name),
    fileType: data.get(#fileType, or: $value.fileType),
    size: data.get(#size, or: $value.size),
    thumbnail: data.get(#thumbnail, or: $value.thumbnail),
    asset: data.get(#asset, or: $value.asset),
    path: data.get(#path, or: $value.path),
    bytes: data.get(#bytes, or: $value.bytes),
    lastModified: data.get(#lastModified, or: $value.lastModified),
    lastAccessed: data.get(#lastAccessed, or: $value.lastAccessed),
  );

  @override
  CrossFileCopyWith<$R2, CrossFile, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CrossFileCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

