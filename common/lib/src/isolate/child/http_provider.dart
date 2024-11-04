import 'package:common/src/isolate/child/sync_provider.dart';
import 'package:refena/refena.dart';

/// An abstraction to provide a custom http client.
abstract class CustomHttpClient {
  Future<String> get({
    required String uri,
    required Map<String, String> query,
  });

  Future<String> post({
    required String uri,
    Map<String, String> query = const {},
    required Map<String, dynamic> json,
  });

  Future<void> postStream({
    required String uri,
    required Map<String, String> query,
    required Map<String, String> headers,
    required Stream<List<int>> stream,
    required void Function(double) onSendProgress,
    required CustomCancelToken cancelToken,
  });
}

class CustomCancelToken {
  void Function()? _cancel;

  void cancel() {
    _cancel?.call();
  }

  void setCancel(void Function() cancel) {
    _cancel = cancel;
  }
}

class HttpClientCollection {
  final CustomHttpClient discovery;
  final CustomHttpClient longLiving;

  HttpClientCollection({
    required this.discovery,
    required this.longLiving,
  });
}

final httpProvider = ViewProvider((ref) {
  final (clientFactory, securityContext, discoveryTimeout) =
      ref.watch(syncProvider.select((state) => (state.httpClientFactory, state.securityContext, state.discoveryTimeout)));
  return HttpClientCollection(
    discovery: clientFactory(Duration(milliseconds: discoveryTimeout), securityContext),
    longLiving: clientFactory(const Duration(days: 30), securityContext),
  );
});
