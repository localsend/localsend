// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'info_dto.dart';

class InfoDtoMapper extends ClassMapperBase<InfoDto> {
  InfoDtoMapper._();

  static InfoDtoMapper? _instance;
  static InfoDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InfoDtoMapper._());
      DeviceTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'InfoDto';

  static String _$alias(InfoDto v) => v.alias;
  static const Field<InfoDto, String> _f$alias = Field('alias', _$alias);
  static String? _$version(InfoDto v) => v.version;
  static const Field<InfoDto, String> _f$version = Field('version', _$version);
  static String? _$deviceModel(InfoDto v) => v.deviceModel;
  static const Field<InfoDto, String> _f$deviceModel =
      Field('deviceModel', _$deviceModel);
  static DeviceType? _$deviceType(InfoDto v) => v.deviceType;
  static const Field<InfoDto, DeviceType> _f$deviceType =
      Field('deviceType', _$deviceType);
  static String? _$fingerprint(InfoDto v) => v.fingerprint;
  static const Field<InfoDto, String> _f$fingerprint =
      Field('fingerprint', _$fingerprint);
  static bool? _$download(InfoDto v) => v.download;
  static const Field<InfoDto, bool> _f$download = Field('download', _$download);

  @override
  final Map<Symbol, Field<InfoDto, dynamic>> fields = const {
    #alias: _f$alias,
    #version: _f$version,
    #deviceModel: _f$deviceModel,
    #deviceType: _f$deviceType,
    #fingerprint: _f$fingerprint,
    #download: _f$download,
  };

  static InfoDto _instantiate(DecodingData data) {
    return InfoDto(
        alias: data.dec(_f$alias),
        version: data.dec(_f$version),
        deviceModel: data.dec(_f$deviceModel),
        deviceType: data.dec(_f$deviceType),
        fingerprint: data.dec(_f$fingerprint),
        download: data.dec(_f$download));
  }

  @override
  final Function instantiate = _instantiate;

  static InfoDto fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InfoDto>(map);
  }

  static InfoDto deserialize(String json) {
    return ensureInitialized().decodeJson<InfoDto>(json);
  }
}

mixin InfoDtoMappable {
  String serialize() {
    return InfoDtoMapper.ensureInitialized()
        .encodeJson<InfoDto>(this as InfoDto);
  }

  Map<String, dynamic> toJson() {
    return InfoDtoMapper.ensureInitialized()
        .encodeMap<InfoDto>(this as InfoDto);
  }

  InfoDtoCopyWith<InfoDto, InfoDto, InfoDto> get copyWith =>
      _InfoDtoCopyWithImpl(this as InfoDto, $identity, $identity);
  @override
  String toString() {
    return InfoDtoMapper.ensureInitialized().stringifyValue(this as InfoDto);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            InfoDtoMapper.ensureInitialized()
                .isValueEqual(this as InfoDto, other));
  }

  @override
  int get hashCode {
    return InfoDtoMapper.ensureInitialized().hashValue(this as InfoDto);
  }
}

extension InfoDtoValueCopy<$R, $Out> on ObjectCopyWith<$R, InfoDto, $Out> {
  InfoDtoCopyWith<$R, InfoDto, $Out> get $asInfoDto =>
      $base.as((v, t, t2) => _InfoDtoCopyWithImpl(v, t, t2));
}

abstract class InfoDtoCopyWith<$R, $In extends InfoDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? alias,
      String? version,
      String? deviceModel,
      DeviceType? deviceType,
      String? fingerprint,
      bool? download});
  InfoDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _InfoDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InfoDto, $Out>
    implements InfoDtoCopyWith<$R, InfoDto, $Out> {
  _InfoDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InfoDto> $mapper =
      InfoDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? alias,
          Object? version = $none,
          Object? deviceModel = $none,
          Object? deviceType = $none,
          Object? fingerprint = $none,
          Object? download = $none}) =>
      $apply(FieldCopyWithData({
        if (alias != null) #alias: alias,
        if (version != $none) #version: version,
        if (deviceModel != $none) #deviceModel: deviceModel,
        if (deviceType != $none) #deviceType: deviceType,
        if (fingerprint != $none) #fingerprint: fingerprint,
        if (download != $none) #download: download
      }));
  @override
  InfoDto $make(CopyWithData data) => InfoDto(
      alias: data.get(#alias, or: $value.alias),
      version: data.get(#version, or: $value.version),
      deviceModel: data.get(#deviceModel, or: $value.deviceModel),
      deviceType: data.get(#deviceType, or: $value.deviceType),
      fingerprint: data.get(#fingerprint, or: $value.fingerprint),
      download: data.get(#download, or: $value.download));

  @override
  InfoDtoCopyWith<$R2, InfoDto, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _InfoDtoCopyWithImpl($value, $cast, t);
}
