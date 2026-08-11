// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RsServerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsServerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RsServerEvent()';
}


}

/// @nodoc
class $RsServerEventCopyWith<$Res>  {
$RsServerEventCopyWith(RsServerEvent _, $Res Function(RsServerEvent) __);
}


/// Adds pattern-matching-related methods to [RsServerEvent].
extension RsServerEventPatterns on RsServerEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RsServerEvent_Register value)?  register,TResult Function( RsServerEvent_PrepareUpload value)?  prepareUpload,TResult Function( RsServerEvent_FileUpload value)?  fileUpload,TResult Function( RsServerEvent_SessionEnd value)?  sessionEnd,TResult Function( RsServerEvent_PrepareUploadAborted value)?  prepareUploadAborted,TResult Function( RsServerEvent_CancelReceived value)?  cancelReceived,TResult Function( RsServerEvent_WebPrepareDownload value)?  webPrepareDownload,TResult Function( RsServerEvent_WebFileDownload value)?  webFileDownload,TResult Function( RsServerEvent_Show value)?  show_,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RsServerEvent_Register() when register != null:
return register(_that);case RsServerEvent_PrepareUpload() when prepareUpload != null:
return prepareUpload(_that);case RsServerEvent_FileUpload() when fileUpload != null:
return fileUpload(_that);case RsServerEvent_SessionEnd() when sessionEnd != null:
return sessionEnd(_that);case RsServerEvent_PrepareUploadAborted() when prepareUploadAborted != null:
return prepareUploadAborted(_that);case RsServerEvent_CancelReceived() when cancelReceived != null:
return cancelReceived(_that);case RsServerEvent_WebPrepareDownload() when webPrepareDownload != null:
return webPrepareDownload(_that);case RsServerEvent_WebFileDownload() when webFileDownload != null:
return webFileDownload(_that);case RsServerEvent_Show() when show_ != null:
return show_(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RsServerEvent_Register value)  register,required TResult Function( RsServerEvent_PrepareUpload value)  prepareUpload,required TResult Function( RsServerEvent_FileUpload value)  fileUpload,required TResult Function( RsServerEvent_SessionEnd value)  sessionEnd,required TResult Function( RsServerEvent_PrepareUploadAborted value)  prepareUploadAborted,required TResult Function( RsServerEvent_CancelReceived value)  cancelReceived,required TResult Function( RsServerEvent_WebPrepareDownload value)  webPrepareDownload,required TResult Function( RsServerEvent_WebFileDownload value)  webFileDownload,required TResult Function( RsServerEvent_Show value)  show_,}){
final _that = this;
switch (_that) {
case RsServerEvent_Register():
return register(_that);case RsServerEvent_PrepareUpload():
return prepareUpload(_that);case RsServerEvent_FileUpload():
return fileUpload(_that);case RsServerEvent_SessionEnd():
return sessionEnd(_that);case RsServerEvent_PrepareUploadAborted():
return prepareUploadAborted(_that);case RsServerEvent_CancelReceived():
return cancelReceived(_that);case RsServerEvent_WebPrepareDownload():
return webPrepareDownload(_that);case RsServerEvent_WebFileDownload():
return webFileDownload(_that);case RsServerEvent_Show():
return show_(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RsServerEvent_Register value)?  register,TResult? Function( RsServerEvent_PrepareUpload value)?  prepareUpload,TResult? Function( RsServerEvent_FileUpload value)?  fileUpload,TResult? Function( RsServerEvent_SessionEnd value)?  sessionEnd,TResult? Function( RsServerEvent_PrepareUploadAborted value)?  prepareUploadAborted,TResult? Function( RsServerEvent_CancelReceived value)?  cancelReceived,TResult? Function( RsServerEvent_WebPrepareDownload value)?  webPrepareDownload,TResult? Function( RsServerEvent_WebFileDownload value)?  webFileDownload,TResult? Function( RsServerEvent_Show value)?  show_,}){
final _that = this;
switch (_that) {
case RsServerEvent_Register() when register != null:
return register(_that);case RsServerEvent_PrepareUpload() when prepareUpload != null:
return prepareUpload(_that);case RsServerEvent_FileUpload() when fileUpload != null:
return fileUpload(_that);case RsServerEvent_SessionEnd() when sessionEnd != null:
return sessionEnd(_that);case RsServerEvent_PrepareUploadAborted() when prepareUploadAborted != null:
return prepareUploadAborted(_that);case RsServerEvent_CancelReceived() when cancelReceived != null:
return cancelReceived(_that);case RsServerEvent_WebPrepareDownload() when webPrepareDownload != null:
return webPrepareDownload(_that);case RsServerEvent_WebFileDownload() when webFileDownload != null:
return webFileDownload(_that);case RsServerEvent_Show() when show_ != null:
return show_(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String ip,  RegisterDtoV2 info)?  register,TResult Function( String sessionId,  String ip,  RegisterDtoV2 info,  String? certFingerprint,  Map<String, FileDto> files)?  prepareUpload,TResult Function( String sessionId,  String fileId,  FileDto file)?  fileUpload,TResult Function( String sessionId,  SessionEndReasonV2 reason)?  sessionEnd,TResult Function( String sessionId)?  prepareUploadAborted,TResult Function( String ip,  String sessionId)?  cancelReceived,TResult Function( String ip,  String sessionId,  String? userAgent)?  webPrepareDownload,TResult Function( String sessionId,  String fileId,  FileDto file)?  webFileDownload,TResult Function( List<String> args)?  show_,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RsServerEvent_Register() when register != null:
return register(_that.ip,_that.info);case RsServerEvent_PrepareUpload() when prepareUpload != null:
return prepareUpload(_that.sessionId,_that.ip,_that.info,_that.certFingerprint,_that.files);case RsServerEvent_FileUpload() when fileUpload != null:
return fileUpload(_that.sessionId,_that.fileId,_that.file);case RsServerEvent_SessionEnd() when sessionEnd != null:
return sessionEnd(_that.sessionId,_that.reason);case RsServerEvent_PrepareUploadAborted() when prepareUploadAborted != null:
return prepareUploadAborted(_that.sessionId);case RsServerEvent_CancelReceived() when cancelReceived != null:
return cancelReceived(_that.ip,_that.sessionId);case RsServerEvent_WebPrepareDownload() when webPrepareDownload != null:
return webPrepareDownload(_that.ip,_that.sessionId,_that.userAgent);case RsServerEvent_WebFileDownload() when webFileDownload != null:
return webFileDownload(_that.sessionId,_that.fileId,_that.file);case RsServerEvent_Show() when show_ != null:
return show_(_that.args);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String ip,  RegisterDtoV2 info)  register,required TResult Function( String sessionId,  String ip,  RegisterDtoV2 info,  String? certFingerprint,  Map<String, FileDto> files)  prepareUpload,required TResult Function( String sessionId,  String fileId,  FileDto file)  fileUpload,required TResult Function( String sessionId,  SessionEndReasonV2 reason)  sessionEnd,required TResult Function( String sessionId)  prepareUploadAborted,required TResult Function( String ip,  String sessionId)  cancelReceived,required TResult Function( String ip,  String sessionId,  String? userAgent)  webPrepareDownload,required TResult Function( String sessionId,  String fileId,  FileDto file)  webFileDownload,required TResult Function( List<String> args)  show_,}) {final _that = this;
switch (_that) {
case RsServerEvent_Register():
return register(_that.ip,_that.info);case RsServerEvent_PrepareUpload():
return prepareUpload(_that.sessionId,_that.ip,_that.info,_that.certFingerprint,_that.files);case RsServerEvent_FileUpload():
return fileUpload(_that.sessionId,_that.fileId,_that.file);case RsServerEvent_SessionEnd():
return sessionEnd(_that.sessionId,_that.reason);case RsServerEvent_PrepareUploadAborted():
return prepareUploadAborted(_that.sessionId);case RsServerEvent_CancelReceived():
return cancelReceived(_that.ip,_that.sessionId);case RsServerEvent_WebPrepareDownload():
return webPrepareDownload(_that.ip,_that.sessionId,_that.userAgent);case RsServerEvent_WebFileDownload():
return webFileDownload(_that.sessionId,_that.fileId,_that.file);case RsServerEvent_Show():
return show_(_that.args);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String ip,  RegisterDtoV2 info)?  register,TResult? Function( String sessionId,  String ip,  RegisterDtoV2 info,  String? certFingerprint,  Map<String, FileDto> files)?  prepareUpload,TResult? Function( String sessionId,  String fileId,  FileDto file)?  fileUpload,TResult? Function( String sessionId,  SessionEndReasonV2 reason)?  sessionEnd,TResult? Function( String sessionId)?  prepareUploadAborted,TResult? Function( String ip,  String sessionId)?  cancelReceived,TResult? Function( String ip,  String sessionId,  String? userAgent)?  webPrepareDownload,TResult? Function( String sessionId,  String fileId,  FileDto file)?  webFileDownload,TResult? Function( List<String> args)?  show_,}) {final _that = this;
switch (_that) {
case RsServerEvent_Register() when register != null:
return register(_that.ip,_that.info);case RsServerEvent_PrepareUpload() when prepareUpload != null:
return prepareUpload(_that.sessionId,_that.ip,_that.info,_that.certFingerprint,_that.files);case RsServerEvent_FileUpload() when fileUpload != null:
return fileUpload(_that.sessionId,_that.fileId,_that.file);case RsServerEvent_SessionEnd() when sessionEnd != null:
return sessionEnd(_that.sessionId,_that.reason);case RsServerEvent_PrepareUploadAborted() when prepareUploadAborted != null:
return prepareUploadAborted(_that.sessionId);case RsServerEvent_CancelReceived() when cancelReceived != null:
return cancelReceived(_that.ip,_that.sessionId);case RsServerEvent_WebPrepareDownload() when webPrepareDownload != null:
return webPrepareDownload(_that.ip,_that.sessionId,_that.userAgent);case RsServerEvent_WebFileDownload() when webFileDownload != null:
return webFileDownload(_that.sessionId,_that.fileId,_that.file);case RsServerEvent_Show() when show_ != null:
return show_(_that.args);case _:
  return null;

}
}

}

