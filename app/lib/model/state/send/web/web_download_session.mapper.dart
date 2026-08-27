// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'web_download_session.dart';

class WebDownloadSessionMapper extends ClassMapperBase<WebDownloadSession> {
  WebDownloadSessionMapper._();

  static WebDownloadSessionMapper? _instance;
  static WebDownloadSessionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebDownloadSessionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WebDownloadSession';

  static String _$sessionId(WebDownloadSession v) => v.sessionId;
  static const Field<WebDownloadSession, String> _f$sessionId = Field(
    'sessionId',
    _$sessionId,
  );
  static bool _$pending(WebDownloadSession v) => v.pending;
  static const Field<WebDownloadSession, bool> _f$pending = Field(
    'pending',
    _$pending,
  );
  static String _$ip(WebDownloadSession v) => v.ip;
  static const Field<WebDownloadSession, String> _f$ip = Field('ip', _$ip);
  static String _$deviceInfo(WebDownloadSession v) => v.deviceInfo;
  static const Field<WebDownloadSession, String> _f$deviceInfo = Field(
    'deviceInfo',
    _$deviceInfo,
  );

  @override
  final MappableFields<WebDownloadSession> fields = const {
    #sessionId: _f$sessionId,
    #pending: _f$pending,
    #ip: _f$ip,
    #deviceInfo: _f$deviceInfo,
  };

  static WebDownloadSession _instantiate(DecodingData data) {
    return WebDownloadSession(
      sessionId: data.dec(_f$sessionId),
      pending: data.dec(_f$pending),
      ip: data.dec(_f$ip),
      deviceInfo: data.dec(_f$deviceInfo),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WebDownloadSession fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WebDownloadSession>(map);
  }

  static WebDownloadSession deserialize(String json) {
    return ensureInitialized().decodeJson<WebDownloadSession>(json);
  }
}

mixin WebDownloadSessionMappable {
  String serialize() {
    return WebDownloadSessionMapper.ensureInitialized()
        .encodeJson<WebDownloadSession>(this as WebDownloadSession);
  }

  Map<String, dynamic> toJson() {
    return WebDownloadSessionMapper.ensureInitialized()
        .encodeMap<WebDownloadSession>(this as WebDownloadSession);
  }

  WebDownloadSessionCopyWith<
    WebDownloadSession,
    WebDownloadSession,
    WebDownloadSession
  >
  get copyWith =>
      _WebDownloadSessionCopyWithImpl<WebDownloadSession, WebDownloadSession>(
        this as WebDownloadSession,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WebDownloadSessionMapper.ensureInitialized().stringifyValue(
      this as WebDownloadSession,
    );
  }

  @override
  bool operator ==(Object other) {
    return WebDownloadSessionMapper.ensureInitialized().equalsValue(
      this as WebDownloadSession,
      other,
    );
  }

  @override
  int get hashCode {
    return WebDownloadSessionMapper.ensureInitialized().hashValue(
      this as WebDownloadSession,
    );
  }
}

extension WebDownloadSessionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebDownloadSession, $Out> {
  WebDownloadSessionCopyWith<$R, WebDownloadSession, $Out>
  get $asWebDownloadSession => $base.as(
    (v, t, t2) => _WebDownloadSessionCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class WebDownloadSessionCopyWith<
  $R,
  $In extends WebDownloadSession,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? sessionId, bool? pending, String? ip, String? deviceInfo});
  WebDownloadSessionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WebDownloadSessionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebDownloadSession, $Out>
    implements WebDownloadSessionCopyWith<$R, WebDownloadSession, $Out> {
  _WebDownloadSessionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebDownloadSession> $mapper =
      WebDownloadSessionMapper.ensureInitialized();
  @override
  $R call({String? sessionId, bool? pending, String? ip, String? deviceInfo}) =>
      $apply(
        FieldCopyWithData({
          if (sessionId != null) #sessionId: sessionId,
          if (pending != null) #pending: pending,
          if (ip != null) #ip: ip,
          if (deviceInfo != null) #deviceInfo: deviceInfo,
        }),
      );
  @override
  WebDownloadSession $make(CopyWithData data) => WebDownloadSession(
    sessionId: data.get(#sessionId, or: $value.sessionId),
    pending: data.get(#pending, or: $value.pending),
    ip: data.get(#ip, or: $value.ip),
    deviceInfo: data.get(#deviceInfo, or: $value.deviceInfo),
  );

  @override
  WebDownloadSessionCopyWith<$R2, WebDownloadSession, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WebDownloadSessionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

