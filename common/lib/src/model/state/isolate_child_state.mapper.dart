// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'isolate_child_state.dart';

class IsolateChildStateMapper extends ClassMapperBase<IsolateChildState> {
  IsolateChildStateMapper._();

  static IsolateChildStateMapper? _instance;
  static IsolateChildStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IsolateChildStateMapper._());
      IsolateCommonStateMapper.ensureInitialized();
      IsolateStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IsolateChildState';

  static IsolateCommonState _$commonState(IsolateChildState v) => v.commonState;
  static const Field<IsolateChildState, IsolateCommonState> _f$commonState =
      Field('commonState', _$commonState);
  static IsolateState _$isolateState(IsolateChildState v) => v.isolateState;
  static const Field<IsolateChildState, IsolateState> _f$isolateState =
      Field('isolateState', _$isolateState);

  @override
  final Map<Symbol, Field<IsolateChildState, dynamic>> fields = const {
    #commonState: _f$commonState,
    #isolateState: _f$isolateState,
  };

  static IsolateChildState _instantiate(DecodingData data) {
    return IsolateChildState(
        commonState: data.dec(_f$commonState),
        isolateState: data.dec(_f$isolateState));
  }

  @override
  final Function instantiate = _instantiate;

  static IsolateChildState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IsolateChildState>(map);
  }

  static IsolateChildState deserialize(String json) {
    return ensureInitialized().decodeJson<IsolateChildState>(json);
  }
}

mixin IsolateChildStateMappable {
  String serialize() {
    return IsolateChildStateMapper.ensureInitialized()
        .encodeJson<IsolateChildState>(this as IsolateChildState);
  }

  Map<String, dynamic> toJson() {
    return IsolateChildStateMapper.ensureInitialized()
        .encodeMap<IsolateChildState>(this as IsolateChildState);
  }

  IsolateChildStateCopyWith<IsolateChildState, IsolateChildState,
          IsolateChildState>
      get copyWith => _IsolateChildStateCopyWithImpl(
          this as IsolateChildState, $identity, $identity);
  @override
  String toString() {
    return IsolateChildStateMapper.ensureInitialized()
        .stringifyValue(this as IsolateChildState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IsolateChildStateMapper.ensureInitialized()
                .isValueEqual(this as IsolateChildState, other));
  }

  @override
  int get hashCode {
    return IsolateChildStateMapper.ensureInitialized()
        .hashValue(this as IsolateChildState);
  }
}

extension IsolateChildStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IsolateChildState, $Out> {
  IsolateChildStateCopyWith<$R, IsolateChildState, $Out>
      get $asIsolateChildState =>
          $base.as((v, t, t2) => _IsolateChildStateCopyWithImpl(v, t, t2));
}

abstract class IsolateChildStateCopyWith<$R, $In extends IsolateChildState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  IsolateCommonStateCopyWith<$R, IsolateCommonState, IsolateCommonState>
      get commonState;
  IsolateStateCopyWith<$R, IsolateState, IsolateState> get isolateState;
  $R call({IsolateCommonState? commonState, IsolateState? isolateState});
  IsolateChildStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IsolateChildStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IsolateChildState, $Out>
    implements IsolateChildStateCopyWith<$R, IsolateChildState, $Out> {
  _IsolateChildStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IsolateChildState> $mapper =
      IsolateChildStateMapper.ensureInitialized();
  @override
  IsolateCommonStateCopyWith<$R, IsolateCommonState, IsolateCommonState>
      get commonState =>
          $value.commonState.copyWith.$chain((v) => call(commonState: v));
  @override
  IsolateStateCopyWith<$R, IsolateState, IsolateState> get isolateState =>
      $value.isolateState.copyWith.$chain((v) => call(isolateState: v));
  @override
  $R call({IsolateCommonState? commonState, IsolateState? isolateState}) =>
      $apply(FieldCopyWithData({
        if (commonState != null) #commonState: commonState,
        if (isolateState != null) #isolateState: isolateState
      }));
  @override
  IsolateChildState $make(CopyWithData data) => IsolateChildState(
      commonState: data.get(#commonState, or: $value.commonState),
      isolateState: data.get(#isolateState, or: $value.isolateState));

  @override
  IsolateChildStateCopyWith<$R2, IsolateChildState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IsolateChildStateCopyWithImpl($value, $cast, t);
}
