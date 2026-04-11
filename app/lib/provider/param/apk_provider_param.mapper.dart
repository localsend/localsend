// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'apk_provider_param.dart';

class ApkProviderParamMapper extends ClassMapperBase<ApkProviderParam> {
  ApkProviderParamMapper._();

  static ApkProviderParamMapper? _instance;
  static ApkProviderParamMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApkProviderParamMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ApkProviderParam';

  static String _$query(ApkProviderParam v) => v.query;
  static const Field<ApkProviderParam, String> _f$query = Field(
    'query',
    _$query,
  );
  static bool _$includeSystemApps(ApkProviderParam v) => v.includeSystemApps;
  static const Field<ApkProviderParam, bool> _f$includeSystemApps = Field(
    'includeSystemApps',
    _$includeSystemApps,
  );
  static bool _$onlyAppsWithLaunchIntent(ApkProviderParam v) =>
      v.onlyAppsWithLaunchIntent;
  static const Field<ApkProviderParam, bool> _f$onlyAppsWithLaunchIntent =
      Field('onlyAppsWithLaunchIntent', _$onlyAppsWithLaunchIntent);
  static bool _$selectMultipleApps(ApkProviderParam v) => v.selectMultipleApps;
  static const Field<ApkProviderParam, bool> _f$selectMultipleApps = Field(
    'selectMultipleApps',
    _$selectMultipleApps,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<ApkProviderParam> fields = const {
    #query: _f$query,
    #includeSystemApps: _f$includeSystemApps,
    #onlyAppsWithLaunchIntent: _f$onlyAppsWithLaunchIntent,
    #selectMultipleApps: _f$selectMultipleApps,
  };

  static ApkProviderParam _instantiate(DecodingData data) {
    return ApkProviderParam(
      query: data.dec(_f$query),
      includeSystemApps: data.dec(_f$includeSystemApps),
      onlyAppsWithLaunchIntent: data.dec(_f$onlyAppsWithLaunchIntent),
      selectMultipleApps: data.dec(_f$selectMultipleApps),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ApkProviderParam fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ApkProviderParam>(map);
  }

  static ApkProviderParam deserialize(String json) {
    return ensureInitialized().decodeJson<ApkProviderParam>(json);
  }
}

mixin ApkProviderParamMappable {
  String serialize() {
    return ApkProviderParamMapper.ensureInitialized()
        .encodeJson<ApkProviderParam>(this as ApkProviderParam);
  }

  Map<String, dynamic> toJson() {
    return ApkProviderParamMapper.ensureInitialized()
        .encodeMap<ApkProviderParam>(this as ApkProviderParam);
  }

  ApkProviderParamCopyWith<ApkProviderParam, ApkProviderParam, ApkProviderParam>
  get copyWith =>
      _ApkProviderParamCopyWithImpl<ApkProviderParam, ApkProviderParam>(
        this as ApkProviderParam,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ApkProviderParamMapper.ensureInitialized().stringifyValue(
      this as ApkProviderParam,
    );
  }

  @override
  bool operator ==(Object other) {
    return ApkProviderParamMapper.ensureInitialized().equalsValue(
      this as ApkProviderParam,
      other,
    );
  }

  @override
  int get hashCode {
    return ApkProviderParamMapper.ensureInitialized().hashValue(
      this as ApkProviderParam,
    );
  }
}

extension ApkProviderParamValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ApkProviderParam, $Out> {
  ApkProviderParamCopyWith<$R, ApkProviderParam, $Out>
  get $asApkProviderParam =>
      $base.as((v, t, t2) => _ApkProviderParamCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ApkProviderParamCopyWith<$R, $In extends ApkProviderParam, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? query,
    bool? includeSystemApps,
    bool? onlyAppsWithLaunchIntent,
    bool? selectMultipleApps,
  });
  ApkProviderParamCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ApkProviderParamCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ApkProviderParam, $Out>
    implements ApkProviderParamCopyWith<$R, ApkProviderParam, $Out> {
  _ApkProviderParamCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ApkProviderParam> $mapper =
      ApkProviderParamMapper.ensureInitialized();
  @override
  $R call({
    String? query,
    bool? includeSystemApps,
    bool? onlyAppsWithLaunchIntent,
    bool? selectMultipleApps,
  }) => $apply(
    FieldCopyWithData({
      if (query != null) #query: query,
      if (includeSystemApps != null) #includeSystemApps: includeSystemApps,
      if (onlyAppsWithLaunchIntent != null)
        #onlyAppsWithLaunchIntent: onlyAppsWithLaunchIntent,
      if (selectMultipleApps != null) #selectMultipleApps: selectMultipleApps,
    }),
  );
  @override
  ApkProviderParam $make(CopyWithData data) => ApkProviderParam(
    query: data.get(#query, or: $value.query),
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
  ApkProviderParamCopyWith<$R2, ApkProviderParam, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ApkProviderParamCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

