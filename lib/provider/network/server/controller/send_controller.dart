import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:localsend_app/constants.dart';
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/model/dto/receive_request_response_dto.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/model/state/send/web/web_send_file.dart';
import 'package:localsend_app/model/state/send/web/web_send_session.dart';
import 'package:localsend_app/model/state/send/web/web_send_state.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// Handles all requests for sending files.
class SendController {
  final ServerUtils server;

  SendController(this.server);

  /// Installs all routes for receiving files.
  void installRoutes({
    required Router router,
    required String alias,
    required String fingerprint,
  }) {
    router.get('/', (Request request) async {
      final state = server.getState();
      if (state.webSendState == null) {
        // There is no web send state
        return server.responseAsset(403, Assets.web.error403);
      }

      return server.responseAsset(200, Assets.web.index);
    });

    router.get('/main.js', (Request request) async {
      final state = server.getState();
      if (state.webSendState == null) {
        // There is no web send state
        return server.responseAsset(403, Assets.web.error403);
      }

      return server.responseAsset(200, Assets.web.main, 'text/javascript; charset=utf-8');
    });

    router.get('/i18n.json', (Request request) async {
      final state = server.getState();
      if (state.webSendState == null) {
        // There is no web send state
        return server.responseJson(403, message: 'Web send not initialized.');
      }

      return server.responseJson(200, body: {
        'waiting': t.web.waiting,
        'rejected': t.web.rejected,
        'files': t.web.files,
        'fileName': t.web.fileName,
        'size': t.web.size,
      });
    });

    router.post(ApiRoute.prepareDownload.v2, (Request request) async {
      final state = server.getState();
      if (state.webSendState == null) {
        // There is no web send state
        return server.responseJson(403, message: 'Web send not initialized.');
      }

      final requestSessionId = request.url.queryParameters['sessionId'];
      if (requestSessionId != null) {
        // Check if the user already has permission
        final session = server.getState().webSendState?.sessions[requestSessionId];
        if (session != null && session.responseHandler == null && session.ip == request.ip) {
          final deviceInfo = server.ref.read(deviceInfoProvider);
          return server.responseJson(200,
              body: ReceiveRequestResponseDto(
                info: InfoDto(
                  alias: alias,
                  version: protocolVersion,
                  deviceModel: deviceInfo.deviceModel,
                  deviceType: deviceInfo.deviceType,
                  fingerprint: fingerprint,
                  download: true,
                ),
                sessionId: session.sessionId,
                files: {
                  for (final entry in state.webSendState!.files.entries) entry.key: entry.value.file,
                },
              ).toJson());
        }
      }

      final streamController = StreamController<bool>();
      final sessionId = _uuid.v4();
      server.setState(
        (oldState) => oldState!.copyWith(
          webSendState: oldState.webSendState!.copyWith(
            sessions: {
              ...oldState.webSendState!.sessions,
              sessionId: WebSendSession(
                sessionId: sessionId,
                responseHandler: streamController,
                ip: request.ip,
                deviceInfo: request.deviceInfo,
              ),
            },
          ),
        ),
      );

      final accepted = await streamController.stream.first;
      if (!accepted) {
        // user rejected the file transfer
        server.setState(
          (oldState) => oldState!.copyWith(
            webSendState: oldState.webSendState!.copyWith(
              sessions: {
                for (final entry in oldState.webSendState!.sessions.entries)
                  if (entry.key != sessionId) entry.key: entry.value, // remove session
              },
            ),
          ),
        );
        return server.responseJson(403, message: 'File transfer rejected.');
      }

      server.setState(
        (oldState) => oldState!.copyWith(
          webSendState: oldState.webSendState!.updateSession(
            sessionId: sessionId,
            update: (oldSession) {
              return oldSession.copyWith(
                responseHandler: null, // this indicates that the session is active
              );
            },
          ),
        ),
      );
      final deviceInfo = server.ref.read(deviceInfoProvider);
      return server.responseJson(200,
          body: ReceiveRequestResponseDto(
            info: InfoDto(
              alias: alias,
              version: protocolVersion,
              deviceModel: deviceInfo.deviceModel,
              deviceType: deviceInfo.deviceType,
              fingerprint: fingerprint,
              download: true,
            ),
            sessionId: sessionId,
            files: {
              for (final entry in state.webSendState!.files.entries) entry.key: entry.value.file,
            },
          ).toJson());
    });

    router.get(ApiRoute.download.v2, (Request request) async {
      final sessionId = request.url.queryParameters['sessionId'];
      if (sessionId == null) {
        return server.responseJson(400, message: 'Missing sessionId.');
      }

      final session = server.getState().webSendState?.sessions[sessionId];
      if (session == null || session.responseHandler != null || session.ip != request.ip) {
        return server.responseJson(403, message: 'Invalid sessionId.');
      }

      final fileId = request.url.queryParameters['fileId'];
      if (fileId == null) {
        return server.responseJson(400, message: 'Missing fileId.');
      }

      final file = server.getState().webSendState?.files[fileId];
      if (file == null) {
        return server.responseJson(403, message: 'Invalid fileId.');
      }

      final fileName = file.file.fileName.replaceAll('/', '-'); // File name may be inside directories
      final headers = {
        'content-type': 'application/octet-stream',
        'content-disposition': 'attachment; filename="${Uri.encodeComponent(fileName)}"',
        'content-length': '${file.file.size}',
      };

      if (file.bytes != null) {
        return Response(
          200,
          body: file.bytes!,
          headers: headers,
        );
      } else {
        return Response(
          200,
          body: File(file.path!).openRead(),
          headers: headers,
        );
      }
    });
  }

  Future<void> initializeWebSend({required List<CrossFile> files}) async {
    final webSendState = WebSendState(
      sessions: {},
      files: Map.fromEntries(await Future.wait(files.map((file) async {
        final id = _uuid.v4();
        return MapEntry(
          id,
          WebSendFile(
            file: FileDto(
              id: id,
              fileName: file.name,
              size: file.size,
              fileType: file.fileType,
              hash: null,
              preview: files.first.fileType == FileType.text && files.first.bytes != null
                  ? utf8.decode(files.first.bytes!) // send simple message by embedding it into the preview
                  : null,
              legacy: false,
            ),
            asset: file.asset,
            path: file.path,
            bytes: file.bytes,
          ),
        );
      }))),
    );

    server.setState(
      (oldState) => oldState?.copyWith(
        webSendState: webSendState,
      ),
    );
  }

  void acceptRequest(String sessionId) {
    _respondRequest(sessionId, true);
  }

  void declineRequest(String sessionId) {
    _respondRequest(sessionId, false);
  }

  void _respondRequest(String sessionId, bool accepted) {
    final controller = server.getState().webSendState?.sessions[sessionId]?.responseHandler;
    if (controller == null) {
      return;
    }

    controller.add(accepted);
    controller.close(); // ignore: discarded_futures
  }
}

extension on WebSendState {
  WebSendState updateSession({
    required String sessionId,
    required WebSendSession Function(WebSendSession oldSession) update,
  }) {
    return copyWith(
      sessions: {...sessions}..update(
          sessionId,
          (session) => update(session),
        ),
    );
  }
}
