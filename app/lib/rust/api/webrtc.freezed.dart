// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webrtc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WsServerMessage {
  Object get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WsServerHelloMessage field0) hello,
    required TResult Function(WsServerJoinedMessage field0) joined,
    required TResult Function(WsServerLeftMessage field0) left,
    required TResult Function(WsServerOfferMessage field0) offer,
    required TResult Function(WsServerAnswerMessage field0) answer,
    required TResult Function(WsServerErrorMessage field0) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(WsServerHelloMessage field0)? hello,
    TResult? Function(WsServerJoinedMessage field0)? joined,
    TResult? Function(WsServerLeftMessage field0)? left,
    TResult? Function(WsServerOfferMessage field0)? offer,
    TResult? Function(WsServerAnswerMessage field0)? answer,
    TResult? Function(WsServerErrorMessage field0)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WsServerHelloMessage field0)? hello,
    TResult Function(WsServerJoinedMessage field0)? joined,
    TResult Function(WsServerLeftMessage field0)? left,
    TResult Function(WsServerOfferMessage field0)? offer,
    TResult Function(WsServerAnswerMessage field0)? answer,
    TResult Function(WsServerErrorMessage field0)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WsServerMessage_Hello value) hello,
    required TResult Function(WsServerMessage_Joined value) joined,
    required TResult Function(WsServerMessage_Left value) left,
    required TResult Function(WsServerMessage_Offer value) offer,
    required TResult Function(WsServerMessage_Answer value) answer,
    required TResult Function(WsServerMessage_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WsServerMessage_Hello value)? hello,
    TResult? Function(WsServerMessage_Joined value)? joined,
    TResult? Function(WsServerMessage_Left value)? left,
    TResult? Function(WsServerMessage_Offer value)? offer,
    TResult? Function(WsServerMessage_Answer value)? answer,
    TResult? Function(WsServerMessage_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WsServerMessage_Hello value)? hello,
    TResult Function(WsServerMessage_Joined value)? joined,
    TResult Function(WsServerMessage_Left value)? left,
    TResult Function(WsServerMessage_Offer value)? offer,
    TResult Function(WsServerMessage_Answer value)? answer,
    TResult Function(WsServerMessage_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WsServerMessageCopyWith<$Res> {
  factory $WsServerMessageCopyWith(WsServerMessage value, $Res Function(WsServerMessage) then) = _$WsServerMessageCopyWithImpl<$Res, WsServerMessage>;
}

/// @nodoc
class _$WsServerMessageCopyWithImpl<$Res, $Val extends WsServerMessage> implements $WsServerMessageCopyWith<$Res> {
  _$WsServerMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WsServerMessage_HelloImplCopyWith<$Res> {
  factory _$$WsServerMessage_HelloImplCopyWith(_$WsServerMessage_HelloImpl value, $Res Function(_$WsServerMessage_HelloImpl) then) =
      __$$WsServerMessage_HelloImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WsServerHelloMessage field0});
}

/// @nodoc
class __$$WsServerMessage_HelloImplCopyWithImpl<$Res> extends _$WsServerMessageCopyWithImpl<$Res, _$WsServerMessage_HelloImpl>
    implements _$$WsServerMessage_HelloImplCopyWith<$Res> {
  __$$WsServerMessage_HelloImplCopyWithImpl(_$WsServerMessage_HelloImpl _value, $Res Function(_$WsServerMessage_HelloImpl) _then)
      : super(_value, _then);

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$WsServerMessage_HelloImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as WsServerHelloMessage,
    ));
  }
}

/// @nodoc

class _$WsServerMessage_HelloImpl extends WsServerMessage_Hello {
  const _$WsServerMessage_HelloImpl(this.field0) : super._();

  @override
  final WsServerHelloMessage field0;

