import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:shelf/shelf.dart';

/// Returns 401 or 429 if the pin is invalid or too many attempts.
/// Returns null if the pin is correct, or if no pin is set.
Response? handlePin({
  required ServerUtils server,
  required String? pin,
  required Map<String, int> pinAttempts,
  required Request request,
}) {
  if (pin != null) {
    final attempts = pinAttempts[request.ip] ?? 0;
    if (attempts >= 3) {
      return server.responseJson(429, message: 'Too many attempts.');
    }

    final requestPin = request.url.queryParameters['pin'];
    if (requestPin != pin) {
      if (requestPin?.isNotEmpty ?? false) {
        pinAttempts[request.ip] = attempts + 1;

        if (attempts == 2) {
          // it was 2 before incrementing
          return server.responseJson(429, message: 'Too many attempts.');
        }
      }
      return server.responseJson(401, message: 'Invalid pin.');
    }
  }

  return null;
}
