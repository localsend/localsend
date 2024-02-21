// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'isolate_state.dart';

class IsolateStateMapper extends ClassMapperBase<IsolateState> {
  IsolateStateMapper._();

  static IsolateStateMapper? _instance;
  static IsolateStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IsolateStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IsolateState';

  static int? _$isolateId(IsolateState v) => v.isolateId;
  static const Field<IsolateState, int> _f$isolateId =
      Field('isolateId', _$isolateId);
  static IsolateType? _$isolateType(IsolateState v) => v.isolateType;
  static const Field<IsolateState, IsolateType> _f$isolateType =
      Field('isolateType', _$isolateType);

  @override
  final Map<Symbol, Field<IsolateState, dynamic>> fields = const {
    #isolateId: _f$isolateId,
    #isolateType: _f$isolateType,
  };

  static IsolateState _instantiate(DecodingData data) {
    return IsolateState(
        isolateId: data.dec(_f$isolateId),
        isolateType: data.dec(_f$isolateType));
  }

  @override
  final Function instantiate = _instantiate;

  static IsolateState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IsolateState>(map);
  }

  static IsolateState deserialize(String json) {
    return ensureInitialized().decodeJson<IsolateState>(json);
  }
}

mixin IsolateStateMappable {
  String serialize() {
    return IsolateStateMapper.ensureInitialized()
        .encodeJson<IsolateState>(this as IsolateState);
  }

  Map<String, dynamic> toJson() {
    return IsolateStateMapper.ensureInitialized()
        .encodeMap<IsolateState>(this as IsolateState);
  }

  IsolateStateCopyWith<IsolateState, IsolateState, IsolateState> get copyWith =>
      _IsolateStateCopyWithImpl(this as IsolateState, $identity, $identity);
  @override
  String toString() {
    return IsolateStateMapper.ensureInitialized()
        .stringifyValue(this as IsolateState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IsolateStateMapper.ensureInitialized()
                .isValueEqual(this as IsolateState, other));
  }

  @override
  int get hashCode {
    return IsolateStateMapper.ensureInitialized()
        .hashValue(this as IsolateState);
  }
}

extension IsolateStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IsolateState, $Out> {
  IsolateStateCopyWith<$R, IsolateState, $Out> get $asIsolateState =>
      $base.as((v, t, t2) => _IsolateStateCopyWithImpl(v, t, t2));
}

abstract class IsolateStateCopyWith<$R, $In extends IsolateState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? isolateId, IsolateType? isolateType});
  IsolateStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _IsolateStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IsolateState, $Out>
    implements IsolateStateCopyWith<$R, IsolateState, $Out> {
  _IsolateStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IsolateState> $mapper =
      IsolateStateMapper.ensureInitialized();
  @override
  $R call({Object? isolateId = $none, Object? isolateType = $none}) =>
      $apply(FieldCopyWithData({
        if (isolateId != $none) #isolateId: isolateId,
        if (isolateType != $none) #isolateType: isolateType
      }));
  @override
  IsolateState $make(CopyWithData data) => IsolateState(
      isolateId: data.get(#isolateId, or: $value.isolateId),
      isolateType: data.get(#isolateType, or: $value.isolateType));

  @override
  IsolateStateCopyWith<$R2, IsolateState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IsolateStateCopyWithImpl($value, $cast, t);
}
