import 'dart:convert';
import 'dart:io';

import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/state/send/web/web_download_file.dart';
import 'package:localsend_app/model/state/send/web/web_download_session.dart';
import 'package:localsend_app/model/state/send/web/web_download_state.dart';
import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/native/directories.dart';
import 'package:localsend_app/util/user_agent_analyzer.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/util/android_channel.dart' as isolate_android_channel;
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final _logger = Logger('WebDownloadController');

/// Handles all server events for web download (sending files to web browsers).
/// The web page and the downloads themselves are served by the Rust server
/// which emits the events handled here.
class SendController {
  final ServerUtils server;

  SendController(this.server);

  /// Builds the [WebDownloadState] for the given [files].
  /// Files that only exist in memory (e.g. text messages) are materialized
  /// to the cache directory so the Rust server can stream them.
  Future<WebDownloadState> buildWebDownloadState({required List<CrossFile> files}) async {
    final currentWebDownloadState = server.getStateOrNull()?.webDownloadState;

    return WebDownloadState(
      sessions: {},
      files: Map.fromEntries(
        await Future.wait(
          files.map((file) async {
            final id = _uuid.v4();

            String? path = file.path;
            if (path == null && file.bytes != null) {
              // The Rust server streams file content from disk, so in-memory
              // bytes (text messages, clipboard content) are written to a temp file.
              final tempPath = p.join(await getCacheDirectory(), 'web-download-$id');
              await File(tempPath).writeAsBytes(file.bytes!);
              path = tempPath;
            }

            return MapEntry(
              id,
              WebDownloadFile(
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
                ),
                asset: file.asset,
                path: path,
                bytes: file.bytes,
              ),
            );
          }),
        ),
      ),
      autoAccept: currentWebDownloadState?.autoAccept ?? server.ref.read(settingsProvider).shareViaLinkAutoAccept,
    );
  }

  /// A web client requests to download the shared files.
  /// The Rust server already checked the PIN and handles repeated visits of
  /// accepted sessions itself.
  void onPrepareDownload(HttpServerWebPrepareDownloadEvent event) {
    final webDownloadState = server.getStateOrNull()?.webDownloadState;
    if (webDownloadState == null) {
      // should not happen: web download events are only emitted when web download was configured
      server.ref.redux(parentIsolateProvider).dispatch(IsolateHttpServerPrepareDownloadDecisionAction(sessionId: event.sessionId, accept: false));
      return;
    }

    server.setState(
      (oldState) => oldState!.updateWebDownloadState(
        (webDownload) => webDownload.copyWith(
          sessions: {
            ...webDownload.sessions,
            event.sessionId: WebDownloadSession(
              sessionId: event.sessionId,
              pending: true,
              ip: event.ip,
              deviceInfo: parseDeviceInfoFromUserAgent(event.userAgent),
            ),
          },
        ),
      ),
    );

    if (webDownloadState.autoAccept) {
      acceptRequest(event.sessionId);
    }
  }

  /// A web client downloads an offered file.
  /// The Rust server already validated the session; it streams the content
  /// from the source resolved here.
  Future<void> onFileDownload(HttpServerWebFileDownloadEvent event) async {
    final String? filePath;
    final int? fileDescriptor;
    try {
      final path = server.getStateOrNull()?.webDownloadState?.files[event.fileId]?.path;
      if (path == null) {
        // should not happen: the Rust server only emits events for offered files
        throw StateError('No path for web download file ${event.fileId}');
      }

      if (path.startsWith('content://')) {
        filePath = null;
        fileDescriptor = await isolate_android_channel.getFileDescriptorAndroid(uri: path);
      } else {
        filePath = path;
        fileDescriptor = null;
      }
    } catch (e, st) {
      _logger.severe('Failed to resolve source for web download file ${event.fileId}', e, st);
      // Unblock the web client's request waiting for the content source.
      server.ref.redux(parentIsolateProvider).dispatch(IsolateHttpServerFailFileDownloadAction(sessionId: event.sessionId, fileId: event.fileId));
      return;
    }

    server.ref
        .redux(parentIsolateProvider)
        .dispatch(
          IsolateHttpServerFileDownloadTargetAction(
            sessionId: event.sessionId,
            fileId: event.fileId,
            path: filePath,
            fileDescriptor: fileDescriptor,
          ),
        );
  }

  void acceptRequest(String sessionId) {
    final session = server.getStateOrNull()?.webDownloadState?.sessions[sessionId];
    if (session == null || !session.pending) {
      return;
    }

    server.setState(
      (oldState) => oldState!.updateWebDownloadState(
        (webDownload) => webDownload.updateSession(
          sessionId: sessionId,
          update: (oldSession) => oldSession.copyWith(pending: false),
        ),
      ),
    );

    server.ref.redux(parentIsolateProvider).dispatch(IsolateHttpServerPrepareDownloadDecisionAction(sessionId: sessionId, accept: true));
  }

  void declineRequest(String sessionId) {
    final session = server.getStateOrNull()?.webDownloadState?.sessions[sessionId];
    if (session == null || !session.pending) {
      return;
    }

    server.setState(
      (oldState) => oldState!.updateWebDownloadState(
        (webDownload) => webDownload.copyWith(
          sessions: {
            for (final entry in webDownload.sessions.entries)
              if (entry.key != sessionId) entry.key: entry.value, // remove session
          },
        ),
      ),
    );

    server.ref.redux(parentIsolateProvider).dispatch(IsolateHttpServerPrepareDownloadDecisionAction(sessionId: sessionId, accept: false));
  }
}

/// Parses a human-readable device description from a user agent.
String parseDeviceInfoFromUserAgent(String? userAgent) {
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

extension on WebDownloadState {
  WebDownloadState updateSession({
    required String sessionId,
    required WebDownloadSession Function(WebDownloadSession oldSession) update,
  }) {
    return copyWith(
      sessions: {...sessions}
        ..update(
          sessionId,
          (session) => update(session),
        ),
    );
  }
}
