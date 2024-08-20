import 'dart:io';

import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:localsend_app/util/simple_server.dart';

/// Responds with 401 or 429 if the pin is invalid or too many attempts.
/// Returns true if the pin is correct, or if no pin is set.
Future<bool> checkPin({
  required ServerUtils server,
  required String? pin,
  required Map<String, int> pinAttempts,
  required HttpRequest request,
}) async {
  if (pin != null) {
    final attempts = pinAttempts[request.ip] ?? 0;
    if (attempts >= 3) {
      await request.respondJson(429, message: 'Too many attempts.');
      return false;
    }

    final requestPin = request.uri.queryParameters['pin'];
    if (requestPin != pin) {
      if (requestPin?.isNotEmpty ?? false) {
        pinAttempts[request.ip] = attempts + 1;

        if (attempts == 2) {
          // it was 2 before incrementing
          await request.respondJson(429, message: 'Too many attempts.');
          return false;
        }
      }
      await request.respondJson(401, message: 'Invalid pin.');
      return false;
    }
  }

  return true;
}
