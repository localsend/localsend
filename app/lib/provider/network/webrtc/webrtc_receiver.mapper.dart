// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'webrtc_receiver.dart';

class WebRTCReceiveStateMapper extends ClassMapperBase<WebRTCReceiveState> {
  WebRTCReceiveStateMapper._();

  static WebRTCReceiveStateMapper? _instance;
  static WebRTCReceiveStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebRTCReceiveStateMapper._());
      ReceiveSessionStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WebRTCReceiveState';

  static LsSignalingConnection _$connection(WebRTCReceiveState v) =>
      v.connection;
  static const Field<WebRTCReceiveState, LsSignalingConnection> _f$connection =
      Field('connection', _$connection);
  static WsServerSdpMessage _$offer(WebRTCReceiveState v) => v.offer;
  static const Field<WebRTCReceiveState, WsServerSdpMessage> _f$offer = Field(
    'offer',
    _$offer,
  );
  static RTCStatus? _$status(WebRTCReceiveState v) => v.status;
  static const Field<WebRTCReceiveState, RTCStatus> _f$status = Field(
    'status',
    _$status,
  );
  static RtcReceiveController? _$controller(WebRTCReceiveState v) =>
      v.controller;
  static const Field<WebRTCReceiveState, RtcReceiveController> _f$controller =
      Field('controller', _$controller);
  static ReceiveSessionState? _$sessionState(WebRTCReceiveState v) =>
      v.sessionState;
  static const Field<WebRTCReceiveState, ReceiveSessionState> _f$sessionState =
      Field('sessionState', _$sessionState);

  @override
  final MappableFields<WebRTCReceiveState> fields = const {
    #connection: _f$connection,
    #offer: _f$offer,
    #status: _f$status,
    #controller: _f$controller,
    #sessionState: _f$sessionState,
  };

  static WebRTCReceiveState _instantiate(DecodingData data) {
    return WebRTCReceiveState(
      connection: data.dec(_f$connection),
      offer: data.dec(_f$offer),
      status: data.dec(_f$status),
      controller: data.dec(_f$controller),
      sessionState: data.dec(_f$sessionState),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WebRTCReceiveState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WebRTCReceiveState>(map);
  }

  static WebRTCReceiveState deserialize(String json) {
    return ensureInitialized().decodeJson<WebRTCReceiveState>(json);
  }
}

mixin WebRTCReceiveStateMappable {
  String serialize() {
    return WebRTCReceiveStateMapper.ensureInitialized()
        .encodeJson<WebRTCReceiveState>(this as WebRTCReceiveState);
  }

  Map<String, dynamic> toJson() {
    return WebRTCReceiveStateMapper.ensureInitialized()
        .encodeMap<WebRTCReceiveState>(this as WebRTCReceiveState);
  }

  WebRTCReceiveStateCopyWith<
    WebRTCReceiveState,
    WebRTCReceiveState,
    WebRTCReceiveState
  >
  get copyWith =>
      _WebRTCReceiveStateCopyWithImpl<WebRTCReceiveState, WebRTCReceiveState>(
        this as WebRTCReceiveState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WebRTCReceiveStateMapper.ensureInitialized().stringifyValue(
      this as WebRTCReceiveState,
    );
  }

  @override
  bool operator ==(Object other) {
    return WebRTCReceiveStateMapper.ensureInitialized().equalsValue(
      this as WebRTCReceiveState,
      other,
    );
  }

  @override
  int get hashCode {
    return WebRTCReceiveStateMapper.ensureInitialized().hashValue(
      this as WebRTCReceiveState,
    );
  }
}

extension WebRTCReceiveStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebRTCReceiveState, $Out> {
  WebRTCReceiveStateCopyWith<$R, WebRTCReceiveState, $Out>
  get $asWebRTCReceiveState => $base.as(
    (v, t, t2) => _WebRTCReceiveStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class WebRTCReceiveStateCopyWith<
  $R,
  $In extends WebRTCReceiveState,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ReceiveSessionStateCopyWith<$R, ReceiveSessionState, ReceiveSessionState>?
  get sessionState;
  $R call({
    LsSignalingConnection? connection,
    WsServerSdpMessage? offer,
    RTCStatus? status,
    RtcReceiveController? controller,
    ReceiveSessionState? sessionState,
  });
  WebRTCReceiveStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WebRTCReceiveStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebRTCReceiveState, $Out>
    implements WebRTCReceiveStateCopyWith<$R, WebRTCReceiveState, $Out> {
  _WebRTCReceiveStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebRTCReceiveState> $mapper =
      WebRTCReceiveStateMapper.ensureInitialized();
  @override
  ReceiveSessionStateCopyWith<$R, ReceiveSessionState, ReceiveSessionState>?
  get sessionState =>
      $value.sessionState?.copyWith.$chain((v) => call(sessionState: v));
  @override
  $R call({
    LsSignalingConnection? connection,
    WsServerSdpMessage? offer,
    Object? status = $none,
    Object? controller = $none,
    Object? sessionState = $none,
  }) => $apply(
    FieldCopyWithData({
      if (connection != null) #connection: connection,
      if (offer != null) #offer: offer,
      if (status != $none) #status: status,
      if (controller != $none) #controller: controller,
      if (sessionState != $none) #sessionState: sessionState,
    }),
  );
  @override
  WebRTCReceiveState $make(CopyWithData data) => WebRTCReceiveState(
    connection: data.get(#connection, or: $value.connection),
    offer: data.get(#offer, or: $value.offer),
    status: data.get(#status, or: $value.status),
    controller: data.get(#controller, or: $value.controller),
    sessionState: data.get(#sessionState, or: $value.sessionState),
  );

  @override
  WebRTCReceiveStateCopyWith<$R2, WebRTCReceiveState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WebRTCReceiveStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

