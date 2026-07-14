import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/rust/api/http.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// Default timeout for peer-to-peer HTTP requests.
///
/// Without this, packet loss, a Wi-Fi drop, or a peer crash mid-handshake
/// can leave the request awaited indefinitely. 30s is generous enough for
/// slow networks while still letting the user recover and retry.
const httpRequestTimeout = Duration(seconds: 30);

/// Shorter timeout for fire-and-forget signaling calls like `cancel`,
/// where waiting longer just delays local UI cleanup.
const httpFireAndForgetTimeout = Duration(seconds: 5);

/// Maximum gap between successive progress events during an active upload.
/// This is an *inactivity* timeout, not a wall-clock one: large transfers
/// can legitimately take many minutes, but a stalled socket should not.
const uploadProgressInactivityTimeout = Duration(seconds: 60);

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
