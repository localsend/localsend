import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:localsend_app/util/user_agent_analyzer.dart';
import 'package:refena_flutter/refena_flutter.dart';
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

  /// Syntax sugar for creating an API response.
  ///
  /// Usage:
  /// responseApi(200, message: 'Hello World')
  Response responseJson(int code, {String? message, Map<String, dynamic>? body}) {
    return Response(
      code,
      body: jsonEncode(message != null ? {'message': message} : (body ?? {})),
      headers: {'content-type': 'application/json'},
    );
  }

  /// Syntax sugar for creating a HTML response.
  ///
  /// Usage:
  /// responseHtml(200, 'assets/web/index.html')
  Future<Response> responseAsset(int code, String asset, [String type = 'text/html; charset=utf-8']) async {
    return Response(
      code,
      body: await rootBundle.loadString(asset),
      headers: {'content-type': type},
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

  /// Client's device info parsed from the user agent.
  String get deviceInfo {
    final userAgent = headers['user-agent'];
    if (userAgent == null) {
      return 'Unknown';
    }

    final userAgentAnalyzer = UserAgentAnalyzer();
    final browser = userAgentAnalyzer.getBrowser(userAgent);
    final os = userAgentAnalyzer.getOS(userAgent);
    if (browser != null && os != null) {
      return '$browser ($os)';
    } else if (browser != null) {
      return browser;
    } else if (os != null) {
      return os;
    } else {
      return 'Unknown';
    }
  }
}
