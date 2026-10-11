import 'package:localsend_isolates/rust/api/http.dart';
import 'package:localsend_isolates/src/isolate/child/sync_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

class HttpClientCollection {
  final String _privateKey;
  final String _certificate;

  HttpClientCollection({
    required String privateKey,
    required String certificate,
  }) : _privateKey = privateKey,
       _certificate = certificate;

  /// A client that only talks to the peer holding the certificate with the
  /// given [fingerprint].
  ///
  /// The check happens during the TLS handshake, so a different peer never
  /// receives the request. Create one per upload task and reuse it for all
  /// files of that task, so the connection is kept alive between them.
  ///
  /// [timeoutMs] bounds each request. Leave it out for uploads, which may
  /// legitimately run for a long time; set it when the peer is unverified and
  /// could keep the request open forever.
  RsHttpClient pinnedTo(String fingerprint, {int? timeoutMs}) {
    return createClient(
      privateKey: _privateKey,
      cert: _certificate,
      version: LsHttpClientVersion.v2,
      expectedFingerprint: fingerprint,
      timeoutMs: timeoutMs,
    );
  }
}

final httpProvider = ViewProvider((ref) {
  final securityContext = ref.watch(syncProvider.select((state) => state.securityContext));
  return HttpClientCollection(
    privateKey: securityContext.privateKey,
    certificate: securityContext.certificate,
  );
});
