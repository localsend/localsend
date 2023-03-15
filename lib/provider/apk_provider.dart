import 'dart:io';

import 'package:device_apps/device_apps.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/provider/param/apk_provider_param.dart';
import 'package:localsend_app/provider/param/cached_apk_provider_param.dart';

final apkProvider = Provider.family.autoDispose<AsyncValue<List<Application>>, ApkProviderParam>((ref, param) {
  return ref.watch(_apkProvider(CachedApkProviderParam(
    includeSystemApps: param.includeSystemApps,
    onlyAppsWithLaunchIntent: param.onlyAppsWithLaunchIntent,
  ))).whenData((apps) {
    final query = param.query.trim().toLowerCase();
    if (query.isNotEmpty) {
      apps = apps.where((a) => a.appName.contains(query) || a.packageName.contains(query)).toList();
    }

    return apps..sort((a, b) => a.appName.compareTo(b.appName));
  });
});

final apkSizeProvider = FutureProvider.family<int, String>((_, path) {
  return File(path).length();
});

/// Provides a list of APKs which is cached
final _apkProvider = FutureProvider.family<List<Application>, CachedApkProviderParam>((_, param) {
  return DeviceApps.getInstalledApplications(
    includeSystemApps: param.includeSystemApps,
    onlyAppsWithLaunchIntent: param.onlyAppsWithLaunchIntent,
    includeAppIcons: true,
  );
});