/// @nodoc


class RsServerEvent_Register extends RsServerEvent {
  const RsServerEvent_Register({required this.ip, required this.info}): super._();
  

 final  String ip;
 final  RegisterDtoV2 info;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsServerEvent_RegisterCopyWith<RsServerEvent_Register> get copyWith => _$RsServerEvent_RegisterCopyWithImpl<RsServerEvent_Register>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsServerEvent_Register&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,ip,info);

@override
String toString() {
  return 'RsServerEvent.register(ip: $ip, info: $info)';
}


}

/// @nodoc
abstract mixin class $RsServerEvent_RegisterCopyWith<$Res> implements $RsServerEventCopyWith<$Res> {
  factory $RsServerEvent_RegisterCopyWith(RsServerEvent_Register value, $Res Function(RsServerEvent_Register) _then) = _$RsServerEvent_RegisterCopyWithImpl;
@useResult
$Res call({
 String ip, RegisterDtoV2 info
});




}
/// @nodoc
class _$RsServerEvent_RegisterCopyWithImpl<$Res>
    implements $RsServerEvent_RegisterCopyWith<$Res> {
  _$RsServerEvent_RegisterCopyWithImpl(this._self, this._then);

  final RsServerEvent_Register _self;
  final $Res Function(RsServerEvent_Register) _then;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ip = null,Object? info = null,}) {
  return _then(RsServerEvent_Register(
ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as RegisterDtoV2,
  ));
}


}

