// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'receive_request_response_dto.dart';

class ReceiveRequestResponseDtoMapper
    extends ClassMapperBase<ReceiveRequestResponseDto> {
  ReceiveRequestResponseDtoMapper._();

  static ReceiveRequestResponseDtoMapper? _instance;
  static ReceiveRequestResponseDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReceiveRequestResponseDtoMapper._());
      InfoDtoMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ReceiveRequestResponseDto';

  static InfoDto _$info(ReceiveRequestResponseDto v) => v.info;
  static const Field<ReceiveRequestResponseDto, InfoDto> _f$info =
      Field('info', _$info);
  static String _$sessionId(ReceiveRequestResponseDto v) => v.sessionId;
  static const Field<ReceiveRequestResponseDto, String> _f$sessionId =
      Field('sessionId', _$sessionId);
  static Map<String, FileDto> _$files(ReceiveRequestResponseDto v) => v.files;
  static const Field<ReceiveRequestResponseDto, Map<String, FileDto>> _f$files =
      Field('files', _$files);

  @override
  final Map<Symbol, Field<ReceiveRequestResponseDto, dynamic>> fields = const {
    #info: _f$info,
    #sessionId: _f$sessionId,
    #files: _f$files,
  };

  static ReceiveRequestResponseDto _instantiate(DecodingData data) {
    return ReceiveRequestResponseDto(
        info: data.dec(_f$info),
        sessionId: data.dec(_f$sessionId),
        files: data.dec(_f$files));
  }

  @override
  final Function instantiate = _instantiate;

  static ReceiveRequestResponseDto fromJson(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ReceiveRequestResponseDto>(map));
  }

  static ReceiveRequestResponseDto deserialize(String json) {
    return _guard((c) => c.fromJson<ReceiveRequestResponseDto>(json));
  }
}

mixin ReceiveRequestResponseDtoMappable {
  String serialize() {
    return ReceiveRequestResponseDtoMapper._guard(
        (c) => c.toJson(this as ReceiveRequestResponseDto));
  }

  Map<String, dynamic> toJson() {
    return ReceiveRequestResponseDtoMapper._guard(
        (c) => c.toMap(this as ReceiveRequestResponseDto));
  }

  ReceiveRequestResponseDtoCopyWith<ReceiveRequestResponseDto,
          ReceiveRequestResponseDto, ReceiveRequestResponseDto>
      get copyWith => _ReceiveRequestResponseDtoCopyWithImpl(
          this as ReceiveRequestResponseDto, $identity, $identity);
  @override
  String toString() {
    return ReceiveRequestResponseDtoMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ReceiveRequestResponseDtoMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ReceiveRequestResponseDtoMapper._guard((c) => c.hash(this));
  }
}

extension ReceiveRequestResponseDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReceiveRequestResponseDto, $Out> {
  ReceiveRequestResponseDtoCopyWith<$R, ReceiveRequestResponseDto, $Out>
      get $asReceiveRequestResponseDto => $base
          .as((v, t, t2) => _ReceiveRequestResponseDtoCopyWithImpl(v, t, t2));
}

abstract class ReceiveRequestResponseDtoCopyWith<
    $R,
    $In extends ReceiveRequestResponseDto,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  InfoDtoCopyWith<$R, InfoDto, InfoDto> get info;
  MapCopyWith<$R, String, FileDto, ObjectCopyWith<$R, FileDto, FileDto>>
      get files;
  $R call({InfoDto? info, String? sessionId, Map<String, FileDto>? files});
  ReceiveRequestResponseDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ReceiveRequestResponseDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReceiveRequestResponseDto, $Out>
    implements
        ReceiveRequestResponseDtoCopyWith<$R, ReceiveRequestResponseDto, $Out> {
  _ReceiveRequestResponseDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReceiveRequestResponseDto> $mapper =
      ReceiveRequestResponseDtoMapper.ensureInitialized();
  @override
  InfoDtoCopyWith<$R, InfoDto, InfoDto> get info =>
      $value.info.copyWith.$chain((v) => call(info: v));
  @override
  MapCopyWith<$R, String, FileDto, ObjectCopyWith<$R, FileDto, FileDto>>
      get files => MapCopyWith($value.files,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(files: v));
  @override
  $R call({InfoDto? info, String? sessionId, Map<String, FileDto>? files}) =>
      $apply(FieldCopyWithData({
        if (info != null) #info: info,
        if (sessionId != null) #sessionId: sessionId,
        if (files != null) #files: files
      }));
  @override
  ReceiveRequestResponseDto $make(CopyWithData data) =>
      ReceiveRequestResponseDto(
          info: data.get(#info, or: $value.info),
          sessionId: data.get(#sessionId, or: $value.sessionId),
          files: data.get(#files, or: $value.files));

  @override
  ReceiveRequestResponseDtoCopyWith<$R2, ReceiveRequestResponseDto, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ReceiveRequestResponseDtoCopyWithImpl($value, $cast, t);
}
