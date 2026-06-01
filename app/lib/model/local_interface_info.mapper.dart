// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'local_interface_info.dart';

class LocalInterfaceInfoMapper extends ClassMapperBase<LocalInterfaceInfo> {
  LocalInterfaceInfoMapper._();

  static LocalInterfaceInfoMapper? _instance;
  static LocalInterfaceInfoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalInterfaceInfoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalInterfaceInfo';

  static String _$ip(LocalInterfaceInfo v) => v.ip;
  static const Field<LocalInterfaceInfo, String> _f$ip = Field('ip', _$ip);
  static int _$prefixLength(LocalInterfaceInfo v) => v.prefixLength;
  static const Field<LocalInterfaceInfo, int> _f$prefixLength = Field(
    'prefixLength',
    _$prefixLength,
  );

  @override
  final MappableFields<LocalInterfaceInfo> fields = const {
    #ip: _f$ip,
    #prefixLength: _f$prefixLength,
  };

  static LocalInterfaceInfo _instantiate(DecodingData data) {
    return LocalInterfaceInfo(
      ip: data.dec(_f$ip),
      prefixLength: data.dec(_f$prefixLength),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LocalInterfaceInfo fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalInterfaceInfo>(map);
  }

  static LocalInterfaceInfo deserialize(String json) {
    return ensureInitialized().decodeJson<LocalInterfaceInfo>(json);
  }
}

mixin LocalInterfaceInfoMappable {
  String serialize() {
    return LocalInterfaceInfoMapper.ensureInitialized()
        .encodeJson<LocalInterfaceInfo>(this as LocalInterfaceInfo);
  }

  Map<String, dynamic> toJson() {
    return LocalInterfaceInfoMapper.ensureInitialized()
        .encodeMap<LocalInterfaceInfo>(this as LocalInterfaceInfo);
  }

  LocalInterfaceInfoCopyWith<
    LocalInterfaceInfo,
    LocalInterfaceInfo,
    LocalInterfaceInfo
  >
  get copyWith =>
      _LocalInterfaceInfoCopyWithImpl<LocalInterfaceInfo, LocalInterfaceInfo>(
        this as LocalInterfaceInfo,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return LocalInterfaceInfoMapper.ensureInitialized().stringifyValue(
      this as LocalInterfaceInfo,
    );
  }

  @override
  bool operator ==(Object other) {
    return LocalInterfaceInfoMapper.ensureInitialized().equalsValue(
      this as LocalInterfaceInfo,
      other,
    );
  }

  @override
  int get hashCode {
    return LocalInterfaceInfoMapper.ensureInitialized().hashValue(
      this as LocalInterfaceInfo,
    );
  }
}

extension LocalInterfaceInfoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalInterfaceInfo, $Out> {
  LocalInterfaceInfoCopyWith<$R, LocalInterfaceInfo, $Out>
  get $asLocalInterfaceInfo => $base.as(
    (v, t, t2) => _LocalInterfaceInfoCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class LocalInterfaceInfoCopyWith<
  $R,
  $In extends LocalInterfaceInfo,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? ip, int? prefixLength});
  LocalInterfaceInfoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LocalInterfaceInfoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalInterfaceInfo, $Out>
    implements LocalInterfaceInfoCopyWith<$R, LocalInterfaceInfo, $Out> {
  _LocalInterfaceInfoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalInterfaceInfo> $mapper =
      LocalInterfaceInfoMapper.ensureInitialized();
  @override
  $R call({String? ip, int? prefixLength}) => $apply(
    FieldCopyWithData({
      if (ip != null) #ip: ip,
      if (prefixLength != null) #prefixLength: prefixLength,
    }),
  );
  @override
  LocalInterfaceInfo $make(CopyWithData data) => LocalInterfaceInfo(
    ip: data.get(#ip, or: $value.ip),
    prefixLength: data.get(#prefixLength, or: $value.prefixLength),
  );

  @override
  LocalInterfaceInfoCopyWith<$R2, LocalInterfaceInfo, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _LocalInterfaceInfoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

