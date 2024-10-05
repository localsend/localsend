import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:common/api_route_builder.dart';
import 'package:common/model/device.dart';
import 'package:common/model/dto/file_dto.dart';
import 'package:common/model/dto/info_register_dto.dart';
import 'package:common/model/dto/multicast_dto.dart';
import 'package:common/model/dto/prepare_upload_request_dto.dart';
import 'package:common/model/dto/prepare_upload_response_dto.dart';
import 'package:common/model/file_status.dart';
import 'package:common/model/file_type.dart';
import 'package:common/model/session_status.dart';
import 'package:common/util/sleep.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/send_mode.dart';
import 'package:localsend_app/model/state/send/send_session_state.dart';
import 'package:localsend_app/model/state/send/sending_file.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/pages/send_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/stream.dart';
import 'package:localsend_app/widget/dialogs/pin_dialog.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';
import 'package:uri_content/uri_content.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();
final _logger = Logger('Send');

/// This provider manages sending files to other devices.
///
/// In contrast to [serverProvider], this provider does not manage a server.
/// Instead, it only does HTTP requests to other servers.
final sendProvider = NotifierProvider<SendNotifier, Map<String, SendSessionState>>((ref) {
  return SendNotifier();
});

class SendNotifier extends Notifier<Map<String, SendSessionState>> {
  SendNotifier();

  @override
  Map<String, SendSessionState> init() {
    return {};
  }

