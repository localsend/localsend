// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discovery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RsDeviceLogEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsDeviceLogEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RsDeviceLogEvent()';
}


}

/// @nodoc
class $RsDeviceLogEventCopyWith<$Res>  {
$RsDeviceLogEventCopyWith(RsDeviceLogEvent _, $Res Function(RsDeviceLogEvent) __);
}


/// Adds pattern-matching-related methods to [RsDeviceLogEvent].
extension RsDeviceLogEventPatterns on RsDeviceLogEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RsDeviceLogEvent_Outbound value)?  outbound,TResult Function( RsDeviceLogEvent_OutboundFailed value)?  outboundFailed,TResult Function( RsDeviceLogEvent_Inbound value)?  inbound,TResult Function( RsDeviceLogEvent_MulticastInbound value)?  multicastInbound,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RsDeviceLogEvent_Outbound() when outbound != null:
return outbound(_that);case RsDeviceLogEvent_OutboundFailed() when outboundFailed != null:
return outboundFailed(_that);case RsDeviceLogEvent_Inbound() when inbound != null:
return inbound(_that);case RsDeviceLogEvent_MulticastInbound() when multicastInbound != null:
return multicastInbound(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RsDeviceLogEvent_Outbound value)  outbound,required TResult Function( RsDeviceLogEvent_OutboundFailed value)  outboundFailed,required TResult Function( RsDeviceLogEvent_Inbound value)  inbound,required TResult Function( RsDeviceLogEvent_MulticastInbound value)  multicastInbound,}){
final _that = this;
switch (_that) {
case RsDeviceLogEvent_Outbound():
return outbound(_that);case RsDeviceLogEvent_OutboundFailed():
return outboundFailed(_that);case RsDeviceLogEvent_Inbound():
return inbound(_that);case RsDeviceLogEvent_MulticastInbound():
return multicastInbound(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RsDeviceLogEvent_Outbound value)?  outbound,TResult? Function( RsDeviceLogEvent_OutboundFailed value)?  outboundFailed,TResult? Function( RsDeviceLogEvent_Inbound value)?  inbound,TResult? Function( RsDeviceLogEvent_MulticastInbound value)?  multicastInbound,}){
final _that = this;
switch (_that) {
case RsDeviceLogEvent_Outbound() when outbound != null:
return outbound(_that);case RsDeviceLogEvent_OutboundFailed() when outboundFailed != null:
return outboundFailed(_that);case RsDeviceLogEvent_Inbound() when inbound != null:
return inbound(_that);case RsDeviceLogEvent_MulticastInbound() when multicastInbound != null:
return multicastInbound(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RsDeviceChannel channel)?  outbound,TResult Function( RsDeviceChannel channel,  String error)?  outboundFailed,TResult Function( RsDeviceChannel channel)?  inbound,TResult Function( String host)?  multicastInbound,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RsDeviceLogEvent_Outbound() when outbound != null:
return outbound(_that.channel);case RsDeviceLogEvent_OutboundFailed() when outboundFailed != null:
return outboundFailed(_that.channel,_that.error);case RsDeviceLogEvent_Inbound() when inbound != null:
return inbound(_that.channel);case RsDeviceLogEvent_MulticastInbound() when multicastInbound != null:
return multicastInbound(_that.host);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RsDeviceChannel channel)  outbound,required TResult Function( RsDeviceChannel channel,  String error)  outboundFailed,required TResult Function( RsDeviceChannel channel)  inbound,required TResult Function( String host)  multicastInbound,}) {final _that = this;
switch (_that) {
case RsDeviceLogEvent_Outbound():
return outbound(_that.channel);case RsDeviceLogEvent_OutboundFailed():
return outboundFailed(_that.channel,_that.error);case RsDeviceLogEvent_Inbound():
return inbound(_that.channel);case RsDeviceLogEvent_MulticastInbound():
return multicastInbound(_that.host);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RsDeviceChannel channel)?  outbound,TResult? Function( RsDeviceChannel channel,  String error)?  outboundFailed,TResult? Function( RsDeviceChannel channel)?  inbound,TResult? Function( String host)?  multicastInbound,}) {final _that = this;
switch (_that) {
case RsDeviceLogEvent_Outbound() when outbound != null:
return outbound(_that.channel);case RsDeviceLogEvent_OutboundFailed() when outboundFailed != null:
return outboundFailed(_that.channel,_that.error);case RsDeviceLogEvent_Inbound() when inbound != null:
return inbound(_that.channel);case RsDeviceLogEvent_MulticastInbound() when multicastInbound != null:
return multicastInbound(_that.host);case _:
  return null;

}
}

}

