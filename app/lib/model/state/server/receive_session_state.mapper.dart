// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'receive_session_state.dart';

class ReceiveSessionStateMapper extends ClassMapperBase<ReceiveSessionState> {
  ReceiveSessionStateMapper._();

  static ReceiveSessionStateMapper? _instance;
  static ReceiveSessionStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReceiveSessionStateMapper._());
      DeviceMapper.ensureInitialized();
      ReceivingFileMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ReceiveSessionState';

  static String _$sessionId(ReceiveSessionState v) => v.sessionId;
  static const Field<ReceiveSessionState, String> _f$sessionId =
      Field('sessionId', _$sessionId);
  static SessionStatus _$status(ReceiveSessionState v) => v.status;
  static const Field<ReceiveSessionState, SessionStatus> _f$status =
      Field('status', _$status);
  static Device _$sender(ReceiveSessionState v) => v.sender;
  static const Field<ReceiveSessionState, Device> _f$sender =
      Field('sender', _$sender);
  static String _$senderAlias(ReceiveSessionState v) => v.senderAlias;
  static const Field<ReceiveSessionState, String> _f$senderAlias =
      Field('senderAlias', _$senderAlias);
  static Map<String, ReceivingFile> _$files(ReceiveSessionState v) => v.files;
  static const Field<ReceiveSessionState, Map<String, ReceivingFile>> _f$files =
      Field('files', _$files);
  static int? _$startTime(ReceiveSessionState v) => v.startTime;
  static const Field<ReceiveSessionState, int> _f$startTime =
      Field('startTime', _$startTime);
  static int? _$endTime(ReceiveSessionState v) => v.endTime;
  static const Field<ReceiveSessionState, int> _f$endTime =
      Field('endTime', _$endTime);
  static String _$destinationDirectory(ReceiveSessionState v) =>
      v.destinationDirectory;
  static const Field<ReceiveSessionState, String> _f$destinationDirectory =
      Field('destinationDirectory', _$destinationDirectory);
  static bool _$saveToGallery(ReceiveSessionState v) => v.saveToGallery;
  static const Field<ReceiveSessionState, bool> _f$saveToGallery =
      Field('saveToGallery', _$saveToGallery);
  static StreamController<Map<String, String>?>? _$responseHandler(
          ReceiveSessionState v) =>
      v.responseHandler;
  static const Field<ReceiveSessionState,
          StreamController<Map<String, String>?>> _f$responseHandler =
      Field('responseHandler', _$responseHandler);

  @override
  final Map<Symbol, Field<ReceiveSessionState, dynamic>> fields = const {
    #sessionId: _f$sessionId,
    #status: _f$status,
    #sender: _f$sender,
    #senderAlias: _f$senderAlias,
    #files: _f$files,
    #startTime: _f$startTime,
    #endTime: _f$endTime,
    #destinationDirectory: _f$destinationDirectory,
    #saveToGallery: _f$saveToGallery,
    #responseHandler: _f$responseHandler,
  };

  static ReceiveSessionState _instantiate(DecodingData data) {
    return ReceiveSessionState(
        sessionId: data.dec(_f$sessionId),
        status: data.dec(_f$status),
        sender: data.dec(_f$sender),
        senderAlias: data.dec(_f$senderAlias),
        files: data.dec(_f$files),
        startTime: data.dec(_f$startTime),
        endTime: data.dec(_f$endTime),
        destinationDirectory: data.dec(_f$destinationDirectory),
        saveToGallery: data.dec(_f$saveToGallery),
        responseHandler: data.dec(_f$responseHandler));
  }

  @override
  final Function instantiate = _instantiate;

  static ReceiveSessionState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReceiveSessionState>(map);
  }

  static ReceiveSessionState deserialize(String json) {
    return ensureInitialized().decodeJson<ReceiveSessionState>(json);
  }
}

