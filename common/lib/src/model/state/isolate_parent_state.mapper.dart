// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'isolate_parent_state.dart';

class IsolateParentStateMapper extends ClassMapperBase<IsolateParentState> {
  IsolateParentStateMapper._();

  static IsolateParentStateMapper? _instance;
  static IsolateParentStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IsolateParentStateMapper._());
      IsolateCommonStateMapper.ensureInitialized();
      IsolateRefStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IsolateParentState';

  static IsolateCommonState _$commonState(IsolateParentState v) =>
      v.commonState;
  static const Field<IsolateParentState, IsolateCommonState> _f$commonState =
      Field('commonState', _$commonState);
  static Map<int, IsolateRefState> _$isolateStates(IsolateParentState v) =>
      v.isolateStates;
  static const Field<IsolateParentState, Map<int, IsolateRefState>>
      _f$isolateStates = Field('isolateStates', _$isolateStates);

  @override
  final Map<Symbol, Field<IsolateParentState, dynamic>> fields = const {
    #commonState: _f$commonState,
    #isolateStates: _f$isolateStates,
  };

  static IsolateParentState _instantiate(DecodingData data) {
    return IsolateParentState(
        commonState: data.dec(_f$commonState),
        isolateStates: data.dec(_f$isolateStates));
  }

  @override
  final Function instantiate = _instantiate;

  static IsolateParentState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IsolateParentState>(map);
  }

  static IsolateParentState deserialize(String json) {
    return ensureInitialized().decodeJson<IsolateParentState>(json);
  }
}

mixin IsolateParentStateMappable {
  String serialize() {
    return IsolateParentStateMapper.ensureInitialized()
        .encodeJson<IsolateParentState>(this as IsolateParentState);
  }

  Map<String, dynamic> toJson() {
    return IsolateParentStateMapper.ensureInitialized()
        .encodeMap<IsolateParentState>(this as IsolateParentState);
  }

  IsolateParentStateCopyWith<IsolateParentState, IsolateParentState,
          IsolateParentState>
      get copyWith => _IsolateParentStateCopyWithImpl(
          this as IsolateParentState, $identity, $identity);
  @override
  String toString() {
    return IsolateParentStateMapper.ensureInitialized()
        .stringifyValue(this as IsolateParentState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IsolateParentStateMapper.ensureInitialized()
                .isValueEqual(this as IsolateParentState, other));
  }

  @override
  int get hashCode {
    return IsolateParentStateMapper.ensureInitialized()
        .hashValue(this as IsolateParentState);
  }
}

extension IsolateParentStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IsolateParentState, $Out> {
  IsolateParentStateCopyWith<$R, IsolateParentState, $Out>
      get $asIsolateParentState =>
          $base.as((v, t, t2) => _IsolateParentStateCopyWithImpl(v, t, t2));
}

abstract class IsolateParentStateCopyWith<$R, $In extends IsolateParentState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  IsolateCommonStateCopyWith<$R, IsolateCommonState, IsolateCommonState>
      get commonState;
  MapCopyWith<$R, int, IsolateRefState,
          IsolateRefStateCopyWith<$R, IsolateRefState, IsolateRefState>>
      get isolateStates;
  $R call(
      {IsolateCommonState? commonState,
      Map<int, IsolateRefState>? isolateStates});
  IsolateParentStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IsolateParentStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IsolateParentState, $Out>
    implements IsolateParentStateCopyWith<$R, IsolateParentState, $Out> {
  _IsolateParentStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IsolateParentState> $mapper =
      IsolateParentStateMapper.ensureInitialized();
  @override
  IsolateCommonStateCopyWith<$R, IsolateCommonState, IsolateCommonState>
      get commonState =>
          $value.commonState.copyWith.$chain((v) => call(commonState: v));
  @override
  MapCopyWith<$R, int, IsolateRefState,
          IsolateRefStateCopyWith<$R, IsolateRefState, IsolateRefState>>
      get isolateStates => MapCopyWith($value.isolateStates,
          (v, t) => v.copyWith.$chain(t), (v) => call(isolateStates: v));
  @override
  $R call(
          {IsolateCommonState? commonState,
          Map<int, IsolateRefState>? isolateStates}) =>
      $apply(FieldCopyWithData({
        if (commonState != null) #commonState: commonState,
        if (isolateStates != null) #isolateStates: isolateStates
      }));
  @override
  IsolateParentState $make(CopyWithData data) => IsolateParentState(
      commonState: data.get(#commonState, or: $value.commonState),
      isolateStates: data.get(#isolateStates, or: $value.isolateStates));

  @override
  IsolateParentStateCopyWith<$R2, IsolateParentState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IsolateParentStateCopyWithImpl($value, $cast, t);
}