/// @nodoc


class RsDeviceLogEvent_Outbound extends RsDeviceLogEvent {
  const RsDeviceLogEvent_Outbound({required this.channel}): super._();
  

 final  RsDeviceChannel channel;

/// Create a copy of RsDeviceLogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsDeviceLogEvent_OutboundCopyWith<RsDeviceLogEvent_Outbound> get copyWith => _$RsDeviceLogEvent_OutboundCopyWithImpl<RsDeviceLogEvent_Outbound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsDeviceLogEvent_Outbound&&(identical(other.channel, channel) || other.channel == channel));
}


@override
int get hashCode => Object.hash(runtimeType,channel);

@override
String toString() {
  return 'RsDeviceLogEvent.outbound(channel: $channel)';
}


}

/// @nodoc
abstract mixin class $RsDeviceLogEvent_OutboundCopyWith<$Res> implements $RsDeviceLogEventCopyWith<$Res> {
  factory $RsDeviceLogEvent_OutboundCopyWith(RsDeviceLogEvent_Outbound value, $Res Function(RsDeviceLogEvent_Outbound) _then) = _$RsDeviceLogEvent_OutboundCopyWithImpl;
@useResult
$Res call({
 RsDeviceChannel channel
});




}
/// @nodoc
class _$RsDeviceLogEvent_OutboundCopyWithImpl<$Res>
    implements $RsDeviceLogEvent_OutboundCopyWith<$Res> {
  _$RsDeviceLogEvent_OutboundCopyWithImpl(this._self, this._then);

  final RsDeviceLogEvent_Outbound _self;
  final $Res Function(RsDeviceLogEvent_Outbound) _then;

/// Create a copy of RsDeviceLogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? channel = null,}) {
  return _then(RsDeviceLogEvent_Outbound(
channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as RsDeviceChannel,
  ));
}


}

/// @nodoc


class RsDeviceLogEvent_OutboundFailed extends RsDeviceLogEvent {
  const RsDeviceLogEvent_OutboundFailed({required this.channel, required this.error}): super._();
  

 final  RsDeviceChannel channel;
/// Why the request failed, for display.
 final  String error;

/// Create a copy of RsDeviceLogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsDeviceLogEvent_OutboundFailedCopyWith<RsDeviceLogEvent_OutboundFailed> get copyWith => _$RsDeviceLogEvent_OutboundFailedCopyWithImpl<RsDeviceLogEvent_OutboundFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsDeviceLogEvent_OutboundFailed&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,channel,error);

@override
String toString() {
  return 'RsDeviceLogEvent.outboundFailed(channel: $channel, error: $error)';
}


}

