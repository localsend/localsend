// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cached_apk_provider_param.dart';

class CachedApkProviderParamMapper
    extends ClassMapperBase<CachedApkProviderParam> {
  CachedApkProviderParamMapper._();

  static CachedApkProviderParamMapper? _instance;
  static CachedApkProviderParamMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CachedApkProviderParamMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CachedApkProviderParam';

  static bool _$includeSystemApps(CachedApkProviderParam v) =>
      v.includeSystemApps;
  static const Field<CachedApkProviderParam, bool> _f$includeSystemApps = Field(
    'includeSystemApps',
    _$includeSystemApps,
  );
  static bool _$onlyAppsWithLaunchIntent(CachedApkProviderParam v) =>
      v.onlyAppsWithLaunchIntent;
  static const Field<CachedApkProviderParam, bool> _f$onlyAppsWithLaunchIntent =
      Field('onlyAppsWithLaunchIntent', _$onlyAppsWithLaunchIntent);
  static bool _$selectMultipleApps(CachedApkProviderParam v) =>
      v.selectMultipleApps;
  static const Field<CachedApkProviderParam, bool> _f$selectMultipleApps =
      Field('selectMultipleApps', _$selectMultipleApps, opt: true, def: false);

  @override
  final MappableFields<CachedApkProviderParam> fields = const {
    #includeSystemApps: _f$includeSystemApps,
    #onlyAppsWithLaunchIntent: _f$onlyAppsWithLaunchIntent,
    #selectMultipleApps: _f$selectMultipleApps,
  };

  static CachedApkProviderParam _instantiate(DecodingData data) {
    return CachedApkProviderParam(
      includeSystemApps: data.dec(_f$includeSystemApps),
      onlyAppsWithLaunchIntent: data.dec(_f$onlyAppsWithLaunchIntent),
      selectMultipleApps: data.dec(_f$selectMultipleApps),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CachedApkProviderParam fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CachedApkProviderParam>(map);
  }

  static CachedApkProviderParam deserialize(String json) {
    return ensureInitialized().decodeJson<CachedApkProviderParam>(json);
  }
}

mixin CachedApkProviderParamMappable {
  String serialize() {
    return CachedApkProviderParamMapper.ensureInitialized()
        .encodeJson<CachedApkProviderParam>(this as CachedApkProviderParam);
  }

  Map<String, dynamic> toJson() {
    return CachedApkProviderParamMapper.ensureInitialized()
        .encodeMap<CachedApkProviderParam>(this as CachedApkProviderParam);
  }

  CachedApkProviderParamCopyWith<
    CachedApkProviderParam,
    CachedApkProviderParam,
    CachedApkProviderParam
  >
  get copyWith =>
      _CachedApkProviderParamCopyWithImpl<
        CachedApkProviderParam,
        CachedApkProviderParam
      >(this as CachedApkProviderParam, $identity, $identity);
  @override
  String toString() {
    return CachedApkProviderParamMapper.ensureInitialized().stringifyValue(
      this as CachedApkProviderParam,
    );
  }

  @override
  bool operator ==(Object other) {
    return CachedApkProviderParamMapper.ensureInitialized().equalsValue(
      this as CachedApkProviderParam,
      other,
    );
  }

  @override
  int get hashCode {
    return CachedApkProviderParamMapper.ensureInitialized().hashValue(
      this as CachedApkProviderParam,
    );
  }
}

extension CachedApkProviderParamValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CachedApkProviderParam, $Out> {
  CachedApkProviderParamCopyWith<$R, CachedApkProviderParam, $Out>
  get $asCachedApkProviderParam => $base.as(
    (v, t, t2) => _CachedApkProviderParamCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CachedApkProviderParamCopyWith<
  $R,
  $In extends CachedApkProviderParam,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    bool? includeSystemApps,
    bool? onlyAppsWithLaunchIntent,
    bool? selectMultipleApps,
  });
  CachedApkProviderParamCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CachedApkProviderParamCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CachedApkProviderParam, $Out>
    implements
        CachedApkProviderParamCopyWith<$R, CachedApkProviderParam, $Out> {
  _CachedApkProviderParamCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CachedApkProviderParam> $mapper =
      CachedApkProviderParamMapper.ensureInitialized();
  @override
  $R call({
    bool? includeSystemApps,
    bool? onlyAppsWithLaunchIntent,
    bool? selectMultipleApps,
  }) => $apply(
    FieldCopyWithData({
      if (includeSystemApps != null) #includeSystemApps: includeSystemApps,
      if (onlyAppsWithLaunchIntent != null)
        #onlyAppsWithLaunchIntent: onlyAppsWithLaunchIntent,
      if (selectMultipleApps != null) #selectMultipleApps: selectMultipleApps,
    }),
  );
  @override
  CachedApkProviderParam $make(CopyWithData data) => CachedApkProviderParam(
    includeSystemApps: data.get(
      #includeSystemApps,
      or: $value.includeSystemApps,
    ),
    onlyAppsWithLaunchIntent: data.get(
      #onlyAppsWithLaunchIntent,
      or: $value.onlyAppsWithLaunchIntent,
    ),
    selectMultipleApps: data.get(
      #selectMultipleApps,
      or: $value.selectMultipleApps,
    ),
  );

  @override
  CachedApkProviderParamCopyWith<$R2, CachedApkProviderParam, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CachedApkProviderParamCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

