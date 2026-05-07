// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'signaling_provider.dart';

class SignalingStateMapper extends ClassMapperBase<SignalingState> {
  SignalingStateMapper._();

  static SignalingStateMapper? _instance;
  static SignalingStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignalingStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SignalingState';

  static bool _$enabled(SignalingState v) => v.enabled;
  static const Field<SignalingState, bool> _f$enabled = Field(
    'enabled',
    _$enabled,
  );
  static String? _$roomSecret(SignalingState v) => v.roomSecret;
  static const Field<SignalingState, String> _f$roomSecret = Field(
    'roomSecret',
    _$roomSecret,
  );
  static List<String> _$signalingServers(SignalingState v) =>
      v.signalingServers;
  static const Field<SignalingState, List<String>> _f$signalingServers = Field(
    'signalingServers',
    _$signalingServers,
  );
  static List<IceServerConfig> _$iceServers(SignalingState v) => v.iceServers;
  static const Field<SignalingState, List<IceServerConfig>> _f$iceServers =
      Field('iceServers', _$iceServers);
  static Map<String, rust_webrtc.LsSignalingConnection> _$connections(
    SignalingState v,
  ) => v.connections;
  static const Field<
    SignalingState,
    Map<String, rust_webrtc.LsSignalingConnection>
  >
  _f$connections = Field('connections', _$connections);

  @override
  final MappableFields<SignalingState> fields = const {
    #enabled: _f$enabled,
    #roomSecret: _f$roomSecret,
    #signalingServers: _f$signalingServers,
    #iceServers: _f$iceServers,
    #connections: _f$connections,
  };

  static SignalingState _instantiate(DecodingData data) {
    return SignalingState(
      enabled: data.dec(_f$enabled),
      roomSecret: data.dec(_f$roomSecret),
      signalingServers: data.dec(_f$signalingServers),
      iceServers: data.dec(_f$iceServers),
      connections: data.dec(_f$connections),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SignalingState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignalingState>(map);
  }

  static SignalingState deserialize(String json) {
    return ensureInitialized().decodeJson<SignalingState>(json);
  }
}

mixin SignalingStateMappable {
  String serialize() {
    return SignalingStateMapper.ensureInitialized().encodeJson<SignalingState>(
      this as SignalingState,
    );
  }

  Map<String, dynamic> toJson() {
    return SignalingStateMapper.ensureInitialized().encodeMap<SignalingState>(
      this as SignalingState,
    );
  }

  SignalingStateCopyWith<SignalingState, SignalingState, SignalingState>
  get copyWith => _SignalingStateCopyWithImpl<SignalingState, SignalingState>(
    this as SignalingState,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return SignalingStateMapper.ensureInitialized().stringifyValue(
      this as SignalingState,
    );
  }

  @override
  bool operator ==(Object other) {
    return SignalingStateMapper.ensureInitialized().equalsValue(
      this as SignalingState,
      other,
    );
  }

  @override
  int get hashCode {
    return SignalingStateMapper.ensureInitialized().hashValue(
      this as SignalingState,
    );
  }
}

extension SignalingStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SignalingState, $Out> {
  SignalingStateCopyWith<$R, SignalingState, $Out> get $asSignalingState =>
      $base.as((v, t, t2) => _SignalingStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SignalingStateCopyWith<$R, $In extends SignalingState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get signalingServers;
  ListCopyWith<
    $R,
    IceServerConfig,
    ObjectCopyWith<$R, IceServerConfig, IceServerConfig>
  >
  get iceServers;
  MapCopyWith<
    $R,
    String,
    rust_webrtc.LsSignalingConnection,
    ObjectCopyWith<
      $R,
      rust_webrtc.LsSignalingConnection,
      rust_webrtc.LsSignalingConnection
    >
  >
  get connections;
  $R call({
    bool? enabled,
    String? roomSecret,
    List<String>? signalingServers,
    List<IceServerConfig>? iceServers,
    Map<String, rust_webrtc.LsSignalingConnection>? connections,
  });
  SignalingStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SignalingStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SignalingState, $Out>
    implements SignalingStateCopyWith<$R, SignalingState, $Out> {
  _SignalingStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SignalingState> $mapper =
      SignalingStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get signalingServers => ListCopyWith(
    $value.signalingServers,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(signalingServers: v),
  );
  @override
  ListCopyWith<
    $R,
    IceServerConfig,
    ObjectCopyWith<$R, IceServerConfig, IceServerConfig>
  >
  get iceServers => ListCopyWith(
    $value.iceServers,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(iceServers: v),
  );
  @override
  MapCopyWith<
    $R,
    String,
    rust_webrtc.LsSignalingConnection,
    ObjectCopyWith<
      $R,
      rust_webrtc.LsSignalingConnection,
      rust_webrtc.LsSignalingConnection
    >
  >
  get connections => MapCopyWith(
    $value.connections,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(connections: v),
  );
  @override
  $R call({
    bool? enabled,
    Object? roomSecret = $none,
    List<String>? signalingServers,
    List<IceServerConfig>? iceServers,
    Map<String, rust_webrtc.LsSignalingConnection>? connections,
  }) => $apply(
    FieldCopyWithData({
      if (enabled != null) #enabled: enabled,
      if (roomSecret != $none) #roomSecret: roomSecret,
      if (signalingServers != null) #signalingServers: signalingServers,
      if (iceServers != null) #iceServers: iceServers,
      if (connections != null) #connections: connections,
    }),
  );
  @override
  SignalingState $make(CopyWithData data) => SignalingState(
    enabled: data.get(#enabled, or: $value.enabled),
    roomSecret: data.get(#roomSecret, or: $value.roomSecret),
    signalingServers: data.get(#signalingServers, or: $value.signalingServers),
    iceServers: data.get(#iceServers, or: $value.iceServers),
    connections: data.get(#connections, or: $value.connections),
  );

  @override
  SignalingStateCopyWith<$R2, SignalingState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SignalingStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

