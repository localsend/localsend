import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:localsend_isolates/api_route_builder.dart';
import 'package:localsend_isolates/model/stored_security_context.dart';
import 'package:logging/logging.dart';

final _logger = Logger('ShowInstance');

/// Asks an app instance that is already running on this machine to show itself
/// and to take over [args].
///
/// Returns `true` when a running instance accepted the handover, so the caller
/// can exit instead of starting a second instance.
///
/// The server demands a client certificate whenever the web pages are not
/// served, so this client must present the device's own certificate. Without
/// it, the TLS handshake is rejected before the request is ever sent and the
/// running instance is never reached.
///
/// If the first attempt gets no answer while [port] is in use, the handover is
/// retried once with [busyTimeout].
Future<bool> notifyRunningInstance({
  required StoredSecurityContext securityContext,
  required int port,
  required bool https,
  required String showToken,
  required List<String> args,
  Duration connectionTimeout = const Duration(milliseconds: 100),
  Duration responseTimeout = const Duration(milliseconds: 500),
  Duration busyTimeout = const Duration(seconds: 3),
  @visibleForTesting Future<bool> Function(int port) isPortInUse = _isPortInUse,
}) async {
  final firstAttempt = await _requestHandover(
    securityContext: securityContext,
    port: port,
    https: https,
    showToken: showToken,
    args: args,
    connectionTimeout: connectionTimeout,
    responseTimeout: responseTimeout,
  );
  if (firstAttempt != _Handover.noAnswer) {
    return firstAttempt == _Handover.accepted;
  }

  // On Windows a closed port times out instead of refusing, so no answer usually
  // means no instance. But a running instance throttled in the tray can also be
  // too slow (https://github.com/localsend/localsend/issues/2479), so wait longer
  // if the port is taken. An instance slower than [busyTimeout] or another app on
  // the port still falls back to a normal start.
  if (!await isPortInUse(port)) {
    return false;
  }

  _logger.warning('Port $port is in use but the running instance did not answer in time, retrying');
  final secondAttempt = await _requestHandover(
    securityContext: securityContext,
    port: port,
    https: https,
    showToken: showToken,
    args: args,
    connectionTimeout: busyTimeout,
    responseTimeout: busyTimeout,
  );
  if (secondAttempt == _Handover.noAnswer) {
    _logger.warning('The running instance on port $port did not answer in time (timeout ${busyTimeout.inSeconds} s per step)');
  }
  return secondAttempt == _Handover.accepted;
}

enum _Handover { accepted, rejected, noAnswer }

Future<_Handover> _requestHandover({
  required StoredSecurityContext securityContext,
  required int port,
  required bool https,
  required String showToken,
  required List<String> args,
  required Duration connectionTimeout,
  required Duration responseTimeout,
}) async {
  final client = HttpClient(context: https ? _clientContext(securityContext) : null);
  client.connectionTimeout = connectionTimeout;

  // The peer is this device itself; its certificate is self-signed by design.
  client.badCertificateCallback = (cert, host, port) => true;

  try {
    // `show` is an internal endpoint that is only served on the v2 path, so the
    // route must not be negotiated like a peer's protocol version.
    final uri = Uri(
      scheme: https ? 'https' : 'http',
      host: '127.0.0.1',
      port: port,
      path: ApiRoute.show.v2,
      queryParameters: {
        'token': showToken,
      },
    );

    final request = await client.postUrl(uri);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode({'args': args}));
    final response = await request.close().timeout(responseTimeout);
    final statusCode = response.statusCode;

    // Read the (empty) body so the connection is not left half-read, but never
    // wait longer than the response timeout for it: the status is already known
    // and startup must not hang on whatever is holding the port.
    try {
      await response.drain<void>().timeout(responseTimeout);
    } catch (_) {
      // A body that never arrives does not change the answer above.
    }

    if (statusCode != 200) {
      // Something answered on the port but refused the handover. That is never
      // normal, and it is exactly what silently degrades into a second instance
      // fighting over the port, so it must not be swallowed.
      _logger.warning('The running instance refused to take over the arguments: HTTP $statusCode');
      return _Handover.rejected;
    }
    return _Handover.accepted;
  } on HandshakeException catch (e) {
    // An instance is listening but the TLS handshake did not complete, e.g.
    // because it did not accept this device's certificate. Also never normal.
    _logger.warning('TLS handshake with the running instance failed: $e');
    return _Handover.rejected;
  } catch (e) {
    // Nothing is listening - the normal case on a regular app start.
    _logger.fine('No running instance took over the arguments: $e');
    return _Handover.noAnswer;
  } finally {
    client.close(force: true);
  }
}

/// The server binds the IPv4 wildcard address, so binding it here fails while
/// an instance holds [port].
Future<bool> _isPortInUse(int port) async {
  try {
    final socket = await ServerSocket.bind(InternetAddress.anyIPv4, port);
    await socket.close();
    return false;
  } on SocketException catch (e) {
    // Other failures, e.g. a port in a range reserved by Windows, are no reason to wait.
    return isAddressInUse(e);
  }
}

@visibleForTesting
bool isAddressInUse(SocketException e) {
  final code = e.osError?.errorCode;
  return switch (Platform.operatingSystem) {
    'windows' => code == 10048, // WSAEADDRINUSE
    'macos' || 'ios' => code == 48, // EADDRINUSE
    _ => code == 98, // EADDRINUSE on Linux and Android
  };
}

/// Presents the device's own certificate, which the server verifies.
SecurityContext _clientContext(StoredSecurityContext securityContext) {
  return SecurityContext(withTrustedRoots: false)
    ..useCertificateChainBytes(utf8.encode(securityContext.certificate))
    ..usePrivateKeyBytes(utf8.encode(securityContext.privateKey));
}
