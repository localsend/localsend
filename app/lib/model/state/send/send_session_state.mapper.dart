// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'send_session_state.dart';

class SendSessionStateMapper extends ClassMapperBase<SendSessionState> {
  SendSessionStateMapper._();

  static SendSessionStateMapper? _instance;
  static SendSessionStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SendSessionStateMapper._());
      DeviceMapper.ensureInitialized();
      SendingFileMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SendSessionState';

  static String _$sessionId(SendSessionState v) => v.sessionId;
  static const Field<SendSessionState, String> _f$sessionId = Field(
    'sessionId',
    _$sessionId,
  );
  static String? _$remoteSessionId(SendSessionState v) => v.remoteSessionId;
  static const Field<SendSessionState, String> _f$remoteSessionId = Field(
    'remoteSessionId',
    _$remoteSessionId,
  );
  static bool _$background(SendSessionState v) => v.background;
  static const Field<SendSessionState, bool> _f$background = Field(
    'background',
    _$background,
  );
  static SessionStatus _$status(SendSessionState v) => v.status;
  static const Field<SendSessionState, SessionStatus> _f$status = Field(
    'status',
    _$status,
  );
  static Device _$target(SendSessionState v) => v.target;
  static const Field<SendSessionState, Device> _f$target = Field(
    'target',
    _$target,
  );
  static Map<String, SendingFile> _$files(SendSessionState v) => v.files;
  static const Field<SendSessionState, Map<String, SendingFile>> _f$files =
      Field('files', _$files);
  static int? _$startTime(SendSessionState v) => v.startTime;
  static const Field<SendSessionState, int> _f$startTime = Field(
    'startTime',
    _$startTime,
  );
  static int? _$endTime(SendSessionState v) => v.endTime;
  static const Field<SendSessionState, int> _f$endTime = Field(
    'endTime',
    _$endTime,
  );
  static List<SendingTask>? _$sendingTasks(SendSessionState v) =>
      v.sendingTasks;
  static const Field<SendSessionState, List<SendingTask>> _f$sendingTasks =
      Field('sendingTasks', _$sendingTasks);
  static String? _$errorMessage(SendSessionState v) => v.errorMessage;
  static const Field<SendSessionState, String> _f$errorMessage = Field(
    'errorMessage',
    _$errorMessage,
  );

  @override
  final MappableFields<SendSessionState> fields = const {
    #sessionId: _f$sessionId,
    #remoteSessionId: _f$remoteSessionId,
    #background: _f$background,
    #status: _f$status,
    #target: _f$target,
    #files: _f$files,
    #startTime: _f$startTime,
    #endTime: _f$endTime,
    #sendingTasks: _f$sendingTasks,
    #errorMessage: _f$errorMessage,
  };

  static SendSessionState _instantiate(DecodingData data) {
    return SendSessionState(
      sessionId: data.dec(_f$sessionId),
      remoteSessionId: data.dec(_f$remoteSessionId),
      background: data.dec(_f$background),
      status: data.dec(_f$status),
      target: data.dec(_f$target),
      files: data.dec(_f$files),
      startTime: data.dec(_f$startTime),
      endTime: data.dec(_f$endTime),
      sendingTasks: data.dec(_f$sendingTasks),
      errorMessage: data.dec(_f$errorMessage),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SendSessionState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SendSessionState>(map);
  }

  static SendSessionState deserialize(String json) {
    return ensureInitialized().decodeJson<SendSessionState>(json);
  }
}

mixin SendSessionStateMappable {
  String serialize() {
    return SendSessionStateMapper.ensureInitialized()
        .encodeJson<SendSessionState>(this as SendSessionState);
  }

  Map<String, dynamic> toJson() {
    return SendSessionStateMapper.ensureInitialized()
        .encodeMap<SendSessionState>(this as SendSessionState);
  }

  SendSessionStateCopyWith<SendSessionState, SendSessionState, SendSessionState>
  get copyWith =>
      _SendSessionStateCopyWithImpl<SendSessionState, SendSessionState>(
        this as SendSessionState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SendSessionStateMapper.ensureInitialized().stringifyValue(
      this as SendSessionState,
    );
  }

  @override
  bool operator ==(Object other) {
    return SendSessionStateMapper.ensureInitialized().equalsValue(
      this as SendSessionState,
      other,
    );
  }

  @override
  int get hashCode {
    return SendSessionStateMapper.ensureInitialized().hashValue(
      this as SendSessionState,
    );
  }
}

