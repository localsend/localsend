// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tailnet_peer.dart';

class TailnetPeerMapper extends ClassMapperBase<TailnetPeer> {
  TailnetPeerMapper._();

  static TailnetPeerMapper? _instance;
  static TailnetPeerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TailnetPeerMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TailnetPeer';

  static String _$fingerprint(TailnetPeer v) => v.fingerprint;
  static const Field<TailnetPeer, String> _f$fingerprint = Field(
    'fingerprint',
    _$fingerprint,
  );
  static String _$alias(TailnetPeer v) => v.alias;
  static const Field<TailnetPeer, String> _f$alias = Field('alias', _$alias);
  static String _$ip(TailnetPeer v) => v.ip;
  static const Field<TailnetPeer, String> _f$ip = Field('ip', _$ip);
  static int _$port(TailnetPeer v) => v.port;
  static const Field<TailnetPeer, int> _f$port = Field('port', _$port);

  @override
  final MappableFields<TailnetPeer> fields = const {
    #fingerprint: _f$fingerprint,
    #alias: _f$alias,
    #ip: _f$ip,
    #port: _f$port,
  };

  static TailnetPeer _instantiate(DecodingData data) {
    return TailnetPeer(
      fingerprint: data.dec(_f$fingerprint),
      alias: data.dec(_f$alias),
      ip: data.dec(_f$ip),
      port: data.dec(_f$port),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TailnetPeer fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TailnetPeer>(map);
  }

  static TailnetPeer deserialize(String json) {
    return ensureInitialized().decodeJson<TailnetPeer>(json);
  }
}

mixin TailnetPeerMappable {
  String serialize() {
    return TailnetPeerMapper.ensureInitialized().encodeJson<TailnetPeer>(
      this as TailnetPeer,
    );
  }

  Map<String, dynamic> toJson() {
    return TailnetPeerMapper.ensureInitialized().encodeMap<TailnetPeer>(
      this as TailnetPeer,
    );
  }

  TailnetPeerCopyWith<TailnetPeer, TailnetPeer, TailnetPeer> get copyWith =>
      _TailnetPeerCopyWithImpl<TailnetPeer, TailnetPeer>(
        this as TailnetPeer,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TailnetPeerMapper.ensureInitialized().stringifyValue(
      this as TailnetPeer,
    );
  }

  @override
  bool operator ==(Object other) {
    return TailnetPeerMapper.ensureInitialized().equalsValue(
      this as TailnetPeer,
      other,
    );
  }

  @override
  int get hashCode {
    return TailnetPeerMapper.ensureInitialized().hashValue(this as TailnetPeer);
  }
}

extension TailnetPeerValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TailnetPeer, $Out> {
  TailnetPeerCopyWith<$R, TailnetPeer, $Out> get $asTailnetPeer =>
      $base.as((v, t, t2) => _TailnetPeerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TailnetPeerCopyWith<$R, $In extends TailnetPeer, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? fingerprint, String? alias, String? ip, int? port});
  TailnetPeerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TailnetPeerCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TailnetPeer, $Out>
    implements TailnetPeerCopyWith<$R, TailnetPeer, $Out> {
  _TailnetPeerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TailnetPeer> $mapper =
      TailnetPeerMapper.ensureInitialized();
  @override
  $R call({String? fingerprint, String? alias, String? ip, int? port}) =>
      $apply(
        FieldCopyWithData({
          if (fingerprint != null) #fingerprint: fingerprint,
          if (alias != null) #alias: alias,
          if (ip != null) #ip: ip,
          if (port != null) #port: port,
        }),
      );
  @override
  TailnetPeer $make(CopyWithData data) => TailnetPeer(
    fingerprint: data.get(#fingerprint, or: $value.fingerprint),
    alias: data.get(#alias, or: $value.alias),
    ip: data.get(#ip, or: $value.ip),
    port: data.get(#port, or: $value.port),
  );

  @override
  TailnetPeerCopyWith<$R2, TailnetPeer, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TailnetPeerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

