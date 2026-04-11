// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'web_send_file.dart';

class WebSendFileMapper extends ClassMapperBase<WebSendFile> {
  WebSendFileMapper._();

  static WebSendFileMapper? _instance;
  static WebSendFileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebSendFileMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WebSendFile';

  static FileDto _$file(WebSendFile v) => v.file;
  static const Field<WebSendFile, FileDto> _f$file = Field('file', _$file);
  static AssetEntity? _$asset(WebSendFile v) => v.asset;
  static const Field<WebSendFile, AssetEntity> _f$asset = Field(
    'asset',
    _$asset,
  );
  static String? _$path(WebSendFile v) => v.path;
  static const Field<WebSendFile, String> _f$path = Field('path', _$path);
  static List<int>? _$bytes(WebSendFile v) => v.bytes;
  static const Field<WebSendFile, List<int>> _f$bytes = Field('bytes', _$bytes);

  @override
  final MappableFields<WebSendFile> fields = const {
    #file: _f$file,
    #asset: _f$asset,
    #path: _f$path,
    #bytes: _f$bytes,
  };

  static WebSendFile _instantiate(DecodingData data) {
    return WebSendFile(
      file: data.dec(_f$file),
      asset: data.dec(_f$asset),
      path: data.dec(_f$path),
      bytes: data.dec(_f$bytes),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WebSendFile fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WebSendFile>(map);
  }

  static WebSendFile deserialize(String json) {
    return ensureInitialized().decodeJson<WebSendFile>(json);
  }
}

mixin WebSendFileMappable {
  String serialize() {
    return WebSendFileMapper.ensureInitialized().encodeJson<WebSendFile>(
      this as WebSendFile,
    );
  }

  Map<String, dynamic> toJson() {
    return WebSendFileMapper.ensureInitialized().encodeMap<WebSendFile>(
      this as WebSendFile,
    );
  }

  WebSendFileCopyWith<WebSendFile, WebSendFile, WebSendFile> get copyWith =>
      _WebSendFileCopyWithImpl<WebSendFile, WebSendFile>(
        this as WebSendFile,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WebSendFileMapper.ensureInitialized().stringifyValue(
      this as WebSendFile,
    );
  }

  @override
  bool operator ==(Object other) {
    return WebSendFileMapper.ensureInitialized().equalsValue(
      this as WebSendFile,
      other,
    );
  }

  @override
  int get hashCode {
    return WebSendFileMapper.ensureInitialized().hashValue(this as WebSendFile);
  }
}

extension WebSendFileValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebSendFile, $Out> {
  WebSendFileCopyWith<$R, WebSendFile, $Out> get $asWebSendFile =>
      $base.as((v, t, t2) => _WebSendFileCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WebSendFileCopyWith<$R, $In extends WebSendFile, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get bytes;
  $R call({FileDto? file, AssetEntity? asset, String? path, List<int>? bytes});
  WebSendFileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WebSendFileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebSendFile, $Out>
    implements WebSendFileCopyWith<$R, WebSendFile, $Out> {
  _WebSendFileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebSendFile> $mapper =
      WebSendFileMapper.ensureInitialized();
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
  WebSendFile $make(CopyWithData data) => WebSendFile(
    file: data.get(#file, or: $value.file),
    asset: data.get(#asset, or: $value.asset),
    path: data.get(#path, or: $value.path),
    bytes: data.get(#bytes, or: $value.bytes),
  );

  @override
  WebSendFileCopyWith<$R2, WebSendFile, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WebSendFileCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

