// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

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

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'NearbyDevicesState';

  static bool _$runningFavoriteScan(NearbyDevicesState v) =>
      v.runningFavoriteScan;
  static const Field<NearbyDevicesState, bool> _f$runningFavoriteScan =
      Field('runningFavoriteScan', _$runningFavoriteScan);
  static Set<String> _$runningIps(NearbyDevicesState v) => v.runningIps;
  static const Field<NearbyDevicesState, Set<String>> _f$runningIps =
      Field('runningIps', _$runningIps);
  static Map<String, Device> _$devices(NearbyDevicesState v) => v.devices;
  static const Field<NearbyDevicesState, Map<String, Device>> _f$devices =
      Field('devices', _$devices);

  @override
  final Map<Symbol, Field<NearbyDevicesState, dynamic>> fields = const {
    #runningFavoriteScan: _f$runningFavoriteScan,
    #runningIps: _f$runningIps,
    #devices: _f$devices,
  };

  static NearbyDevicesState _instantiate(DecodingData data) {
    return NearbyDevicesState(
        runningFavoriteScan: data.dec(_f$runningFavoriteScan),
        runningIps: data.dec(_f$runningIps),
        devices: data.dec(_f$devices));
  }

  @override
  final Function instantiate = _instantiate;

  static NearbyDevicesState fromJson(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<NearbyDevicesState>(map));
  }

  static NearbyDevicesState deserialize(String json) {
    return _guard((c) => c.fromJson<NearbyDevicesState>(json));
  }
}

mixin NearbyDevicesStateMappable {
  String serialize() {
    return NearbyDevicesStateMapper._guard(
        (c) => c.toJson(this as NearbyDevicesState));
  }

  Map<String, dynamic> toJson() {
    return NearbyDevicesStateMapper._guard(
        (c) => c.toMap(this as NearbyDevicesState));
  }

  NearbyDevicesStateCopyWith<NearbyDevicesState, NearbyDevicesState,
          NearbyDevicesState>
      get copyWith => _NearbyDevicesStateCopyWithImpl(
          this as NearbyDevicesState, $identity, $identity);
  @override
  String toString() {
    return NearbyDevicesStateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NearbyDevicesStateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return NearbyDevicesStateMapper._guard((c) => c.hash(this));
  }
}

extension NearbyDevicesStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NearbyDevicesState, $Out> {
  NearbyDevicesStateCopyWith<$R, NearbyDevicesState, $Out>
      get $asNearbyDevicesState =>
          $base.as((v, t, t2) => _NearbyDevicesStateCopyWithImpl(v, t, t2));
}

abstract class NearbyDevicesStateCopyWith<$R, $In extends NearbyDevicesState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, Device, DeviceCopyWith<$R, Device, Device>>
      get devices;
  $R call(
      {bool? runningFavoriteScan,
      Set<String>? runningIps,
      Map<String, Device>? devices});
  NearbyDevicesStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
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
      get devices => MapCopyWith($value.devices, (v, t) => v.copyWith.$chain(t),
          (v) => call(devices: v));
  @override
  $R call(
          {bool? runningFavoriteScan,
          Set<String>? runningIps,
          Map<String, Device>? devices}) =>
      $apply(FieldCopyWithData({
        if (runningFavoriteScan != null)
          #runningFavoriteScan: runningFavoriteScan,
        if (runningIps != null) #runningIps: runningIps,
        if (devices != null) #devices: devices
      }));
  @override
  NearbyDevicesState $make(CopyWithData data) => NearbyDevicesState(
      runningFavoriteScan:
          data.get(#runningFavoriteScan, or: $value.runningFavoriteScan),
      runningIps: data.get(#runningIps, or: $value.runningIps),
      devices: data.get(#devices, or: $value.devices));

  @override
  NearbyDevicesStateCopyWith<$R2, NearbyDevicesState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NearbyDevicesStateCopyWithImpl($value, $cast, t);
}
