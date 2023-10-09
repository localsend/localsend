import 'package:dart_mappable/dart_mappable.dart';

part 'apk_provider_param.mapper.dart';

@MappableClass()
class ApkProviderParam with ApkProviderParamMappable {
  final String query;
  final bool includeSystemApps;
  final bool onlyAppsWithLaunchIntent;

  const ApkProviderParam({
    required this.query,
    required this.includeSystemApps,
    required this.onlyAppsWithLaunchIntent,
  });
}
