import 'package:dart_mappable/dart_mappable.dart';

part 'cached_apk_provider_param.mapper.dart';

@MappableClass()
class CachedApkProviderParam with CachedApkProviderParamMappable {
  final bool includeSystemApps;
  final bool onlyAppsWithLaunchIntent;

  const CachedApkProviderParam({
    required this.includeSystemApps,
    required this.onlyAppsWithLaunchIntent,
  });
}