/// @nodoc


class RsServerEvent_PrepareUpload extends RsServerEvent {
  const RsServerEvent_PrepareUpload({required this.sessionId, required this.ip, required this.info, this.certFingerprint, required final  Map<String, FileDto> files}): _files = files,super._();
  

/// The session ID the upload session will have when the request is accepted.
 final  String sessionId;
 final  String ip;
 final  RegisterDtoV2 info;
/// The SHA-256 fingerprint (uppercase hex) of the sender's client
/// certificate verified during the mTLS handshake. Unlike
/// `info.fingerprint`, this value cannot be spoofed.
/// `None` when the server runs without TLS.
 final  String? certFingerprint;
 final  Map<String, FileDto> _files;
 Map<String, FileDto> get files {
  if (_files is EqualUnmodifiableMapView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_files);
}


/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsServerEvent_PrepareUploadCopyWith<RsServerEvent_PrepareUpload> get copyWith => _$RsServerEvent_PrepareUploadCopyWithImpl<RsServerEvent_PrepareUpload>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsServerEvent_PrepareUpload&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.info, info) || other.info == info)&&(identical(other.certFingerprint, certFingerprint) || other.certFingerprint == certFingerprint)&&const DeepCollectionEquality().equals(other._files, _files));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,ip,info,certFingerprint,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'RsServerEvent.prepareUpload(sessionId: $sessionId, ip: $ip, info: $info, certFingerprint: $certFingerprint, files: $files)';
}


}

