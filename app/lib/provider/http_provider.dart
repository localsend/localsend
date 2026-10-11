import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_isolates/rust/api/http.dart';
import 'package:refena_flutter/refena_flutter.dart';

class HttpClientCollection {
  final String _privateKey;
  final String _certificate;

  /// A client that accepts any valid peer certificate.
  ///
  /// Only for discovery, where the certificate of the peer is not known yet
  /// and is learned from the response. Never use this to transfer files:
  /// it cannot tell the discovered device apart from anyone else answering
  /// on that address.
  final RsHttpClient discovery;

  HttpClientCollection({
    required String privateKey,
    required String certificate,
    required this.discovery,
  }) : _privateKey = privateKey,
       _certificate = certificate;

  /// A client that only talks to the peer holding the certificate with the
  /// given [fingerprint].
  ///
  /// The check happens during the TLS handshake, so a different peer never
  /// receives the request. Use this for everything that carries file data or
  /// belongs to a session with a device the user has picked.
  RsHttpClient pinnedTo(String fingerprint) {
    return createClient(
      privateKey: _privateKey,
      cert: _certificate,
      version: LsHttpClientVersion.v2,
      expectedFingerprint: fingerprint,
    );
  }
}

/// Provides an HTTP client for each protocol version.
final httpProvider = ViewProvider((ref) {
  final securityContext = ref.watch(securityProvider);
  return HttpClientCollection(
    privateKey: securityContext.privateKey,
    certificate: securityContext.certificate,
    discovery: createClient(
      privateKey: securityContext.privateKey,
      cert: securityContext.certificate,
      version: LsHttpClientVersion.v2,
      expectedFingerprint: null,
    ),
  );
});
