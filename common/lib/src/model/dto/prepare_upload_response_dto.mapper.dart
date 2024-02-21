// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'prepare_upload_response_dto.dart';

class PrepareUploadResponseDtoMapper
    extends ClassMapperBase<PrepareUploadResponseDto> {
  PrepareUploadResponseDtoMapper._();

  static PrepareUploadResponseDtoMapper? _instance;
  static PrepareUploadResponseDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = PrepareUploadResponseDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PrepareUploadResponseDto';

  static String _$sessionId(PrepareUploadResponseDto v) => v.sessionId;
  static const Field<PrepareUploadResponseDto, String> _f$sessionId =
      Field('sessionId', _$sessionId);
  static Map<String, String> _$files(PrepareUploadResponseDto v) => v.files;
  static const Field<PrepareUploadResponseDto, Map<String, String>> _f$files =
      Field('files', _$files);

  @override
  final Map<Symbol, Field<PrepareUploadResponseDto, dynamic>> fields = const {
    #sessionId: _f$sessionId,
    #files: _f$files,
  };

  static PrepareUploadResponseDto _instantiate(DecodingData data) {
    return PrepareUploadResponseDto(
        sessionId: data.dec(_f$sessionId), files: data.dec(_f$files));
  }

  @override
  final Function instantiate = _instantiate;

  static PrepareUploadResponseDto fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PrepareUploadResponseDto>(map);
  }

  static PrepareUploadResponseDto deserialize(String json) {
    return ensureInitialized().decodeJson<PrepareUploadResponseDto>(json);
  }
}

mixin PrepareUploadResponseDtoMappable {
  String serialize() {
    return PrepareUploadResponseDtoMapper.ensureInitialized()
        .encodeJson<PrepareUploadResponseDto>(this as PrepareUploadResponseDto);
  }

  Map<String, dynamic> toJson() {
    return PrepareUploadResponseDtoMapper.ensureInitialized()
        .encodeMap<PrepareUploadResponseDto>(this as PrepareUploadResponseDto);
  }

  PrepareUploadResponseDtoCopyWith<PrepareUploadResponseDto,
          PrepareUploadResponseDto, PrepareUploadResponseDto>
      get copyWith => _PrepareUploadResponseDtoCopyWithImpl(
          this as PrepareUploadResponseDto, $identity, $identity);
  @override
  String toString() {
    return PrepareUploadResponseDtoMapper.ensureInitialized()
        .stringifyValue(this as PrepareUploadResponseDto);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PrepareUploadResponseDtoMapper.ensureInitialized()
                .isValueEqual(this as PrepareUploadResponseDto, other));
  }

  @override
  int get hashCode {
    return PrepareUploadResponseDtoMapper.ensureInitialized()
        .hashValue(this as PrepareUploadResponseDto);
  }
}

extension PrepareUploadResponseDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PrepareUploadResponseDto, $Out> {
  PrepareUploadResponseDtoCopyWith<$R, PrepareUploadResponseDto, $Out>
      get $asPrepareUploadResponseDto => $base
          .as((v, t, t2) => _PrepareUploadResponseDtoCopyWithImpl(v, t, t2));
}

abstract class PrepareUploadResponseDtoCopyWith<
    $R,
    $In extends PrepareUploadResponseDto,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>> get files;
  $R call({String? sessionId, Map<String, String>? files});
  PrepareUploadResponseDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PrepareUploadResponseDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PrepareUploadResponseDto, $Out>
    implements
        PrepareUploadResponseDtoCopyWith<$R, PrepareUploadResponseDto, $Out> {
  _PrepareUploadResponseDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PrepareUploadResponseDto> $mapper =
      PrepareUploadResponseDtoMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get files => MapCopyWith($value.files,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(files: v));
  @override
  $R call({String? sessionId, Map<String, String>? files}) =>
      $apply(FieldCopyWithData({
        if (sessionId != null) #sessionId: sessionId,
        if (files != null) #files: files
      }));
  @override
  PrepareUploadResponseDto $make(CopyWithData data) => PrepareUploadResponseDto(
      sessionId: data.get(#sessionId, or: $value.sessionId),
      files: data.get(#files, or: $value.files));

  @override
  PrepareUploadResponseDtoCopyWith<$R2, PrepareUploadResponseDto, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PrepareUploadResponseDtoCopyWithImpl($value, $cast, t);
}
