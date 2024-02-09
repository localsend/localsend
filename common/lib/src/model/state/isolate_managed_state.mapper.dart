// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'isolate_managed_state.dart';

class IsolateManagedStateMapper extends ClassMapperBase<IsolateManagedState> {
  IsolateManagedStateMapper._();

  static IsolateManagedStateMapper? _instance;
  static IsolateManagedStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IsolateManagedStateMapper._());
      IsolateStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IsolateManagedState';

  static IsolateCommunication<dynamic, dynamic> _$communication(
          IsolateManagedState v) =>
      v.communication;
  static const Field<IsolateManagedState,
          IsolateCommunication<dynamic, dynamic>> _f$communication =
      Field('communication', _$communication);
  static IsolateState _$isolateState(IsolateManagedState v) => v.isolateState;
  static const Field<IsolateManagedState, IsolateState> _f$isolateState =
      Field('isolateState', _$isolateState);

  @override
  final Map<Symbol, Field<IsolateManagedState, dynamic>> fields = const {
    #communication: _f$communication,
    #isolateState: _f$isolateState,
  };

  static IsolateManagedState _instantiate(DecodingData data) {
    return IsolateManagedState(
        communication: data.dec(_f$communication),
        isolateState: data.dec(_f$isolateState));
  }

  @override
  final Function instantiate = _instantiate;

  static IsolateManagedState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IsolateManagedState>(map);
  }

  static IsolateManagedState deserialize(String json) {
    return ensureInitialized().decodeJson<IsolateManagedState>(json);
  }
}

mixin IsolateManagedStateMappable {
  String serialize() {
    return IsolateManagedStateMapper.ensureInitialized()
        .encodeJson<IsolateManagedState>(this as IsolateManagedState);
  }

  Map<String, dynamic> toJson() {
    return IsolateManagedStateMapper.ensureInitialized()
        .encodeMap<IsolateManagedState>(this as IsolateManagedState);
  }

  IsolateManagedStateCopyWith<IsolateManagedState, IsolateManagedState,
          IsolateManagedState>
      get copyWith => _IsolateManagedStateCopyWithImpl(
          this as IsolateManagedState, $identity, $identity);
  @override
  String toString() {
    return IsolateManagedStateMapper.ensureInitialized()
        .stringifyValue(this as IsolateManagedState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IsolateManagedStateMapper.ensureInitialized()
                .isValueEqual(this as IsolateManagedState, other));
  }

  @override
  int get hashCode {
    return IsolateManagedStateMapper.ensureInitialized()
        .hashValue(this as IsolateManagedState);
  }
}

extension IsolateManagedStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IsolateManagedState, $Out> {
  IsolateManagedStateCopyWith<$R, IsolateManagedState, $Out>
      get $asIsolateManagedState =>
          $base.as((v, t, t2) => _IsolateManagedStateCopyWithImpl(v, t, t2));
}

abstract class IsolateManagedStateCopyWith<$R, $In extends IsolateManagedState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  IsolateStateCopyWith<$R, IsolateState, IsolateState> get isolateState;
  $R call(
      {IsolateCommunication<dynamic, dynamic>? communication,
      IsolateState? isolateState});
  IsolateManagedStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IsolateManagedStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IsolateManagedState, $Out>
    implements IsolateManagedStateCopyWith<$R, IsolateManagedState, $Out> {
  _IsolateManagedStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IsolateManagedState> $mapper =
      IsolateManagedStateMapper.ensureInitialized();
  @override
  IsolateStateCopyWith<$R, IsolateState, IsolateState> get isolateState =>
      $value.isolateState.copyWith.$chain((v) => call(isolateState: v));
  @override
  $R call(
          {IsolateCommunication<dynamic, dynamic>? communication,
          IsolateState? isolateState}) =>
      $apply(FieldCopyWithData({
        if (communication != null) #communication: communication,
        if (isolateState != null) #isolateState: isolateState
      }));
  @override
  IsolateManagedState $make(CopyWithData data) => IsolateManagedState(
      communication: data.get(#communication, or: $value.communication),
      isolateState: data.get(#isolateState, or: $value.isolateState));

  @override
  IsolateManagedStateCopyWith<$R2, IsolateManagedState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _IsolateManagedStateCopyWithImpl($value, $cast, t);
}
