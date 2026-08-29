// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webrtc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RTCStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RTCStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RTCStatus()';
}


}

/// @nodoc
class $RTCStatusCopyWith<$Res>  {
$RTCStatusCopyWith(RTCStatus _, $Res Function(RTCStatus) __);
}


/// Adds pattern-matching-related methods to [RTCStatus].
extension RTCStatusPatterns on RTCStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RTCStatus_SdpExchanged value)?  sdpExchanged,TResult Function( RTCStatus_Connected value)?  connected,TResult Function( RTCStatus_PinRequired value)?  pinRequired,TResult Function( RTCStatus_TooManyAttempts value)?  tooManyAttempts,TResult Function( RTCStatus_Declined value)?  declined,TResult Function( RTCStatus_Sending value)?  sending,TResult Function( RTCStatus_Finished value)?  finished,TResult Function( RTCStatus_Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RTCStatus_SdpExchanged() when sdpExchanged != null:
return sdpExchanged(_that);case RTCStatus_Connected() when connected != null:
return connected(_that);case RTCStatus_PinRequired() when pinRequired != null:
return pinRequired(_that);case RTCStatus_TooManyAttempts() when tooManyAttempts != null:
return tooManyAttempts(_that);case RTCStatus_Declined() when declined != null:
return declined(_that);case RTCStatus_Sending() when sending != null:
return sending(_that);case RTCStatus_Finished() when finished != null:
return finished(_that);case RTCStatus_Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RTCStatus_SdpExchanged value)  sdpExchanged,required TResult Function( RTCStatus_Connected value)  connected,required TResult Function( RTCStatus_PinRequired value)  pinRequired,required TResult Function( RTCStatus_TooManyAttempts value)  tooManyAttempts,required TResult Function( RTCStatus_Declined value)  declined,required TResult Function( RTCStatus_Sending value)  sending,required TResult Function( RTCStatus_Finished value)  finished,required TResult Function( RTCStatus_Error value)  error,}){
final _that = this;
switch (_that) {
case RTCStatus_SdpExchanged():
return sdpExchanged(_that);case RTCStatus_Connected():
return connected(_that);case RTCStatus_PinRequired():
return pinRequired(_that);case RTCStatus_TooManyAttempts():
return tooManyAttempts(_that);case RTCStatus_Declined():
return declined(_that);case RTCStatus_Sending():
return sending(_that);case RTCStatus_Finished():
return finished(_that);case RTCStatus_Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RTCStatus_SdpExchanged value)?  sdpExchanged,TResult? Function( RTCStatus_Connected value)?  connected,TResult? Function( RTCStatus_PinRequired value)?  pinRequired,TResult? Function( RTCStatus_TooManyAttempts value)?  tooManyAttempts,TResult? Function( RTCStatus_Declined value)?  declined,TResult? Function( RTCStatus_Sending value)?  sending,TResult? Function( RTCStatus_Finished value)?  finished,TResult? Function( RTCStatus_Error value)?  error,}){
final _that = this;
switch (_that) {
case RTCStatus_SdpExchanged() when sdpExchanged != null:
return sdpExchanged(_that);case RTCStatus_Connected() when connected != null:
return connected(_that);case RTCStatus_PinRequired() when pinRequired != null:
return pinRequired(_that);case RTCStatus_TooManyAttempts() when tooManyAttempts != null:
return tooManyAttempts(_that);case RTCStatus_Declined() when declined != null:
return declined(_that);case RTCStatus_Sending() when sending != null:
return sending(_that);case RTCStatus_Finished() when finished != null:
return finished(_that);case RTCStatus_Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  sdpExchanged,TResult Function()?  connected,TResult Function()?  pinRequired,TResult Function()?  tooManyAttempts,TResult Function()?  declined,TResult Function()?  sending,TResult Function()?  finished,TResult Function( String field0)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RTCStatus_SdpExchanged() when sdpExchanged != null:
return sdpExchanged();case RTCStatus_Connected() when connected != null:
return connected();case RTCStatus_PinRequired() when pinRequired != null:
return pinRequired();case RTCStatus_TooManyAttempts() when tooManyAttempts != null:
return tooManyAttempts();case RTCStatus_Declined() when declined != null:
return declined();case RTCStatus_Sending() when sending != null:
return sending();case RTCStatus_Finished() when finished != null:
return finished();case RTCStatus_Error() when error != null:
return error(_that.field0);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  sdpExchanged,required TResult Function()  connected,required TResult Function()  pinRequired,required TResult Function()  tooManyAttempts,required TResult Function()  declined,required TResult Function()  sending,required TResult Function()  finished,required TResult Function( String field0)  error,}) {final _that = this;
switch (_that) {
case RTCStatus_SdpExchanged():
return sdpExchanged();case RTCStatus_Connected():
return connected();case RTCStatus_PinRequired():
return pinRequired();case RTCStatus_TooManyAttempts():
return tooManyAttempts();case RTCStatus_Declined():
return declined();case RTCStatus_Sending():
return sending();case RTCStatus_Finished():
return finished();case RTCStatus_Error():
return error(_that.field0);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  sdpExchanged,TResult? Function()?  connected,TResult? Function()?  pinRequired,TResult? Function()?  tooManyAttempts,TResult? Function()?  declined,TResult? Function()?  sending,TResult? Function()?  finished,TResult? Function( String field0)?  error,}) {final _that = this;
switch (_that) {
case RTCStatus_SdpExchanged() when sdpExchanged != null:
return sdpExchanged();case RTCStatus_Connected() when connected != null:
return connected();case RTCStatus_PinRequired() when pinRequired != null:
return pinRequired();case RTCStatus_TooManyAttempts() when tooManyAttempts != null:
return tooManyAttempts();case RTCStatus_Declined() when declined != null:
return declined();case RTCStatus_Sending() when sending != null:
return sending();case RTCStatus_Finished() when finished != null:
return finished();case RTCStatus_Error() when error != null:
return error(_that.field0);case _:
  return null;

}
}

}