extension SendSessionStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SendSessionState, $Out> {
  SendSessionStateCopyWith<$R, SendSessionState, $Out>
  get $asSendSessionState =>
      $base.as((v, t, t2) => _SendSessionStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SendSessionStateCopyWith<$R, $In extends SendSessionState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  DeviceCopyWith<$R, Device, Device> get target;
  MapCopyWith<
    $R,
    String,
    SendingFile,
    SendingFileCopyWith<$R, SendingFile, SendingFile>
  >
  get files;
  ListCopyWith<$R, SendingTask, ObjectCopyWith<$R, SendingTask, SendingTask>>?
  get sendingTasks;
  $R call({
    String? sessionId,
    String? remoteSessionId,
    bool? background,
    SessionStatus? status,
    Device? target,
    Map<String, SendingFile>? files,
    int? startTime,
    int? endTime,
    List<SendingTask>? sendingTasks,
    String? errorMessage,
  });
  SendSessionStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SendSessionStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SendSessionState, $Out>
    implements SendSessionStateCopyWith<$R, SendSessionState, $Out> {
  _SendSessionStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SendSessionState> $mapper =
      SendSessionStateMapper.ensureInitialized();
  @override
  DeviceCopyWith<$R, Device, Device> get target =>
      $value.target.copyWith.$chain((v) => call(target: v));
  @override
  MapCopyWith<
    $R,
    String,
    SendingFile,
    SendingFileCopyWith<$R, SendingFile, SendingFile>
  >
  get files => MapCopyWith(
    $value.files,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(files: v),
  );
  @override
  ListCopyWith<$R, SendingTask, ObjectCopyWith<$R, SendingTask, SendingTask>>?
  get sendingTasks => $value.sendingTasks != null
      ? ListCopyWith(
          $value.sendingTasks!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(sendingTasks: v),
        )
      : null;
  @override
  $R call({
    String? sessionId,
    Object? remoteSessionId = $none,
    bool? background,
    SessionStatus? status,
    Device? target,
    Map<String, SendingFile>? files,
    Object? startTime = $none,
    Object? endTime = $none,
    Object? sendingTasks = $none,
    Object? errorMessage = $none,
  }) => $apply(
    FieldCopyWithData({
      if (sessionId != null) #sessionId: sessionId,
      if (remoteSessionId != $none) #remoteSessionId: remoteSessionId,
      if (background != null) #background: background,
      if (status != null) #status: status,
      if (target != null) #target: target,
      if (files != null) #files: files,
      if (startTime != $none) #startTime: startTime,
      if (endTime != $none) #endTime: endTime,
      if (sendingTasks != $none) #sendingTasks: sendingTasks,
      if (errorMessage != $none) #errorMessage: errorMessage,
    }),
  );
  @override
  SendSessionState $make(CopyWithData data) => SendSessionState(
    sessionId: data.get(#sessionId, or: $value.sessionId),
    remoteSessionId: data.get(#remoteSessionId, or: $value.remoteSessionId),
    background: data.get(#background, or: $value.background),
    status: data.get(#status, or: $value.status),
    target: data.get(#target, or: $value.target),
    files: data.get(#files, or: $value.files),
    startTime: data.get(#startTime, or: $value.startTime),
    endTime: data.get(#endTime, or: $value.endTime),
    sendingTasks: data.get(#sendingTasks, or: $value.sendingTasks),
    errorMessage: data.get(#errorMessage, or: $value.errorMessage),
  );

  @override
  SendSessionStateCopyWith<$R2, SendSessionState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SendSessionStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

