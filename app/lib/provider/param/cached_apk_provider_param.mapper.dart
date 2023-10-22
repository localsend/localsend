// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

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

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'CachedApkProviderParam';

  static bool _$includeSystemApps(CachedApkProviderParam v) =>
      v.includeSystemApps;
  static const Field<CachedApkProviderParam, bool> _f$includeSystemApps =
      Field('includeSystemApps', _$includeSystemApps);
  static bool _$onlyAppsWithLaunchIntent(CachedApkProviderParam v) =>
      v.onlyAppsWithLaunchIntent;
  static const Field<CachedApkProviderParam, bool> _f$onlyAppsWithLaunchIntent =
      Field('onlyAppsWithLaunchIntent', _$onlyAppsWithLaunchIntent);

  @override
  final Map<Symbol, Field<CachedApkProviderParam, dynamic>> fields = const {
    #includeSystemApps: _f$includeSystemApps,
    #onlyAppsWithLaunchIntent: _f$onlyAppsWithLaunchIntent,
  };

  static CachedApkProviderParam _instantiate(DecodingData data) {
    return CachedApkProviderParam(
        includeSystemApps: data.dec(_f$includeSystemApps),
        onlyAppsWithLaunchIntent: data.dec(_f$onlyAppsWithLaunchIntent));
  }

  @override
  final Function instantiate = _instantiate;

  static CachedApkProviderParam fromJson(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<CachedApkProviderParam>(map));
  }

  static CachedApkProviderParam deserialize(String json) {
    return _guard((c) => c.fromJson<CachedApkProviderParam>(json));
  }
}

mixin CachedApkProviderParamMappable {
  String serialize() {
    return CachedApkProviderParamMapper._guard(
        (c) => c.toJson(this as CachedApkProviderParam));
  }

  Map<String, dynamic> toJson() {
    return CachedApkProviderParamMapper._guard(
        (c) => c.toMap(this as CachedApkProviderParam));
  }

  CachedApkProviderParamCopyWith<CachedApkProviderParam, CachedApkProviderParam,
          CachedApkProviderParam>
      get copyWith => _CachedApkProviderParamCopyWithImpl(
          this as CachedApkProviderParam, $identity, $identity);
  @override
  String toString() {
    return CachedApkProviderParamMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CachedApkProviderParamMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CachedApkProviderParamMapper._guard((c) => c.hash(this));
  }
}

extension CachedApkProviderParamValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CachedApkProviderParam, $Out> {
  CachedApkProviderParamCopyWith<$R, CachedApkProviderParam, $Out>
      get $asCachedApkProviderParam =>
          $base.as((v, t, t2) => _CachedApkProviderParamCopyWithImpl(v, t, t2));
}

abstract class CachedApkProviderParamCopyWith<
    $R,
    $In extends CachedApkProviderParam,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? includeSystemApps, bool? onlyAppsWithLaunchIntent});
  CachedApkProviderParamCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
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
  $R call({bool? includeSystemApps, bool? onlyAppsWithLaunchIntent}) =>
      $apply(FieldCopyWithData({
        if (includeSystemApps != null) #includeSystemApps: includeSystemApps,
        if (onlyAppsWithLaunchIntent != null)
          #onlyAppsWithLaunchIntent: onlyAppsWithLaunchIntent
      }));
  @override
  CachedApkProviderParam $make(CopyWithData data) => CachedApkProviderParam(
      includeSystemApps:
          data.get(#includeSystemApps, or: $value.includeSystemApps),
      onlyAppsWithLaunchIntent: data.get(#onlyAppsWithLaunchIntent,
          or: $value.onlyAppsWithLaunchIntent));

  @override
  CachedApkProviderParamCopyWith<$R2, CachedApkProviderParam, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CachedApkProviderParamCopyWithImpl($value, $cast, t);
}