/// @nodoc


class RTCStatus_SdpExchanged extends RTCStatus {
  const RTCStatus_SdpExchanged(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RTCStatus_SdpExchanged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RTCStatus.sdpExchanged()';
}


}




/// @nodoc


class RTCStatus_Connected extends RTCStatus {
  const RTCStatus_Connected(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RTCStatus_Connected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RTCStatus.connected()';
}


}




/// @nodoc


class RTCStatus_PinRequired extends RTCStatus {
  const RTCStatus_PinRequired(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RTCStatus_PinRequired);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RTCStatus.pinRequired()';
}


}




/// @nodoc


class RTCStatus_TooManyAttempts extends RTCStatus {
  const RTCStatus_TooManyAttempts(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RTCStatus_TooManyAttempts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RTCStatus.tooManyAttempts()';
}


}




/// @nodoc


class RTCStatus_Declined extends RTCStatus {
  const RTCStatus_Declined(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RTCStatus_Declined);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RTCStatus.declined()';
}


}




/// @nodoc


class RTCStatus_Sending extends RTCStatus {
  const RTCStatus_Sending(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RTCStatus_Sending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RTCStatus.sending()';
}


}




/// @nodoc


class RTCStatus_Finished extends RTCStatus {
  const RTCStatus_Finished(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RTCStatus_Finished);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RTCStatus.finished()';
}


}




/// @nodoc


class RTCStatus_Error extends RTCStatus {
  const RTCStatus_Error(this.field0): super._();
  

 final  String field0;

/// Create a copy of RTCStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RTCStatus_ErrorCopyWith<RTCStatus_Error> get copyWith => _$RTCStatus_ErrorCopyWithImpl<RTCStatus_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RTCStatus_Error&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'RTCStatus.error(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $RTCStatus_ErrorCopyWith<$Res> implements $RTCStatusCopyWith<$Res> {
  factory $RTCStatus_ErrorCopyWith(RTCStatus_Error value, $Res Function(RTCStatus_Error) _then) = _$RTCStatus_ErrorCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$RTCStatus_ErrorCopyWithImpl<$Res>
    implements $RTCStatus_ErrorCopyWith<$Res> {
  _$RTCStatus_ErrorCopyWithImpl(this._self, this._then);

  final RTCStatus_Error _self;
  final $Res Function(RTCStatus_Error) _then;

/// Create a copy of RTCStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(RTCStatus_Error(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$WsServerMessage {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsServerMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WsServerMessage()';
}


}

