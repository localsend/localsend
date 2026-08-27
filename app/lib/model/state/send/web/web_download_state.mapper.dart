// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'web_download_state.dart';

class WebDownloadStateMapper extends ClassMapperBase<WebDownloadState> {
  WebDownloadStateMapper._();

  static WebDownloadStateMapper? _instance;
  static WebDownloadStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WebDownloadStateMapper._());
      WebDownloadSessionMapper.ensureInitialized();
      WebDownloadFileMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WebDownloadState';

  static Map<String, WebDownloadSession> _$sessions(WebDownloadState v) =>
      v.sessions;
  static const Field<WebDownloadState, Map<String, WebDownloadSession>>
  _f$sessions = Field('sessions', _$sessions);
  static Map<String, WebDownloadFile> _$files(WebDownloadState v) => v.files;
  static const Field<WebDownloadState, Map<String, WebDownloadFile>> _f$files =
      Field('files', _$files);
  static bool _$autoAccept(WebDownloadState v) => v.autoAccept;
  static const Field<WebDownloadState, bool> _f$autoAccept = Field(
    'autoAccept',
    _$autoAccept,
  );

  @override
  final MappableFields<WebDownloadState> fields = const {
    #sessions: _f$sessions,
    #files: _f$files,
    #autoAccept: _f$autoAccept,
  };

  static WebDownloadState _instantiate(DecodingData data) {
    return WebDownloadState(
      sessions: data.dec(_f$sessions),
      files: data.dec(_f$files),
      autoAccept: data.dec(_f$autoAccept),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WebDownloadState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WebDownloadState>(map);
  }

  static WebDownloadState deserialize(String json) {
    return ensureInitialized().decodeJson<WebDownloadState>(json);
  }
}

mixin WebDownloadStateMappable {
  String serialize() {
    return WebDownloadStateMapper.ensureInitialized()
        .encodeJson<WebDownloadState>(this as WebDownloadState);
  }

  Map<String, dynamic> toJson() {
    return WebDownloadStateMapper.ensureInitialized()
        .encodeMap<WebDownloadState>(this as WebDownloadState);
  }

  WebDownloadStateCopyWith<WebDownloadState, WebDownloadState, WebDownloadState>
  get copyWith =>
      _WebDownloadStateCopyWithImpl<WebDownloadState, WebDownloadState>(
        this as WebDownloadState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WebDownloadStateMapper.ensureInitialized().stringifyValue(
      this as WebDownloadState,
    );
  }

  @override
  bool operator ==(Object other) {
    return WebDownloadStateMapper.ensureInitialized().equalsValue(
      this as WebDownloadState,
      other,
    );
  }

  @override
  int get hashCode {
    return WebDownloadStateMapper.ensureInitialized().hashValue(
      this as WebDownloadState,
    );
  }
}

extension WebDownloadStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WebDownloadState, $Out> {
  WebDownloadStateCopyWith<$R, WebDownloadState, $Out>
  get $asWebDownloadState =>
      $base.as((v, t, t2) => _WebDownloadStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WebDownloadStateCopyWith<$R, $In extends WebDownloadState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<
    $R,
    String,
    WebDownloadSession,
    WebDownloadSessionCopyWith<$R, WebDownloadSession, WebDownloadSession>
  >
  get sessions;
  MapCopyWith<
    $R,
    String,
    WebDownloadFile,
    WebDownloadFileCopyWith<$R, WebDownloadFile, WebDownloadFile>
  >
  get files;
  $R call({
    Map<String, WebDownloadSession>? sessions,
    Map<String, WebDownloadFile>? files,
    bool? autoAccept,
  });
  WebDownloadStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WebDownloadStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WebDownloadState, $Out>
    implements WebDownloadStateCopyWith<$R, WebDownloadState, $Out> {
  _WebDownloadStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WebDownloadState> $mapper =
      WebDownloadStateMapper.ensureInitialized();
  @override
  MapCopyWith<
    $R,
    String,
    WebDownloadSession,
    WebDownloadSessionCopyWith<$R, WebDownloadSession, WebDownloadSession>
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
    WebDownloadFile,
    WebDownloadFileCopyWith<$R, WebDownloadFile, WebDownloadFile>
  >
  get files => MapCopyWith(
    $value.files,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(files: v),
  );
  @override
  $R call({
    Map<String, WebDownloadSession>? sessions,
    Map<String, WebDownloadFile>? files,
    bool? autoAccept,
  }) => $apply(
    FieldCopyWithData({
      if (sessions != null) #sessions: sessions,
      if (files != null) #files: files,
      if (autoAccept != null) #autoAccept: autoAccept,
    }),
  );
  @override
  WebDownloadState $make(CopyWithData data) => WebDownloadState(
    sessions: data.get(#sessions, or: $value.sessions),
    files: data.get(#files, or: $value.files),
    autoAccept: data.get(#autoAccept, or: $value.autoAccept),
  );

  @override
  WebDownloadStateCopyWith<$R2, WebDownloadState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WebDownloadStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

