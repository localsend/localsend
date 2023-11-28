// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'info_register_dto.dart';

class InfoRegisterDtoMapper extends ClassMapperBase<InfoRegisterDto> {
  InfoRegisterDtoMapper._();

  static InfoRegisterDtoMapper? _instance;
  static InfoRegisterDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InfoRegisterDtoMapper._());
      DeviceTypeMapper.ensureInitialized();
      ProtocolTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'InfoRegisterDto';

  static String _$alias(InfoRegisterDto v) => v.alias;
  static const Field<InfoRegisterDto, String> _f$alias =
      Field('alias', _$alias);
  static String? _$version(InfoRegisterDto v) => v.version;
  static const Field<InfoRegisterDto, String> _f$version =
      Field('version', _$version);
  static String? _$deviceModel(InfoRegisterDto v) => v.deviceModel;
  static const Field<InfoRegisterDto, String> _f$deviceModel =
      Field('deviceModel', _$deviceModel);
  static DeviceType? _$deviceType(InfoRegisterDto v) => v.deviceType;
  static const Field<InfoRegisterDto, DeviceType> _f$deviceType =
      Field('deviceType', _$deviceType);
  static String? _$fingerprint(InfoRegisterDto v) => v.fingerprint;
  static const Field<InfoRegisterDto, String> _f$fingerprint =
      Field('fingerprint', _$fingerprint);
  static int? _$port(InfoRegisterDto v) => v.port;
  static const Field<InfoRegisterDto, int> _f$port = Field('port', _$port);
  static ProtocolType? _$protocol(InfoRegisterDto v) => v.protocol;
  static const Field<InfoRegisterDto, ProtocolType> _f$protocol =
      Field('protocol', _$protocol);
  static bool? _$download(InfoRegisterDto v) => v.download;
  static const Field<InfoRegisterDto, bool> _f$download =
      Field('download', _$download);

  @override
  final Map<Symbol, Field<InfoRegisterDto, dynamic>> fields = const {
    #alias: _f$alias,
    #version: _f$version,
    #deviceModel: _f$deviceModel,
    #deviceType: _f$deviceType,
    #fingerprint: _f$fingerprint,
    #port: _f$port,
    #protocol: _f$protocol,
    #download: _f$download,
  };

  static InfoRegisterDto _instantiate(DecodingData data) {
    return InfoRegisterDto(
        alias: data.dec(_f$alias),
        version: data.dec(_f$version),
        deviceModel: data.dec(_f$deviceModel),
        deviceType: data.dec(_f$deviceType),
        fingerprint: data.dec(_f$fingerprint),
        port: data.dec(_f$port),
        protocol: data.dec(_f$protocol),
        download: data.dec(_f$download));
  }

  @override
  final Function instantiate = _instantiate;

  static InfoRegisterDto fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InfoRegisterDto>(map);
  }

  static InfoRegisterDto deserialize(String json) {
    return ensureInitialized().decodeJson<InfoRegisterDto>(json);
  }
}

mixin InfoRegisterDtoMappable {
  String serialize() {
    return InfoRegisterDtoMapper.ensureInitialized()
        .encodeJson<InfoRegisterDto>(this as InfoRegisterDto);
  }

  Map<String, dynamic> toJson() {
    return InfoRegisterDtoMapper.ensureInitialized()
        .encodeMap<InfoRegisterDto>(this as InfoRegisterDto);
  }

  InfoRegisterDtoCopyWith<InfoRegisterDto, InfoRegisterDto, InfoRegisterDto>
      get copyWith => _InfoRegisterDtoCopyWithImpl(
          this as InfoRegisterDto, $identity, $identity);
  @override
  String toString() {
    return InfoRegisterDtoMapper.ensureInitialized()
        .stringifyValue(this as InfoRegisterDto);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            InfoRegisterDtoMapper.ensureInitialized()
                .isValueEqual(this as InfoRegisterDto, other));
  }

  @override
  int get hashCode {
    return InfoRegisterDtoMapper.ensureInitialized()
        .hashValue(this as InfoRegisterDto);
  }
}

extension InfoRegisterDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InfoRegisterDto, $Out> {
  InfoRegisterDtoCopyWith<$R, InfoRegisterDto, $Out> get $asInfoRegisterDto =>
      $base.as((v, t, t2) => _InfoRegisterDtoCopyWithImpl(v, t, t2));
}

abstract class InfoRegisterDtoCopyWith<$R, $In extends InfoRegisterDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? alias,
      String? version,
      String? deviceModel,
      DeviceType? deviceType,
      String? fingerprint,
      int? port,
      ProtocolType? protocol,
      bool? download});
  InfoRegisterDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _InfoRegisterDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InfoRegisterDto, $Out>
    implements InfoRegisterDtoCopyWith<$R, InfoRegisterDto, $Out> {
  _InfoRegisterDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InfoRegisterDto> $mapper =
      InfoRegisterDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? alias,
          Object? version = $none,
          Object? deviceModel = $none,
          Object? deviceType = $none,
          Object? fingerprint = $none,
          Object? port = $none,
          Object? protocol = $none,
          Object? download = $none}) =>
      $apply(FieldCopyWithData({
        if (alias != null) #alias: alias,
        if (version != $none) #version: version,
        if (deviceModel != $none) #deviceModel: deviceModel,
        if (deviceType != $none) #deviceType: deviceType,
        if (fingerprint != $none) #fingerprint: fingerprint,
        if (port != $none) #port: port,
        if (protocol != $none) #protocol: protocol,
        if (download != $none) #download: download
      }));
  @override
  InfoRegisterDto $make(CopyWithData data) => InfoRegisterDto(
      alias: data.get(#alias, or: $value.alias),
      version: data.get(#version, or: $value.version),
      deviceModel: data.get(#deviceModel, or: $value.deviceModel),
      deviceType: data.get(#deviceType, or: $value.deviceType),
      fingerprint: data.get(#fingerprint, or: $value.fingerprint),
      port: data.get(#port, or: $value.port),
      protocol: data.get(#protocol, or: $value.protocol),
      download: data.get(#download, or: $value.download));

  @override
  InfoRegisterDtoCopyWith<$R2, InfoRegisterDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _InfoRegisterDtoCopyWithImpl($value, $cast, t);
}
