import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/rust/api/http.dart';
import 'package:refena_flutter/refena_flutter.dart';

class HttpClientCollection {
  final RsHttpClient v2;

  HttpClientCollection({
    required this.v2,
  });
}

/// Provides an HTTP client for each protocol version.
final httpProvider = ViewProvider((ref) {
  final securityContext = ref.watch(securityProvider);
  return HttpClientCollection(
    v2: createClient(privateKey: securityContext.privateKey, cert: securityContext.certificate, version: LsHttpClientVersion.v2),
  );
});
