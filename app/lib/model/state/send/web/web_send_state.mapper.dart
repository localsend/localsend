// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
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
  static const Field<WebSendState, Map<String, WebSendFile>> _f$files =
      Field('files', _$files);

  @override
  final Map<Symbol, Field<WebSendState, dynamic>> fields = const {
    #sessions: _f$sessions,
    #files: _f$files,
  };

  static WebSendState _instantiate(DecodingData data) {
    return WebSendState(
        sessions: data.dec(_f$sessions), files: data.dec(_f$files));
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
    return WebSendStateMapper.ensureInitialized()
        .encodeJson<WebSendState>(this as WebSendState);
  }

  Map<String, dynamic> toJson() {
    return WebSendStateMapper.ensureInitialized()
        .encodeMap<WebSendState>(this as WebSendState);
  }

  WebSendStateCopyWith<WebSendState, WebSendState, WebSendState> get copyWith =>
      _WebSendStateCopyWithImpl(this as WebSendState, $identity, $identity);
  @override
  String toString() {
    return WebSendStateMapper.ensureInitialized()
        .stringifyValue(this as WebSendState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WebSendStateMapper.ensureInitialized()
                .isValueEqual(this as WebSendState, other));
  }

  @override
  int get hashCode {
    return WebSendStateMapper.ensureInitialized()
        .hashValue(this as WebSendState);
  }
}

extension WebSendStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebSendState, $Out> {
  WebSendStateCopyWith<$R, WebSendState, $Out> get $asWebSendState =>
      $base.as((v, t, t2) => _WebSendStateCopyWithImpl(v, t, t2));
}

abstract class WebSendStateCopyWith<$R, $In extends WebSendState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, WebSendSession,
      WebSendSessionCopyWith<$R, WebSendSession, WebSendSession>> get sessions;
  MapCopyWith<$R, String, WebSendFile,
      WebSendFileCopyWith<$R, WebSendFile, WebSendFile>> get files;
  $R call(
      {Map<String, WebSendSession>? sessions, Map<String, WebSendFile>? files});
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
  MapCopyWith<$R, String, WebSendSession,
          WebSendSessionCopyWith<$R, WebSendSession, WebSendSession>>
      get sessions => MapCopyWith($value.sessions,
          (v, t) => v.copyWith.$chain(t), (v) => call(sessions: v));
  @override
  MapCopyWith<$R, String, WebSendFile,
          WebSendFileCopyWith<$R, WebSendFile, WebSendFile>>
      get files => MapCopyWith(
          $value.files, (v, t) => v.copyWith.$chain(t), (v) => call(files: v));
  @override
  $R call(
          {Map<String, WebSendSession>? sessions,
          Map<String, WebSendFile>? files}) =>
      $apply(FieldCopyWithData({
        if (sessions != null) #sessions: sessions,
        if (files != null) #files: files
      }));
  @override
  WebSendState $make(CopyWithData data) => WebSendState(
      sessions: data.get(#sessions, or: $value.sessions),
      files: data.get(#files, or: $value.files));

  @override
  WebSendStateCopyWith<$R2, WebSendState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WebSendStateCopyWithImpl($value, $cast, t);
}