  /// Starts a session.
  /// If [background] is true, then the session closes itself on success and no pages will be open
  /// If [background] is false, then this method will open pages by itself and waits for user input to close the session.
  Future<void> startSession({
    required Device target,
    required List<CrossFile> files,
    required bool background,
  }) async {
    final requestDio = ref.read(dioProvider).longLiving;
    final cancelToken = CancelToken();
    final sessionId = _uuid.v4();

    final requestState = SendSessionState(
      sessionId: sessionId,
      remoteSessionId: null,
      background: background,
      status: SessionStatus.waiting,
      target: target,
      files: Map.fromEntries(await Future.wait(files.map((file) async {
        final id = _uuid.v4();
        return MapEntry(
          id,
          SendingFile(
            file: FileDto(
              id: id,
              fileName: file.name,
              size: file.size,
              fileType: file.fileType,
              hash: null,
              preview: files.length == 1 && files.first.fileType == FileType.text && files.first.bytes != null
                  ? utf8.decode(files.first.bytes!) // send simple message by embedding it into the preview
                  : null,
              metadata: file.lastModified != null || file.lastAccessed != null
                  ? FileMetadata(
                      lastModified: file.lastModified,
                      lastAccessed: file.lastAccessed,
                    )
                  : null,
              legacy: target.version == '1.0',
            ),
            status: FileStatus.queue,
            token: null,
            thumbnail: file.thumbnail,
            asset: file.asset,
            path: file.path,
            bytes: file.bytes,
            errorMessage: null,
          ),
        );
      }))),
      startTime: null,
      endTime: null,
      cancelToken: cancelToken,
      errorMessage: null,
    );

    final originDevice = ref.read(deviceFullInfoProvider);
    final requestDto = PrepareUploadRequestDto(
      info: InfoRegisterDto(
        alias: originDevice.alias,
        version: originDevice.version,
        deviceModel: originDevice.deviceModel,
        deviceType: originDevice.deviceType,
        fingerprint: originDevice.fingerprint,
        port: originDevice.port,
        protocol: originDevice.https ? ProtocolType.https : ProtocolType.http,
        download: originDevice.download,
      ),
      files: {
        for (final entry in requestState.files.entries) entry.key: entry.value.file,
      },
    );

    state = state.updateSession(
      sessionId: sessionId,
      state: (_) => requestState,
    );

    if (!background) {
      // ignore: use_build_context_synchronously, unawaited_futures
      Routerino.context.push(
        () => SendPage(showAppBar: false, closeSessionOnClose: true, sessionId: sessionId),
        transition: RouterinoTransition.fade(),
      );
    }

    Response? response;
    bool invalidPin;
    bool pinFirstAttempt = true;
    String? pin;
    do {
      invalidPin = false;
      try {
        response = await requestDio.post(
          ApiRoute.prepareUpload.target(target, query: {
            if (pin != null) 'pin': pin,
          }),
          data: jsonEncode(requestDto), // jsonEncode for better logging
          cancelToken: cancelToken,
        );
      } on DioException catch (e) {
        switch (e.response?.statusCode) {
          case 401:
            invalidPin = true;

            // wait until animation is finished
            await sleepAsync(500);

            pin = await showDialog<String>(
              context: Routerino.context, // ignore: use_build_context_synchronously
              builder: (_) => PinDialog(
                obscureText: true,
                showInvalidPin: !pinFirstAttempt,
              ),
            );

            pinFirstAttempt = false;

            if (pin == null) {
              state = state.updateSession(
                sessionId: sessionId,
                state: (s) => s?.copyWith(
                  status: SessionStatus.canceledBySender,
                ),
              );
              return;
            }
            break;
          case 403:
            state = state.updateSession(
              sessionId: sessionId,
              state: (s) => s?.copyWith(
                status: SessionStatus.declined,
              ),
            );
            return;
          case 409:
            state = state.updateSession(
              sessionId: sessionId,
              state: (s) => s?.copyWith(
                status: SessionStatus.recipientBusy,
              ),
            );
            return;
          case 429:
            state = state.updateSession(
              sessionId: sessionId,
              state: (s) => s?.copyWith(
                status: SessionStatus.tooManyAttempts,
              ),
            );
            return;
          default:
            state = state.updateSession(
              sessionId: sessionId,
              state: (s) => s?.copyWith(
                status: SessionStatus.finishedWithErrors,
                errorMessage: e.humanErrorMessage,
              ),
            );
            return;
        }
      } catch (e) {
        state = state.updateSession(
          sessionId: sessionId,
          state: (s) => s?.copyWith(
            status: SessionStatus.finishedWithErrors,
            errorMessage: e.humanErrorMessage,
          ),
        );
        return;
      }
    } while (invalidPin);

    if (response == null) {
      return;
    }

    final Map<String, String> fileMap;
    if (target.version == '1.0') {
      fileMap = (response.data as Map).cast<String, String>();
    } else {
      if (response.statusCode == 204) {
        // Nothing selected
        // Interpret this as "Read and close"
        fileMap = {};
      } else {
        try {
          final responseDto = PrepareUploadResponseDto.fromJson(response.data);
          fileMap = responseDto.files;
          state = state.updateSession(
            sessionId: sessionId,
            state: (s) => s?.copyWith(
              remoteSessionId: responseDto.sessionId,
            ),
          );
        } catch (e) {
          state = state.updateSession(
            sessionId: sessionId,
            state: (s) => s?.copyWith(
              status: SessionStatus.finishedWithErrors,
              errorMessage: e.humanErrorMessage,
            ),
          );
          return;
        }
      }
    }

    if (fileMap.isEmpty) {
      // receiver has nothing selected
      state = state.updateSession(
        sessionId: sessionId,
        state: (s) => s?.copyWith(
          status: SessionStatus.finished,
        ),
      );

      if (state[sessionId]?.background == false) {
        // ignore: use_build_context_synchronously, unawaited_futures
        Routerino.context.pushRootImmediately(() => const HomePage(initialTab: HomeTab.send, appStart: false));
      }

      closeSession(sessionId);
      return;
    }

    final sendingFiles = {
      for (final file in requestState.files.values)
        file.file.id: fileMap.containsKey(file.file.id) ? file.copyWith(token: fileMap[file.file.id]) : file.copyWith(status: FileStatus.skipped),
    };

    if (state[sessionId]?.background == false) {
      final background = ref.read(settingsProvider).sendMode == SendMode.multiple;

      // ignore: use_build_context_synchronously, unawaited_futures
      Routerino.context.pushAndRemoveUntil(
        removeUntil: HomePage,
        transition: RouterinoTransition.fade(),
        // immediately is not possible: https://github.com/flutter/flutter/issues/121910
        builder: () => ProgressPage(
          showAppBar: background,
          closeSessionOnClose: !background,
          sessionId: sessionId,
        ),
      );
    }

    state = state.updateSession(
      sessionId: sessionId,
      state: (s) => s?.copyWith(
        status: SessionStatus.sending,
        files: sendingFiles,
      ),
    );

    await _sendLoop(sessionId, target, sendingFiles);
  }

