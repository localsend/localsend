// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'isolate_ref_state.dart';

class IsolateRefStateMapper extends ClassMapperBase<IsolateRefState> {
  IsolateRefStateMapper._();

  static IsolateRefStateMapper? _instance;
  static IsolateRefStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IsolateRefStateMapper._());
      IsolateStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IsolateRefState';

  static IsolateCommunication<dynamic, dynamic> _$communication(
          IsolateRefState v) =>
      v.communication;
  static const Field<IsolateRefState, IsolateCommunication<dynamic, dynamic>>
      _f$communication = Field('communication', _$communication);
  static IsolateState _$isolateState(IsolateRefState v) => v.isolateState;
  static const Field<IsolateRefState, IsolateState> _f$isolateState =
      Field('isolateState', _$isolateState);

  @override
  final Map<Symbol, Field<IsolateRefState, dynamic>> fields = const {
    #communication: _f$communication,
    #isolateState: _f$isolateState,
  };

  static IsolateRefState _instantiate(DecodingData data) {
    return IsolateRefState(
        communication: data.dec(_f$communication),
        isolateState: data.dec(_f$isolateState));
  }

  @override
  final Function instantiate = _instantiate;

  static IsolateRefState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IsolateRefState>(map);
  }

  static IsolateRefState deserialize(String json) {
    return ensureInitialized().decodeJson<IsolateRefState>(json);
  }
}

mixin IsolateRefStateMappable {
  String serialize() {
    return IsolateRefStateMapper.ensureInitialized()
        .encodeJson<IsolateRefState>(this as IsolateRefState);
  }

  Map<String, dynamic> toJson() {
    return IsolateRefStateMapper.ensureInitialized()
        .encodeMap<IsolateRefState>(this as IsolateRefState);
  }

  IsolateRefStateCopyWith<IsolateRefState, IsolateRefState, IsolateRefState>
      get copyWith => _IsolateRefStateCopyWithImpl(
          this as IsolateRefState, $identity, $identity);
  @override
  String toString() {
    return IsolateRefStateMapper.ensureInitialized()
        .stringifyValue(this as IsolateRefState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IsolateRefStateMapper.ensureInitialized()
                .isValueEqual(this as IsolateRefState, other));
  }

  @override
  int get hashCode {
    return IsolateRefStateMapper.ensureInitialized()
        .hashValue(this as IsolateRefState);
  }
}

extension IsolateRefStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IsolateRefState, $Out> {
  IsolateRefStateCopyWith<$R, IsolateRefState, $Out> get $asIsolateRefState =>
      $base.as((v, t, t2) => _IsolateRefStateCopyWithImpl(v, t, t2));
}

abstract class IsolateRefStateCopyWith<$R, $In extends IsolateRefState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  IsolateStateCopyWith<$R, IsolateState, IsolateState> get isolateState;
  $R call(
      {IsolateCommunication<dynamic, dynamic>? communication,
      IsolateState? isolateState});
  IsolateRefStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IsolateRefStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IsolateRefState, $Out>
    implements IsolateRefStateCopyWith<$R, IsolateRefState, $Out> {
  _IsolateRefStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IsolateRefState> $mapper =
      IsolateRefStateMapper.ensureInitialized();
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
  IsolateRefState $make(CopyWithData data) => IsolateRefState(
      communication: data.get(#communication, or: $value.communication),
      isolateState: data.get(#isolateState, or: $value.isolateState));

  @override
  IsolateRefStateCopyWith<$R2, IsolateRefState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IsolateRefStateCopyWithImpl($value, $cast, t);
}
