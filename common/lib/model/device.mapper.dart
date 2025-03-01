// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
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

class DiscoveryMethodMapper extends ClassMapperBase<DiscoveryMethod> {
  DiscoveryMethodMapper._();

  static DiscoveryMethodMapper? _instance;
  static DiscoveryMethodMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DiscoveryMethodMapper._());
      MulticastDiscoveryMapper.ensureInitialized();
      HttpDiscoveryMapper.ensureInitialized();
      SignalingDiscoveryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DiscoveryMethod';

  @override
  final MappableFields<DiscoveryMethod> fields = const {};

  static DiscoveryMethod _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('DiscoveryMethod');
  }

  @override
  final Function instantiate = _instantiate;

  static DiscoveryMethod fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DiscoveryMethod>(map);
  }

  static DiscoveryMethod deserialize(String json) {
    return ensureInitialized().decodeJson<DiscoveryMethod>(json);
  }
}

mixin DiscoveryMethodMappable {
  String serialize();
  Map<String, dynamic> toJson();
  DiscoveryMethodCopyWith<DiscoveryMethod, DiscoveryMethod, DiscoveryMethod> get copyWith;
}

abstract class DiscoveryMethodCopyWith<$R, $In extends DiscoveryMethod, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  DiscoveryMethodCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class MulticastDiscoveryMapper extends ClassMapperBase<MulticastDiscovery> {
  MulticastDiscoveryMapper._();

  static MulticastDiscoveryMapper? _instance;
  static MulticastDiscoveryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MulticastDiscoveryMapper._());
      DiscoveryMethodMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MulticastDiscovery';

  @override
  final MappableFields<MulticastDiscovery> fields = const {};

  static MulticastDiscovery _instantiate(DecodingData data) {
    return MulticastDiscovery();
  }

  @override
  final Function instantiate = _instantiate;

  static MulticastDiscovery fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MulticastDiscovery>(map);
  }

  static MulticastDiscovery deserialize(String json) {
    return ensureInitialized().decodeJson<MulticastDiscovery>(json);
  }
}

mixin MulticastDiscoveryMappable {
  String serialize() {
    return MulticastDiscoveryMapper.ensureInitialized().encodeJson<MulticastDiscovery>(this as MulticastDiscovery);
  }

  Map<String, dynamic> toJson() {
    return MulticastDiscoveryMapper.ensureInitialized().encodeMap<MulticastDiscovery>(this as MulticastDiscovery);
  }

  MulticastDiscoveryCopyWith<MulticastDiscovery, MulticastDiscovery, MulticastDiscovery> get copyWith =>
      _MulticastDiscoveryCopyWithImpl(this as MulticastDiscovery, $identity, $identity);
  @override
  String toString() {
    return MulticastDiscoveryMapper.ensureInitialized().stringifyValue(this as MulticastDiscovery);
  }

  @override
  bool operator ==(Object other) {
    return MulticastDiscoveryMapper.ensureInitialized().equalsValue(this as MulticastDiscovery, other);
  }

  @override
  int get hashCode {
    return MulticastDiscoveryMapper.ensureInitialized().hashValue(this as MulticastDiscovery);
  }
}

extension MulticastDiscoveryValueCopy<$R, $Out> on ObjectCopyWith<$R, MulticastDiscovery, $Out> {
  MulticastDiscoveryCopyWith<$R, MulticastDiscovery, $Out> get $asMulticastDiscovery =>
      $base.as((v, t, t2) => _MulticastDiscoveryCopyWithImpl(v, t, t2));
}

abstract class MulticastDiscoveryCopyWith<$R, $In extends MulticastDiscovery, $Out> implements DiscoveryMethodCopyWith<$R, $In, $Out> {
  @override
  $R call();
  MulticastDiscoveryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MulticastDiscoveryCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, MulticastDiscovery, $Out>
    implements MulticastDiscoveryCopyWith<$R, MulticastDiscovery, $Out> {
  _MulticastDiscoveryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MulticastDiscovery> $mapper = MulticastDiscoveryMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  MulticastDiscovery $make(CopyWithData data) => MulticastDiscovery();

  @override
  MulticastDiscoveryCopyWith<$R2, MulticastDiscovery, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MulticastDiscoveryCopyWithImpl($value, $cast, t);
}

class HttpDiscoveryMapper extends ClassMapperBase<HttpDiscovery> {
  HttpDiscoveryMapper._();