/// @nodoc
class $WsServerMessageCopyWith<$Res>  {
$WsServerMessageCopyWith(WsServerMessage _, $Res Function(WsServerMessage) __);
}


/// Adds pattern-matching-related methods to [WsServerMessage].
extension WsServerMessagePatterns on WsServerMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WsServerMessage_Hello value)?  hello,TResult Function( WsServerMessage_Join value)?  join,TResult Function( WsServerMessage_Update value)?  update,TResult Function( WsServerMessage_Left value)?  left,TResult Function( WsServerMessage_Offer value)?  offer,TResult Function( WsServerMessage_Answer value)?  answer,TResult Function( WsServerMessage_Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WsServerMessage_Hello() when hello != null:
return hello(_that);case WsServerMessage_Join() when join != null:
return join(_that);case WsServerMessage_Update() when update != null:
return update(_that);case WsServerMessage_Left() when left != null:
return left(_that);case WsServerMessage_Offer() when offer != null:
return offer(_that);case WsServerMessage_Answer() when answer != null:
return answer(_that);case WsServerMessage_Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WsServerMessage_Hello value)  hello,required TResult Function( WsServerMessage_Join value)  join,required TResult Function( WsServerMessage_Update value)  update,required TResult Function( WsServerMessage_Left value)  left,required TResult Function( WsServerMessage_Offer value)  offer,required TResult Function( WsServerMessage_Answer value)  answer,required TResult Function( WsServerMessage_Error value)  error,}){
final _that = this;
switch (_that) {
case WsServerMessage_Hello():
return hello(_that);case WsServerMessage_Join():
return join(_that);case WsServerMessage_Update():
return update(_that);case WsServerMessage_Left():
return left(_that);case WsServerMessage_Offer():
return offer(_that);case WsServerMessage_Answer():
return answer(_that);case WsServerMessage_Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WsServerMessage_Hello value)?  hello,TResult? Function( WsServerMessage_Join value)?  join,TResult? Function( WsServerMessage_Update value)?  update,TResult? Function( WsServerMessage_Left value)?  left,TResult? Function( WsServerMessage_Offer value)?  offer,TResult? Function( WsServerMessage_Answer value)?  answer,TResult? Function( WsServerMessage_Error value)?  error,}){
final _that = this;
switch (_that) {
case WsServerMessage_Hello() when hello != null:
return hello(_that);case WsServerMessage_Join() when join != null:
return join(_that);case WsServerMessage_Update() when update != null:
return update(_that);case WsServerMessage_Left() when left != null:
return left(_that);case WsServerMessage_Offer() when offer != null:
return offer(_that);case WsServerMessage_Answer() when answer != null:
return answer(_that);case WsServerMessage_Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ClientInfo client,  List<ClientInfo> peers)?  hello,TResult Function( ClientInfo peer)?  join,TResult Function( ClientInfo peer)?  update,TResult Function( UuidValue peerId)?  left,TResult Function( WsServerSdpMessage field0)?  offer,TResult Function( WsServerSdpMessage field0)?  answer,TResult Function( int code)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WsServerMessage_Hello() when hello != null:
return hello(_that.client,_that.peers);case WsServerMessage_Join() when join != null:
return join(_that.peer);case WsServerMessage_Update() when update != null:
return update(_that.peer);case WsServerMessage_Left() when left != null:
return left(_that.peerId);case WsServerMessage_Offer() when offer != null:
return offer(_that.field0);case WsServerMessage_Answer() when answer != null:
return answer(_that.field0);case WsServerMessage_Error() when error != null:
return error(_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ClientInfo client,  List<ClientInfo> peers)  hello,required TResult Function( ClientInfo peer)  join,required TResult Function( ClientInfo peer)  update,required TResult Function( UuidValue peerId)  left,required TResult Function( WsServerSdpMessage field0)  offer,required TResult Function( WsServerSdpMessage field0)  answer,required TResult Function( int code)  error,}) {final _that = this;
switch (_that) {
case WsServerMessage_Hello():
return hello(_that.client,_that.peers);case WsServerMessage_Join():
return join(_that.peer);case WsServerMessage_Update():
return update(_that.peer);case WsServerMessage_Left():
return left(_that.peerId);case WsServerMessage_Offer():
return offer(_that.field0);case WsServerMessage_Answer():
return answer(_that.field0);case WsServerMessage_Error():
return error(_that.code);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ClientInfo client,  List<ClientInfo> peers)?  hello,TResult? Function( ClientInfo peer)?  join,TResult? Function( ClientInfo peer)?  update,TResult? Function( UuidValue peerId)?  left,TResult? Function( WsServerSdpMessage field0)?  offer,TResult? Function( WsServerSdpMessage field0)?  answer,TResult? Function( int code)?  error,}) {final _that = this;
switch (_that) {
case WsServerMessage_Hello() when hello != null:
return hello(_that.client,_that.peers);case WsServerMessage_Join() when join != null:
return join(_that.peer);case WsServerMessage_Update() when update != null:
return update(_that.peer);case WsServerMessage_Left() when left != null:
return left(_that.peerId);case WsServerMessage_Offer() when offer != null:
return offer(_that.field0);case WsServerMessage_Answer() when answer != null:
return answer(_that.field0);case WsServerMessage_Error() when error != null:
return error(_that.code);case _:
  return null;

}
}

}