  @override
  String toString() {
    return 'WsServerMessage.hello(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WsServerMessage_HelloImpl && (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WsServerMessage_HelloImplCopyWith<_$WsServerMessage_HelloImpl> get copyWith =>
      __$$WsServerMessage_HelloImplCopyWithImpl<_$WsServerMessage_HelloImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WsServerHelloMessage field0) hello,
    required TResult Function(WsServerJoinedMessage field0) joined,
    required TResult Function(WsServerLeftMessage field0) left,
    required TResult Function(WsServerOfferMessage field0) offer,
    required TResult Function(WsServerAnswerMessage field0) answer,
    required TResult Function(WsServerErrorMessage field0) error,
  }) {
    return hello(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(WsServerHelloMessage field0)? hello,
    TResult? Function(WsServerJoinedMessage field0)? joined,
    TResult? Function(WsServerLeftMessage field0)? left,
    TResult? Function(WsServerOfferMessage field0)? offer,
    TResult? Function(WsServerAnswerMessage field0)? answer,
    TResult? Function(WsServerErrorMessage field0)? error,
  }) {
    return hello?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WsServerHelloMessage field0)? hello,
    TResult Function(WsServerJoinedMessage field0)? joined,
    TResult Function(WsServerLeftMessage field0)? left,
    TResult Function(WsServerOfferMessage field0)? offer,
    TResult Function(WsServerAnswerMessage field0)? answer,
    TResult Function(WsServerErrorMessage field0)? error,
    required TResult orElse(),
  }) {
    if (hello != null) {
      return hello(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WsServerMessage_Hello value) hello,
    required TResult Function(WsServerMessage_Joined value) joined,
    required TResult Function(WsServerMessage_Left value) left,
    required TResult Function(WsServerMessage_Offer value) offer,
    required TResult Function(WsServerMessage_Answer value) answer,
    required TResult Function(WsServerMessage_Error value) error,
  }) {
    return hello(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WsServerMessage_Hello value)? hello,
    TResult? Function(WsServerMessage_Joined value)? joined,
    TResult? Function(WsServerMessage_Left value)? left,
    TResult? Function(WsServerMessage_Offer value)? offer,
    TResult? Function(WsServerMessage_Answer value)? answer,
    TResult? Function(WsServerMessage_Error value)? error,
  }) {
    return hello?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WsServerMessage_Hello value)? hello,
    TResult Function(WsServerMessage_Joined value)? joined,
    TResult Function(WsServerMessage_Left value)? left,
    TResult Function(WsServerMessage_Offer value)? offer,
    TResult Function(WsServerMessage_Answer value)? answer,
    TResult Function(WsServerMessage_Error value)? error,
    required TResult orElse(),
  }) {
    if (hello != null) {
      return hello(this);
    }
    return orElse();
  }
}

abstract class WsServerMessage_Hello extends WsServerMessage {
  const factory WsServerMessage_Hello(final WsServerHelloMessage field0) = _$WsServerMessage_HelloImpl;
  const WsServerMessage_Hello._() : super._();

  @override
  WsServerHelloMessage get field0;

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WsServerMessage_HelloImplCopyWith<_$WsServerMessage_HelloImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WsServerMessage_JoinedImplCopyWith<$Res> {
  factory _$$WsServerMessage_JoinedImplCopyWith(_$WsServerMessage_JoinedImpl value, $Res Function(_$WsServerMessage_JoinedImpl) then) =
      __$$WsServerMessage_JoinedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WsServerJoinedMessage field0});
}

/// @nodoc
class __$$WsServerMessage_JoinedImplCopyWithImpl<$Res> extends _$WsServerMessageCopyWithImpl<$Res, _$WsServerMessage_JoinedImpl>
    implements _$$WsServerMessage_JoinedImplCopyWith<$Res> {
  __$$WsServerMessage_JoinedImplCopyWithImpl(_$WsServerMessage_JoinedImpl _value, $Res Function(_$WsServerMessage_JoinedImpl) _then)
      : super(_value, _then);

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$WsServerMessage_JoinedImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as WsServerJoinedMessage,
    ));
  }
}

/// @nodoc

class _$WsServerMessage_JoinedImpl extends WsServerMessage_Joined {
  const _$WsServerMessage_JoinedImpl(this.field0) : super._();

