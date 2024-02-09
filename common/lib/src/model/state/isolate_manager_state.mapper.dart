// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'isolate_manager_state.dart';

class IsolateManagerStateMapper extends ClassMapperBase<IsolateManagerState> {
  IsolateManagerStateMapper._();

  static IsolateManagerStateMapper? _instance;
  static IsolateManagerStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IsolateManagerStateMapper._());
      IsolateCommonStateMapper.ensureInitialized();
      IsolateManagedStateMapper.ensureInitialized();
      IsolateStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IsolateManagerState';

  static IsolateCommonState _$commonState(IsolateManagerState v) =>
      v.commonState;
  static const Field<IsolateManagerState, IsolateCommonState> _f$commonState =
      Field('commonState', _$commonState);
  static Map<int, IsolateManagedState> _$isolateStates(IsolateManagerState v) =>
      v.isolateStates;
  static const Field<IsolateManagerState, Map<int, IsolateManagedState>>
      _f$isolateStates = Field('isolateStates', _$isolateStates);
  static IsolateState? _$currentIsolateState(IsolateManagerState v) =>
      v.currentIsolateState;
  static const Field<IsolateManagerState, IsolateState> _f$currentIsolateState =
      Field('currentIsolateState', _$currentIsolateState);

  @override
  final Map<Symbol, Field<IsolateManagerState, dynamic>> fields = const {
    #commonState: _f$commonState,
    #isolateStates: _f$isolateStates,
    #currentIsolateState: _f$currentIsolateState,
  };

  static IsolateManagerState _instantiate(DecodingData data) {
    return IsolateManagerState(
        commonState: data.dec(_f$commonState),
        isolateStates: data.dec(_f$isolateStates),
        currentIsolateState: data.dec(_f$currentIsolateState));
  }

  @override
  final Function instantiate = _instantiate;

  static IsolateManagerState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IsolateManagerState>(map);
  }

  static IsolateManagerState deserialize(String json) {
    return ensureInitialized().decodeJson<IsolateManagerState>(json);
  }
}

mixin IsolateManagerStateMappable {
  String serialize() {
    return IsolateManagerStateMapper.ensureInitialized()
        .encodeJson<IsolateManagerState>(this as IsolateManagerState);
  }

  Map<String, dynamic> toJson() {
    return IsolateManagerStateMapper.ensureInitialized()
        .encodeMap<IsolateManagerState>(this as IsolateManagerState);
  }

  IsolateManagerStateCopyWith<IsolateManagerState, IsolateManagerState,
          IsolateManagerState>
      get copyWith => _IsolateManagerStateCopyWithImpl(
          this as IsolateManagerState, $identity, $identity);
  @override
  String toString() {
    return IsolateManagerStateMapper.ensureInitialized()
        .stringifyValue(this as IsolateManagerState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IsolateManagerStateMapper.ensureInitialized()
                .isValueEqual(this as IsolateManagerState, other));
  }

  @override
  int get hashCode {
    return IsolateManagerStateMapper.ensureInitialized()
        .hashValue(this as IsolateManagerState);
  }
}

extension IsolateManagerStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IsolateManagerState, $Out> {
  IsolateManagerStateCopyWith<$R, IsolateManagerState, $Out>
      get $asIsolateManagerState =>
          $base.as((v, t, t2) => _IsolateManagerStateCopyWithImpl(v, t, t2));
}

abstract class IsolateManagerStateCopyWith<$R, $In extends IsolateManagerState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  IsolateCommonStateCopyWith<$R, IsolateCommonState, IsolateCommonState>
      get commonState;
  MapCopyWith<
      $R,
      int,
      IsolateManagedState,
      IsolateManagedStateCopyWith<$R, IsolateManagedState,
          IsolateManagedState>> get isolateStates;
  IsolateStateCopyWith<$R, IsolateState, IsolateState>? get currentIsolateState;
  $R call(
      {IsolateCommonState? commonState,
      Map<int, IsolateManagedState>? isolateStates,
      IsolateState? currentIsolateState});
  IsolateManagerStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IsolateManagerStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IsolateManagerState, $Out>
    implements IsolateManagerStateCopyWith<$R, IsolateManagerState, $Out> {
  _IsolateManagerStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IsolateManagerState> $mapper =
      IsolateManagerStateMapper.ensureInitialized();
  @override
  IsolateCommonStateCopyWith<$R, IsolateCommonState, IsolateCommonState>
      get commonState =>
          $value.commonState.copyWith.$chain((v) => call(commonState: v));
  @override
  MapCopyWith<
      $R,
      int,
      IsolateManagedState,
      IsolateManagedStateCopyWith<$R, IsolateManagedState,
          IsolateManagedState>> get isolateStates => MapCopyWith(
      $value.isolateStates,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(isolateStates: v));
  @override
  IsolateStateCopyWith<$R, IsolateState, IsolateState>?
      get currentIsolateState => $value.currentIsolateState?.copyWith
          .$chain((v) => call(currentIsolateState: v));
  @override
  $R call(
          {IsolateCommonState? commonState,
          Map<int, IsolateManagedState>? isolateStates,
          Object? currentIsolateState = $none}) =>
      $apply(FieldCopyWithData({
        if (commonState != null) #commonState: commonState,
        if (isolateStates != null) #isolateStates: isolateStates,
        if (currentIsolateState != $none)
          #currentIsolateState: currentIsolateState
      }));
  @override
  IsolateManagerState $make(CopyWithData data) => IsolateManagerState(
      commonState: data.get(#commonState, or: $value.commonState),
      isolateStates: data.get(#isolateStates, or: $value.isolateStates),
      currentIsolateState:
          data.get(#currentIsolateState, or: $value.currentIsolateState));

  @override
  IsolateManagerStateCopyWith<$R2, IsolateManagerState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _IsolateManagerStateCopyWithImpl($value, $cast, t);
}