/// @nodoc
abstract mixin class $RsServerEvent_PrepareUploadCopyWith<$Res> implements $RsServerEventCopyWith<$Res> {
  factory $RsServerEvent_PrepareUploadCopyWith(RsServerEvent_PrepareUpload value, $Res Function(RsServerEvent_PrepareUpload) _then) = _$RsServerEvent_PrepareUploadCopyWithImpl;
@useResult
$Res call({
 String sessionId, String ip, RegisterDtoV2 info, String? certFingerprint, Map<String, FileDto> files
});




}
/// @nodoc
class _$RsServerEvent_PrepareUploadCopyWithImpl<$Res>
    implements $RsServerEvent_PrepareUploadCopyWith<$Res> {
  _$RsServerEvent_PrepareUploadCopyWithImpl(this._self, this._then);

  final RsServerEvent_PrepareUpload _self;
  final $Res Function(RsServerEvent_PrepareUpload) _then;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? ip = null,Object? info = null,Object? certFingerprint = freezed,Object? files = null,}) {
  return _then(RsServerEvent_PrepareUpload(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as RegisterDtoV2,certFingerprint: freezed == certFingerprint ? _self.certFingerprint : certFingerprint // ignore: cast_nullable_to_non_nullable
as String?,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as Map<String, FileDto>,
  ));
}


}

/// @nodoc


class RsServerEvent_FileUpload extends RsServerEvent {
  const RsServerEvent_FileUpload({required this.sessionId, required this.fileId, required this.file}): super._();
  

 final  String sessionId;
 final  String fileId;
 final  FileDto file;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsServerEvent_FileUploadCopyWith<RsServerEvent_FileUpload> get copyWith => _$RsServerEvent_FileUploadCopyWithImpl<RsServerEvent_FileUpload>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsServerEvent_FileUpload&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,fileId,file);

@override
String toString() {
  return 'RsServerEvent.fileUpload(sessionId: $sessionId, fileId: $fileId, file: $file)';
}


}

/// @nodoc
abstract mixin class $RsServerEvent_FileUploadCopyWith<$Res> implements $RsServerEventCopyWith<$Res> {
  factory $RsServerEvent_FileUploadCopyWith(RsServerEvent_FileUpload value, $Res Function(RsServerEvent_FileUpload) _then) = _$RsServerEvent_FileUploadCopyWithImpl;
@useResult
$Res call({
 String sessionId, String fileId, FileDto file
});




}
/// @nodoc
class _$RsServerEvent_FileUploadCopyWithImpl<$Res>
    implements $RsServerEvent_FileUploadCopyWith<$Res> {
  _$RsServerEvent_FileUploadCopyWithImpl(this._self, this._then);

  final RsServerEvent_FileUpload _self;
  final $Res Function(RsServerEvent_FileUpload) _then;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? fileId = null,Object? file = null,}) {
  return _then(RsServerEvent_FileUpload(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as FileDto,
  ));
}


}

/// @nodoc


class RsServerEvent_SessionEnd extends RsServerEvent {
  const RsServerEvent_SessionEnd({required this.sessionId, required this.reason}): super._();
  

 final  String sessionId;
 final  SessionEndReasonV2 reason;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsServerEvent_SessionEndCopyWith<RsServerEvent_SessionEnd> get copyWith => _$RsServerEvent_SessionEndCopyWithImpl<RsServerEvent_SessionEnd>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsServerEvent_SessionEnd&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,reason);

@override
String toString() {
  return 'RsServerEvent.sessionEnd(sessionId: $sessionId, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $RsServerEvent_SessionEndCopyWith<$Res> implements $RsServerEventCopyWith<$Res> {
  factory $RsServerEvent_SessionEndCopyWith(RsServerEvent_SessionEnd value, $Res Function(RsServerEvent_SessionEnd) _then) = _$RsServerEvent_SessionEndCopyWithImpl;
@useResult
$Res call({
 String sessionId, SessionEndReasonV2 reason
});




}
/// @nodoc
class _$RsServerEvent_SessionEndCopyWithImpl<$Res>
    implements $RsServerEvent_SessionEndCopyWith<$Res> {
  _$RsServerEvent_SessionEndCopyWithImpl(this._self, this._then);

  final RsServerEvent_SessionEnd _self;
  final $Res Function(RsServerEvent_SessionEnd) _then;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? reason = null,}) {
  return _then(RsServerEvent_SessionEnd(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as SessionEndReasonV2,
  ));
}


}

