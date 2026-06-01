// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'network_state.dart';

class NetworkStateMapper extends ClassMapperBase<NetworkState> {
  NetworkStateMapper._();

  static NetworkStateMapper? _instance;
  static NetworkStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NetworkStateMapper._());
      LocalInterfaceInfoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NetworkState';

  static List<LocalInterfaceInfo> _$localInterfaces(NetworkState v) =>
      v.localInterfaces;
  static const Field<NetworkState, List<LocalInterfaceInfo>>
  _f$localInterfaces = Field('localInterfaces', _$localInterfaces);
  static bool _$initialized(NetworkState v) => v.initialized;
  static const Field<NetworkState, bool> _f$initialized = Field(
    'initialized',
    _$initialized,
  );
  static List<String> _$localIps(NetworkState v) => v.localIps;
  static const Field<NetworkState, List<String>> _f$localIps = Field(
    'localIps',
    _$localIps,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<NetworkState> fields = const {
    #localInterfaces: _f$localInterfaces,
    #initialized: _f$initialized,
    #localIps: _f$localIps,
  };

  static NetworkState _instantiate(DecodingData data) {
    return NetworkState(
      localInterfaces: data.dec(_f$localInterfaces),
      initialized: data.dec(_f$initialized),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NetworkState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NetworkState>(map);
  }

  static NetworkState deserialize(String json) {
    return ensureInitialized().decodeJson<NetworkState>(json);
  }
}

mixin NetworkStateMappable {
  String serialize() {
    return NetworkStateMapper.ensureInitialized().encodeJson<NetworkState>(
      this as NetworkState,
    );
  }

  Map<String, dynamic> toJson() {
    return NetworkStateMapper.ensureInitialized().encodeMap<NetworkState>(
      this as NetworkState,
    );
  }

  NetworkStateCopyWith<NetworkState, NetworkState, NetworkState> get copyWith =>
      _NetworkStateCopyWithImpl<NetworkState, NetworkState>(
        this as NetworkState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return NetworkStateMapper.ensureInitialized().stringifyValue(
      this as NetworkState,
    );
  }

  @override
  bool operator ==(Object other) {
    return NetworkStateMapper.ensureInitialized().equalsValue(
      this as NetworkState,
      other,
    );
  }

  @override
  int get hashCode {
    return NetworkStateMapper.ensureInitialized().hashValue(
      this as NetworkState,
    );
  }
}

extension NetworkStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NetworkState, $Out> {
  NetworkStateCopyWith<$R, NetworkState, $Out> get $asNetworkState =>
      $base.as((v, t, t2) => _NetworkStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NetworkStateCopyWith<$R, $In extends NetworkState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    LocalInterfaceInfo,
    LocalInterfaceInfoCopyWith<$R, LocalInterfaceInfo, LocalInterfaceInfo>
  >
  get localInterfaces;
  $R call({List<LocalInterfaceInfo>? localInterfaces, bool? initialized});
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
  ListCopyWith<
    $R,
    LocalInterfaceInfo,
    LocalInterfaceInfoCopyWith<$R, LocalInterfaceInfo, LocalInterfaceInfo>
  >
  get localInterfaces => ListCopyWith(
    $value.localInterfaces,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(localInterfaces: v),
  );
  @override
  $R call({List<LocalInterfaceInfo>? localInterfaces, bool? initialized}) =>
      $apply(
        FieldCopyWithData({
          if (localInterfaces != null) #localInterfaces: localInterfaces,
          if (initialized != null) #initialized: initialized,
        }),
      );
  @override
  NetworkState $make(CopyWithData data) => NetworkState(
    localInterfaces: data.get(#localInterfaces, or: $value.localInterfaces),
    initialized: data.get(#initialized, or: $value.initialized),
  );

  @override
  NetworkStateCopyWith<$R2, NetworkState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NetworkStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