  @override
  final WsServerJoinedMessage field0;

  @override
  String toString() {
    return 'WsServerMessage.joined(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WsServerMessage_JoinedImpl && (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WsServerMessage_JoinedImplCopyWith<_$WsServerMessage_JoinedImpl> get copyWith =>
      __$$WsServerMessage_JoinedImplCopyWithImpl<_$WsServerMessage_JoinedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WsServerHelloMessage field0) hello,
    required TResult Function(WsServerJoinedMessage field0) joined,
    required TResult Function(WsServerLeftMessage field0) left,
    required TResult Function(WsServerOfferMessage field0) offer,
    required TResult Function(WsServerAnswerMessage field0) answer,
    required TResult Function(WsServerErrorMessage field0) error,
  }) {
    return joined(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(WsServerHelloMessage field0)? hello,
    TResult? Function(WsServerJoinedMessage field0)? joined,
    TResult? Function(WsServerLeftMessage field0)? left,
    TResult? Function(WsServerOfferMessage field0)? offer,
    TResult? Function(WsServerAnswerMessage field0)? answer,
    TResult? Function(WsServerErrorMessage field0)? error,
  }) {
    return joined?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WsServerHelloMessage field0)? hello,
    TResult Function(WsServerJoinedMessage field0)? joined,
    TResult Function(WsServerLeftMessage field0)? left,
    TResult Function(WsServerOfferMessage field0)? offer,
    TResult Function(WsServerAnswerMessage field0)? answer,
    TResult Function(WsServerErrorMessage field0)? error,
    required TResult orElse(),
  }) {
    if (joined != null) {
      return joined(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WsServerMessage_Hello value) hello,
    required TResult Function(WsServerMessage_Joined value) joined,
    required TResult Function(WsServerMessage_Left value) left,
    required TResult Function(WsServerMessage_Offer value) offer,
    required TResult Function(WsServerMessage_Answer value) answer,
    required TResult Function(WsServerMessage_Error value) error,
  }) {
    return joined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WsServerMessage_Hello value)? hello,
    TResult? Function(WsServerMessage_Joined value)? joined,
    TResult? Function(WsServerMessage_Left value)? left,
    TResult? Function(WsServerMessage_Offer value)? offer,
    TResult? Function(WsServerMessage_Answer value)? answer,
    TResult? Function(WsServerMessage_Error value)? error,
  }) {
    return joined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WsServerMessage_Hello value)? hello,
    TResult Function(WsServerMessage_Joined value)? joined,
    TResult Function(WsServerMessage_Left value)? left,
    TResult Function(WsServerMessage_Offer value)? offer,
    TResult Function(WsServerMessage_Answer value)? answer,
    TResult Function(WsServerMessage_Error value)? error,
    required TResult orElse(),
  }) {
    if (joined != null) {
      return joined(this);
    }
    return orElse();
  }
}

abstract class WsServerMessage_Joined extends WsServerMessage {
  const factory WsServerMessage_Joined(final WsServerJoinedMessage field0) = _$WsServerMessage_JoinedImpl;
  const WsServerMessage_Joined._() : super._();

  @override
  WsServerJoinedMessage get field0;

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WsServerMessage_JoinedImplCopyWith<_$WsServerMessage_JoinedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WsServerMessage_LeftImplCopyWith<$Res> {
  factory _$$WsServerMessage_LeftImplCopyWith(_$WsServerMessage_LeftImpl value, $Res Function(_$WsServerMessage_LeftImpl) then) =
      __$$WsServerMessage_LeftImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WsServerLeftMessage field0});
}

/// @nodoc
class __$$WsServerMessage_LeftImplCopyWithImpl<$Res> extends _$WsServerMessageCopyWithImpl<$Res, _$WsServerMessage_LeftImpl>
    implements _$$WsServerMessage_LeftImplCopyWith<$Res> {
  __$$WsServerMessage_LeftImplCopyWithImpl(_$WsServerMessage_LeftImpl _value, $Res Function(_$WsServerMessage_LeftImpl) _then) : super(_value, _then);

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$WsServerMessage_LeftImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as WsServerLeftMessage,
    ));
  }
}