/// @nodoc


class WsServerMessage_Hello extends WsServerMessage {
  const WsServerMessage_Hello({required this.client, required final  List<ClientInfo> peers}): _peers = peers,super._();
  

 final  ClientInfo client;
 final  List<ClientInfo> _peers;
 List<ClientInfo> get peers {
  if (_peers is EqualUnmodifiableListView) return _peers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_peers);
}


/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsServerMessage_HelloCopyWith<WsServerMessage_Hello> get copyWith => _$WsServerMessage_HelloCopyWithImpl<WsServerMessage_Hello>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsServerMessage_Hello&&(identical(other.client, client) || other.client == client)&&const DeepCollectionEquality().equals(other._peers, _peers));
}


@override
int get hashCode => Object.hash(runtimeType,client,const DeepCollectionEquality().hash(_peers));

@override
String toString() {
  return 'WsServerMessage.hello(client: $client, peers: $peers)';
}


}

/// @nodoc
abstract mixin class $WsServerMessage_HelloCopyWith<$Res> implements $WsServerMessageCopyWith<$Res> {
  factory $WsServerMessage_HelloCopyWith(WsServerMessage_Hello value, $Res Function(WsServerMessage_Hello) _then) = _$WsServerMessage_HelloCopyWithImpl;
@useResult
$Res call({
 ClientInfo client, List<ClientInfo> peers
});




}
/// @nodoc
class _$WsServerMessage_HelloCopyWithImpl<$Res>
    implements $WsServerMessage_HelloCopyWith<$Res> {
  _$WsServerMessage_HelloCopyWithImpl(this._self, this._then);

  final WsServerMessage_Hello _self;
  final $Res Function(WsServerMessage_Hello) _then;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? client = null,Object? peers = null,}) {
  return _then(WsServerMessage_Hello(
client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as ClientInfo,peers: null == peers ? _self._peers : peers // ignore: cast_nullable_to_non_nullable
as List<ClientInfo>,
  ));
}


}

/// @nodoc


class WsServerMessage_Join extends WsServerMessage {
  const WsServerMessage_Join({required this.peer}): super._();
  

