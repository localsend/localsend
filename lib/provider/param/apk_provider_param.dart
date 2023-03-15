import 'package:freezed_annotation/freezed_annotation.dart';

part 'apk_provider_param.freezed.dart';

@freezed
class ApkProviderParam with _$ApkProviderParam {
  const factory ApkProviderParam({
    required String query,
    required bool includeSystemApps,
    required bool onlyAppsWithLaunchIntent,
  }) = _ApkProviderParam;
}
