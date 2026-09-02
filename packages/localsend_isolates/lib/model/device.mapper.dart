// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
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
      case r'mobile':
        return DeviceType.mobile;
      case r'desktop':
        return DeviceType.desktop;
      case r'web':
        return DeviceType.web;
      case r'headless':
        return DeviceType.headless;
      case r'server':
        return DeviceType.server;
      default:
        return DeviceType.values[1];
    }
  }

  @override
  dynamic encode(DeviceType self) {
    switch (self) {
      case DeviceType.mobile:
        return r'mobile';
      case DeviceType.desktop:
        return r'desktop';
      case DeviceType.web:
        return r'web';
      case DeviceType.headless:
        return r'headless';
      case DeviceType.server:
        return r'server';
    }
  }
}

extension DeviceTypeMapperExtension on DeviceType {
  String toValue() {
    DeviceTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<DeviceType>(this) as String;
  }
}

class DeviceChannelMapper extends ClassMapperBase<DeviceChannel> {
  DeviceChannelMapper._();

  static DeviceChannelMapper? _instance;
  static DeviceChannelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeviceChannelMapper._());
      HttpChannelMapper.ensureInitialized();
      SignalingChannelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DeviceChannel';

  @override
  final MappableFields<DeviceChannel> fields = const {};

  static DeviceChannel _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('DeviceChannel');
  }

  @override
  final Function instantiate = _instantiate;

  static DeviceChannel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DeviceChannel>(map);
  }

  static DeviceChannel deserialize(String json) {
    return ensureInitialized().decodeJson<DeviceChannel>(json);
  }
}

mixin DeviceChannelMappable {
  String serialize();
  Map<String, dynamic> toJson();
  DeviceChannelCopyWith<DeviceChannel, DeviceChannel, DeviceChannel>
  get copyWith;
}

abstract class DeviceChannelCopyWith<$R, $In extends DeviceChannel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  DeviceChannelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class HttpChannelMapper extends ClassMapperBase<HttpChannel> {
  HttpChannelMapper._();

  static HttpChannelMapper? _instance;
  static HttpChannelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HttpChannelMapper._());
      DeviceChannelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HttpChannel';

  static String _$host(HttpChannel v) => v.host;
  static const Field<HttpChannel, String> _f$host = Field('host', _$host);
  static int _$port(HttpChannel v) => v.port;
  static const Field<HttpChannel, int> _f$port = Field('port', _$port);
  static bool _$https(HttpChannel v) => v.https;
  static const Field<HttpChannel, bool> _f$https = Field('https', _$https);

  @override
  final MappableFields<HttpChannel> fields = const {
    #host: _f$host,
    #port: _f$port,
    #https: _f$https,
  };

  static HttpChannel _instantiate(DecodingData data) {
    return HttpChannel(
      host: data.dec(_f$host),
      port: data.dec(_f$port),
      https: data.dec(_f$https),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static HttpChannel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HttpChannel>(map);
  }

  static HttpChannel deserialize(String json) {
    return ensureInitialized().decodeJson<HttpChannel>(json);
  }
}

mixin HttpChannelMappable {
  String serialize() {
    return HttpChannelMapper.ensureInitialized().encodeJson<HttpChannel>(
      this as HttpChannel,
    );
  }

  Map<String, dynamic> toJson() {
    return HttpChannelMapper.ensureInitialized().encodeMap<HttpChannel>(
      this as HttpChannel,
    );
  }

  HttpChannelCopyWith<HttpChannel, HttpChannel, HttpChannel> get copyWith =>
      _HttpChannelCopyWithImpl<HttpChannel, HttpChannel>(
        this as HttpChannel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return HttpChannelMapper.ensureInitialized().stringifyValue(
      this as HttpChannel,
    );
  }

  @override
  bool operator ==(Object other) {
    return HttpChannelMapper.ensureInitialized().equalsValue(
      this as HttpChannel,
      other,
    );
  }

  @override
  int get hashCode {
    return HttpChannelMapper.ensureInitialized().hashValue(this as HttpChannel);
  }
}