 final  ClientInfo peer;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsServerMessage_JoinCopyWith<WsServerMessage_Join> get copyWith => _$WsServerMessage_JoinCopyWithImpl<WsServerMessage_Join>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsServerMessage_Join&&(identical(other.peer, peer) || other.peer == peer));
}


@override
int get hashCode => Object.hash(runtimeType,peer);

@override
String toString() {
  return 'WsServerMessage.join(peer: $peer)';
}


}

/// @nodoc
abstract mixin class $WsServerMessage_JoinCopyWith<$Res> implements $WsServerMessageCopyWith<$Res> {
  factory $WsServerMessage_JoinCopyWith(WsServerMessage_Join value, $Res Function(WsServerMessage_Join) _then) = _$WsServerMessage_JoinCopyWithImpl;
@useResult
$Res call({
 ClientInfo peer
});




}
/// @nodoc
class _$WsServerMessage_JoinCopyWithImpl<$Res>
    implements $WsServerMessage_JoinCopyWith<$Res> {
  _$WsServerMessage_JoinCopyWithImpl(this._self, this._then);

  final WsServerMessage_Join _self;
  final $Res Function(WsServerMessage_Join) _then;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? peer = null,}) {
  return _then(WsServerMessage_Join(
peer: null == peer ? _self.peer : peer // ignore: cast_nullable_to_non_nullable
as ClientInfo,
  ));
}


}

/// @nodoc


class WsServerMessage_Update extends WsServerMessage {
  const WsServerMessage_Update({required this.peer}): super._();
  

 final  ClientInfo peer;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsServerMessage_UpdateCopyWith<WsServerMessage_Update> get copyWith => _$WsServerMessage_UpdateCopyWithImpl<WsServerMessage_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsServerMessage_Update&&(identical(other.peer, peer) || other.peer == peer));
}


@override
int get hashCode => Object.hash(runtimeType,peer);

@override
String toString() {
  return 'WsServerMessage.update(peer: $peer)';
}


}

/// @nodoc
abstract mixin class $WsServerMessage_UpdateCopyWith<$Res> implements $WsServerMessageCopyWith<$Res> {
  factory $WsServerMessage_UpdateCopyWith(WsServerMessage_Update value, $Res Function(WsServerMessage_Update) _then) = _$WsServerMessage_UpdateCopyWithImpl;
@useResult
$Res call({
 ClientInfo peer
});




}
/// @nodoc
class _$WsServerMessage_UpdateCopyWithImpl<$Res>
    implements $WsServerMessage_UpdateCopyWith<$Res> {
  _$WsServerMessage_UpdateCopyWithImpl(this._self, this._then);

  final WsServerMessage_Update _self;
  final $Res Function(WsServerMessage_Update) _then;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? peer = null,}) {
  return _then(WsServerMessage_Update(
peer: null == peer ? _self.peer : peer // ignore: cast_nullable_to_non_nullable
as ClientInfo,
  ));
}


}

/// @nodoc


class WsServerMessage_Left extends WsServerMessage {
  const WsServerMessage_Left({required this.peerId}): super._();
  

 final  UuidValue peerId;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsServerMessage_LeftCopyWith<WsServerMessage_Left> get copyWith => _$WsServerMessage_LeftCopyWithImpl<WsServerMessage_Left>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsServerMessage_Left&&(identical(other.peerId, peerId) || other.peerId == peerId));
}


@override
int get hashCode => Object.hash(runtimeType,peerId);

@override
String toString() {
  return 'WsServerMessage.left(peerId: $peerId)';
}


}

