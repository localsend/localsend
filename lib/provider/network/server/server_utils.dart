import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:shelf/shelf.dart';

/// Having this class allows us to have one parameter to access all relevant server methods.
class ServerUtils {
  /// The ref to the provider.
  Ref Function() refFunc;
  Ref get ref => refFunc();

  /// The current server state.
  /// This should be used within route controllers because it is guaranteed to be online and therefore non-null.
  ServerState Function() getState;

  /// The current server state or null.
  /// This should be used outside of routes because the server may be offline.
  ServerState? Function() getStateOrNull;

  /// Updates the server state.
  void Function(ServerState? Function(ServerState? oldState) builder) setState;

  /// Syntax sugar for creating a response.
  ///
  /// Usage:
  /// response(200, message: 'Hello World')
  Response response(int code, {String? message, Map<String, dynamic>? body}) {
    return Response(
      code,
      body: jsonEncode(message != null ? {'message': message} : (body ?? {})),
      headers: {'content-type': 'application/json'},
    );
  }

  ServerUtils({
    required this.refFunc,
    required this.getState,
    required this.getStateOrNull,
    required this.setState,
  });
}

extension RequestExt on Request {
  /// The IP address of the client.
  String get ip {
    return (context['shelf.io.connection_info'] as HttpConnectionInfo).remoteAddress.address;
  }
}
