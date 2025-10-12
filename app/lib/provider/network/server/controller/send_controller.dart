import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:common/api_route_builder.dart';
import 'package:common/constants.dart';
import 'package:common/model/dto/file_dto.dart';
import 'package:common/model/dto/info_dto.dart';
import 'package:common/model/dto/receive_request_response_dto.dart';
import 'package:common/model/file_type.dart';
import 'package:common/util/stream.dart';
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/state/send/web/web_send_file.dart';
import 'package:localsend_app/model/state/send/web/web_send_session.dart';
import 'package:localsend_app/model/state/send/web/web_send_state.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/server/controller/common.dart';
import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/simple_server.dart';
import 'package:uri_content/uri_content.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// Handles all requests for sending files.
class SendController {
  final ServerUtils server;

  SendController(this.server);

  /// Installs all routes for receiving files.
  void installRoutes({
    required SimpleServerRouteBuilder router,
    required String alias,
    required String fingerprint,
  }) {
    router.get('/', (HttpRequest request) async {
      final state = server.getState();
      if (state.webSendState == null) {
        // There is no web send state
        return await request.respondAsset(403, Assets.web.error403);
      }

      return await request.respondAsset(200, Assets.web.index);
    });

    router.get('/main.js', (HttpRequest request) async {
      final state = server.getState();
      if (state.webSendState == null) {
        // There is no web send state
        return await request.respondAsset(403, Assets.web.error403);
      }

      return await request.respondAsset(200, Assets.web.main, 'text/javascript; charset=utf-8');
    });

    router.get('/i18n.json', (HttpRequest request) async {
      final state = server.getState();
      if (state.webSendState == null) {
        // There is no web send state
        return await request.respondJson(403, message: 'Web send not initialized.');
      }

      return await request.respondJson(200, body: {
        'waiting': t.web.waiting,
        'enterPin': t.web.enterPin,
        'invalidPin': t.web.invalidPin,
        'tooManyAttempts': t.web.tooManyAttempts,
        'rejected': t.web.rejected,
        'files': t.web.files,
        'fileName': t.web.fileName,
        'size': t.web.size,
      });
    });

    router.post(ApiRoute.prepareDownload.v2, (HttpRequest request) async {
      final state = server.getState();
      if (state.webSendState == null) {
        // There is no web send state
        return request.respondJson(403, message: 'Web send not initialized.');
      }

      final requestSessionId = request.uri.queryParameters['sessionId'];
      if (requestSessionId != null) {
        // Check if the user already has permission
        final session = server.getState().webSendState?.sessions[requestSessionId];
        if (session != null && session.responseHandler == null && session.ip == request.ip) {
          final deviceInfo = server.ref.read(deviceInfoProvider);
          return await request.respondJson(200,
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

      final pinCorrect = await checkPin(
        server: server,
        pin: state.webSendState!.pin,
        pinAttempts: state.webSendState!.pinAttempts,
        request: request,
      );
      if (!pinCorrect) {
        return;
      }

      final streamController = StreamController<bool>();
      final sessionId = request.ip;
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

      final accepted = state.webSendState?.autoAccept == true || await streamController.stream.first;
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
        return await request.respondJson(403, message: 'File transfer rejected.');
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
      return await request.respondJson(200,
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

    router.get(ApiRoute.download.v2, (HttpRequest request) async {
      final sessionId = request.uri.queryParameters['sessionId'];
      if (sessionId == null) {
        return await request.respondJson(400, message: 'Missing sessionId.');
      }

      final session = server.getState().webSendState?.sessions[sessionId];
      if (session == null || session.responseHandler != null || session.ip != request.ip) {
        return await request.respondJson(403, message: 'Invalid sessionId.');
      }

      final fileId = request.uri.queryParameters['fileId'];
      if (fileId == null) {
        return await request.respondJson(400, message: 'Missing fileId.');
      }

      final file = server.getState().webSendState?.files[fileId];
      if (file == null) {
        return await request.respondJson(403, message: 'Invalid fileId.');
      }

      final fileName = file.file.fileName.replaceAll('/', '-'); // File name may be inside directories

      request.response
        ..statusCode = 200
        ..headers.set('content-type', 'application/octet-stream')
        ..headers.set('content-disposition', 'attachment; filename="${Uri.encodeComponent(fileName)}"');

      final isInlineContent = file.bytes != null; // text message, clipboard content
      if (isInlineContent) {
        request.response.headers.set('content-length', '${file.bytes!.length}');

        final byteStream = Stream.fromIterable([file.bytes!]);
        final (streamController, subscription) = byteStream.digested();

        await request.response.addStream(streamController.stream).then((_) {
          // ignore: discarded_futures
          request.response.close();
          // ignore: discarded_futures
          subscription.cancel();
        });
      } else {
        final path = file.path!;
        final isContentUri = path.startsWith('content://');

        // Read file size at download time, since the file could have changed since it was selected (#2359, #2043)
        final fileSize = isContentUri ? await UriContent().getContentLength(Uri.parse(path)) : File(path).lengthSync();
        request.response.headers.set('content-length', '$fileSize');

        final fileStream = isContentUri ? UriContent().getContentStream(Uri.parse(path)) : File(path).openRead();
        final (streamController, subscription) = fileStream.digested();

        await request.response.addStream(streamController.stream).then((_) {
          request.response.close(); // ignore: discarded_futures
          subscription.cancel(); // ignore: discarded_futures
        });
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
              metadata: file.lastModified != null || file.lastAccessed != null
                  ? FileMetadata(
                      lastModified: file.lastModified,
                      lastAccessed: file.lastAccessed,
                    )
                  : null,
              legacy: false,
            ),
            asset: file.asset,
            path: file.path,
            bytes: file.bytes,
          ),
        );
      }))),
      autoAccept: server.ref.read(settingsProvider).shareViaLinkAutoAccept,
      pin: null,
      pinAttempts: {},
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