/// @nodoc
abstract mixin class $WsServerMessage_LeftCopyWith<$Res> implements $WsServerMessageCopyWith<$Res> {
  factory $WsServerMessage_LeftCopyWith(WsServerMessage_Left value, $Res Function(WsServerMessage_Left) _then) = _$WsServerMessage_LeftCopyWithImpl;
@useResult
$Res call({
 UuidValue peerId
});




}
/// @nodoc
class _$WsServerMessage_LeftCopyWithImpl<$Res>
    implements $WsServerMessage_LeftCopyWith<$Res> {
  _$WsServerMessage_LeftCopyWithImpl(this._self, this._then);

  final WsServerMessage_Left _self;
  final $Res Function(WsServerMessage_Left) _then;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? peerId = null,}) {
  return _then(WsServerMessage_Left(
peerId: null == peerId ? _self.peerId : peerId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc


class WsServerMessage_Offer extends WsServerMessage {
  const WsServerMessage_Offer(this.field0): super._();
  

 final  WsServerSdpMessage field0;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsServerMessage_OfferCopyWith<WsServerMessage_Offer> get copyWith => _$WsServerMessage_OfferCopyWithImpl<WsServerMessage_Offer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsServerMessage_Offer&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'WsServerMessage.offer(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $WsServerMessage_OfferCopyWith<$Res> implements $WsServerMessageCopyWith<$Res> {
  factory $WsServerMessage_OfferCopyWith(WsServerMessage_Offer value, $Res Function(WsServerMessage_Offer) _then) = _$WsServerMessage_OfferCopyWithImpl;
@useResult
$Res call({
 WsServerSdpMessage field0
});




}
/// @nodoc
class _$WsServerMessage_OfferCopyWithImpl<$Res>
    implements $WsServerMessage_OfferCopyWith<$Res> {
  _$WsServerMessage_OfferCopyWithImpl(this._self, this._then);

  final WsServerMessage_Offer _self;
  final $Res Function(WsServerMessage_Offer) _then;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(WsServerMessage_Offer(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as WsServerSdpMessage,
  ));
}


}

/// @nodoc


class WsServerMessage_Answer extends WsServerMessage {
  const WsServerMessage_Answer(this.field0): super._();
  

 final  WsServerSdpMessage field0;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsServerMessage_AnswerCopyWith<WsServerMessage_Answer> get copyWith => _$WsServerMessage_AnswerCopyWithImpl<WsServerMessage_Answer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsServerMessage_Answer&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'WsServerMessage.answer(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $WsServerMessage_AnswerCopyWith<$Res> implements $WsServerMessageCopyWith<$Res> {
  factory $WsServerMessage_AnswerCopyWith(WsServerMessage_Answer value, $Res Function(WsServerMessage_Answer) _then) = _$WsServerMessage_AnswerCopyWithImpl;
@useResult
$Res call({
 WsServerSdpMessage field0
});




}
/// @nodoc
class _$WsServerMessage_AnswerCopyWithImpl<$Res>
    implements $WsServerMessage_AnswerCopyWith<$Res> {
  _$WsServerMessage_AnswerCopyWithImpl(this._self, this._then);

  final WsServerMessage_Answer _self;
  final $Res Function(WsServerMessage_Answer) _then;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(WsServerMessage_Answer(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as WsServerSdpMessage,
  ));
}


}

/// @nodoc


class WsServerMessage_Error extends WsServerMessage {
  const WsServerMessage_Error({required this.code}): super._();
  

 final  int code;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsServerMessage_ErrorCopyWith<WsServerMessage_Error> get copyWith => _$WsServerMessage_ErrorCopyWithImpl<WsServerMessage_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsServerMessage_Error&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,code);

@override
String toString() {
  return 'WsServerMessage.error(code: $code)';
}


}

/// @nodoc
abstract mixin class $WsServerMessage_ErrorCopyWith<$Res> implements $WsServerMessageCopyWith<$Res> {
  factory $WsServerMessage_ErrorCopyWith(WsServerMessage_Error value, $Res Function(WsServerMessage_Error) _then) = _$WsServerMessage_ErrorCopyWithImpl;
@useResult
$Res call({
 int code
});




}
/// @nodoc
class _$WsServerMessage_ErrorCopyWithImpl<$Res>
    implements $WsServerMessage_ErrorCopyWith<$Res> {
  _$WsServerMessage_ErrorCopyWithImpl(this._self, this._then);

  final WsServerMessage_Error _self;
  final $Res Function(WsServerMessage_Error) _then;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(WsServerMessage_Error(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
