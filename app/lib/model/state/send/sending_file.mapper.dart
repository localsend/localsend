// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sending_file.dart';

class SendingFileMapper extends ClassMapperBase<SendingFile> {
  SendingFileMapper._();

  static SendingFileMapper? _instance;
  static SendingFileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SendingFileMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SendingFile';

  static FileDto _$file(SendingFile v) => v.file;
  static const Field<SendingFile, FileDto> _f$file = Field('file', _$file);
  static FileStatus _$status(SendingFile v) => v.status;
  static const Field<SendingFile, FileStatus> _f$status = Field(
    'status',
    _$status,
  );
  static String? _$token(SendingFile v) => v.token;
  static const Field<SendingFile, String> _f$token = Field('token', _$token);
  static Uint8List? _$thumbnail(SendingFile v) => v.thumbnail;
  static const Field<SendingFile, Uint8List> _f$thumbnail = Field(
    'thumbnail',
    _$thumbnail,
  );
  static AssetEntity? _$asset(SendingFile v) => v.asset;
  static const Field<SendingFile, AssetEntity> _f$asset = Field(
    'asset',
    _$asset,
  );
  static String? _$path(SendingFile v) => v.path;
  static const Field<SendingFile, String> _f$path = Field('path', _$path);
  static List<int>? _$bytes(SendingFile v) => v.bytes;
  static const Field<SendingFile, List<int>> _f$bytes = Field('bytes', _$bytes);
  static String? _$errorMessage(SendingFile v) => v.errorMessage;
  static const Field<SendingFile, String> _f$errorMessage = Field(
    'errorMessage',
    _$errorMessage,
  );

  @override
  final MappableFields<SendingFile> fields = const {
    #file: _f$file,
    #status: _f$status,
    #token: _f$token,
    #thumbnail: _f$thumbnail,
    #asset: _f$asset,
    #path: _f$path,
    #bytes: _f$bytes,
    #errorMessage: _f$errorMessage,
  };

  static SendingFile _instantiate(DecodingData data) {
    return SendingFile(
      file: data.dec(_f$file),
      status: data.dec(_f$status),
      token: data.dec(_f$token),
      thumbnail: data.dec(_f$thumbnail),
      asset: data.dec(_f$asset),
      path: data.dec(_f$path),
      bytes: data.dec(_f$bytes),
      errorMessage: data.dec(_f$errorMessage),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SendingFile fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SendingFile>(map);
  }

  static SendingFile deserialize(String json) {
    return ensureInitialized().decodeJson<SendingFile>(json);
  }
}

mixin SendingFileMappable {
  String serialize() {
    return SendingFileMapper.ensureInitialized().encodeJson<SendingFile>(
      this as SendingFile,
    );
  }

  Map<String, dynamic> toJson() {
    return SendingFileMapper.ensureInitialized().encodeMap<SendingFile>(
      this as SendingFile,
    );
  }

  SendingFileCopyWith<SendingFile, SendingFile, SendingFile> get copyWith =>
      _SendingFileCopyWithImpl<SendingFile, SendingFile>(
        this as SendingFile,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SendingFileMapper.ensureInitialized().stringifyValue(
      this as SendingFile,
    );
  }

  @override
  bool operator ==(Object other) {
    return SendingFileMapper.ensureInitialized().equalsValue(
      this as SendingFile,
      other,
    );
  }

  @override
  int get hashCode {
    return SendingFileMapper.ensureInitialized().hashValue(this as SendingFile);
  }
}

extension SendingFileValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SendingFile, $Out> {
  SendingFileCopyWith<$R, SendingFile, $Out> get $asSendingFile =>
      $base.as((v, t, t2) => _SendingFileCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SendingFileCopyWith<$R, $In extends SendingFile, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get bytes;
  $R call({
    FileDto? file,
    FileStatus? status,
    String? token,
    Uint8List? thumbnail,
    AssetEntity? asset,
    String? path,
    List<int>? bytes,
    String? errorMessage,
  });
  SendingFileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SendingFileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SendingFile, $Out>
    implements SendingFileCopyWith<$R, SendingFile, $Out> {
  _SendingFileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SendingFile> $mapper =
      SendingFileMapper.ensureInitialized();
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
    FileStatus? status,
    Object? token = $none,
    Object? thumbnail = $none,
    Object? asset = $none,
    Object? path = $none,
    Object? bytes = $none,
    Object? errorMessage = $none,
  }) => $apply(
    FieldCopyWithData({
      if (file != null) #file: file,
      if (status != null) #status: status,
      if (token != $none) #token: token,
      if (thumbnail != $none) #thumbnail: thumbnail,
      if (asset != $none) #asset: asset,
      if (path != $none) #path: path,
      if (bytes != $none) #bytes: bytes,
      if (errorMessage != $none) #errorMessage: errorMessage,
    }),
  );
  @override
  SendingFile $make(CopyWithData data) => SendingFile(
    file: data.get(#file, or: $value.file),
    status: data.get(#status, or: $value.status),
    token: data.get(#token, or: $value.token),
    thumbnail: data.get(#thumbnail, or: $value.thumbnail),
    asset: data.get(#asset, or: $value.asset),
    path: data.get(#path, or: $value.path),
    bytes: data.get(#bytes, or: $value.bytes),
    errorMessage: data.get(#errorMessage, or: $value.errorMessage),
  );

  @override
  SendingFileCopyWith<$R2, SendingFile, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SendingFileCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

