import 'package:common/util/dio.dart';
import 'package:dio/dio.dart';
import 'package:localsend_app/provider/logging/http_logs_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

class DioCollection {
  final Dio discovery;
  final Dio longLiving;

  DioCollection({
    required this.discovery,
    required this.longLiving,
  });
}

/// Provides a dio having a specific timeout.
/// Changes must be made in common/lib/src/isolate/child/dio_provider.dart also
final dioProvider = ViewProvider((ref) {
  final securityContext = ref.watch(securityProvider);
  final discoveryTimeout = ref.watch(settingsProvider.select((state) => state.discoveryTimeout));
  return DioCollection(
    discovery: createDio(Duration(milliseconds: discoveryTimeout), securityContext),
    longLiving: createDio(
      const Duration(days: 30),
      securityContext,
      interceptor: LogInterceptor(
        requestHeader: false,
        requestBody: true,
        request: false,
        responseHeader: false,
        responseBody: true,
        error: true,
        logPrint: (log) => ref.notifier(httpLogsProvider).addLog(log.toString()),
      ),
    ),
  );
});
