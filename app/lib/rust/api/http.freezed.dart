// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RsHttpClientError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsHttpClientError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RsHttpClientError()';
}


}

/// @nodoc
class $RsHttpClientErrorCopyWith<$Res>  {
$RsHttpClientErrorCopyWith(RsHttpClientError _, $Res Function(RsHttpClientError) __);
}


/// Adds pattern-matching-related methods to [RsHttpClientError].
extension RsHttpClientErrorPatterns on RsHttpClientError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RsHttpClientError_StatusCode value)?  statusCode,TResult Function( RsHttpClientError_Reqwest value)?  reqwest,TResult Function( RsHttpClientError_Json value)?  json,TResult Function( RsHttpClientError_Io value)?  io,TResult Function( RsHttpClientError_Other value)?  other,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RsHttpClientError_StatusCode() when statusCode != null:
return statusCode(_that);case RsHttpClientError_Reqwest() when reqwest != null:
return reqwest(_that);case RsHttpClientError_Json() when json != null:
return json(_that);case RsHttpClientError_Io() when io != null:
return io(_that);case RsHttpClientError_Other() when other != null:
return other(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RsHttpClientError_StatusCode value)  statusCode,required TResult Function( RsHttpClientError_Reqwest value)  reqwest,required TResult Function( RsHttpClientError_Json value)  json,required TResult Function( RsHttpClientError_Io value)  io,required TResult Function( RsHttpClientError_Other value)  other,}){
final _that = this;
switch (_that) {
case RsHttpClientError_StatusCode():
return statusCode(_that);case RsHttpClientError_Reqwest():
return reqwest(_that);case RsHttpClientError_Json():
return json(_that);case RsHttpClientError_Io():
return io(_that);case RsHttpClientError_Other():
return other(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RsHttpClientError_StatusCode value)?  statusCode,TResult? Function( RsHttpClientError_Reqwest value)?  reqwest,TResult? Function( RsHttpClientError_Json value)?  json,TResult? Function( RsHttpClientError_Io value)?  io,TResult? Function( RsHttpClientError_Other value)?  other,}){
final _that = this;
switch (_that) {
case RsHttpClientError_StatusCode() when statusCode != null:
return statusCode(_that);case RsHttpClientError_Reqwest() when reqwest != null:
return reqwest(_that);case RsHttpClientError_Json() when json != null:
return json(_that);case RsHttpClientError_Io() when io != null:
return io(_that);case RsHttpClientError_Other() when other != null:
return other(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int status,  String? message)?  statusCode,TResult Function( String field0)?  reqwest,TResult Function( String field0)?  json,TResult Function( String field0)?  io,TResult Function( String field0)?  other,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RsHttpClientError_StatusCode() when statusCode != null:
return statusCode(_that.status,_that.message);case RsHttpClientError_Reqwest() when reqwest != null:
return reqwest(_that.field0);case RsHttpClientError_Json() when json != null:
return json(_that.field0);case RsHttpClientError_Io() when io != null:
return io(_that.field0);case RsHttpClientError_Other() when other != null:
return other(_that.field0);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int status,  String? message)  statusCode,required TResult Function( String field0)  reqwest,required TResult Function( String field0)  json,required TResult Function( String field0)  io,required TResult Function( String field0)  other,}) {final _that = this;
switch (_that) {
case RsHttpClientError_StatusCode():
return statusCode(_that.status,_that.message);case RsHttpClientError_Reqwest():
return reqwest(_that.field0);case RsHttpClientError_Json():
return json(_that.field0);case RsHttpClientError_Io():
return io(_that.field0);case RsHttpClientError_Other():
return other(_that.field0);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int status,  String? message)?  statusCode,TResult? Function( String field0)?  reqwest,TResult? Function( String field0)?  json,TResult? Function( String field0)?  io,TResult? Function( String field0)?  other,}) {final _that = this;
switch (_that) {
case RsHttpClientError_StatusCode() when statusCode != null:
return statusCode(_that.status,_that.message);case RsHttpClientError_Reqwest() when reqwest != null:
return reqwest(_that.field0);case RsHttpClientError_Json() when json != null:
return json(_that.field0);case RsHttpClientError_Io() when io != null:
return io(_that.field0);case RsHttpClientError_Other() when other != null:
return other(_that.field0);case _:
  return null;

}
}

}

/// @nodoc


class RsHttpClientError_StatusCode extends RsHttpClientError {
  const RsHttpClientError_StatusCode({required this.status, this.message}): super._();
  