extension HttpChannelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HttpChannel, $Out> {
  HttpChannelCopyWith<$R, HttpChannel, $Out> get $asHttpChannel =>
      $base.as((v, t, t2) => _HttpChannelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class HttpChannelCopyWith<$R, $In extends HttpChannel, $Out>
    implements DeviceChannelCopyWith<$R, $In, $Out> {
  @override
  $R call({String? host, int? port, bool? https});
  HttpChannelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HttpChannelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HttpChannel, $Out>
    implements HttpChannelCopyWith<$R, HttpChannel, $Out> {
  _HttpChannelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HttpChannel> $mapper =
      HttpChannelMapper.ensureInitialized();
  @override
  $R call({String? host, int? port, bool? https}) => $apply(
    FieldCopyWithData({
      if (host != null) #host: host,
      if (port != null) #port: port,
      if (https != null) #https: https,
    }),
  );
  @override
  HttpChannel $make(CopyWithData data) => HttpChannel(
    host: data.get(#host, or: $value.host),
    port: data.get(#port, or: $value.port),
    https: data.get(#https, or: $value.https),
  );

  @override
  HttpChannelCopyWith<$R2, HttpChannel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _HttpChannelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SignalingChannelMapper extends ClassMapperBase<SignalingChannel> {
  SignalingChannelMapper._();

  static SignalingChannelMapper? _instance;
  static SignalingChannelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignalingChannelMapper._());
      DeviceChannelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SignalingChannel';

  static String _$signalingServer(SignalingChannel v) => v.signalingServer;
  static const Field<SignalingChannel, String> _f$signalingServer = Field(
    'signalingServer',
    _$signalingServer,
  );

  @override
  final MappableFields<SignalingChannel> fields = const {
    #signalingServer: _f$signalingServer,
  };

  static SignalingChannel _instantiate(DecodingData data) {
    return SignalingChannel(signalingServer: data.dec(_f$signalingServer));
  }

  @override
  final Function instantiate = _instantiate;

  static SignalingChannel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignalingChannel>(map);
  }

  static SignalingChannel deserialize(String json) {
    return ensureInitialized().decodeJson<SignalingChannel>(json);
  }
}

mixin SignalingChannelMappable {
  String serialize() {
    return SignalingChannelMapper.ensureInitialized()
        .encodeJson<SignalingChannel>(this as SignalingChannel);
  }

  Map<String, dynamic> toJson() {
    return SignalingChannelMapper.ensureInitialized()
        .encodeMap<SignalingChannel>(this as SignalingChannel);
  }

  SignalingChannelCopyWith<SignalingChannel, SignalingChannel, SignalingChannel>
  get copyWith =>
      _SignalingChannelCopyWithImpl<SignalingChannel, SignalingChannel>(
        this as SignalingChannel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SignalingChannelMapper.ensureInitialized().stringifyValue(
      this as SignalingChannel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SignalingChannelMapper.ensureInitialized().equalsValue(
      this as SignalingChannel,
      other,
    );
  }

  @override
  int get hashCode {
    return SignalingChannelMapper.ensureInitialized().hashValue(
      this as SignalingChannel,
    );
  }
}

extension SignalingChannelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SignalingChannel, $Out> {
  SignalingChannelCopyWith<$R, SignalingChannel, $Out>
  get $asSignalingChannel =>
      $base.as((v, t, t2) => _SignalingChannelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SignalingChannelCopyWith<$R, $In extends SignalingChannel, $Out>
    implements DeviceChannelCopyWith<$R, $In, $Out> {
  @override
  $R call({String? signalingServer});
  SignalingChannelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SignalingChannelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SignalingChannel, $Out>
    implements SignalingChannelCopyWith<$R, SignalingChannel, $Out> {
  _SignalingChannelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SignalingChannel> $mapper =
      SignalingChannelMapper.ensureInitialized();
  @override
  $R call({String? signalingServer}) => $apply(
    FieldCopyWithData({
      if (signalingServer != null) #signalingServer: signalingServer,
    }),
  );
  @override
  SignalingChannel $make(CopyWithData data) => SignalingChannel(
    signalingServer: data.get(#signalingServer, or: $value.signalingServer),
  );

  @override
  SignalingChannelCopyWith<$R2, SignalingChannel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SignalingChannelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DeviceMapper extends ClassMapperBase<Device> {
  DeviceMapper._();

  static DeviceMapper? _instance;
  static DeviceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeviceMapper._());
      DeviceTypeMapper.ensureInitialized();
      DeviceChannelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Device';

  static String? _$signalingId(Device v) => v.signalingId;
  static const Field<Device, String> _f$signalingId = Field(
    'signalingId',
    _$signalingId,
  );
  static String? _$ip(Device v) => v.ip;
  static const Field<Device, String> _f$ip = Field('ip', _$ip);
  static String _$version(Device v) => v.version;
  static const Field<Device, String> _f$version = Field('version', _$version);
  static int _$port(Device v) => v.port;
  static const Field<Device, int> _f$port = Field('port', _$port);
  static bool _$https(Device v) => v.https;
  static const Field<Device, bool> _f$https = Field('https', _$https);
  static String _$fingerprint(Device v) => v.fingerprint;
  static const Field<Device, String> _f$fingerprint = Field(
    'fingerprint',
    _$fingerprint,
  );
  static String _$alias(Device v) => v.alias;
  static const Field<Device, String> _f$alias = Field('alias', _$alias);
  static String? _$deviceModel(Device v) => v.deviceModel;
  static const Field<Device, String> _f$deviceModel = Field(
    'deviceModel',
    _$deviceModel,
  );
  static DeviceType _$deviceType(Device v) => v.deviceType;
  static const Field<Device, DeviceType> _f$deviceType = Field(
    'deviceType',
    _$deviceType,
  );
  static bool _$download(Device v) => v.download;
  static const Field<Device, bool> _f$download = Field('download', _$download);
  static List<DeviceChannel> _$channels(Device v) => v.channels;
  static const Field<Device, List<DeviceChannel>> _f$channels = Field(
    'channels',
    _$channels,
  );

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
    #channels: _f$channels,
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
      channels: data.dec(_f$channels),
    );
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
      _DeviceCopyWithImpl<Device, Device>(this as Device, $identity, $identity);
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
  DeviceCopyWith<$R, Device, $Out> get $asDevice =>
      $base.as((v, t, t2) => _DeviceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DeviceCopyWith<$R, $In extends Device, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    DeviceChannel,
    DeviceChannelCopyWith<$R, DeviceChannel, DeviceChannel>
  >
  get channels;
  $R call({
    String? signalingId,
    String? ip,
    String? version,
    int? port,
    bool? https,
    String? fingerprint,
    String? alias,
    String? deviceModel,
    DeviceType? deviceType,
    bool? download,
    List<DeviceChannel>? channels,
  });
  DeviceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DeviceCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Device, $Out>
    implements DeviceCopyWith<$R, Device, $Out> {
  _DeviceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Device> $mapper = DeviceMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    DeviceChannel,
    DeviceChannelCopyWith<$R, DeviceChannel, DeviceChannel>
  >
  get channels => ListCopyWith(
    $value.channels,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(channels: v),
  );
  @override
  $R call({
    Object? signalingId = $none,
    Object? ip = $none,
    String? version,
    int? port,
    bool? https,
    String? fingerprint,
    String? alias,
    Object? deviceModel = $none,
    DeviceType? deviceType,
    bool? download,
    List<DeviceChannel>? channels,
  }) => $apply(
    FieldCopyWithData({
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
      if (channels != null) #channels: channels,
    }),
  );
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
    channels: data.get(#channels, or: $value.channels),
  );

  @override
  DeviceCopyWith<$R2, Device, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DeviceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

