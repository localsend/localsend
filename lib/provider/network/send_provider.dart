import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/dto/info_register_dto.dart';
import 'package:localsend_app/model/dto/multicast_dto.dart';
import 'package:localsend_app/model/dto/prepare_upload_request_dto.dart';
import 'package:localsend_app/model/dto/prepare_upload_response_dto.dart';
import 'package:localsend_app/model/file_status.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/model/send_mode.dart';
import 'package:localsend_app/model/session_status.dart';
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
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:routerino/routerino.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// This provider manages sending files to other devices.
///
/// In contrast to [serverProvider], this provider does not manage a server.
/// Instead, it only does HTTP requests to other servers.
final sendProvider = NotifierProvider<SendNotifier, Map<String, SendSessionState>>(() {
  return SendNotifier();
});

class SendNotifier extends Notifier<Map<String, SendSessionState>> {
  SendNotifier();

  @override
  Map<String, SendSessionState> build() {
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
    final requestDio = ref.read(dioProvider(DioType.longLiving));
    final uploadDio = ref.read(dioProvider(DioType.longLiving));
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
              legacy: target.version == '1.0',
            ),
            status: FileStatus.queue,
            token: null,
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

    final originDevice = ref.read(deviceInfoProvider);
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
        transition: RouterinoTransition.fade,
      );
    }

    final Response response;
    try {
      response = await requestDio.post(
        ApiRoute.prepareUpload.target(target),
        data: jsonEncode(requestDto), // jsonEncode for better logging
        cancelToken: cancelToken,
      );
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 403) {
        state = state.updateSession(
          sessionId: sessionId,
          state: (s) => s?.copyWith(
            status: SessionStatus.declined,
          ),
        );
      } else if (e is DioError && e.response?.statusCode == 409) {
        state = state.updateSession(
          sessionId: sessionId,
          state: (s) => s?.copyWith(
            status: SessionStatus.recipientBusy,
          ),
        );
      } else {
        state = state.updateSession(
          sessionId: sessionId,
          state: (s) => s?.copyWith(
            status: SessionStatus.finishedWithErrors,
            errorMessage: e.humanErrorMessage,
          ),
        );
      }
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
      final background = ref.read(settingsProvider.select((s) => s.sendMode == SendMode.multiple));

      // ignore: use_build_context_synchronously, unawaited_futures
      Routerino.context.pushAndRemoveUntil(
        removeUntil: HomePage,
        transition: RouterinoTransition.fade, // immediately is not possible: https://github.com/flutter/flutter/issues/121910
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

    await _send(sessionId, uploadDio, target, sendingFiles);
  }

  Future<void> _send(String sessionId, Dio dio, Device target, Map<String, SendingFile> files) async {
    bool hasError = false;
    final remoteSessionId = state[sessionId]!.remoteSessionId;

    state = state.updateSession(
      sessionId: sessionId,
      state: (s) => s?.copyWith(startTime: DateTime.now().millisecondsSinceEpoch),
    );

    for (final file in files.values) {
      final token = file.token;
      if (token == null) {
        continue;
      }

      print('Sending ${file.file.fileName}');
      state = state.updateSession(
        sessionId: sessionId,
        state: (s) => s?.withFileStatus(file.file.id, FileStatus.sending, null),
      );

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
          data: file.path != null ? File(file.path!).openRead() : Stream.fromIterable([file.bytes!]),
          onSendProgress: (curr, total) {
            if (stopwatch.elapsedMilliseconds >= 100) {
              stopwatch.reset();
              ref.read(progressProvider.notifier).setProgress(
                    sessionId: sessionId,
                    fileId: file.file.id,
                    progress: curr / total,
                  );
            }
          },
          cancelToken: cancelToken,
        );

        // set progress to 100% when successfully finished
        ref.read(progressProvider.notifier).setProgress(
              sessionId: sessionId,
              fileId: file.file.id,
              progress: 1,
            );
      } catch (e, st) {
        fileError = e.humanErrorMessage;
        hasError = true;
        print(e);
        print(st);
      }

      state = state.updateSession(
        sessionId: sessionId,
        state: (s) => s?.withFileStatus(file.file.id, fileError != null ? FileStatus.failed : FileStatus.finished, fileError),
      );
    }

    if (!hasError && state[sessionId]?.background == true) {
      // close session because everything is fine and it is in background
      closeSession(sessionId);
    } else {
      // keep session alive when there are errors or currently in foreground
      state = state.updateSession(
        sessionId: sessionId,
        state: (s) => s?.copyWith(
          status: hasError ? SessionStatus.finishedWithErrors : SessionStatus.finished,
          endTime: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    }

    print('Files sent successfully.');
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
    unawaited(
      ref
          .read(dioProvider(DioType.discovery))
          .post(ApiRoute.cancel.target(sessionState.target, query: remoteSessionId != null ? {'sessionId': remoteSessionId} : null))
          .then((_) {})
          .catchError((e) {
        print(e);
      }),
    );

    // finally, close session locally
    closeSession(sessionId);
  }

  /// Closes the session
  void closeSession(String sessionId) {
    final sessionState = state[sessionId];
    if (sessionState == null) {
      return;
    }
    state = state.removeSession(ref, sessionId);
    if (sessionState.status == SessionStatus.finished && ref.read(settingsProvider.select((s) => s.sendMode == SendMode.single))) {
      // clear selected files
      ref.read(selectedSendingFilesProvider.notifier).reset();
    }
  }

  void clearAllSessions() {
    state = {};
    ref.read(progressProvider.notifier).removeAllSessions();
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
    ref.read(progressProvider.notifier).removeSession(sessionId);
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
    if (e is DioError && e.response != null) {
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
