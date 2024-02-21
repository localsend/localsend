// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'isolate_common_state.dart';

class IsolateCommonStateMapper extends ClassMapperBase<IsolateCommonState> {
  IsolateCommonStateMapper._();

  static IsolateCommonStateMapper? _instance;
  static IsolateCommonStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IsolateCommonStateMapper._());
      StoredSecurityContextMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IsolateCommonState';

  static StoredSecurityContext? _$securityContext(IsolateCommonState v) =>
      v.securityContext;
  static const Field<IsolateCommonState, StoredSecurityContext>
      _f$securityContext = Field('securityContext', _$securityContext);

  @override
  final Map<Symbol, Field<IsolateCommonState, dynamic>> fields = const {
    #securityContext: _f$securityContext,
  };

  static IsolateCommonState _instantiate(DecodingData data) {
    return IsolateCommonState(securityContext: data.dec(_f$securityContext));
  }

  @override
  final Function instantiate = _instantiate;

  static IsolateCommonState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IsolateCommonState>(map);
  }

  static IsolateCommonState deserialize(String json) {
    return ensureInitialized().decodeJson<IsolateCommonState>(json);
  }
}

mixin IsolateCommonStateMappable {
  String serialize() {
    return IsolateCommonStateMapper.ensureInitialized()
        .encodeJson<IsolateCommonState>(this as IsolateCommonState);
  }

  Map<String, dynamic> toJson() {
    return IsolateCommonStateMapper.ensureInitialized()
        .encodeMap<IsolateCommonState>(this as IsolateCommonState);
  }

  IsolateCommonStateCopyWith<IsolateCommonState, IsolateCommonState,
          IsolateCommonState>
      get copyWith => _IsolateCommonStateCopyWithImpl(
          this as IsolateCommonState, $identity, $identity);
  @override
  String toString() {
    return IsolateCommonStateMapper.ensureInitialized()
        .stringifyValue(this as IsolateCommonState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IsolateCommonStateMapper.ensureInitialized()
                .isValueEqual(this as IsolateCommonState, other));
  }

  @override
  int get hashCode {
    return IsolateCommonStateMapper.ensureInitialized()
        .hashValue(this as IsolateCommonState);
  }
}

extension IsolateCommonStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IsolateCommonState, $Out> {
  IsolateCommonStateCopyWith<$R, IsolateCommonState, $Out>
      get $asIsolateCommonState =>
          $base.as((v, t, t2) => _IsolateCommonStateCopyWithImpl(v, t, t2));
}

abstract class IsolateCommonStateCopyWith<$R, $In extends IsolateCommonState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  StoredSecurityContextCopyWith<$R, StoredSecurityContext,
      StoredSecurityContext>? get securityContext;
  $R call({StoredSecurityContext? securityContext});
  IsolateCommonStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IsolateCommonStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IsolateCommonState, $Out>
    implements IsolateCommonStateCopyWith<$R, IsolateCommonState, $Out> {
  _IsolateCommonStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IsolateCommonState> $mapper =
      IsolateCommonStateMapper.ensureInitialized();
  @override
  StoredSecurityContextCopyWith<$R, StoredSecurityContext,
          StoredSecurityContext>?
      get securityContext => $value.securityContext?.copyWith
          .$chain((v) => call(securityContext: v));
  @override
  $R call({Object? securityContext = $none}) => $apply(FieldCopyWithData(
      {if (securityContext != $none) #securityContext: securityContext}));
  @override
  IsolateCommonState $make(CopyWithData data) => IsolateCommonState(
      securityContext: data.get(#securityContext, or: $value.securityContext));

  @override
  IsolateCommonStateCopyWith<$R2, IsolateCommonState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IsolateCommonStateCopyWithImpl($value, $cast, t);
}