 final  int status;
 final  String? message;

/// Create a copy of RsHttpClientError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsHttpClientError_StatusCodeCopyWith<RsHttpClientError_StatusCode> get copyWith => _$RsHttpClientError_StatusCodeCopyWithImpl<RsHttpClientError_StatusCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsHttpClientError_StatusCode&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,message);

@override
String toString() {
  return 'RsHttpClientError.statusCode(status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $RsHttpClientError_StatusCodeCopyWith<$Res> implements $RsHttpClientErrorCopyWith<$Res> {
  factory $RsHttpClientError_StatusCodeCopyWith(RsHttpClientError_StatusCode value, $Res Function(RsHttpClientError_StatusCode) _then) = _$RsHttpClientError_StatusCodeCopyWithImpl;
@useResult
$Res call({
 int status, String? message
});




}
/// @nodoc
class _$RsHttpClientError_StatusCodeCopyWithImpl<$Res>
    implements $RsHttpClientError_StatusCodeCopyWith<$Res> {
  _$RsHttpClientError_StatusCodeCopyWithImpl(this._self, this._then);

  final RsHttpClientError_StatusCode _self;
  final $Res Function(RsHttpClientError_StatusCode) _then;

/// Create a copy of RsHttpClientError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = freezed,}) {
  return _then(RsHttpClientError_StatusCode(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class RsHttpClientError_Reqwest extends RsHttpClientError {
  const RsHttpClientError_Reqwest(this.field0): super._();
  

 final  String field0;

/// Create a copy of RsHttpClientError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsHttpClientError_ReqwestCopyWith<RsHttpClientError_Reqwest> get copyWith => _$RsHttpClientError_ReqwestCopyWithImpl<RsHttpClientError_Reqwest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsHttpClientError_Reqwest&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'RsHttpClientError.reqwest(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $RsHttpClientError_ReqwestCopyWith<$Res> implements $RsHttpClientErrorCopyWith<$Res> {
  factory $RsHttpClientError_ReqwestCopyWith(RsHttpClientError_Reqwest value, $Res Function(RsHttpClientError_Reqwest) _then) = _$RsHttpClientError_ReqwestCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$RsHttpClientError_ReqwestCopyWithImpl<$Res>
    implements $RsHttpClientError_ReqwestCopyWith<$Res> {
  _$RsHttpClientError_ReqwestCopyWithImpl(this._self, this._then);

  final RsHttpClientError_Reqwest _self;
  final $Res Function(RsHttpClientError_Reqwest) _then;

/// Create a copy of RsHttpClientError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(RsHttpClientError_Reqwest(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RsHttpClientError_Json extends RsHttpClientError {
  const RsHttpClientError_Json(this.field0): super._();
  

 final  String field0;

/// Create a copy of RsHttpClientError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsHttpClientError_JsonCopyWith<RsHttpClientError_Json> get copyWith => _$RsHttpClientError_JsonCopyWithImpl<RsHttpClientError_Json>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsHttpClientError_Json&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'RsHttpClientError.json(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $RsHttpClientError_JsonCopyWith<$Res> implements $RsHttpClientErrorCopyWith<$Res> {
  factory $RsHttpClientError_JsonCopyWith(RsHttpClientError_Json value, $Res Function(RsHttpClientError_Json) _then) = _$RsHttpClientError_JsonCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$RsHttpClientError_JsonCopyWithImpl<$Res>
    implements $RsHttpClientError_JsonCopyWith<$Res> {
  _$RsHttpClientError_JsonCopyWithImpl(this._self, this._then);

  final RsHttpClientError_Json _self;
  final $Res Function(RsHttpClientError_Json) _then;

/// Create a copy of RsHttpClientError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(RsHttpClientError_Json(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RsHttpClientError_Io extends RsHttpClientError {
  const RsHttpClientError_Io(this.field0): super._();
  

 final  String field0;

/// Create a copy of RsHttpClientError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsHttpClientError_IoCopyWith<RsHttpClientError_Io> get copyWith => _$RsHttpClientError_IoCopyWithImpl<RsHttpClientError_Io>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsHttpClientError_Io&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'RsHttpClientError.io(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $RsHttpClientError_IoCopyWith<$Res> implements $RsHttpClientErrorCopyWith<$Res> {
  factory $RsHttpClientError_IoCopyWith(RsHttpClientError_Io value, $Res Function(RsHttpClientError_Io) _then) = _$RsHttpClientError_IoCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$RsHttpClientError_IoCopyWithImpl<$Res>
    implements $RsHttpClientError_IoCopyWith<$Res> {
  _$RsHttpClientError_IoCopyWithImpl(this._self, this._then);

  final RsHttpClientError_Io _self;
  final $Res Function(RsHttpClientError_Io) _then;

/// Create a copy of RsHttpClientError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(RsHttpClientError_Io(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RsHttpClientError_Other extends RsHttpClientError {
  const RsHttpClientError_Other(this.field0): super._();
  

 final  String field0;

/// Create a copy of RsHttpClientError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsHttpClientError_OtherCopyWith<RsHttpClientError_Other> get copyWith => _$RsHttpClientError_OtherCopyWithImpl<RsHttpClientError_Other>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsHttpClientError_Other&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'RsHttpClientError.other(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $RsHttpClientError_OtherCopyWith<$Res> implements $RsHttpClientErrorCopyWith<$Res> {
  factory $RsHttpClientError_OtherCopyWith(RsHttpClientError_Other value, $Res Function(RsHttpClientError_Other) _then) = _$RsHttpClientError_OtherCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$RsHttpClientError_OtherCopyWithImpl<$Res>
    implements $RsHttpClientError_OtherCopyWith<$Res> {
  _$RsHttpClientError_OtherCopyWithImpl(this._self, this._then);

  final RsHttpClientError_Other _self;
  final $Res Function(RsHttpClientError_Other) _then;

/// Create a copy of RsHttpClientError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(RsHttpClientError_Other(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
