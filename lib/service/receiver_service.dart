import 'dart:io';

import 'package:localsend_app/constants.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

class ReceiverService {
  HttpServer? _server;

  ReceiverService();

  Future<void> start() async {
    if (_server != null) {
      print('Server already running.');
      return;
    }

    final app = Router();

    app.get('/hello', (Request request) {
      return Response.ok('hello-world');
    });

    app.get('/user/<user>', (Request request, String user) {
      return Response.ok('hello $user');
    });

    print('Starting server...');
    _server = await io.serve(app, '0.0.0.0', Constants.defaultPort);
    print('Server started. (Port: ${_server?.port})');
  }

  Future<void> stop() async {
    await _server?.close(force: true);
    _server = null;
    print('Server stopped.');
  }

  bool get running => _server != null;
}
