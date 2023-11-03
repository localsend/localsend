import 'package:package_info_plus/package_info_plus.dart';
import 'package:refena_flutter/refena_flutter.dart';

final versionProvider = FutureProvider((ref) async {
  final info = await PackageInfo.fromPlatform();
  return '${info.version} (${info.buildNumber})';
}, debugLabel: 'VersionProvider');