/// @nodoc

class _$WsServerMessage_LeftImpl extends WsServerMessage_Left {
  const _$WsServerMessage_LeftImpl(this.field0) : super._();

  @override
  final WsServerLeftMessage field0;

  @override
  String toString() {
    return 'WsServerMessage.left(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WsServerMessage_LeftImpl && (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WsServerMessage_LeftImplCopyWith<_$WsServerMessage_LeftImpl> get copyWith =>
      __$$WsServerMessage_LeftImplCopyWithImpl<_$WsServerMessage_LeftImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WsServerHelloMessage field0) hello,
    required TResult Function(WsServerJoinedMessage field0) joined,
    required TResult Function(WsServerLeftMessage field0) left,
    required TResult Function(WsServerOfferMessage field0) offer,
    required TResult Function(WsServerAnswerMessage field0) answer,
    required TResult Function(WsServerErrorMessage field0) error,
  }) {
    return left(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(WsServerHelloMessage field0)? hello,
    TResult? Function(WsServerJoinedMessage field0)? joined,
    TResult? Function(WsServerLeftMessage field0)? left,
    TResult? Function(WsServerOfferMessage field0)? offer,
    TResult? Function(WsServerAnswerMessage field0)? answer,
    TResult? Function(WsServerErrorMessage field0)? error,
  }) {
    return left?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WsServerHelloMessage field0)? hello,
    TResult Function(WsServerJoinedMessage field0)? joined,
    TResult Function(WsServerLeftMessage field0)? left,
    TResult Function(WsServerOfferMessage field0)? offer,
    TResult Function(WsServerAnswerMessage field0)? answer,
    TResult Function(WsServerErrorMessage field0)? error,
    required TResult orElse(),
  }) {
    if (left != null) {
      return left(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WsServerMessage_Hello value) hello,
    required TResult Function(WsServerMessage_Joined value) joined,
    required TResult Function(WsServerMessage_Left value) left,
    required TResult Function(WsServerMessage_Offer value) offer,
    required TResult Function(WsServerMessage_Answer value) answer,
    required TResult Function(WsServerMessage_Error value) error,
  }) {
    return left(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WsServerMessage_Hello value)? hello,
    TResult? Function(WsServerMessage_Joined value)? joined,
    TResult? Function(WsServerMessage_Left value)? left,
    TResult? Function(WsServerMessage_Offer value)? offer,
    TResult? Function(WsServerMessage_Answer value)? answer,
    TResult? Function(WsServerMessage_Error value)? error,
  }) {
    return left?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WsServerMessage_Hello value)? hello,
    TResult Function(WsServerMessage_Joined value)? joined,
    TResult Function(WsServerMessage_Left value)? left,
    TResult Function(WsServerMessage_Offer value)? offer,
    TResult Function(WsServerMessage_Answer value)? answer,
    TResult Function(WsServerMessage_Error value)? error,
    required TResult orElse(),
  }) {
    if (left != null) {
      return left(this);
    }
    return orElse();
  }
}

abstract class WsServerMessage_Left extends WsServerMessage {
  const factory WsServerMessage_Left(final WsServerLeftMessage field0) = _$WsServerMessage_LeftImpl;
  const WsServerMessage_Left._() : super._();

  @override
  WsServerLeftMessage get field0;

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WsServerMessage_LeftImplCopyWith<_$WsServerMessage_LeftImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WsServerMessage_OfferImplCopyWith<$Res> {
  factory _$$WsServerMessage_OfferImplCopyWith(_$WsServerMessage_OfferImpl value, $Res Function(_$WsServerMessage_OfferImpl) then) =
      __$$WsServerMessage_OfferImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WsServerOfferMessage field0});
}

