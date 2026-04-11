// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'receiving_file.dart';

class ReceivingFileMapper extends ClassMapperBase<ReceivingFile> {
  ReceivingFileMapper._();

  static ReceivingFileMapper? _instance;
  static ReceivingFileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReceivingFileMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReceivingFile';

  static FileDto _$file(ReceivingFile v) => v.file;
  static const Field<ReceivingFile, FileDto> _f$file = Field('file', _$file);
  static FileStatus _$status(ReceivingFile v) => v.status;
  static const Field<ReceivingFile, FileStatus> _f$status = Field(
    'status',
    _$status,
  );
  static String? _$token(ReceivingFile v) => v.token;
  static const Field<ReceivingFile, String> _f$token = Field('token', _$token);
  static String? _$desiredName(ReceivingFile v) => v.desiredName;
  static const Field<ReceivingFile, String> _f$desiredName = Field(
    'desiredName',
    _$desiredName,
  );
  static String? _$path(ReceivingFile v) => v.path;
  static const Field<ReceivingFile, String> _f$path = Field('path', _$path);
  static bool _$savedToGallery(ReceivingFile v) => v.savedToGallery;
  static const Field<ReceivingFile, bool> _f$savedToGallery = Field(
    'savedToGallery',
    _$savedToGallery,
  );
  static String? _$errorMessage(ReceivingFile v) => v.errorMessage;
  static const Field<ReceivingFile, String> _f$errorMessage = Field(
    'errorMessage',
    _$errorMessage,
  );

  @override
  final MappableFields<ReceivingFile> fields = const {
    #file: _f$file,
    #status: _f$status,
    #token: _f$token,
    #desiredName: _f$desiredName,
    #path: _f$path,
    #savedToGallery: _f$savedToGallery,
    #errorMessage: _f$errorMessage,
  };

  static ReceivingFile _instantiate(DecodingData data) {
    return ReceivingFile(
      file: data.dec(_f$file),
      status: data.dec(_f$status),
      token: data.dec(_f$token),
      desiredName: data.dec(_f$desiredName),
      path: data.dec(_f$path),
      savedToGallery: data.dec(_f$savedToGallery),
      errorMessage: data.dec(_f$errorMessage),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ReceivingFile fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReceivingFile>(map);
  }

  static ReceivingFile deserialize(String json) {
    return ensureInitialized().decodeJson<ReceivingFile>(json);
  }
}

mixin ReceivingFileMappable {
  String serialize() {
    return ReceivingFileMapper.ensureInitialized().encodeJson<ReceivingFile>(
      this as ReceivingFile,
    );
  }

  Map<String, dynamic> toJson() {
    return ReceivingFileMapper.ensureInitialized().encodeMap<ReceivingFile>(
      this as ReceivingFile,
    );
  }

  ReceivingFileCopyWith<ReceivingFile, ReceivingFile, ReceivingFile>
  get copyWith => _ReceivingFileCopyWithImpl<ReceivingFile, ReceivingFile>(
    this as ReceivingFile,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ReceivingFileMapper.ensureInitialized().stringifyValue(
      this as ReceivingFile,
    );
  }

  @override
  bool operator ==(Object other) {
    return ReceivingFileMapper.ensureInitialized().equalsValue(
      this as ReceivingFile,
      other,
    );
  }

  @override
  int get hashCode {
    return ReceivingFileMapper.ensureInitialized().hashValue(
      this as ReceivingFile,
    );
  }
}

extension ReceivingFileValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReceivingFile, $Out> {
  ReceivingFileCopyWith<$R, ReceivingFile, $Out> get $asReceivingFile =>
      $base.as((v, t, t2) => _ReceivingFileCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ReceivingFileCopyWith<$R, $In extends ReceivingFile, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    FileDto? file,
    FileStatus? status,
    String? token,
    String? desiredName,
    String? path,
    bool? savedToGallery,
    String? errorMessage,
  });
  ReceivingFileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReceivingFileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReceivingFile, $Out>
    implements ReceivingFileCopyWith<$R, ReceivingFile, $Out> {
  _ReceivingFileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReceivingFile> $mapper =
      ReceivingFileMapper.ensureInitialized();
  @override
  $R call({
    FileDto? file,
    FileStatus? status,
    Object? token = $none,
    Object? desiredName = $none,
    Object? path = $none,
    bool? savedToGallery,
    Object? errorMessage = $none,
  }) => $apply(
    FieldCopyWithData({
      if (file != null) #file: file,
      if (status != null) #status: status,
      if (token != $none) #token: token,
      if (desiredName != $none) #desiredName: desiredName,
      if (path != $none) #path: path,
      if (savedToGallery != null) #savedToGallery: savedToGallery,
      if (errorMessage != $none) #errorMessage: errorMessage,
    }),
  );
  @override
  ReceivingFile $make(CopyWithData data) => ReceivingFile(
    file: data.get(#file, or: $value.file),
    status: data.get(#status, or: $value.status),
    token: data.get(#token, or: $value.token),
    desiredName: data.get(#desiredName, or: $value.desiredName),
    path: data.get(#path, or: $value.path),
    savedToGallery: data.get(#savedToGallery, or: $value.savedToGallery),
    errorMessage: data.get(#errorMessage, or: $value.errorMessage),
  );

  @override
  ReceivingFileCopyWith<$R2, ReceivingFile, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ReceivingFileCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