/// @nodoc
abstract mixin class $RsDeviceLogEvent_OutboundFailedCopyWith<$Res> implements $RsDeviceLogEventCopyWith<$Res> {
  factory $RsDeviceLogEvent_OutboundFailedCopyWith(RsDeviceLogEvent_OutboundFailed value, $Res Function(RsDeviceLogEvent_OutboundFailed) _then) = _$RsDeviceLogEvent_OutboundFailedCopyWithImpl;
@useResult
$Res call({
 RsDeviceChannel channel, String error
});




}
/// @nodoc
class _$RsDeviceLogEvent_OutboundFailedCopyWithImpl<$Res>
    implements $RsDeviceLogEvent_OutboundFailedCopyWith<$Res> {
  _$RsDeviceLogEvent_OutboundFailedCopyWithImpl(this._self, this._then);

  final RsDeviceLogEvent_OutboundFailed _self;
  final $Res Function(RsDeviceLogEvent_OutboundFailed) _then;

/// Create a copy of RsDeviceLogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? channel = null,Object? error = null,}) {
  return _then(RsDeviceLogEvent_OutboundFailed(
channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as RsDeviceChannel,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RsDeviceLogEvent_Inbound extends RsDeviceLogEvent {
  const RsDeviceLogEvent_Inbound({required this.channel}): super._();
  

 final  RsDeviceChannel channel;

/// Create a copy of RsDeviceLogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsDeviceLogEvent_InboundCopyWith<RsDeviceLogEvent_Inbound> get copyWith => _$RsDeviceLogEvent_InboundCopyWithImpl<RsDeviceLogEvent_Inbound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsDeviceLogEvent_Inbound&&(identical(other.channel, channel) || other.channel == channel));
}


@override
int get hashCode => Object.hash(runtimeType,channel);

@override
String toString() {
  return 'RsDeviceLogEvent.inbound(channel: $channel)';
}


}

/// @nodoc
abstract mixin class $RsDeviceLogEvent_InboundCopyWith<$Res> implements $RsDeviceLogEventCopyWith<$Res> {
  factory $RsDeviceLogEvent_InboundCopyWith(RsDeviceLogEvent_Inbound value, $Res Function(RsDeviceLogEvent_Inbound) _then) = _$RsDeviceLogEvent_InboundCopyWithImpl;
@useResult
$Res call({
 RsDeviceChannel channel
});




}
/// @nodoc
class _$RsDeviceLogEvent_InboundCopyWithImpl<$Res>
    implements $RsDeviceLogEvent_InboundCopyWith<$Res> {
  _$RsDeviceLogEvent_InboundCopyWithImpl(this._self, this._then);

  final RsDeviceLogEvent_Inbound _self;
  final $Res Function(RsDeviceLogEvent_Inbound) _then;

/// Create a copy of RsDeviceLogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? channel = null,}) {
  return _then(RsDeviceLogEvent_Inbound(
channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as RsDeviceChannel,
  ));
}


}

/// @nodoc


class RsDeviceLogEvent_MulticastInbound extends RsDeviceLogEvent {
  const RsDeviceLogEvent_MulticastInbound({required this.host}): super._();
  

/// The address the announcement came from, in the scoped form
/// `fe80::1%3` for link-local IPv6.
 final  String host;

/// Create a copy of RsDeviceLogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsDeviceLogEvent_MulticastInboundCopyWith<RsDeviceLogEvent_MulticastInbound> get copyWith => _$RsDeviceLogEvent_MulticastInboundCopyWithImpl<RsDeviceLogEvent_MulticastInbound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsDeviceLogEvent_MulticastInbound&&(identical(other.host, host) || other.host == host));
}


@override
int get hashCode => Object.hash(runtimeType,host);

@override
String toString() {
  return 'RsDeviceLogEvent.multicastInbound(host: $host)';
}


}

