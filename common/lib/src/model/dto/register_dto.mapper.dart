// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'register_dto.dart';

class RegisterDtoMapper extends ClassMapperBase<RegisterDto> {
  RegisterDtoMapper._();

  static RegisterDtoMapper? _instance;
  static RegisterDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterDtoMapper._());
      DeviceTypeMapper.ensureInitialized();
      ProtocolTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RegisterDto';

  static String _$alias(RegisterDto v) => v.alias;
  static const Field<RegisterDto, String> _f$alias = Field('alias', _$alias);
  static String? _$version(RegisterDto v) => v.version;
  static const Field<RegisterDto, String> _f$version =
      Field('version', _$version);
  static String? _$deviceModel(RegisterDto v) => v.deviceModel;
  static const Field<RegisterDto, String> _f$deviceModel =
      Field('deviceModel', _$deviceModel);
  static DeviceType? _$deviceType(RegisterDto v) => v.deviceType;
  static const Field<RegisterDto, DeviceType> _f$deviceType =
      Field('deviceType', _$deviceType);
  static String _$fingerprint(RegisterDto v) => v.fingerprint;
  static const Field<RegisterDto, String> _f$fingerprint =
      Field('fingerprint', _$fingerprint);
  static int? _$port(RegisterDto v) => v.port;
  static const Field<RegisterDto, int> _f$port = Field('port', _$port);
  static ProtocolType? _$protocol(RegisterDto v) => v.protocol;
  static const Field<RegisterDto, ProtocolType> _f$protocol =
      Field('protocol', _$protocol);
  static bool? _$download(RegisterDto v) => v.download;
  static const Field<RegisterDto, bool> _f$download =
      Field('download', _$download);

  @override
  final Map<Symbol, Field<RegisterDto, dynamic>> fields = const {
    #alias: _f$alias,
    #version: _f$version,
    #deviceModel: _f$deviceModel,
    #deviceType: _f$deviceType,
    #fingerprint: _f$fingerprint,
    #port: _f$port,
    #protocol: _f$protocol,
    #download: _f$download,
  };

  static RegisterDto _instantiate(DecodingData data) {
    return RegisterDto(
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

  static RegisterDto fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegisterDto>(map);
  }

  static RegisterDto deserialize(String json) {
    return ensureInitialized().decodeJson<RegisterDto>(json);
  }
}

mixin RegisterDtoMappable {
  String serialize() {
    return RegisterDtoMapper.ensureInitialized()
        .encodeJson<RegisterDto>(this as RegisterDto);
  }

  Map<String, dynamic> toJson() {
    return RegisterDtoMapper.ensureInitialized()
        .encodeMap<RegisterDto>(this as RegisterDto);
  }

  RegisterDtoCopyWith<RegisterDto, RegisterDto, RegisterDto> get copyWith =>
      _RegisterDtoCopyWithImpl(this as RegisterDto, $identity, $identity);
  @override
  String toString() {
    return RegisterDtoMapper.ensureInitialized()
        .stringifyValue(this as RegisterDto);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RegisterDtoMapper.ensureInitialized()
                .isValueEqual(this as RegisterDto, other));
  }

  @override
  int get hashCode {
    return RegisterDtoMapper.ensureInitialized().hashValue(this as RegisterDto);
  }
}

extension RegisterDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RegisterDto, $Out> {
  RegisterDtoCopyWith<$R, RegisterDto, $Out> get $asRegisterDto =>
      $base.as((v, t, t2) => _RegisterDtoCopyWithImpl(v, t, t2));
}

abstract class RegisterDtoCopyWith<$R, $In extends RegisterDto, $Out>
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
  RegisterDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RegisterDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegisterDto, $Out>
    implements RegisterDtoCopyWith<$R, RegisterDto, $Out> {
  _RegisterDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegisterDto> $mapper =
      RegisterDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? alias,
          Object? version = $none,
          Object? deviceModel = $none,
          Object? deviceType = $none,
          String? fingerprint,
          Object? port = $none,
          Object? protocol = $none,
          Object? download = $none}) =>
      $apply(FieldCopyWithData({
        if (alias != null) #alias: alias,
        if (version != $none) #version: version,
        if (deviceModel != $none) #deviceModel: deviceModel,
        if (deviceType != $none) #deviceType: deviceType,
        if (fingerprint != null) #fingerprint: fingerprint,
        if (port != $none) #port: port,
        if (protocol != $none) #protocol: protocol,
        if (download != $none) #download: download
      }));
  @override
  RegisterDto $make(CopyWithData data) => RegisterDto(
      alias: data.get(#alias, or: $value.alias),
      version: data.get(#version, or: $value.version),
      deviceModel: data.get(#deviceModel, or: $value.deviceModel),
      deviceType: data.get(#deviceType, or: $value.deviceType),
      fingerprint: data.get(#fingerprint, or: $value.fingerprint),
      port: data.get(#port, or: $value.port),
      protocol: data.get(#protocol, or: $value.protocol),
      download: data.get(#download, or: $value.download));

  @override
  RegisterDtoCopyWith<$R2, RegisterDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RegisterDtoCopyWithImpl($value, $cast, t);
}