/// @nodoc
class __$$WsServerMessage_OfferImplCopyWithImpl<$Res> extends _$WsServerMessageCopyWithImpl<$Res, _$WsServerMessage_OfferImpl>
    implements _$$WsServerMessage_OfferImplCopyWith<$Res> {
  __$$WsServerMessage_OfferImplCopyWithImpl(_$WsServerMessage_OfferImpl _value, $Res Function(_$WsServerMessage_OfferImpl) _then)
      : super(_value, _then);

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$WsServerMessage_OfferImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as WsServerOfferMessage,
    ));
  }
}

/// @nodoc

class _$WsServerMessage_OfferImpl extends WsServerMessage_Offer {
  const _$WsServerMessage_OfferImpl(this.field0) : super._();

  @override
  final WsServerOfferMessage field0;

  @override
  String toString() {
    return 'WsServerMessage.offer(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WsServerMessage_OfferImpl && (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WsServerMessage_OfferImplCopyWith<_$WsServerMessage_OfferImpl> get copyWith =>
      __$$WsServerMessage_OfferImplCopyWithImpl<_$WsServerMessage_OfferImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WsServerHelloMessage field0) hello,
    required TResult Function(WsServerJoinedMessage field0) joined,
    required TResult Function(WsServerLeftMessage field0) left,
    required TResult Function(WsServerOfferMessage field0) offer,
    required TResult Function(WsServerAnswerMessage field0) answer,
    required TResult Function(WsServerErrorMessage field0) error,
  }) {
    return offer(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(WsServerHelloMessage field0)? hello,
    TResult? Function(WsServerJoinedMessage field0)? joined,
    TResult? Function(WsServerLeftMessage field0)? left,
    TResult? Function(WsServerOfferMessage field0)? offer,
    TResult? Function(WsServerAnswerMessage field0)? answer,
    TResult? Function(WsServerErrorMessage field0)? error,
  }) {
    return offer?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WsServerHelloMessage field0)? hello,
    TResult Function(WsServerJoinedMessage field0)? joined,
    TResult Function(WsServerLeftMessage field0)? left,
    TResult Function(WsServerOfferMessage field0)? offer,
    TResult Function(WsServerAnswerMessage field0)? answer,
    TResult Function(WsServerErrorMessage field0)? error,
    required TResult orElse(),
  }) {
    if (offer != null) {
      return offer(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WsServerMessage_Hello value) hello,
    required TResult Function(WsServerMessage_Joined value) joined,
    required TResult Function(WsServerMessage_Left value) left,
    required TResult Function(WsServerMessage_Offer value) offer,
    required TResult Function(WsServerMessage_Answer value) answer,
    required TResult Function(WsServerMessage_Error value) error,
  }) {
    return offer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WsServerMessage_Hello value)? hello,
    TResult? Function(WsServerMessage_Joined value)? joined,
    TResult? Function(WsServerMessage_Left value)? left,
    TResult? Function(WsServerMessage_Offer value)? offer,
    TResult? Function(WsServerMessage_Answer value)? answer,
    TResult? Function(WsServerMessage_Error value)? error,
  }) {
    return offer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WsServerMessage_Hello value)? hello,
    TResult Function(WsServerMessage_Joined value)? joined,
    TResult Function(WsServerMessage_Left value)? left,
    TResult Function(WsServerMessage_Offer value)? offer,
    TResult Function(WsServerMessage_Answer value)? answer,
    TResult Function(WsServerMessage_Error value)? error,
    required TResult orElse(),
  }) {
    if (offer != null) {
      return offer(this);
    }
    return orElse();
  }
}

abstract class WsServerMessage_Offer extends WsServerMessage {
  const factory WsServerMessage_Offer(final WsServerOfferMessage field0) = _$WsServerMessage_OfferImpl;
  const WsServerMessage_Offer._() : super._();

  @override
  WsServerOfferMessage get field0;

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WsServerMessage_OfferImplCopyWith<_$WsServerMessage_OfferImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WsServerMessage_AnswerImplCopyWith<$Res> {
  factory _$$WsServerMessage_AnswerImplCopyWith(_$WsServerMessage_AnswerImpl value, $Res Function(_$WsServerMessage_AnswerImpl) then) =
      __$$WsServerMessage_AnswerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WsServerAnswerMessage field0});
}