/// @nodoc
abstract mixin class $RsDeviceLogEvent_MulticastInboundCopyWith<$Res> implements $RsDeviceLogEventCopyWith<$Res> {
  factory $RsDeviceLogEvent_MulticastInboundCopyWith(RsDeviceLogEvent_MulticastInbound value, $Res Function(RsDeviceLogEvent_MulticastInbound) _then) = _$RsDeviceLogEvent_MulticastInboundCopyWithImpl;
@useResult
$Res call({
 String host
});




}
/// @nodoc
class _$RsDeviceLogEvent_MulticastInboundCopyWithImpl<$Res>
    implements $RsDeviceLogEvent_MulticastInboundCopyWith<$Res> {
  _$RsDeviceLogEvent_MulticastInboundCopyWithImpl(this._self, this._then);

  final RsDeviceLogEvent_MulticastInbound _self;
  final $Res Function(RsDeviceLogEvent_MulticastInbound) _then;

/// Create a copy of RsDeviceLogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? host = null,}) {
  return _then(RsDeviceLogEvent_MulticastInbound(
host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RsDiscoveryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsDiscoveryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RsDiscoveryEvent()';
}


}

/// @nodoc
class $RsDiscoveryEventCopyWith<$Res>  {
$RsDiscoveryEventCopyWith(RsDiscoveryEvent _, $Res Function(RsDiscoveryEvent) __);
}


/// Adds pattern-matching-related methods to [RsDiscoveryEvent].
extension RsDiscoveryEventPatterns on RsDiscoveryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RsDiscoveryEvent_Device value)?  device,TResult Function( RsDiscoveryEvent_Unreachable value)?  unreachable,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RsDiscoveryEvent_Device() when device != null:
return device(_that);case RsDiscoveryEvent_Unreachable() when unreachable != null:
return unreachable(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RsDiscoveryEvent_Device value)  device,required TResult Function( RsDiscoveryEvent_Unreachable value)  unreachable,}){
final _that = this;
switch (_that) {
case RsDiscoveryEvent_Device():
return device(_that);case RsDiscoveryEvent_Unreachable():
return unreachable(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RsDiscoveryEvent_Device value)?  device,TResult? Function( RsDiscoveryEvent_Unreachable value)?  unreachable,}){
final _that = this;
switch (_that) {
case RsDiscoveryEvent_Device() when device != null:
return device(_that);case RsDiscoveryEvent_Unreachable() when unreachable != null:
return unreachable(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RsStoredDevice field0)?  device,TResult Function( RsStoredDevice device,  String error)?  unreachable,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RsDiscoveryEvent_Device() when device != null:
return device(_that.field0);case RsDiscoveryEvent_Unreachable() when unreachable != null:
return unreachable(_that.device,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RsStoredDevice field0)  device,required TResult Function( RsStoredDevice device,  String error)  unreachable,}) {final _that = this;
switch (_that) {
case RsDiscoveryEvent_Device():
return device(_that.field0);case RsDiscoveryEvent_Unreachable():
return unreachable(_that.device,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RsStoredDevice field0)?  device,TResult? Function( RsStoredDevice device,  String error)?  unreachable,}) {final _that = this;
switch (_that) {
case RsDiscoveryEvent_Device() when device != null:
return device(_that.field0);case RsDiscoveryEvent_Unreachable() when unreachable != null:
return unreachable(_that.device,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class RsDiscoveryEvent_Device extends RsDiscoveryEvent {
  const RsDiscoveryEvent_Device(this.field0): super._();
  

 final  RsStoredDevice field0;

/// Create a copy of RsDiscoveryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsDiscoveryEvent_DeviceCopyWith<RsDiscoveryEvent_Device> get copyWith => _$RsDiscoveryEvent_DeviceCopyWithImpl<RsDiscoveryEvent_Device>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsDiscoveryEvent_Device&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'RsDiscoveryEvent.device(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $RsDiscoveryEvent_DeviceCopyWith<$Res> implements $RsDiscoveryEventCopyWith<$Res> {
  factory $RsDiscoveryEvent_DeviceCopyWith(RsDiscoveryEvent_Device value, $Res Function(RsDiscoveryEvent_Device) _then) = _$RsDiscoveryEvent_DeviceCopyWithImpl;
@useResult
$Res call({
 RsStoredDevice field0
});




}
/// @nodoc
class _$RsDiscoveryEvent_DeviceCopyWithImpl<$Res>
    implements $RsDiscoveryEvent_DeviceCopyWith<$Res> {
  _$RsDiscoveryEvent_DeviceCopyWithImpl(this._self, this._then);

  final RsDiscoveryEvent_Device _self;
  final $Res Function(RsDiscoveryEvent_Device) _then;

/// Create a copy of RsDiscoveryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(RsDiscoveryEvent_Device(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as RsStoredDevice,
  ));
}


}

/// @nodoc


class RsDiscoveryEvent_Unreachable extends RsDiscoveryEvent {
  const RsDiscoveryEvent_Unreachable({required this.device, required this.error}): super._();
  

/// The merged state of the device, as its announcements claim it.
 final  RsStoredDevice device;
/// Why the most recent register request failed, for display.
 final  String error;

/// Create a copy of RsDiscoveryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsDiscoveryEvent_UnreachableCopyWith<RsDiscoveryEvent_Unreachable> get copyWith => _$RsDiscoveryEvent_UnreachableCopyWithImpl<RsDiscoveryEvent_Unreachable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsDiscoveryEvent_Unreachable&&(identical(other.device, device) || other.device == device)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,device,error);

@override
String toString() {
  return 'RsDiscoveryEvent.unreachable(device: $device, error: $error)';
}


}

/// @nodoc
abstract mixin class $RsDiscoveryEvent_UnreachableCopyWith<$Res> implements $RsDiscoveryEventCopyWith<$Res> {
  factory $RsDiscoveryEvent_UnreachableCopyWith(RsDiscoveryEvent_Unreachable value, $Res Function(RsDiscoveryEvent_Unreachable) _then) = _$RsDiscoveryEvent_UnreachableCopyWithImpl;
@useResult
$Res call({
 RsStoredDevice device, String error
});




}
/// @nodoc
class _$RsDiscoveryEvent_UnreachableCopyWithImpl<$Res>
    implements $RsDiscoveryEvent_UnreachableCopyWith<$Res> {
  _$RsDiscoveryEvent_UnreachableCopyWithImpl(this._self, this._then);

  final RsDiscoveryEvent_Unreachable _self;
  final $Res Function(RsDiscoveryEvent_Unreachable) _then;

/// Create a copy of RsDiscoveryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? device = null,Object? error = null,}) {
  return _then(RsDiscoveryEvent_Unreachable(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as RsStoredDevice,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
