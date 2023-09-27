import 'package:freezed_annotation/freezed_annotation.dart';

part 'cached_apk_provider_param.freezed.dart';

@freezed
class CachedApkProviderParam with _$CachedApkProviderParam {
  const factory CachedApkProviderParam({
    required bool includeSystemApps,
    required bool onlyAppsWithLaunchIntent,
  }) = _CachedApkProviderParam;
}
