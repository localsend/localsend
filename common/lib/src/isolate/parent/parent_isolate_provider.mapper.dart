// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'parent_isolate_provider.dart';

class ParentIsolateStateMapper extends ClassMapperBase<ParentIsolateState> {
  ParentIsolateStateMapper._();

  static ParentIsolateStateMapper? _instance;
  static ParentIsolateStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ParentIsolateStateMapper._());
      SyncStateMapper.ensureInitialized();
      DeviceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ParentIsolateState';

  static SyncState _$syncState(ParentIsolateState v) => v.syncState;
  static const Field<ParentIsolateState, SyncState> _f$syncState = Field('syncState', _$syncState);
  static IsolateConnector<IsolateTaskStreamResult<Device>, SendToIsolateData<IsolateTask<HttpScanTask>>>? _$httpScanDiscovery(ParentIsolateState v) =>
      v.httpScanDiscovery;
  static const Field<ParentIsolateState, IsolateConnector<IsolateTaskStreamResult<Device>, SendToIsolateData<IsolateTask<HttpScanTask>>>>
      _f$httpScanDiscovery = Field('httpScanDiscovery', _$httpScanDiscovery);
  static IsolateConnector<IsolateTaskResult<Device>, SendToIsolateData<IsolateTask<HttpTargetTask>>>? _$httpTargetDiscovery(ParentIsolateState v) =>
      v.httpTargetDiscovery;
  static const Field<ParentIsolateState, IsolateConnector<IsolateTaskResult<Device>, SendToIsolateData<IsolateTask<HttpTargetTask>>>>
      _f$httpTargetDiscovery = Field('httpTargetDiscovery', _$httpTargetDiscovery);
  static IsolateConnector<Device, SendToIsolateData<MulticastTask>>? _$multicastDiscovery(ParentIsolateState v) => v.multicastDiscovery;
  static const Field<ParentIsolateState, IsolateConnector<Device, SendToIsolateData<MulticastTask>>> _f$multicastDiscovery =
      Field('multicastDiscovery', _$multicastDiscovery);
  static List<IsolateConnector<IsolateTaskStreamResult<double>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>>> _$httpUpload(
          ParentIsolateState v) =>
      v.httpUpload;
  static const Field<ParentIsolateState, List<IsolateConnector<IsolateTaskStreamResult<double>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>>>>
      _f$httpUpload = Field('httpUpload', _$httpUpload);

  @override
  final MappableFields<ParentIsolateState> fields = const {
    #syncState: _f$syncState,
    #httpScanDiscovery: _f$httpScanDiscovery,
    #httpTargetDiscovery: _f$httpTargetDiscovery,
    #multicastDiscovery: _f$multicastDiscovery,
    #httpUpload: _f$httpUpload,
  };

  static ParentIsolateState _instantiate(DecodingData data) {
    return ParentIsolateState(
        syncState: data.dec(_f$syncState),
        httpScanDiscovery: data.dec(_f$httpScanDiscovery),
        httpTargetDiscovery: data.dec(_f$httpTargetDiscovery),
        multicastDiscovery: data.dec(_f$multicastDiscovery),
        httpUpload: data.dec(_f$httpUpload));
  }

  @override
  final Function instantiate = _instantiate;

  static ParentIsolateState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ParentIsolateState>(map);
  }

  static ParentIsolateState deserialize(String json) {
    return ensureInitialized().decodeJson<ParentIsolateState>(json);
  }
}

mixin ParentIsolateStateMappable {
  String serialize() {
    return ParentIsolateStateMapper.ensureInitialized().encodeJson<ParentIsolateState>(this as ParentIsolateState);
  }

  Map<String, dynamic> toJson() {
    return ParentIsolateStateMapper.ensureInitialized().encodeMap<ParentIsolateState>(this as ParentIsolateState);
  }

  ParentIsolateStateCopyWith<ParentIsolateState, ParentIsolateState, ParentIsolateState> get copyWith =>
      _ParentIsolateStateCopyWithImpl(this as ParentIsolateState, $identity, $identity);
  @override
  String toString() {
    return ParentIsolateStateMapper.ensureInitialized().stringifyValue(this as ParentIsolateState);
  }

  @override
  bool operator ==(Object other) {
    return ParentIsolateStateMapper.ensureInitialized().equalsValue(this as ParentIsolateState, other);
  }

  @override
  int get hashCode {
    return ParentIsolateStateMapper.ensureInitialized().hashValue(this as ParentIsolateState);
  }
}

