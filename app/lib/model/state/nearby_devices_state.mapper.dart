// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'nearby_devices_state.dart';

class NearbyDevicesStateMapper extends ClassMapperBase<NearbyDevicesState> {
  NearbyDevicesStateMapper._();

  static NearbyDevicesStateMapper? _instance;
  static NearbyDevicesStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NearbyDevicesStateMapper._());
      DeviceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NearbyDevicesState';

  static bool _$runningFavoriteScan(NearbyDevicesState v) =>
      v.runningFavoriteScan;
  static const Field<NearbyDevicesState, bool> _f$runningFavoriteScan = Field(
    'runningFavoriteScan',
    _$runningFavoriteScan,
  );
  static Set<String> _$runningIps(NearbyDevicesState v) => v.runningIps;
  static const Field<NearbyDevicesState, Set<String>> _f$runningIps = Field(
    'runningIps',
    _$runningIps,
  );
  static Map<String, Device> _$devices(NearbyDevicesState v) => v.devices;
  static const Field<NearbyDevicesState, Map<String, Device>> _f$devices =
      Field('devices', _$devices);
  static Map<String, Set<Device>> _$signalingDevices(NearbyDevicesState v) =>
      v.signalingDevices;
  static const Field<NearbyDevicesState, Map<String, Set<Device>>>
  _f$signalingDevices = Field('signalingDevices', _$signalingDevices);
  static Map<String, Device> _$allDevices(NearbyDevicesState v) => v.allDevices;
  static const Field<NearbyDevicesState, Map<String, Device>> _f$allDevices =
      Field('allDevices', _$allDevices, mode: FieldMode.member);

  @override
  final MappableFields<NearbyDevicesState> fields = const {
    #runningFavoriteScan: _f$runningFavoriteScan,
    #runningIps: _f$runningIps,
    #devices: _f$devices,
    #signalingDevices: _f$signalingDevices,
    #allDevices: _f$allDevices,
  };

  static NearbyDevicesState _instantiate(DecodingData data) {
    return NearbyDevicesState(
      runningFavoriteScan: data.dec(_f$runningFavoriteScan),
      runningIps: data.dec(_f$runningIps),
      devices: data.dec(_f$devices),
      signalingDevices: data.dec(_f$signalingDevices),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NearbyDevicesState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NearbyDevicesState>(map);
  }

  static NearbyDevicesState deserialize(String json) {
    return ensureInitialized().decodeJson<NearbyDevicesState>(json);
  }
}

mixin NearbyDevicesStateMappable {
  String serialize() {
    return NearbyDevicesStateMapper.ensureInitialized()
        .encodeJson<NearbyDevicesState>(this as NearbyDevicesState);
  }

  Map<String, dynamic> toJson() {
    return NearbyDevicesStateMapper.ensureInitialized()
        .encodeMap<NearbyDevicesState>(this as NearbyDevicesState);
  }

  NearbyDevicesStateCopyWith<
    NearbyDevicesState,
    NearbyDevicesState,
    NearbyDevicesState
  >
  get copyWith =>
      _NearbyDevicesStateCopyWithImpl<NearbyDevicesState, NearbyDevicesState>(
        this as NearbyDevicesState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return NearbyDevicesStateMapper.ensureInitialized().stringifyValue(
      this as NearbyDevicesState,
    );
  }

  @override
  bool operator ==(Object other) {
    return NearbyDevicesStateMapper.ensureInitialized().equalsValue(
      this as NearbyDevicesState,
      other,
    );
  }

  @override
  int get hashCode {
    return NearbyDevicesStateMapper.ensureInitialized().hashValue(
      this as NearbyDevicesState,
    );
  }
}

extension NearbyDevicesStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NearbyDevicesState, $Out> {
  NearbyDevicesStateCopyWith<$R, NearbyDevicesState, $Out>
  get $asNearbyDevicesState => $base.as(
    (v, t, t2) => _NearbyDevicesStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class NearbyDevicesStateCopyWith<
  $R,
  $In extends NearbyDevicesState,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, Device, DeviceCopyWith<$R, Device, Device>>
  get devices;
  MapCopyWith<
    $R,
    String,
    Set<Device>,
    ObjectCopyWith<$R, Set<Device>, Set<Device>>
  >
  get signalingDevices;
  $R call({
    bool? runningFavoriteScan,
    Set<String>? runningIps,
    Map<String, Device>? devices,
    Map<String, Set<Device>>? signalingDevices,
  });
  NearbyDevicesStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _NearbyDevicesStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NearbyDevicesState, $Out>
    implements NearbyDevicesStateCopyWith<$R, NearbyDevicesState, $Out> {
  _NearbyDevicesStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NearbyDevicesState> $mapper =
      NearbyDevicesStateMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, Device, DeviceCopyWith<$R, Device, Device>>
  get devices => MapCopyWith(
    $value.devices,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(devices: v),
  );
  @override
  MapCopyWith<
    $R,
    String,
    Set<Device>,
    ObjectCopyWith<$R, Set<Device>, Set<Device>>
  >
  get signalingDevices => MapCopyWith(
    $value.signalingDevices,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(signalingDevices: v),
  );
  @override
  $R call({
    bool? runningFavoriteScan,
    Set<String>? runningIps,
    Map<String, Device>? devices,
    Map<String, Set<Device>>? signalingDevices,
  }) => $apply(
    FieldCopyWithData({
      if (runningFavoriteScan != null)
        #runningFavoriteScan: runningFavoriteScan,
      if (runningIps != null) #runningIps: runningIps,
      if (devices != null) #devices: devices,
      if (signalingDevices != null) #signalingDevices: signalingDevices,
    }),
  );
  @override
  NearbyDevicesState $make(CopyWithData data) => NearbyDevicesState(
    runningFavoriteScan: data.get(
      #runningFavoriteScan,
      or: $value.runningFavoriteScan,
    ),
    runningIps: data.get(#runningIps, or: $value.runningIps),
    devices: data.get(#devices, or: $value.devices),
    signalingDevices: data.get(#signalingDevices, or: $value.signalingDevices),
  );

  @override
  NearbyDevicesStateCopyWith<$R2, NearbyDevicesState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NearbyDevicesStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

