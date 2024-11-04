import 'package:localsend_app/provider/logging/http_logs_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/rhttp.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:rhttp/rhttp.dart';

class HttpClientCollection {
  final RhttpClient discovery;
  final RhttpClient longLiving;

  HttpClientCollection({
    required this.discovery,
    required this.longLiving,
  });
}

/// Provides a dio having a specific timeout.
/// Changes must be made in common/lib/src/isolate/child/dio_provider.dart also
final httpProvider = ViewProvider((ref) {
  final securityContext = ref.watch(securityProvider);
  final discoveryTimeout = ref.watch(settingsProvider.select((state) => state.discoveryTimeout));
  return HttpClientCollection(
    discovery: createRhttpClient(Duration(milliseconds: discoveryTimeout), securityContext),
    longLiving: createRhttpClient(
      const Duration(days: 30),
      securityContext,
      interceptor: SimpleInterceptor(
        beforeRequest: (request) async {
          ref.notifier(httpLogsProvider).addLog('HTTP Request: ${request.method} ${request.url}');
          return Interceptor.next();
        },
        afterResponse: (response) async {
          final body = switch (response) {
            HttpTextResponse() => response.body,
            HttpBytesResponse() => '<${response.body.length} bytes>',
            HttpStreamResponse() => '<stream>',
          };

          ref
              .notifier(httpLogsProvider)
              .addLog('HTTP Response: ${response.request.method} ${response.request.url} returned ${response.statusCode} with body: $body');
          return Interceptor.next();
        },
        onError: (exception) async {
          ref.notifier(httpLogsProvider).addLog(exception.toString());
          return Interceptor.next();
        },
      ),
    ),
  );
});
