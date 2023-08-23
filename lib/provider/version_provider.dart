import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpie_flutter/riverpie_flutter.dart';

final versionProvider = FutureProvider((ref) async {
  final info = await PackageInfo.fromPlatform();
  return '${info.version} (${info.buildNumber})';
});
