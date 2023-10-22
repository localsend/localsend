// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'network_state.dart';

class NetworkStateMapper extends ClassMapperBase<NetworkState> {
  NetworkStateMapper._();

  static NetworkStateMapper? _instance;
  static NetworkStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NetworkStateMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'NetworkState';

  static List<String> _$localIps(NetworkState v) => v.localIps;
  static const Field<NetworkState, List<String>> _f$localIps =
      Field('localIps', _$localIps);
  static bool _$initialized(NetworkState v) => v.initialized;
  static const Field<NetworkState, bool> _f$initialized =
      Field('initialized', _$initialized);

  @override
  final Map<Symbol, Field<NetworkState, dynamic>> fields = const {
    #localIps: _f$localIps,
    #initialized: _f$initialized,
  };

  static NetworkState _instantiate(DecodingData data) {
    return NetworkState(
        localIps: data.dec(_f$localIps), initialized: data.dec(_f$initialized));
  }

  @override
  final Function instantiate = _instantiate;

  static NetworkState fromJson(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<NetworkState>(map));
  }

  static NetworkState deserialize(String json) {
    return _guard((c) => c.fromJson<NetworkState>(json));
  }
}

mixin NetworkStateMappable {
  String serialize() {
    return NetworkStateMapper._guard((c) => c.toJson(this as NetworkState));
  }

  Map<String, dynamic> toJson() {
    return NetworkStateMapper._guard((c) => c.toMap(this as NetworkState));
  }

  NetworkStateCopyWith<NetworkState, NetworkState, NetworkState> get copyWith =>
      _NetworkStateCopyWithImpl(this as NetworkState, $identity, $identity);
  @override
  String toString() {
    return NetworkStateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NetworkStateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return NetworkStateMapper._guard((c) => c.hash(this));
  }
}

extension NetworkStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NetworkState, $Out> {
  NetworkStateCopyWith<$R, NetworkState, $Out> get $asNetworkState =>
      $base.as((v, t, t2) => _NetworkStateCopyWithImpl(v, t, t2));
}

abstract class NetworkStateCopyWith<$R, $In extends NetworkState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get localIps;
  $R call({List<String>? localIps, bool? initialized});
  NetworkStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NetworkStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NetworkState, $Out>
    implements NetworkStateCopyWith<$R, NetworkState, $Out> {
  _NetworkStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NetworkState> $mapper =
      NetworkStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get localIps =>
      ListCopyWith($value.localIps, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(localIps: v));
  @override
  $R call({List<String>? localIps, bool? initialized}) =>
      $apply(FieldCopyWithData({
        if (localIps != null) #localIps: localIps,
        if (initialized != null) #initialized: initialized
      }));
  @override
  NetworkState $make(CopyWithData data) => NetworkState(
      localIps: data.get(#localIps, or: $value.localIps),
      initialized: data.get(#initialized, or: $value.initialized));

  @override
  NetworkStateCopyWith<$R2, NetworkState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NetworkStateCopyWithImpl($value, $cast, t);
}