extension ParentIsolateStateValueCopy<$R, $Out> on ObjectCopyWith<$R, ParentIsolateState, $Out> {
  ParentIsolateStateCopyWith<$R, ParentIsolateState, $Out> get $asParentIsolateState =>
      $base.as((v, t, t2) => _ParentIsolateStateCopyWithImpl(v, t, t2));
}

abstract class ParentIsolateStateCopyWith<$R, $In extends ParentIsolateState, $Out> implements ClassCopyWith<$R, $In, $Out> {
  SyncStateCopyWith<$R, SyncState, SyncState> get syncState;
  ListCopyWith<
      $R,
      IsolateConnector<IsolateTaskStreamResult<double>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>>,
      ObjectCopyWith<$R, IsolateConnector<IsolateTaskStreamResult<double>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>>,
          IsolateConnector<IsolateTaskStreamResult<double>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>>>> get httpUpload;
  $R call(
      {SyncState? syncState,
      IsolateConnector<IsolateTaskStreamResult<Device>, SendToIsolateData<IsolateTask<HttpScanTask>>>? httpScanDiscovery,
      IsolateConnector<IsolateTaskResult<Device>, SendToIsolateData<IsolateTask<HttpTargetTask>>>? httpTargetDiscovery,
      IsolateConnector<Device, SendToIsolateData<MulticastTask>>? multicastDiscovery,
      List<IsolateConnector<IsolateTaskStreamResult<double>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>>>? httpUpload});
  ParentIsolateStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ParentIsolateStateCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, ParentIsolateState, $Out>
    implements ParentIsolateStateCopyWith<$R, ParentIsolateState, $Out> {
  _ParentIsolateStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ParentIsolateState> $mapper = ParentIsolateStateMapper.ensureInitialized();
  @override
  SyncStateCopyWith<$R, SyncState, SyncState> get syncState => $value.syncState.copyWith.$chain((v) => call(syncState: v));
  @override
  ListCopyWith<
      $R,
      IsolateConnector<IsolateTaskStreamResult<double>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>>,
      ObjectCopyWith<$R, IsolateConnector<IsolateTaskStreamResult<double>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>>,
          IsolateConnector<IsolateTaskStreamResult<double>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>>>> get httpUpload =>
      ListCopyWith($value.httpUpload, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(httpUpload: v));
  @override
  $R call(
          {SyncState? syncState,
          Object? httpScanDiscovery = $none,
          Object? httpTargetDiscovery = $none,
          Object? multicastDiscovery = $none,
          List<IsolateConnector<IsolateTaskStreamResult<double>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>>>? httpUpload}) =>
      $apply(FieldCopyWithData({
        if (syncState != null) #syncState: syncState,
        if (httpScanDiscovery != $none) #httpScanDiscovery: httpScanDiscovery,
        if (httpTargetDiscovery != $none) #httpTargetDiscovery: httpTargetDiscovery,
        if (multicastDiscovery != $none) #multicastDiscovery: multicastDiscovery,
        if (httpUpload != null) #httpUpload: httpUpload
      }));
  @override
  ParentIsolateState $make(CopyWithData data) => ParentIsolateState(
      syncState: data.get(#syncState, or: $value.syncState),
      httpScanDiscovery: data.get(#httpScanDiscovery, or: $value.httpScanDiscovery),
      httpTargetDiscovery: data.get(#httpTargetDiscovery, or: $value.httpTargetDiscovery),
      multicastDiscovery: data.get(#multicastDiscovery, or: $value.multicastDiscovery),
      httpUpload: data.get(#httpUpload, or: $value.httpUpload));

  @override
  ParentIsolateStateCopyWith<$R2, ParentIsolateState, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ParentIsolateStateCopyWithImpl($value, $cast, t);
}