  Future<void> _sendLoop(String sessionId, Device target, Map<String, SendingFile> files) async {
    state = state.updateSession(
      sessionId: sessionId,
      state: (s) => s?.copyWith(startTime: DateTime.now().millisecondsSinceEpoch),
    );

    for (final file in files.values) {
      final result = await sendFile(
        sessionId: sessionId,
        file: file,
        isRetry: false,
      );
      if (!result) {
        break;
      }
    }

    _finish(sessionId: sessionId);
  }

  void _finish({required String sessionId}) {
    if (state[sessionId] != null && state[sessionId]!.status != SessionStatus.sending) {
      _logger.info('Transfer was canceled.');
    } else {
      final hasError = state[sessionId]!.files.values.any((file) => file.status == FileStatus.failed);
      if (!hasError && state[sessionId]!.background == true) {
        // close session because everything is fine and it is in background
        closeSession(sessionId);
        _logger.info('Transfer finished and session removed.');
      } else {
        // keep session alive when there are errors or currently in foreground
        state = state.updateSession(
          sessionId: sessionId,
          state: (s) => s?.copyWith(
            status: hasError ? SessionStatus.finishedWithErrors : SessionStatus.finished,
            endTime: DateTime.now().millisecondsSinceEpoch,
          ),
        );

        if (hasError) {
          _logger.info('Transfer finished with errors.');
        } else {
          _logger.info('Transfer finished successfully.');
        }
      }
    }
  }

  final uriContent = UriContent();

  /// Sends a file.
  /// Returns true, if the next file should be sent.
  Future<bool> sendFile({
    required String sessionId,
    required SendingFile file,
    required bool isRetry,
  }) async {
    final token = file.token;
    if (token == null) {
      return true;
    }

    final status = state[sessionId]?.status;
    const allowedStates = {SessionStatus.sending, SessionStatus.finishedWithErrors};
    if (status == null || !allowedStates.contains(status)) {
      return false;
    }

    final remoteSessionId = state[sessionId]!.remoteSessionId;
    final dio = ref.read(dioProvider).longLiving;
    final target = state[sessionId]!.target;

    if (isRetry) {
      _logger.info('Retrying ${file.file.fileName}');

      state = state.updateSession(
        sessionId: sessionId,
        state: (s) => s?.copyWith(
          status: SessionStatus.sending,
          files: s.files.map((key, value) {
            if (key == file.file.id) {
              return MapEntry(key, value.copyWith(status: FileStatus.queue, errorMessage: null));
            }
            return MapEntry(key, value);
          }),
        ),
      );
    } else {
      _logger.info('Sending ${file.file.fileName}');
    }

    state = state.updateSession(
      sessionId: sessionId,
      state: (s) => s?.withFileStatus(file.file.id, FileStatus.sending, null),
    );

    final Stream<List<int>>? fileStream = file.path != null
        ? file.path!.startsWith('content://')
            ? uriContent.getContentStream(Uri.parse(file.path!))
            : File(file.path!).openRead()
        : null;

    final (streamController, subscription) = fileStream?.digested() ?? (null, null);

    String? fileError;
    try {
      final cancelToken = CancelToken();
      state = state.updateSession(
        sessionId: sessionId,
        state: (s) => s?.copyWith(cancelToken: cancelToken),
      );
      final stopwatch = Stopwatch()..start();
      await dio.post(
        ApiRoute.upload.target(target, query: {
          if (remoteSessionId != null) 'sessionId': remoteSessionId,
          'fileId': file.file.id,
          'token': token,
        }),
        options: Options(
          headers: {
            'Content-Length': file.file.size,
            'Content-Type': file.file.lookupMime(),
          },
        ),
        data: streamController?.stream ?? file.bytes!,
        onSendProgress: (curr, total) {
          if (stopwatch.elapsedMilliseconds >= 100) {
            stopwatch.reset();
            ref.notifier(progressProvider).setProgress(
                  sessionId: sessionId,
                  fileId: file.file.id,
                  progress: curr / total,
                );
          }
        },
        cancelToken: cancelToken,
      );

      // set progress to 100% when successfully finished
      ref.notifier(progressProvider).setProgress(
            sessionId: sessionId,
            fileId: file.file.id,
            progress: 1,
          );
    } catch (e, st) {
      fileError = e.humanErrorMessage;
      _logger.warning('Error while sending file ${file.file.fileName}', e, st);
    } finally {
      // Close the stream if it is still open
      // ignore: unawaited_futures
      streamController?.close();

      // Cancel the subscription if it is still open
      // ignore: unawaited_futures
      subscription?.cancel();
    }

    state = state.updateSession(
      sessionId: sessionId,
      state: (s) => s?.withFileStatus(file.file.id, fileError != null ? FileStatus.failed : FileStatus.finished, fileError),
    );

    if (isRetry) {
      final state = this.state[sessionId];
      if (state != null && state.files.values.map((e) => e.status).isFinishedOrError) {
        _finish(sessionId: sessionId);
        return false;
      }
    }

    return true;
  }

