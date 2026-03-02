// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'web_send_state.dart';

class WebSendStateMapper extends ClassMapperBase<WebSendState> {
  WebSendStateMapper._();

  static WebSendStateMapper? _instance;
  static WebSendStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebSendStateMapper._());
      WebSendSessionMapper.ensureInitialized();
      WebSendFileMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WebSendState';

  static Map<String, WebSendSession> _$sessions(WebSendState v) => v.sessions;
  static const Field<WebSendState, Map<String, WebSendSession>> _f$sessions =
      Field('sessions', _$sessions);
  static Map<String, WebSendFile> _$files(WebSendState v) => v.files;
  static const Field<WebSendState, Map<String, WebSendFile>> _f$files = Field(
    'files',
    _$files,
  );
  static bool _$autoAccept(WebSendState v) => v.autoAccept;
  static const Field<WebSendState, bool> _f$autoAccept = Field(
    'autoAccept',
    _$autoAccept,
  );
  static String? _$pin(WebSendState v) => v.pin;
  static const Field<WebSendState, String> _f$pin = Field('pin', _$pin);
  static Map<String, int> _$pinAttempts(WebSendState v) => v.pinAttempts;
  static const Field<WebSendState, Map<String, int>> _f$pinAttempts = Field(
    'pinAttempts',
    _$pinAttempts,
  );

  @override
  final MappableFields<WebSendState> fields = const {
    #sessions: _f$sessions,
    #files: _f$files,
    #autoAccept: _f$autoAccept,
    #pin: _f$pin,
    #pinAttempts: _f$pinAttempts,
  };

  static WebSendState _instantiate(DecodingData data) {
    return WebSendState(
      sessions: data.dec(_f$sessions),
      files: data.dec(_f$files),
      autoAccept: data.dec(_f$autoAccept),
      pin: data.dec(_f$pin),
      pinAttempts: data.dec(_f$pinAttempts),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WebSendState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WebSendState>(map);
  }

  static WebSendState deserialize(String json) {
    return ensureInitialized().decodeJson<WebSendState>(json);
  }
}

mixin WebSendStateMappable {
  String serialize() {
    return WebSendStateMapper.ensureInitialized().encodeJson<WebSendState>(
      this as WebSendState,
    );
  }

  Map<String, dynamic> toJson() {
    return WebSendStateMapper.ensureInitialized().encodeMap<WebSendState>(
      this as WebSendState,
    );
  }

  WebSendStateCopyWith<WebSendState, WebSendState, WebSendState> get copyWith =>
      _WebSendStateCopyWithImpl<WebSendState, WebSendState>(
        this as WebSendState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WebSendStateMapper.ensureInitialized().stringifyValue(
      this as WebSendState,
    );
  }

  @override
  bool operator ==(Object other) {
    return WebSendStateMapper.ensureInitialized().equalsValue(
      this as WebSendState,
      other,
    );
  }

  @override
  int get hashCode {
    return WebSendStateMapper.ensureInitialized().hashValue(
      this as WebSendState,
    );
  }
}

extension WebSendStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebSendState, $Out> {
  WebSendStateCopyWith<$R, WebSendState, $Out> get $asWebSendState =>
      $base.as((v, t, t2) => _WebSendStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WebSendStateCopyWith<$R, $In extends WebSendState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<
    $R,
    String,
    WebSendSession,
    WebSendSessionCopyWith<$R, WebSendSession, WebSendSession>
  >
  get sessions;
  MapCopyWith<
    $R,
    String,
    WebSendFile,
    WebSendFileCopyWith<$R, WebSendFile, WebSendFile>
  >
  get files;
  MapCopyWith<$R, String, int, ObjectCopyWith<$R, int, int>> get pinAttempts;
  $R call({
    Map<String, WebSendSession>? sessions,
    Map<String, WebSendFile>? files,
    bool? autoAccept,
    String? pin,
    Map<String, int>? pinAttempts,
  });
  WebSendStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WebSendStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebSendState, $Out>
    implements WebSendStateCopyWith<$R, WebSendState, $Out> {
  _WebSendStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebSendState> $mapper =
      WebSendStateMapper.ensureInitialized();
  @override
  MapCopyWith<
    $R,
    String,
    WebSendSession,
    WebSendSessionCopyWith<$R, WebSendSession, WebSendSession>
  >
  get sessions => MapCopyWith(
    $value.sessions,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(sessions: v),
  );
  @override
  MapCopyWith<
    $R,
    String,
    WebSendFile,
    WebSendFileCopyWith<$R, WebSendFile, WebSendFile>
  >
  get files => MapCopyWith(
    $value.files,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(files: v),
  );
  @override
  MapCopyWith<$R, String, int, ObjectCopyWith<$R, int, int>> get pinAttempts =>
      MapCopyWith(
        $value.pinAttempts,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(pinAttempts: v),
      );
  @override
  $R call({
    Map<String, WebSendSession>? sessions,
    Map<String, WebSendFile>? files,
    bool? autoAccept,
    Object? pin = $none,
    Map<String, int>? pinAttempts,
  }) => $apply(
    FieldCopyWithData({
      if (sessions != null) #sessions: sessions,
      if (files != null) #files: files,
      if (autoAccept != null) #autoAccept: autoAccept,
      if (pin != $none) #pin: pin,
      if (pinAttempts != null) #pinAttempts: pinAttempts,
    }),
  );
  @override
  WebSendState $make(CopyWithData data) => WebSendState(
    sessions: data.get(#sessions, or: $value.sessions),
    files: data.get(#files, or: $value.files),
    autoAccept: data.get(#autoAccept, or: $value.autoAccept),
    pin: data.get(#pin, or: $value.pin),
    pinAttempts: data.get(#pinAttempts, or: $value.pinAttempts),
  );

  @override
  WebSendStateCopyWith<$R2, WebSendState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WebSendStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

