// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'isolate_sync_dto.dart';

class IsolateSyncDtoMapper extends ClassMapperBase<IsolateSyncDto> {
  IsolateSyncDtoMapper._();

  static IsolateSyncDtoMapper? _instance;
  static IsolateSyncDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IsolateSyncDtoMapper._());
      IsolateStateMapper.ensureInitialized();
      IsolateCommonStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IsolateSyncDto';

  static IsolateState _$isolateState(IsolateSyncDto v) => v.isolateState;
  static const Field<IsolateSyncDto, IsolateState> _f$isolateState =
      Field('isolateState', _$isolateState);
  static IsolateCommonState _$isolateCommonState(IsolateSyncDto v) =>
      v.isolateCommonState;
  static const Field<IsolateSyncDto, IsolateCommonState> _f$isolateCommonState =
      Field('isolateCommonState', _$isolateCommonState);

  @override
  final Map<Symbol, Field<IsolateSyncDto, dynamic>> fields = const {
    #isolateState: _f$isolateState,
    #isolateCommonState: _f$isolateCommonState,
  };

  static IsolateSyncDto _instantiate(DecodingData data) {
    return IsolateSyncDto(
        isolateState: data.dec(_f$isolateState),
        isolateCommonState: data.dec(_f$isolateCommonState));
  }

  @override
  final Function instantiate = _instantiate;

  static IsolateSyncDto fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IsolateSyncDto>(map);
  }

  static IsolateSyncDto deserialize(String json) {
    return ensureInitialized().decodeJson<IsolateSyncDto>(json);
  }
}

mixin IsolateSyncDtoMappable {
  String serialize() {
    return IsolateSyncDtoMapper.ensureInitialized()
        .encodeJson<IsolateSyncDto>(this as IsolateSyncDto);
  }

  Map<String, dynamic> toJson() {
    return IsolateSyncDtoMapper.ensureInitialized()
        .encodeMap<IsolateSyncDto>(this as IsolateSyncDto);
  }

  IsolateSyncDtoCopyWith<IsolateSyncDto, IsolateSyncDto, IsolateSyncDto>
      get copyWith => _IsolateSyncDtoCopyWithImpl(
          this as IsolateSyncDto, $identity, $identity);
  @override
  String toString() {
    return IsolateSyncDtoMapper.ensureInitialized()
        .stringifyValue(this as IsolateSyncDto);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IsolateSyncDtoMapper.ensureInitialized()
                .isValueEqual(this as IsolateSyncDto, other));
  }

  @override
  int get hashCode {
    return IsolateSyncDtoMapper.ensureInitialized()
        .hashValue(this as IsolateSyncDto);
  }
}

extension IsolateSyncDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IsolateSyncDto, $Out> {
  IsolateSyncDtoCopyWith<$R, IsolateSyncDto, $Out> get $asIsolateSyncDto =>
      $base.as((v, t, t2) => _IsolateSyncDtoCopyWithImpl(v, t, t2));
}

abstract class IsolateSyncDtoCopyWith<$R, $In extends IsolateSyncDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  IsolateStateCopyWith<$R, IsolateState, IsolateState> get isolateState;
  IsolateCommonStateCopyWith<$R, IsolateCommonState, IsolateCommonState>
      get isolateCommonState;
  $R call({IsolateState? isolateState, IsolateCommonState? isolateCommonState});
  IsolateSyncDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IsolateSyncDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IsolateSyncDto, $Out>
    implements IsolateSyncDtoCopyWith<$R, IsolateSyncDto, $Out> {
  _IsolateSyncDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IsolateSyncDto> $mapper =
      IsolateSyncDtoMapper.ensureInitialized();
  @override
  IsolateStateCopyWith<$R, IsolateState, IsolateState> get isolateState =>
      $value.isolateState.copyWith.$chain((v) => call(isolateState: v));
  @override
  IsolateCommonStateCopyWith<$R, IsolateCommonState, IsolateCommonState>
      get isolateCommonState => $value.isolateCommonState.copyWith
          .$chain((v) => call(isolateCommonState: v));
  @override
  $R call(
          {IsolateState? isolateState,
          IsolateCommonState? isolateCommonState}) =>
      $apply(FieldCopyWithData({
        if (isolateState != null) #isolateState: isolateState,
        if (isolateCommonState != null) #isolateCommonState: isolateCommonState
      }));
  @override
  IsolateSyncDto $make(CopyWithData data) => IsolateSyncDto(
      isolateState: data.get(#isolateState, or: $value.isolateState),
      isolateCommonState:
          data.get(#isolateCommonState, or: $value.isolateCommonState));

  @override
  IsolateSyncDtoCopyWith<$R2, IsolateSyncDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IsolateSyncDtoCopyWithImpl($value, $cast, t);
}
