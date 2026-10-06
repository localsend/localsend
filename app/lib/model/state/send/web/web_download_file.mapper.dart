// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'web_download_file.dart';

class WebDownloadFileMapper extends ClassMapperBase<WebDownloadFile> {
  WebDownloadFileMapper._();

  static WebDownloadFileMapper? _instance;
  static WebDownloadFileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebDownloadFileMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WebDownloadFile';

  static FileDto _$file(WebDownloadFile v) => v.file;
  static const Field<WebDownloadFile, FileDto> _f$file = Field('file', _$file);
  static AssetEntity? _$asset(WebDownloadFile v) => v.asset;
  static const Field<WebDownloadFile, AssetEntity> _f$asset = Field(
    'asset',
    _$asset,
  );
  static String? _$path(WebDownloadFile v) => v.path;
  static const Field<WebDownloadFile, String> _f$path = Field('path', _$path);
  static List<int>? _$bytes(WebDownloadFile v) => v.bytes;
  static const Field<WebDownloadFile, List<int>> _f$bytes = Field(
    'bytes',
    _$bytes,
  );

  @override
  final MappableFields<WebDownloadFile> fields = const {
    #file: _f$file,
    #asset: _f$asset,
    #path: _f$path,
    #bytes: _f$bytes,
  };

  static WebDownloadFile _instantiate(DecodingData data) {
    return WebDownloadFile(
      file: data.dec(_f$file),
      asset: data.dec(_f$asset),
      path: data.dec(_f$path),
      bytes: data.dec(_f$bytes),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WebDownloadFile fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WebDownloadFile>(map);
  }

  static WebDownloadFile deserialize(String json) {
    return ensureInitialized().decodeJson<WebDownloadFile>(json);
  }
}

mixin WebDownloadFileMappable {
  String serialize() {
    return WebDownloadFileMapper.ensureInitialized()
        .encodeJson<WebDownloadFile>(this as WebDownloadFile);
  }

  Map<String, dynamic> toJson() {
    return WebDownloadFileMapper.ensureInitialized().encodeMap<WebDownloadFile>(
      this as WebDownloadFile,
    );
  }

  WebDownloadFileCopyWith<WebDownloadFile, WebDownloadFile, WebDownloadFile>
  get copyWith =>
      _WebDownloadFileCopyWithImpl<WebDownloadFile, WebDownloadFile>(
        this as WebDownloadFile,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WebDownloadFileMapper.ensureInitialized().stringifyValue(
      this as WebDownloadFile,
    );
  }

  @override
  bool operator ==(Object other) {
    return WebDownloadFileMapper.ensureInitialized().equalsValue(
      this as WebDownloadFile,
      other,
    );
  }

  @override
  int get hashCode {
    return WebDownloadFileMapper.ensureInitialized().hashValue(
      this as WebDownloadFile,
    );
  }
}

extension WebDownloadFileValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebDownloadFile, $Out> {
  WebDownloadFileCopyWith<$R, WebDownloadFile, $Out> get $asWebDownloadFile =>
      $base.as((v, t, t2) => _WebDownloadFileCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WebDownloadFileCopyWith<$R, $In extends WebDownloadFile, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get bytes;
  $R call({FileDto? file, AssetEntity? asset, String? path, List<int>? bytes});
  WebDownloadFileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WebDownloadFileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebDownloadFile, $Out>
    implements WebDownloadFileCopyWith<$R, WebDownloadFile, $Out> {
  _WebDownloadFileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebDownloadFile> $mapper =
      WebDownloadFileMapper.ensureInitialized();
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
    FileDto? file,
    Object? asset = $none,
    Object? path = $none,
    Object? bytes = $none,
  }) => $apply(
    FieldCopyWithData({
      if (file != null) #file: file,
      if (asset != $none) #asset: asset,
      if (path != $none) #path: path,
      if (bytes != $none) #bytes: bytes,
    }),
  );
  @override
  WebDownloadFile $make(CopyWithData data) => WebDownloadFile(
    file: data.get(#file, or: $value.file),
    asset: data.get(#asset, or: $value.asset),
    path: data.get(#path, or: $value.path),
    bytes: data.get(#bytes, or: $value.bytes),
  );

  @override
  WebDownloadFileCopyWith<$R2, WebDownloadFile, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WebDownloadFileCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

