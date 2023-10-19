import 'dart:io';

import 'package:device_apps/device_apps.dart';
import 'package:localsend_app/provider/param/apk_provider_param.dart';
import 'package:localsend_app/provider/param/cached_apk_provider_param.dart';
import 'package:refena_flutter/refena_flutter.dart';

final apkSearchParamProvider = StateProvider<ApkProviderParam>(
  (ref) => const ApkProviderParam(
    query: '',
    includeSystemApps: false,
    onlyAppsWithLaunchIntent: true,
  ),
);

final apkProvider = ViewProvider<AsyncValue<List<Application>>>((ref) {
  final param = ref.watch(apkSearchParamProvider);

  return ref
      .watch(_apkProvider(CachedApkProviderParam(
        includeSystemApps: param.includeSystemApps,
        onlyAppsWithLaunchIntent: param.onlyAppsWithLaunchIntent,
      )))
      .maybeWhen(
        data: (apps) {
          final query = param.query.trim().toLowerCase();
          if (query.isNotEmpty) {
            apps = apps.where((a) => a.appName.toLowerCase().contains(query) || a.packageName.contains(query)).toList();
          }

          apps.sort((a, b) => a.appName.compareTo(b.appName));
          return AsyncValue<List<Application>>.data(apps);
        },
        orElse: () => const AsyncValue<List<Application>>.loading(),
      );
});

final apkSizeProvider = FutureFamilyProvider<int, String>((_, path) {
  return File(path).length();
});

/// Provides a list of APKs which is cached
final _apkProvider = FutureFamilyProvider<List<Application>, CachedApkProviderParam>((_, param) {
  return DeviceApps.getInstalledApplications(
    includeSystemApps: param.includeSystemApps,
    onlyAppsWithLaunchIntent: param.onlyAppsWithLaunchIntent,
    includeAppIcons: true,
  );
});
