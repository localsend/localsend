import 'package:common/isolate.dart';
import 'package:common/model/stored_security_context.dart';
import 'package:rhttp/rhttp.dart';

class RhttpWrapper implements CustomHttpClient {
  final RhttpClient _client;

  RhttpWrapper._(this._client);

  factory RhttpWrapper.create(Duration timeout, StoredSecurityContext securityContext) {
    final client = RhttpClient.createSync(
      settings: ClientSettings(
        timeoutSettings: TimeoutSettings(
          timeout: timeout,
        ),
        tlsSettings: TlsSettings(
          verifyCertificates: false,
          clientCertificate: ClientCertificate(
            certificate: securityContext.certificate,
            privateKey: securityContext.privateKey,
          ),
        ),
      ),
    );
    return RhttpWrapper._(client);
  }

  @override
  Future<void> postStream({
    required String uri,
    required Map<String, String> query,
    required Map<String, String> headers,
    required Stream<List<int>> stream,
    required void Function(double progress) onSendProgress,
    required CustomCancelToken cancelToken,
  }) async {
    final token = CancelToken();
    cancelToken.setCancel(token.cancel);
    await _client.request(
      method: HttpMethod.post,
      expectBody: HttpExpectBody.bytes,
      url: uri,
      query: query,
      headers: HttpHeaders.rawMap(headers),
      body: HttpBody.stream(
        stream,
        length: int.parse(headers['Content-Length']!),
      ),
      onSendProgress: (curr, total) {
        onSendProgress(curr / total);
      },
      cancelToken: token,
    );
  }
}