/// @nodoc


class RsServerEvent_PrepareUploadAborted extends RsServerEvent {
  const RsServerEvent_PrepareUploadAborted({required this.sessionId}): super._();
  

 final  String sessionId;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsServerEvent_PrepareUploadAbortedCopyWith<RsServerEvent_PrepareUploadAborted> get copyWith => _$RsServerEvent_PrepareUploadAbortedCopyWithImpl<RsServerEvent_PrepareUploadAborted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsServerEvent_PrepareUploadAborted&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'RsServerEvent.prepareUploadAborted(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $RsServerEvent_PrepareUploadAbortedCopyWith<$Res> implements $RsServerEventCopyWith<$Res> {
  factory $RsServerEvent_PrepareUploadAbortedCopyWith(RsServerEvent_PrepareUploadAborted value, $Res Function(RsServerEvent_PrepareUploadAborted) _then) = _$RsServerEvent_PrepareUploadAbortedCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class _$RsServerEvent_PrepareUploadAbortedCopyWithImpl<$Res>
    implements $RsServerEvent_PrepareUploadAbortedCopyWith<$Res> {
  _$RsServerEvent_PrepareUploadAbortedCopyWithImpl(this._self, this._then);

  final RsServerEvent_PrepareUploadAborted _self;
  final $Res Function(RsServerEvent_PrepareUploadAborted) _then;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(RsServerEvent_PrepareUploadAborted(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RsServerEvent_CancelReceived extends RsServerEvent {
  const RsServerEvent_CancelReceived({required this.ip, required this.sessionId}): super._();
  

 final  String ip;
 final  String sessionId;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsServerEvent_CancelReceivedCopyWith<RsServerEvent_CancelReceived> get copyWith => _$RsServerEvent_CancelReceivedCopyWithImpl<RsServerEvent_CancelReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsServerEvent_CancelReceived&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode => Object.hash(runtimeType,ip,sessionId);

@override
String toString() {
  return 'RsServerEvent.cancelReceived(ip: $ip, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $RsServerEvent_CancelReceivedCopyWith<$Res> implements $RsServerEventCopyWith<$Res> {
  factory $RsServerEvent_CancelReceivedCopyWith(RsServerEvent_CancelReceived value, $Res Function(RsServerEvent_CancelReceived) _then) = _$RsServerEvent_CancelReceivedCopyWithImpl;
@useResult
$Res call({
 String ip, String sessionId
});




}
/// @nodoc
class _$RsServerEvent_CancelReceivedCopyWithImpl<$Res>
    implements $RsServerEvent_CancelReceivedCopyWith<$Res> {
  _$RsServerEvent_CancelReceivedCopyWithImpl(this._self, this._then);

  final RsServerEvent_CancelReceived _self;
  final $Res Function(RsServerEvent_CancelReceived) _then;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ip = null,Object? sessionId = null,}) {
  return _then(RsServerEvent_CancelReceived(
ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RsServerEvent_WebPrepareDownload extends RsServerEvent {
  const RsServerEvent_WebPrepareDownload({required this.ip, required this.sessionId, this.userAgent}): super._();
  

 final  String ip;
 final  String sessionId;
 final  String? userAgent;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsServerEvent_WebPrepareDownloadCopyWith<RsServerEvent_WebPrepareDownload> get copyWith => _$RsServerEvent_WebPrepareDownloadCopyWithImpl<RsServerEvent_WebPrepareDownload>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsServerEvent_WebPrepareDownload&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent));
}


@override
int get hashCode => Object.hash(runtimeType,ip,sessionId,userAgent);

@override
String toString() {
  return 'RsServerEvent.webPrepareDownload(ip: $ip, sessionId: $sessionId, userAgent: $userAgent)';
}


}

/// @nodoc
abstract mixin class $RsServerEvent_WebPrepareDownloadCopyWith<$Res> implements $RsServerEventCopyWith<$Res> {
  factory $RsServerEvent_WebPrepareDownloadCopyWith(RsServerEvent_WebPrepareDownload value, $Res Function(RsServerEvent_WebPrepareDownload) _then) = _$RsServerEvent_WebPrepareDownloadCopyWithImpl;
@useResult
$Res call({
 String ip, String sessionId, String? userAgent
});




}
/// @nodoc
class _$RsServerEvent_WebPrepareDownloadCopyWithImpl<$Res>
    implements $RsServerEvent_WebPrepareDownloadCopyWith<$Res> {
  _$RsServerEvent_WebPrepareDownloadCopyWithImpl(this._self, this._then);

  final RsServerEvent_WebPrepareDownload _self;
  final $Res Function(RsServerEvent_WebPrepareDownload) _then;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ip = null,Object? sessionId = null,Object? userAgent = freezed,}) {
  return _then(RsServerEvent_WebPrepareDownload(
ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class RsServerEvent_WebFileDownload extends RsServerEvent {
  const RsServerEvent_WebFileDownload({required this.sessionId, required this.fileId, required this.file}): super._();
  

 final  String sessionId;
 final  String fileId;
 final  FileDto file;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsServerEvent_WebFileDownloadCopyWith<RsServerEvent_WebFileDownload> get copyWith => _$RsServerEvent_WebFileDownloadCopyWithImpl<RsServerEvent_WebFileDownload>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsServerEvent_WebFileDownload&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,fileId,file);

@override
String toString() {
  return 'RsServerEvent.webFileDownload(sessionId: $sessionId, fileId: $fileId, file: $file)';
}


}

/// @nodoc
abstract mixin class $RsServerEvent_WebFileDownloadCopyWith<$Res> implements $RsServerEventCopyWith<$Res> {
  factory $RsServerEvent_WebFileDownloadCopyWith(RsServerEvent_WebFileDownload value, $Res Function(RsServerEvent_WebFileDownload) _then) = _$RsServerEvent_WebFileDownloadCopyWithImpl;
@useResult
$Res call({
 String sessionId, String fileId, FileDto file
});




}
/// @nodoc
class _$RsServerEvent_WebFileDownloadCopyWithImpl<$Res>
    implements $RsServerEvent_WebFileDownloadCopyWith<$Res> {
  _$RsServerEvent_WebFileDownloadCopyWithImpl(this._self, this._then);

  final RsServerEvent_WebFileDownload _self;
  final $Res Function(RsServerEvent_WebFileDownload) _then;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? fileId = null,Object? file = null,}) {
  return _then(RsServerEvent_WebFileDownload(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as FileDto,
  ));
}


}

/// @nodoc


class RsServerEvent_Show extends RsServerEvent {
  const RsServerEvent_Show({required final  List<String> args}): _args = args,super._();
  

/// Command-line arguments forwarded by the other application instance.
 final  List<String> _args;
/// Command-line arguments forwarded by the other application instance.
 List<String> get args {
  if (_args is EqualUnmodifiableListView) return _args;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_args);
}


/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsServerEvent_ShowCopyWith<RsServerEvent_Show> get copyWith => _$RsServerEvent_ShowCopyWithImpl<RsServerEvent_Show>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsServerEvent_Show&&const DeepCollectionEquality().equals(other._args, _args));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_args));

@override
String toString() {
  return 'RsServerEvent.show_(args: $args)';
}


}

/// @nodoc
abstract mixin class $RsServerEvent_ShowCopyWith<$Res> implements $RsServerEventCopyWith<$Res> {
  factory $RsServerEvent_ShowCopyWith(RsServerEvent_Show value, $Res Function(RsServerEvent_Show) _then) = _$RsServerEvent_ShowCopyWithImpl;
@useResult
$Res call({
 List<String> args
});




}
/// @nodoc
class _$RsServerEvent_ShowCopyWithImpl<$Res>
    implements $RsServerEvent_ShowCopyWith<$Res> {
  _$RsServerEvent_ShowCopyWithImpl(this._self, this._then);

  final RsServerEvent_Show _self;
  final $Res Function(RsServerEvent_Show) _then;

/// Create a copy of RsServerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? args = null,}) {
  return _then(RsServerEvent_Show(
args: null == args ? _self._args : args // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
