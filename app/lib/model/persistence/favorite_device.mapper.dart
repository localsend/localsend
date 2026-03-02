// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'favorite_device.dart';

class FavoriteDeviceMapper extends ClassMapperBase<FavoriteDevice> {
  FavoriteDeviceMapper._();

  static FavoriteDeviceMapper? _instance;
  static FavoriteDeviceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FavoriteDeviceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FavoriteDevice';

  static String _$id(FavoriteDevice v) => v.id;
  static const Field<FavoriteDevice, String> _f$id = Field('id', _$id);
  static String _$fingerprint(FavoriteDevice v) => v.fingerprint;
  static const Field<FavoriteDevice, String> _f$fingerprint = Field(
    'fingerprint',
    _$fingerprint,
  );
  static String _$ip(FavoriteDevice v) => v.ip;
  static const Field<FavoriteDevice, String> _f$ip = Field('ip', _$ip);
  static int _$port(FavoriteDevice v) => v.port;
  static const Field<FavoriteDevice, int> _f$port = Field('port', _$port);
  static String _$alias(FavoriteDevice v) => v.alias;
  static const Field<FavoriteDevice, String> _f$alias = Field('alias', _$alias);
  static bool _$customAlias(FavoriteDevice v) => v.customAlias;
  static const Field<FavoriteDevice, bool> _f$customAlias = Field(
    'customAlias',
    _$customAlias,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<FavoriteDevice> fields = const {
    #id: _f$id,
    #fingerprint: _f$fingerprint,
    #ip: _f$ip,
    #port: _f$port,
    #alias: _f$alias,
    #customAlias: _f$customAlias,
  };

  static FavoriteDevice _instantiate(DecodingData data) {
    return FavoriteDevice(
      id: data.dec(_f$id),
      fingerprint: data.dec(_f$fingerprint),
      ip: data.dec(_f$ip),
      port: data.dec(_f$port),
      alias: data.dec(_f$alias),
      customAlias: data.dec(_f$customAlias),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FavoriteDevice fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FavoriteDevice>(map);
  }

  static FavoriteDevice deserialize(String json) {
    return ensureInitialized().decodeJson<FavoriteDevice>(json);
  }
}

mixin FavoriteDeviceMappable {
  String serialize() {
    return FavoriteDeviceMapper.ensureInitialized().encodeJson<FavoriteDevice>(
      this as FavoriteDevice,
    );
  }

  Map<String, dynamic> toJson() {
    return FavoriteDeviceMapper.ensureInitialized().encodeMap<FavoriteDevice>(
      this as FavoriteDevice,
    );
  }

  FavoriteDeviceCopyWith<FavoriteDevice, FavoriteDevice, FavoriteDevice>
  get copyWith => _FavoriteDeviceCopyWithImpl<FavoriteDevice, FavoriteDevice>(
    this as FavoriteDevice,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return FavoriteDeviceMapper.ensureInitialized().stringifyValue(
      this as FavoriteDevice,
    );
  }

  @override
  bool operator ==(Object other) {
    return FavoriteDeviceMapper.ensureInitialized().equalsValue(
      this as FavoriteDevice,
      other,
    );
  }

  @override
  int get hashCode {
    return FavoriteDeviceMapper.ensureInitialized().hashValue(
      this as FavoriteDevice,
    );
  }
}

extension FavoriteDeviceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FavoriteDevice, $Out> {
  FavoriteDeviceCopyWith<$R, FavoriteDevice, $Out> get $asFavoriteDevice =>
      $base.as((v, t, t2) => _FavoriteDeviceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FavoriteDeviceCopyWith<$R, $In extends FavoriteDevice, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? fingerprint,
    String? ip,
    int? port,
    String? alias,
    bool? customAlias,
  });
  FavoriteDeviceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FavoriteDeviceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FavoriteDevice, $Out>
    implements FavoriteDeviceCopyWith<$R, FavoriteDevice, $Out> {
  _FavoriteDeviceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FavoriteDevice> $mapper =
      FavoriteDeviceMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? fingerprint,
    String? ip,
    int? port,
    String? alias,
    bool? customAlias,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (fingerprint != null) #fingerprint: fingerprint,
      if (ip != null) #ip: ip,
      if (port != null) #port: port,
      if (alias != null) #alias: alias,
      if (customAlias != null) #customAlias: customAlias,
    }),
  );
  @override
  FavoriteDevice $make(CopyWithData data) => FavoriteDevice(
    id: data.get(#id, or: $value.id),
    fingerprint: data.get(#fingerprint, or: $value.fingerprint),
    ip: data.get(#ip, or: $value.ip),
    port: data.get(#port, or: $value.port),
    alias: data.get(#alias, or: $value.alias),
    customAlias: data.get(#customAlias, or: $value.customAlias),
  );

  @override
  FavoriteDeviceCopyWith<$R2, FavoriteDevice, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FavoriteDeviceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