/// @nodoc
class __$$WsServerMessage_AnswerImplCopyWithImpl<$Res> extends _$WsServerMessageCopyWithImpl<$Res, _$WsServerMessage_AnswerImpl>
    implements _$$WsServerMessage_AnswerImplCopyWith<$Res> {
  __$$WsServerMessage_AnswerImplCopyWithImpl(_$WsServerMessage_AnswerImpl _value, $Res Function(_$WsServerMessage_AnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$WsServerMessage_AnswerImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as WsServerAnswerMessage,
    ));
  }
}

/// @nodoc

class _$WsServerMessage_AnswerImpl extends WsServerMessage_Answer {
  const _$WsServerMessage_AnswerImpl(this.field0) : super._();

  @override
  final WsServerAnswerMessage field0;

  @override
  String toString() {
    return 'WsServerMessage.answer(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WsServerMessage_AnswerImpl && (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WsServerMessage_AnswerImplCopyWith<_$WsServerMessage_AnswerImpl> get copyWith =>
      __$$WsServerMessage_AnswerImplCopyWithImpl<_$WsServerMessage_AnswerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WsServerHelloMessage field0) hello,
    required TResult Function(WsServerJoinedMessage field0) joined,
    required TResult Function(WsServerLeftMessage field0) left,
    required TResult Function(WsServerOfferMessage field0) offer,
    required TResult Function(WsServerAnswerMessage field0) answer,
    required TResult Function(WsServerErrorMessage field0) error,
  }) {
    return answer(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(WsServerHelloMessage field0)? hello,
    TResult? Function(WsServerJoinedMessage field0)? joined,
    TResult? Function(WsServerLeftMessage field0)? left,
    TResult? Function(WsServerOfferMessage field0)? offer,
    TResult? Function(WsServerAnswerMessage field0)? answer,
    TResult? Function(WsServerErrorMessage field0)? error,
  }) {
    return answer?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WsServerHelloMessage field0)? hello,
    TResult Function(WsServerJoinedMessage field0)? joined,
    TResult Function(WsServerLeftMessage field0)? left,
    TResult Function(WsServerOfferMessage field0)? offer,
    TResult Function(WsServerAnswerMessage field0)? answer,
    TResult Function(WsServerErrorMessage field0)? error,
    required TResult orElse(),
  }) {
    if (answer != null) {
      return answer(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WsServerMessage_Hello value) hello,
    required TResult Function(WsServerMessage_Joined value) joined,
    required TResult Function(WsServerMessage_Left value) left,
    required TResult Function(WsServerMessage_Offer value) offer,
    required TResult Function(WsServerMessage_Answer value) answer,
    required TResult Function(WsServerMessage_Error value) error,
  }) {
    return answer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WsServerMessage_Hello value)? hello,
    TResult? Function(WsServerMessage_Joined value)? joined,
    TResult? Function(WsServerMessage_Left value)? left,
    TResult? Function(WsServerMessage_Offer value)? offer,
    TResult? Function(WsServerMessage_Answer value)? answer,
    TResult? Function(WsServerMessage_Error value)? error,
  }) {
    return answer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WsServerMessage_Hello value)? hello,
    TResult Function(WsServerMessage_Joined value)? joined,
    TResult Function(WsServerMessage_Left value)? left,
    TResult Function(WsServerMessage_Offer value)? offer,
    TResult Function(WsServerMessage_Answer value)? answer,
    TResult Function(WsServerMessage_Error value)? error,
    required TResult orElse(),
  }) {
    if (answer != null) {
      return answer(this);
    }
    return orElse();
  }
}

abstract class WsServerMessage_Answer extends WsServerMessage {
  const factory WsServerMessage_Answer(final WsServerAnswerMessage field0) = _$WsServerMessage_AnswerImpl;
  const WsServerMessage_Answer._() : super._();