mixin ReceiveSessionStateMappable {
  String serialize() {
    return ReceiveSessionStateMapper.ensureInitialized()
        .encodeJson<ReceiveSessionState>(this as ReceiveSessionState);
  }

  Map<String, dynamic> toJson() {
    return ReceiveSessionStateMapper.ensureInitialized()
        .encodeMap<ReceiveSessionState>(this as ReceiveSessionState);
  }

  ReceiveSessionStateCopyWith<ReceiveSessionState, ReceiveSessionState,
          ReceiveSessionState>
      get copyWith => _ReceiveSessionStateCopyWithImpl(
          this as ReceiveSessionState, $identity, $identity);
  @override
  String toString() {
    return ReceiveSessionStateMapper.ensureInitialized()
        .stringifyValue(this as ReceiveSessionState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ReceiveSessionStateMapper.ensureInitialized()
                .isValueEqual(this as ReceiveSessionState, other));
  }

  @override
  int get hashCode {
    return ReceiveSessionStateMapper.ensureInitialized()
        .hashValue(this as ReceiveSessionState);
  }
}

extension ReceiveSessionStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReceiveSessionState, $Out> {
  ReceiveSessionStateCopyWith<$R, ReceiveSessionState, $Out>
      get $asReceiveSessionState =>
          $base.as((v, t, t2) => _ReceiveSessionStateCopyWithImpl(v, t, t2));
}

abstract class ReceiveSessionStateCopyWith<$R, $In extends ReceiveSessionState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  DeviceCopyWith<$R, Device, Device> get sender;
  MapCopyWith<$R, String, ReceivingFile,
      ReceivingFileCopyWith<$R, ReceivingFile, ReceivingFile>> get files;
  $R call(
      {String? sessionId,
      SessionStatus? status,
      Device? sender,
      String? senderAlias,
      Map<String, ReceivingFile>? files,
      int? startTime,
      int? endTime,
      String? destinationDirectory,
      bool? saveToGallery,
      StreamController<Map<String, String>?>? responseHandler});
  ReceiveSessionStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ReceiveSessionStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReceiveSessionState, $Out>
    implements ReceiveSessionStateCopyWith<$R, ReceiveSessionState, $Out> {
  _ReceiveSessionStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReceiveSessionState> $mapper =
      ReceiveSessionStateMapper.ensureInitialized();
  @override
  DeviceCopyWith<$R, Device, Device> get sender =>
      $value.sender.copyWith.$chain((v) => call(sender: v));
  @override
  MapCopyWith<$R, String, ReceivingFile,
          ReceivingFileCopyWith<$R, ReceivingFile, ReceivingFile>>
      get files => MapCopyWith(
          $value.files, (v, t) => v.copyWith.$chain(t), (v) => call(files: v));
  @override
  $R call(
          {String? sessionId,
          SessionStatus? status,
          Device? sender,
          String? senderAlias,
          Map<String, ReceivingFile>? files,
          Object? startTime = $none,
          Object? endTime = $none,
          String? destinationDirectory,
          bool? saveToGallery,
          Object? responseHandler = $none}) =>
      $apply(FieldCopyWithData({
        if (sessionId != null) #sessionId: sessionId,
        if (status != null) #status: status,
        if (sender != null) #sender: sender,
        if (senderAlias != null) #senderAlias: senderAlias,
        if (files != null) #files: files,
        if (startTime != $none) #startTime: startTime,
        if (endTime != $none) #endTime: endTime,
        if (destinationDirectory != null)
          #destinationDirectory: destinationDirectory,
        if (saveToGallery != null) #saveToGallery: saveToGallery,
        if (responseHandler != $none) #responseHandler: responseHandler
      }));
  @override
  ReceiveSessionState $make(CopyWithData data) => ReceiveSessionState(
      sessionId: data.get(#sessionId, or: $value.sessionId),
      status: data.get(#status, or: $value.status),
      sender: data.get(#sender, or: $value.sender),
      senderAlias: data.get(#senderAlias, or: $value.senderAlias),
      files: data.get(#files, or: $value.files),
      startTime: data.get(#startTime, or: $value.startTime),
      endTime: data.get(#endTime, or: $value.endTime),
      destinationDirectory:
          data.get(#destinationDirectory, or: $value.destinationDirectory),
      saveToGallery: data.get(#saveToGallery, or: $value.saveToGallery),
      responseHandler: data.get(#responseHandler, or: $value.responseHandler));

  @override
  ReceiveSessionStateCopyWith<$R2, ReceiveSessionState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ReceiveSessionStateCopyWithImpl($value, $cast, t);
}