  /// Closes the send-session and sends a cancel event to the receiver.
  void cancelSession(String sessionId) {
    final sessionState = state[sessionId];
    if (sessionState == null) {
      return;
    }
    final remoteSessionId = sessionState.remoteSessionId;
    sessionState.cancelToken?.cancel(); // cancel current request

    // notify the receiver
    try {
      ref
          .read(dioProvider)
          .discovery
          // ignore: discarded_futures
          .post(ApiRoute.cancel.target(sessionState.target, query: remoteSessionId != null ? {'sessionId': remoteSessionId} : null));
    } catch (e) {
      _logger.warning('Error while canceling session', e);
    }

    // finally, close session locally
    closeSession(sessionId);
  }

  void cancelSessionByReceiver(String sessionId) {
    final sessionState = state[sessionId];
    if (sessionState == null) {
      return;
    }
    sessionState.cancelToken?.cancel(); // cancel current request

    state = state.updateSession(
      sessionId: sessionId,
      state: (s) => s?.copyWith(
        status: SessionStatus.canceledByReceiver,
        endTime: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  /// Closes the session
  void closeSession(String sessionId) {
    final sessionState = state[sessionId];
    if (sessionState == null) {
      return;
    }
    state = state.removeSession(ref, sessionId);
    if (sessionState.status == SessionStatus.finished && ref.read(settingsProvider).sendMode == SendMode.single) {
      // clear selected files
      ref.redux(selectedSendingFilesProvider).dispatch(ClearSelectionAction());
    }
  }

  void clearAllSessions() {
    state = {};
    ref.notifier(progressProvider).removeAllSessions();
  }

  void setBackground(String sessionId, bool background) {
    state = state.updateSession(sessionId: sessionId, state: (s) => s?.copyWith(background: background));
  }
}

extension on Map<String, SendSessionState> {
  Map<String, SendSessionState> updateSession({
    required String sessionId,
    required SendSessionState? Function(SendSessionState? old) state,
  }) {
    final newState = state(this[sessionId]);
    if (newState == null) {
      // no change
      return this;
    }
    return {
      ...this,
      sessionId: newState,
    };
  }

  Map<String, SendSessionState> removeSession(Ref ref, String sessionId) {
    ref.notifier(progressProvider).removeSession(sessionId);
    return {...this}..remove(sessionId);
  }
}

extension on SendSessionState {
  SendSessionState withFileStatus(String fileId, FileStatus status, String? errorMessage) {
    return copyWith(
      files: {...files}..update(
          fileId,
          (file) => file.copyWith(
            status: status,
            errorMessage: errorMessage,
          ),
        ),
    );
  }
}

extension on Object {
  String get humanErrorMessage {
    final e = this;
    if (e is DioException && e.response != null) {
      final body = e.response!.data;
      String message;
      try {
        message = (body as Map)['message'];
      } catch (_) {
        message = body;
      }
      return '[${e.response!.statusCode}] $message';
    }

    return e.toString();
  }
}
