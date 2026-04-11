// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'web_send_session.dart';

class WebSendSessionMapper extends ClassMapperBase<WebSendSession> {
  WebSendSessionMapper._();

  static WebSendSessionMapper? _instance;
  static WebSendSessionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebSendSessionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WebSendSession';

  static String _$sessionId(WebSendSession v) => v.sessionId;
  static const Field<WebSendSession, String> _f$sessionId = Field(
    'sessionId',
    _$sessionId,
  );
  static StreamController<bool>? _$responseHandler(WebSendSession v) =>
      v.responseHandler;
  static const Field<WebSendSession, StreamController<bool>>
  _f$responseHandler = Field('responseHandler', _$responseHandler);
  static String _$ip(WebSendSession v) => v.ip;
  static const Field<WebSendSession, String> _f$ip = Field('ip', _$ip);
  static String _$deviceInfo(WebSendSession v) => v.deviceInfo;
  static const Field<WebSendSession, String> _f$deviceInfo = Field(
    'deviceInfo',
    _$deviceInfo,
  );

  @override
  final MappableFields<WebSendSession> fields = const {
    #sessionId: _f$sessionId,
    #responseHandler: _f$responseHandler,
    #ip: _f$ip,
    #deviceInfo: _f$deviceInfo,
  };

  static WebSendSession _instantiate(DecodingData data) {
    return WebSendSession(
      sessionId: data.dec(_f$sessionId),
      responseHandler: data.dec(_f$responseHandler),
      ip: data.dec(_f$ip),
      deviceInfo: data.dec(_f$deviceInfo),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WebSendSession fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WebSendSession>(map);
  }

  static WebSendSession deserialize(String json) {
    return ensureInitialized().decodeJson<WebSendSession>(json);
  }
}

mixin WebSendSessionMappable {
  String serialize() {
    return WebSendSessionMapper.ensureInitialized().encodeJson<WebSendSession>(
      this as WebSendSession,
    );
  }

  Map<String, dynamic> toJson() {
    return WebSendSessionMapper.ensureInitialized().encodeMap<WebSendSession>(
      this as WebSendSession,
    );
  }

  WebSendSessionCopyWith<WebSendSession, WebSendSession, WebSendSession>
  get copyWith => _WebSendSessionCopyWithImpl<WebSendSession, WebSendSession>(
    this as WebSendSession,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return WebSendSessionMapper.ensureInitialized().stringifyValue(
      this as WebSendSession,
    );
  }

  @override
  bool operator ==(Object other) {
    return WebSendSessionMapper.ensureInitialized().equalsValue(
      this as WebSendSession,
      other,
    );
  }

  @override
  int get hashCode {
    return WebSendSessionMapper.ensureInitialized().hashValue(
      this as WebSendSession,
    );
  }
}

extension WebSendSessionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebSendSession, $Out> {
  WebSendSessionCopyWith<$R, WebSendSession, $Out> get $asWebSendSession =>
      $base.as((v, t, t2) => _WebSendSessionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WebSendSessionCopyWith<$R, $In extends WebSendSession, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? sessionId,
    StreamController<bool>? responseHandler,
    String? ip,
    String? deviceInfo,
  });
  WebSendSessionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WebSendSessionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebSendSession, $Out>
    implements WebSendSessionCopyWith<$R, WebSendSession, $Out> {
  _WebSendSessionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebSendSession> $mapper =
      WebSendSessionMapper.ensureInitialized();
  @override
  $R call({
    String? sessionId,
    Object? responseHandler = $none,
    String? ip,
    String? deviceInfo,
  }) => $apply(
    FieldCopyWithData({
      if (sessionId != null) #sessionId: sessionId,
      if (responseHandler != $none) #responseHandler: responseHandler,
      if (ip != null) #ip: ip,
      if (deviceInfo != null) #deviceInfo: deviceInfo,
    }),
  );
  @override
  WebSendSession $make(CopyWithData data) => WebSendSession(
    sessionId: data.get(#sessionId, or: $value.sessionId),
    responseHandler: data.get(#responseHandler, or: $value.responseHandler),
    ip: data.get(#ip, or: $value.ip),
    deviceInfo: data.get(#deviceInfo, or: $value.deviceInfo),
  );

  @override
  WebSendSessionCopyWith<$R2, WebSendSession, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WebSendSessionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

