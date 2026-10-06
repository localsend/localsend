// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RsHashFileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsHashFileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RsHashFileEvent()';
}


}

/// @nodoc
class $RsHashFileEventCopyWith<$Res>  {
$RsHashFileEventCopyWith(RsHashFileEvent _, $Res Function(RsHashFileEvent) __);
}


/// Adds pattern-matching-related methods to [RsHashFileEvent].
extension RsHashFileEventPatterns on RsHashFileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RsHashFileEvent_Progress value)?  progress,TResult Function( RsHashFileEvent_Done value)?  done,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RsHashFileEvent_Progress() when progress != null:
return progress(_that);case RsHashFileEvent_Done() when done != null:
return done(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RsHashFileEvent_Progress value)  progress,required TResult Function( RsHashFileEvent_Done value)  done,}){
final _that = this;
switch (_that) {
case RsHashFileEvent_Progress():
return progress(_that);case RsHashFileEvent_Done():
return done(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RsHashFileEvent_Progress value)?  progress,TResult? Function( RsHashFileEvent_Done value)?  done,}){
final _that = this;
switch (_that) {
case RsHashFileEvent_Progress() when progress != null:
return progress(_that);case RsHashFileEvent_Done() when done != null:
return done(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( BigInt bytes)?  progress,TResult Function( String hash)?  done,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RsHashFileEvent_Progress() when progress != null:
return progress(_that.bytes);case RsHashFileEvent_Done() when done != null:
return done(_that.hash);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( BigInt bytes)  progress,required TResult Function( String hash)  done,}) {final _that = this;
switch (_that) {
case RsHashFileEvent_Progress():
return progress(_that.bytes);case RsHashFileEvent_Done():
return done(_that.hash);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( BigInt bytes)?  progress,TResult? Function( String hash)?  done,}) {final _that = this;
switch (_that) {
case RsHashFileEvent_Progress() when progress != null:
return progress(_that.bytes);case RsHashFileEvent_Done() when done != null:
return done(_that.hash);case _:
  return null;

}
}

}

/// @nodoc


class RsHashFileEvent_Progress extends RsHashFileEvent {
  const RsHashFileEvent_Progress({required this.bytes}): super._();
  

 final  BigInt bytes;

/// Create a copy of RsHashFileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsHashFileEvent_ProgressCopyWith<RsHashFileEvent_Progress> get copyWith => _$RsHashFileEvent_ProgressCopyWithImpl<RsHashFileEvent_Progress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsHashFileEvent_Progress&&(identical(other.bytes, bytes) || other.bytes == bytes));
}


@override
int get hashCode => Object.hash(runtimeType,bytes);

@override
String toString() {
  return 'RsHashFileEvent.progress(bytes: $bytes)';
}


}

/// @nodoc
abstract mixin class $RsHashFileEvent_ProgressCopyWith<$Res> implements $RsHashFileEventCopyWith<$Res> {
  factory $RsHashFileEvent_ProgressCopyWith(RsHashFileEvent_Progress value, $Res Function(RsHashFileEvent_Progress) _then) = _$RsHashFileEvent_ProgressCopyWithImpl;
@useResult
$Res call({
 BigInt bytes
});




}
/// @nodoc
class _$RsHashFileEvent_ProgressCopyWithImpl<$Res>
    implements $RsHashFileEvent_ProgressCopyWith<$Res> {
  _$RsHashFileEvent_ProgressCopyWithImpl(this._self, this._then);

  final RsHashFileEvent_Progress _self;
  final $Res Function(RsHashFileEvent_Progress) _then;

/// Create a copy of RsHashFileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bytes = null,}) {
  return _then(RsHashFileEvent_Progress(
bytes: null == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as BigInt,
  ));
}


}

/// @nodoc


class RsHashFileEvent_Done extends RsHashFileEvent {
  const RsHashFileEvent_Done({required this.hash}): super._();
  

 final  String hash;

/// Create a copy of RsHashFileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsHashFileEvent_DoneCopyWith<RsHashFileEvent_Done> get copyWith => _$RsHashFileEvent_DoneCopyWithImpl<RsHashFileEvent_Done>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsHashFileEvent_Done&&(identical(other.hash, hash) || other.hash == hash));
}


@override
int get hashCode => Object.hash(runtimeType,hash);

@override
String toString() {
  return 'RsHashFileEvent.done(hash: $hash)';
}


}

/// @nodoc
abstract mixin class $RsHashFileEvent_DoneCopyWith<$Res> implements $RsHashFileEventCopyWith<$Res> {
  factory $RsHashFileEvent_DoneCopyWith(RsHashFileEvent_Done value, $Res Function(RsHashFileEvent_Done) _then) = _$RsHashFileEvent_DoneCopyWithImpl;
@useResult
$Res call({
 String hash
});




}
/// @nodoc
class _$RsHashFileEvent_DoneCopyWithImpl<$Res>
    implements $RsHashFileEvent_DoneCopyWith<$Res> {
  _$RsHashFileEvent_DoneCopyWithImpl(this._self, this._then);

  final RsHashFileEvent_Done _self;
  final $Res Function(RsHashFileEvent_Done) _then;

/// Create a copy of RsHashFileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hash = null,}) {
  return _then(RsHashFileEvent_Done(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