  @override
  WsServerAnswerMessage get field0;

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WsServerMessage_AnswerImplCopyWith<_$WsServerMessage_AnswerImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WsServerMessage_ErrorImplCopyWith<$Res> {
  factory _$$WsServerMessage_ErrorImplCopyWith(_$WsServerMessage_ErrorImpl value, $Res Function(_$WsServerMessage_ErrorImpl) then) =
      __$$WsServerMessage_ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WsServerErrorMessage field0});
}

/// @nodoc
class __$$WsServerMessage_ErrorImplCopyWithImpl<$Res> extends _$WsServerMessageCopyWithImpl<$Res, _$WsServerMessage_ErrorImpl>
    implements _$$WsServerMessage_ErrorImplCopyWith<$Res> {
  __$$WsServerMessage_ErrorImplCopyWithImpl(_$WsServerMessage_ErrorImpl _value, $Res Function(_$WsServerMessage_ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$WsServerMessage_ErrorImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as WsServerErrorMessage,
    ));
  }
}

/// @nodoc

class _$WsServerMessage_ErrorImpl extends WsServerMessage_Error {
  const _$WsServerMessage_ErrorImpl(this.field0) : super._();

  @override
  final WsServerErrorMessage field0;

  @override
  String toString() {
    return 'WsServerMessage.error(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WsServerMessage_ErrorImpl && (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WsServerMessage_ErrorImplCopyWith<_$WsServerMessage_ErrorImpl> get copyWith =>
      __$$WsServerMessage_ErrorImplCopyWithImpl<_$WsServerMessage_ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WsServerHelloMessage field0) hello,
    required TResult Function(WsServerJoinedMessage field0) joined,
    required TResult Function(WsServerLeftMessage field0) left,
    required TResult Function(WsServerOfferMessage field0) offer,
    required TResult Function(WsServerAnswerMessage field0) answer,
    required TResult Function(WsServerErrorMessage field0) error,
  }) {
    return error(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(WsServerHelloMessage field0)? hello,
    TResult? Function(WsServerJoinedMessage field0)? joined,
    TResult? Function(WsServerLeftMessage field0)? left,
    TResult? Function(WsServerOfferMessage field0)? offer,
    TResult? Function(WsServerAnswerMessage field0)? answer,
    TResult? Function(WsServerErrorMessage field0)? error,
  }) {
    return error?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WsServerHelloMessage field0)? hello,
    TResult Function(WsServerJoinedMessage field0)? joined,
    TResult Function(WsServerLeftMessage field0)? left,
    TResult Function(WsServerOfferMessage field0)? offer,
    TResult Function(WsServerAnswerMessage field0)? answer,
    TResult Function(WsServerErrorMessage field0)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WsServerMessage_Hello value) hello,
    required TResult Function(WsServerMessage_Joined value) joined,
    required TResult Function(WsServerMessage_Left value) left,
    required TResult Function(WsServerMessage_Offer value) offer,
    required TResult Function(WsServerMessage_Answer value) answer,
    required TResult Function(WsServerMessage_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WsServerMessage_Hello value)? hello,
    TResult? Function(WsServerMessage_Joined value)? joined,
    TResult? Function(WsServerMessage_Left value)? left,
    TResult? Function(WsServerMessage_Offer value)? offer,
    TResult? Function(WsServerMessage_Answer value)? answer,
    TResult? Function(WsServerMessage_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WsServerMessage_Hello value)? hello,
    TResult Function(WsServerMessage_Joined value)? joined,
    TResult Function(WsServerMessage_Left value)? left,
    TResult Function(WsServerMessage_Offer value)? offer,
    TResult Function(WsServerMessage_Answer value)? answer,
    TResult Function(WsServerMessage_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class WsServerMessage_Error extends WsServerMessage {
  const factory WsServerMessage_Error(final WsServerErrorMessage field0) = _$WsServerMessage_ErrorImpl;
  const WsServerMessage_Error._() : super._();

  @override
  WsServerErrorMessage get field0;

  /// Create a copy of WsServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WsServerMessage_ErrorImplCopyWith<_$WsServerMessage_ErrorImpl> get copyWith => throw _privateConstructorUsedError;
}
