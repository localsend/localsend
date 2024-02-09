// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'multicast_dto.dart';

class ProtocolTypeMapper extends EnumMapper<ProtocolType> {
  ProtocolTypeMapper._();

  static ProtocolTypeMapper? _instance;
  static ProtocolTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProtocolTypeMapper._());
    }
    return _instance!;
  }

  static ProtocolType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ProtocolType decode(dynamic value) {
    switch (value) {
      case 'http':
        return ProtocolType.http;
      case 'https':
        return ProtocolType.https;
      default:
        return ProtocolType.values[1];
    }
  }

  @override
  dynamic encode(ProtocolType self) {
    switch (self) {
      case ProtocolType.http:
        return 'http';
      case ProtocolType.https:
        return 'https';
    }
  }
}

extension ProtocolTypeMapperExtension on ProtocolType {
  String toValue() {
    ProtocolTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ProtocolType>(this) as String;
  }
}

class MulticastDtoMapper extends ClassMapperBase<MulticastDto> {
  MulticastDtoMapper._();

  static MulticastDtoMapper? _instance;
  static MulticastDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MulticastDtoMapper._());
      DeviceTypeMapper.ensureInitialized();
      ProtocolTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MulticastDto';

  static String _$alias(MulticastDto v) => v.alias;
  static const Field<MulticastDto, String> _f$alias = Field('alias', _$alias);
  static String? _$version(MulticastDto v) => v.version;
  static const Field<MulticastDto, String> _f$version =
      Field('version', _$version);
  static String? _$deviceModel(MulticastDto v) => v.deviceModel;
  static const Field<MulticastDto, String> _f$deviceModel =
      Field('deviceModel', _$deviceModel);
  static DeviceType? _$deviceType(MulticastDto v) => v.deviceType;
  static const Field<MulticastDto, DeviceType> _f$deviceType =
      Field('deviceType', _$deviceType);
  static String _$fingerprint(MulticastDto v) => v.fingerprint;
  static const Field<MulticastDto, String> _f$fingerprint =
      Field('fingerprint', _$fingerprint);
  static int? _$port(MulticastDto v) => v.port;
  static const Field<MulticastDto, int> _f$port = Field('port', _$port);
  static ProtocolType? _$protocol(MulticastDto v) => v.protocol;
  static const Field<MulticastDto, ProtocolType> _f$protocol =
      Field('protocol', _$protocol);
  static bool? _$download(MulticastDto v) => v.download;
  static const Field<MulticastDto, bool> _f$download =
      Field('download', _$download);
  static bool? _$announcement(MulticastDto v) => v.announcement;
  static const Field<MulticastDto, bool> _f$announcement =
      Field('announcement', _$announcement);
  static bool? _$announce(MulticastDto v) => v.announce;
  static const Field<MulticastDto, bool> _f$announce =
      Field('announce', _$announce);

  @override
  final Map<Symbol, Field<MulticastDto, dynamic>> fields = const {
    #alias: _f$alias,
    #version: _f$version,
    #deviceModel: _f$deviceModel,
    #deviceType: _f$deviceType,
    #fingerprint: _f$fingerprint,
    #port: _f$port,
    #protocol: _f$protocol,
    #download: _f$download,
    #announcement: _f$announcement,
    #announce: _f$announce,
  };

  static MulticastDto _instantiate(DecodingData data) {
    return MulticastDto(
        alias: data.dec(_f$alias),
        version: data.dec(_f$version),
        deviceModel: data.dec(_f$deviceModel),
        deviceType: data.dec(_f$deviceType),
        fingerprint: data.dec(_f$fingerprint),
        port: data.dec(_f$port),
        protocol: data.dec(_f$protocol),
        download: data.dec(_f$download),
        announcement: data.dec(_f$announcement),
        announce: data.dec(_f$announce));
  }

  @override
  final Function instantiate = _instantiate;

  static MulticastDto fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MulticastDto>(map);
  }

  static MulticastDto deserialize(String json) {
    return ensureInitialized().decodeJson<MulticastDto>(json);
  }
}

mixin MulticastDtoMappable {
  String serialize() {
    return MulticastDtoMapper.ensureInitialized()
        .encodeJson<MulticastDto>(this as MulticastDto);
  }

  Map<String, dynamic> toJson() {
    return MulticastDtoMapper.ensureInitialized()
        .encodeMap<MulticastDto>(this as MulticastDto);
  }

  MulticastDtoCopyWith<MulticastDto, MulticastDto, MulticastDto> get copyWith =>
      _MulticastDtoCopyWithImpl(this as MulticastDto, $identity, $identity);
  @override
  String toString() {
    return MulticastDtoMapper.ensureInitialized()
        .stringifyValue(this as MulticastDto);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            MulticastDtoMapper.ensureInitialized()
                .isValueEqual(this as MulticastDto, other));
  }

  @override
  int get hashCode {
    return MulticastDtoMapper.ensureInitialized()
        .hashValue(this as MulticastDto);
  }
}

extension MulticastDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MulticastDto, $Out> {
  MulticastDtoCopyWith<$R, MulticastDto, $Out> get $asMulticastDto =>
      $base.as((v, t, t2) => _MulticastDtoCopyWithImpl(v, t, t2));
}

abstract class MulticastDtoCopyWith<$R, $In extends MulticastDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? alias,
      String? version,
      String? deviceModel,
      DeviceType? deviceType,
      String? fingerprint,
      int? port,
      ProtocolType? protocol,
      bool? download,
      bool? announcement,
      bool? announce});
  MulticastDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MulticastDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MulticastDto, $Out>
    implements MulticastDtoCopyWith<$R, MulticastDto, $Out> {
  _MulticastDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MulticastDto> $mapper =
      MulticastDtoMapper.ensureInitialized();
  @override
  $R call(
          {String? alias,
          Object? version = $none,
          Object? deviceModel = $none,
          Object? deviceType = $none,
          String? fingerprint,
          Object? port = $none,
          Object? protocol = $none,
          Object? download = $none,
          Object? announcement = $none,
          Object? announce = $none}) =>
      $apply(FieldCopyWithData({
        if (alias != null) #alias: alias,
        if (version != $none) #version: version,
        if (deviceModel != $none) #deviceModel: deviceModel,
        if (deviceType != $none) #deviceType: deviceType,
        if (fingerprint != null) #fingerprint: fingerprint,
        if (port != $none) #port: port,
        if (protocol != $none) #protocol: protocol,
        if (download != $none) #download: download,
        if (announcement != $none) #announcement: announcement,
        if (announce != $none) #announce: announce
      }));
  @override
  MulticastDto $make(CopyWithData data) => MulticastDto(
      alias: data.get(#alias, or: $value.alias),
      version: data.get(#version, or: $value.version),
      deviceModel: data.get(#deviceModel, or: $value.deviceModel),
      deviceType: data.get(#deviceType, or: $value.deviceType),
      fingerprint: data.get(#fingerprint, or: $value.fingerprint),
      port: data.get(#port, or: $value.port),
      protocol: data.get(#protocol, or: $value.protocol),
      download: data.get(#download, or: $value.download),
      announcement: data.get(#announcement, or: $value.announcement),
      announce: data.get(#announce, or: $value.announce));

  @override
  MulticastDtoCopyWith<$R2, MulticastDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MulticastDtoCopyWithImpl($value, $cast, t);
}
