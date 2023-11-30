// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'device.dart';

class DeviceTypeMapper extends EnumMapper<DeviceType> {
  DeviceTypeMapper._();

  static DeviceTypeMapper? _instance;
  static DeviceTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeviceTypeMapper._());
    }
    return _instance!;
  }

  static DeviceType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  DeviceType decode(dynamic value) {
    switch (value) {
      case 'mobile':
        return DeviceType.mobile;
      case 'desktop':
        return DeviceType.desktop;
      case 'web':
        return DeviceType.web;
      case 'headless':
        return DeviceType.headless;
      case 'server':
        return DeviceType.server;
      default:
        return DeviceType.values[1];
    }
  }

  @override
  dynamic encode(DeviceType self) {
    switch (self) {
      case DeviceType.mobile:
        return 'mobile';
      case DeviceType.desktop:
        return 'desktop';
      case DeviceType.web:
        return 'web';
      case DeviceType.headless:
        return 'headless';
      case DeviceType.server:
        return 'server';
    }
  }
}

extension DeviceTypeMapperExtension on DeviceType {
  String toValue() {
    DeviceTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<DeviceType>(this) as String;
  }
}

class DeviceMapper extends ClassMapperBase<Device> {
  DeviceMapper._();

  static DeviceMapper? _instance;
  static DeviceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeviceMapper._());
      DeviceTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Device';

  static String _$ip(Device v) => v.ip;
  static const Field<Device, String> _f$ip = Field('ip', _$ip);
  static String _$version(Device v) => v.version;
  static const Field<Device, String> _f$version = Field('version', _$version);
  static int _$port(Device v) => v.port;
  static const Field<Device, int> _f$port = Field('port', _$port);
  static bool _$https(Device v) => v.https;
  static const Field<Device, bool> _f$https = Field('https', _$https);
  static String _$fingerprint(Device v) => v.fingerprint;
  static const Field<Device, String> _f$fingerprint =
      Field('fingerprint', _$fingerprint);
  static String _$alias(Device v) => v.alias;
  static const Field<Device, String> _f$alias = Field('alias', _$alias);
  static String? _$deviceModel(Device v) => v.deviceModel;
  static const Field<Device, String> _f$deviceModel =
      Field('deviceModel', _$deviceModel);
  static DeviceType _$deviceType(Device v) => v.deviceType;
  static const Field<Device, DeviceType> _f$deviceType =
      Field('deviceType', _$deviceType);
  static bool _$download(Device v) => v.download;
  static const Field<Device, bool> _f$download = Field('download', _$download);

  @override
  final Map<Symbol, Field<Device, dynamic>> fields = const {
    #ip: _f$ip,
    #version: _f$version,
    #port: _f$port,
    #https: _f$https,
    #fingerprint: _f$fingerprint,
    #alias: _f$alias,
    #deviceModel: _f$deviceModel,
    #deviceType: _f$deviceType,
    #download: _f$download,
  };

  static Device _instantiate(DecodingData data) {
    return Device(
        ip: data.dec(_f$ip),
        version: data.dec(_f$version),
        port: data.dec(_f$port),
        https: data.dec(_f$https),
        fingerprint: data.dec(_f$fingerprint),
        alias: data.dec(_f$alias),
        deviceModel: data.dec(_f$deviceModel),
        deviceType: data.dec(_f$deviceType),
        download: data.dec(_f$download));
  }

  @override
  final Function instantiate = _instantiate;

  static Device fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Device>(map);
  }

  static Device deserialize(String json) {
    return ensureInitialized().decodeJson<Device>(json);
  }
}

mixin DeviceMappable {
  String serialize() {
    return DeviceMapper.ensureInitialized().encodeJson<Device>(this as Device);
  }

  Map<String, dynamic> toJson() {
    return DeviceMapper.ensureInitialized().encodeMap<Device>(this as Device);
  }

  DeviceCopyWith<Device, Device, Device> get copyWith =>
      _DeviceCopyWithImpl(this as Device, $identity, $identity);
  @override
  String toString() {
    return DeviceMapper.ensureInitialized().stringifyValue(this as Device);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DeviceMapper.ensureInitialized()
                .isValueEqual(this as Device, other));
  }

  @override
  int get hashCode {
    return DeviceMapper.ensureInitialized().hashValue(this as Device);
  }
}

extension DeviceValueCopy<$R, $Out> on ObjectCopyWith<$R, Device, $Out> {
  DeviceCopyWith<$R, Device, $Out> get $asDevice =>
      $base.as((v, t, t2) => _DeviceCopyWithImpl(v, t, t2));
}

abstract class DeviceCopyWith<$R, $In extends Device, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? ip,
      String? version,
      int? port,
      bool? https,
      String? fingerprint,
      String? alias,
      String? deviceModel,
      DeviceType? deviceType,
      bool? download});
  DeviceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DeviceCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Device, $Out>
    implements DeviceCopyWith<$R, Device, $Out> {
  _DeviceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Device> $mapper = DeviceMapper.ensureInitialized();
  @override
  $R call(
          {String? ip,
          String? version,
          int? port,
          bool? https,
          String? fingerprint,
          String? alias,
          Object? deviceModel = $none,
          DeviceType? deviceType,
          bool? download}) =>
      $apply(FieldCopyWithData({
        if (ip != null) #ip: ip,
        if (version != null) #version: version,
        if (port != null) #port: port,
        if (https != null) #https: https,
        if (fingerprint != null) #fingerprint: fingerprint,
        if (alias != null) #alias: alias,
        if (deviceModel != $none) #deviceModel: deviceModel,
        if (deviceType != null) #deviceType: deviceType,
        if (download != null) #download: download
      }));
  @override
  Device $make(CopyWithData data) => Device(
      ip: data.get(#ip, or: $value.ip),
      version: data.get(#version, or: $value.version),
      port: data.get(#port, or: $value.port),
      https: data.get(#https, or: $value.https),
      fingerprint: data.get(#fingerprint, or: $value.fingerprint),
      alias: data.get(#alias, or: $value.alias),
      deviceModel: data.get(#deviceModel, or: $value.deviceModel),
      deviceType: data.get(#deviceType, or: $value.deviceType),
      download: data.get(#download, or: $value.download));

  @override
  DeviceCopyWith<$R2, Device, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DeviceCopyWithImpl($value, $cast, t);
}