  static HttpDiscoveryMapper? _instance;
  static HttpDiscoveryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HttpDiscoveryMapper._());
      DiscoveryMethodMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HttpDiscovery';

  static String _$ip(HttpDiscovery v) => v.ip;
  static const Field<HttpDiscovery, String> _f$ip = Field('ip', _$ip);

  @override
  final MappableFields<HttpDiscovery> fields = const {
    #ip: _f$ip,
  };

  static HttpDiscovery _instantiate(DecodingData data) {
    return HttpDiscovery(ip: data.dec(_f$ip));
  }

  @override
  final Function instantiate = _instantiate;

  static HttpDiscovery fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HttpDiscovery>(map);
  }

  static HttpDiscovery deserialize(String json) {
    return ensureInitialized().decodeJson<HttpDiscovery>(json);
  }
}

mixin HttpDiscoveryMappable {
  String serialize() {
    return HttpDiscoveryMapper.ensureInitialized().encodeJson<HttpDiscovery>(this as HttpDiscovery);
  }

  Map<String, dynamic> toJson() {
    return HttpDiscoveryMapper.ensureInitialized().encodeMap<HttpDiscovery>(this as HttpDiscovery);
  }

  HttpDiscoveryCopyWith<HttpDiscovery, HttpDiscovery, HttpDiscovery> get copyWith =>
      _HttpDiscoveryCopyWithImpl(this as HttpDiscovery, $identity, $identity);
  @override
  String toString() {
    return HttpDiscoveryMapper.ensureInitialized().stringifyValue(this as HttpDiscovery);
  }

  @override
  bool operator ==(Object other) {
    return HttpDiscoveryMapper.ensureInitialized().equalsValue(this as HttpDiscovery, other);
  }

  @override
  int get hashCode {
    return HttpDiscoveryMapper.ensureInitialized().hashValue(this as HttpDiscovery);
  }
}

extension HttpDiscoveryValueCopy<$R, $Out> on ObjectCopyWith<$R, HttpDiscovery, $Out> {
  HttpDiscoveryCopyWith<$R, HttpDiscovery, $Out> get $asHttpDiscovery => $base.as((v, t, t2) => _HttpDiscoveryCopyWithImpl(v, t, t2));
}

