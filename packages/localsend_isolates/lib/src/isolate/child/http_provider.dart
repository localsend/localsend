import 'package:localsend_isolates/rust/api/http.dart';
import 'package:localsend_isolates/src/isolate/child/sync_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

class HttpClientCollection {
  final RsHttpClient discovery;
  final RsHttpClient longLiving;

  HttpClientCollection({
    required this.discovery,
    required this.longLiving,
  });
}

final httpProvider = ViewProvider((ref) {
  final (securityContext, discoveryTimeout) = ref.watch(
    syncProvider.select((state) => (state.securityContext, state.discoveryTimeout)),
  );
  return HttpClientCollection(
    discovery: createClient(
      privateKey: securityContext.privateKey,
      cert: securityContext.certificate,
      version: LsHttpClientVersion.v2,
      timeoutMs: discoveryTimeout,
    ),
    longLiving: createClient(
      privateKey: securityContext.privateKey,
      cert: securityContext.certificate,
      version: LsHttpClientVersion.v2,
    ),
  );
});