abstract class HttpDiscoveryCopyWith<$R, $In extends HttpDiscovery, $Out> implements DiscoveryMethodCopyWith<$R, $In, $Out> {
  @override
  $R call({String? ip});
  HttpDiscoveryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HttpDiscoveryCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, HttpDiscovery, $Out>
    implements HttpDiscoveryCopyWith<$R, HttpDiscovery, $Out> {
  _HttpDiscoveryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HttpDiscovery> $mapper = HttpDiscoveryMapper.ensureInitialized();
  @override
  $R call({String? ip}) => $apply(FieldCopyWithData({if (ip != null) #ip: ip}));
  @override
  HttpDiscovery $make(CopyWithData data) => HttpDiscovery(ip: data.get(#ip, or: $value.ip));

  @override
  HttpDiscoveryCopyWith<$R2, HttpDiscovery, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _HttpDiscoveryCopyWithImpl($value, $cast, t);
}

class SignalingDiscoveryMapper extends ClassMapperBase<SignalingDiscovery> {
  SignalingDiscoveryMapper._();

  static SignalingDiscoveryMapper? _instance;
  static SignalingDiscoveryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignalingDiscoveryMapper._());
      DiscoveryMethodMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SignalingDiscovery';

  static String _$signalingServer(SignalingDiscovery v) => v.signalingServer;
  static const Field<SignalingDiscovery, String> _f$signalingServer = Field('signalingServer', _$signalingServer);

  @override
  final MappableFields<SignalingDiscovery> fields = const {
    #signalingServer: _f$signalingServer,
  };

  static SignalingDiscovery _instantiate(DecodingData data) {
    return SignalingDiscovery(signalingServer: data.dec(_f$signalingServer));
  }

  @override
  final Function instantiate = _instantiate;

  static SignalingDiscovery fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignalingDiscovery>(map);
  }

  static SignalingDiscovery deserialize(String json) {
    return ensureInitialized().decodeJson<SignalingDiscovery>(json);
  }
}

mixin SignalingDiscoveryMappable {
  String serialize() {
    return SignalingDiscoveryMapper.ensureInitialized().encodeJson<SignalingDiscovery>(this as SignalingDiscovery);
  }

  Map<String, dynamic> toJson() {
    return SignalingDiscoveryMapper.ensureInitialized().encodeMap<SignalingDiscovery>(this as SignalingDiscovery);
  }

  SignalingDiscoveryCopyWith<SignalingDiscovery, SignalingDiscovery, SignalingDiscovery> get copyWith =>
      _SignalingDiscoveryCopyWithImpl(this as SignalingDiscovery, $identity, $identity);
  @override
  String toString() {
    return SignalingDiscoveryMapper.ensureInitialized().stringifyValue(this as SignalingDiscovery);
  }

  @override
  bool operator ==(Object other) {
    return SignalingDiscoveryMapper.ensureInitialized().equalsValue(this as SignalingDiscovery, other);
  }

  @override
  int get hashCode {
    return SignalingDiscoveryMapper.ensureInitialized().hashValue(this as SignalingDiscovery);
  }
}

extension SignalingDiscoveryValueCopy<$R, $Out> on ObjectCopyWith<$R, SignalingDiscovery, $Out> {
  SignalingDiscoveryCopyWith<$R, SignalingDiscovery, $Out> get $asSignalingDiscovery =>
      $base.as((v, t, t2) => _SignalingDiscoveryCopyWithImpl(v, t, t2));
}

abstract class SignalingDiscoveryCopyWith<$R, $In extends SignalingDiscovery, $Out> implements DiscoveryMethodCopyWith<$R, $In, $Out> {
  @override
  $R call({String? signalingServer});
  SignalingDiscoveryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SignalingDiscoveryCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, SignalingDiscovery, $Out>
    implements SignalingDiscoveryCopyWith<$R, SignalingDiscovery, $Out> {
  _SignalingDiscoveryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SignalingDiscovery> $mapper = SignalingDiscoveryMapper.ensureInitialized();
  @override
  $R call({String? signalingServer}) => $apply(FieldCopyWithData({if (signalingServer != null) #signalingServer: signalingServer}));
  @override
  SignalingDiscovery $make(CopyWithData data) => SignalingDiscovery(signalingServer: data.get(#signalingServer, or: $value.signalingServer));

  @override
  SignalingDiscoveryCopyWith<$R2, SignalingDiscovery, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SignalingDiscoveryCopyWithImpl($value, $cast, t);
}

class DeviceMapper extends ClassMapperBase<Device> {
  DeviceMapper._();

  static DeviceMapper? _instance;
  static DeviceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeviceMapper._());
      DeviceTypeMapper.ensureInitialized();
      DiscoveryMethodMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Device';

  static String? _$signalingId(Device v) => v.signalingId;
  static const Field<Device, String> _f$signalingId = Field('signalingId', _$signalingId);
  static String? _$ip(Device v) => v.ip;
  static const Field<Device, String> _f$ip = Field('ip', _$ip);
  static String _$version(Device v) => v.version;
  static const Field<Device, String> _f$version = Field('version', _$version);
  static int _$port(Device v) => v.port;
  static const Field<Device, int> _f$port = Field('port', _$port);
  static bool _$https(Device v) => v.https;
  static const Field<Device, bool> _f$https = Field('https', _$https);
  static String _$fingerprint(Device v) => v.fingerprint;
  static const Field<Device, String> _f$fingerprint = Field('fingerprint', _$fingerprint);
  static String _$alias(Device v) => v.alias;
  static const Field<Device, String> _f$alias = Field('alias', _$alias);
  static String? _$deviceModel(Device v) => v.deviceModel;
  static const Field<Device, String> _f$deviceModel = Field('deviceModel', _$deviceModel);
  static DeviceType _$deviceType(Device v) => v.deviceType;
  static const Field<Device, DeviceType> _f$deviceType = Field('deviceType', _$deviceType);
  static bool _$download(Device v) => v.download;
  static const Field<Device, bool> _f$download = Field('download', _$download);
  static Set<DiscoveryMethod> _$discoveryMethods(Device v) => v.discoveryMethods;
  static const Field<Device, Set<DiscoveryMethod>> _f$discoveryMethods = Field('discoveryMethods', _$discoveryMethods);

  @override
  final MappableFields<Device> fields = const {
    #signalingId: _f$signalingId,
    #ip: _f$ip,
    #version: _f$version,
    #port: _f$port,
    #https: _f$https,
    #fingerprint: _f$fingerprint,
    #alias: _f$alias,
    #deviceModel: _f$deviceModel,
    #deviceType: _f$deviceType,
    #download: _f$download,
    #discoveryMethods: _f$discoveryMethods,
  };

  static Device _instantiate(DecodingData data) {
    return Device(
        signalingId: data.dec(_f$signalingId),
        ip: data.dec(_f$ip),
        version: data.dec(_f$version),
        port: data.dec(_f$port),
        https: data.dec(_f$https),
        fingerprint: data.dec(_f$fingerprint),
        alias: data.dec(_f$alias),
        deviceModel: data.dec(_f$deviceModel),
        deviceType: data.dec(_f$deviceType),
        download: data.dec(_f$download),
        discoveryMethods: data.dec(_f$discoveryMethods));
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

  DeviceCopyWith<Device, Device, Device> get copyWith => _DeviceCopyWithImpl(this as Device, $identity, $identity);
  @override
  String toString() {
    return DeviceMapper.ensureInitialized().stringifyValue(this as Device);
  }

  @override
  bool operator ==(Object other) {
    return DeviceMapper.ensureInitialized().equalsValue(this as Device, other);
  }

  @override
  int get hashCode {
    return DeviceMapper.ensureInitialized().hashValue(this as Device);
  }
}

extension DeviceValueCopy<$R, $Out> on ObjectCopyWith<$R, Device, $Out> {
  DeviceCopyWith<$R, Device, $Out> get $asDevice => $base.as((v, t, t2) => _DeviceCopyWithImpl(v, t, t2));
}

abstract class DeviceCopyWith<$R, $In extends Device, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? signalingId,
      String? ip,
      String? version,
      int? port,
      bool? https,
      String? fingerprint,
      String? alias,
      String? deviceModel,
      DeviceType? deviceType,
      bool? download,
      Set<DiscoveryMethod>? discoveryMethods});
  DeviceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DeviceCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Device, $Out> implements DeviceCopyWith<$R, Device, $Out> {
  _DeviceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Device> $mapper = DeviceMapper.ensureInitialized();
  @override
  $R call(
          {Object? signalingId = $none,
          Object? ip = $none,
          String? version,
          int? port,
          bool? https,
          String? fingerprint,
          String? alias,
          Object? deviceModel = $none,
          DeviceType? deviceType,
          bool? download,
          Set<DiscoveryMethod>? discoveryMethods}) =>
      $apply(FieldCopyWithData({
        if (signalingId != $none) #signalingId: signalingId,
        if (ip != $none) #ip: ip,
        if (version != null) #version: version,
        if (port != null) #port: port,
        if (https != null) #https: https,
        if (fingerprint != null) #fingerprint: fingerprint,
        if (alias != null) #alias: alias,
        if (deviceModel != $none) #deviceModel: deviceModel,
        if (deviceType != null) #deviceType: deviceType,
        if (download != null) #download: download,
        if (discoveryMethods != null) #discoveryMethods: discoveryMethods
      }));
  @override
  Device $make(CopyWithData data) => Device(
      signalingId: data.get(#signalingId, or: $value.signalingId),
      ip: data.get(#ip, or: $value.ip),
      version: data.get(#version, or: $value.version),
      port: data.get(#port, or: $value.port),
      https: data.get(#https, or: $value.https),
      fingerprint: data.get(#fingerprint, or: $value.fingerprint),
      alias: data.get(#alias, or: $value.alias),
      deviceModel: data.get(#deviceModel, or: $value.deviceModel),
      deviceType: data.get(#deviceType, or: $value.deviceType),
      download: data.get(#download, or: $value.download),
      discoveryMethods: data.get(#discoveryMethods, or: $value.discoveryMethods));

  @override
  DeviceCopyWith<$R2, Device, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _DeviceCopyWithImpl($value, $cast, t);
}
