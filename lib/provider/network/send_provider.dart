import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/model/dto/send_request_dto.dart';
import 'package:localsend_app/model/file_status.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/model/send/send_state.dart';
import 'package:localsend_app/model/send/sending_file.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/pages/send_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:routerino/routerino.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final sendProvider = StateNotifierProvider<SendNotifier, SendState?>((ref) {
  return SendNotifier(ref);
});

class SendNotifier extends StateNotifier<SendState?> {
  final Ref _ref;

  SendNotifier(this._ref) : super(null);

  Future<void> startSession({
    required Device target,
    required List<CrossFile> files,
  }) async {
    final requestDio = _ref.read(dioProvider(DioType.longLiving));
    final uploadDio = _ref.read(dioProvider(DioType.longLiving));
    final cancelToken = CancelToken();

    final requestState = SendState(
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
              preview: files.length == 1 && files.first.fileType == FileType.text && files.first.bytes != null
                  ? utf8.decode(files.first.bytes!) // send simple message by embedding it into the preview
                  : null,
            ),
            status: FileStatus.queue,
            token: null,
            asset: file.asset,
            path: file.path,
            bytes: file.bytes,
          ),
        );
      }))),
      startTime: null,
      endTime: null,
      cancelToken: cancelToken,
    );

    final originDevice = _ref.read(deviceInfoProvider);

    final requestDto = SendRequestDto(
      info: InfoDto(
        alias: originDevice.alias,
        deviceModel: originDevice.deviceModel,
        deviceType: originDevice.deviceType,
      ),
      files: {
        for (final file in requestState.files.values) file.file.id: file.file,
      },
    );

    try {
      state = requestState;

      // ignore: use_build_context_synchronously
      Routerino.context.push(() => const SendPage(), transition: RouterinoTransition.fade);

      final response = await requestDio.post(
        ApiRoute.sendRequest.target(target),
        data: requestDto.toJson(),
        cancelToken: cancelToken,
      );

      final responseMap = response.data as Map;
      if (responseMap.isEmpty) {
        // receiver has nothing selected

        // ignore: use_build_context_synchronously
        Routerino.context.pushRootImmediately(() => const HomePage(doPostInit: false));
        state = null;
        return;
      }

      final sendingFiles = {
        for (final file in requestState.files.values)
          file.file.id:
              responseMap.containsKey(file.file.id) ? file.copyWith(token: responseMap[file.file.id]) : file.copyWith(status: FileStatus.skipped),
      };

      // ignore: use_build_context_synchronously
      Routerino.context.pushAndRemoveUntilImmediately(
        removeUntil: SendPage,
        builder: () => const ProgressPage(),
      );

      state = requestState.copyWith(
        status: SessionStatus.sending,
        files: sendingFiles,
      );

      await _send(uploadDio, target, sendingFiles);
    } on DioError catch (e) {
      if (e.type != DioErrorType.response && e.type != DioErrorType.cancel) {
        print(e);
      }
      state = state?.copyWith(
        status: SessionStatus.declined,
      );
    }
  }

  Future<void> _send(Dio dio, Device target, Map<String, SendingFile> files) async {
    if (state == null) {
      return;
    }

    bool hasError = false;

    state = state?.copyWith(startTime: DateTime.now().millisecondsSinceEpoch);
    _ref.read(progressProvider.notifier).reset();

    for (final file in files.values) {
      final token = file.token;
      if (token == null) {
        continue;
      }

      print('Sending ${file.file.fileName}');
      state = state?.withFileStatus(file.file.id, FileStatus.sending);

      bool hasErrorForFile = false;
      try {
        final cancelToken = CancelToken();
        state = state?.copyWith(cancelToken: cancelToken);
        await dio.post(
          ApiRoute.send.target(target, query: {
            'fileId': file.file.id,
            'token': token,
          }),
          options: Options(
            headers: {
              'Content-Length': file.file.size,
            },
          ),
          data: file.path != null ? File(file.path!).openRead() : Stream.fromIterable([file.bytes!]),
          onSendProgress: (curr, total) {
            _ref.read(progressProvider.notifier).setProgress(file.file.id, curr / total);
          },
          cancelToken: cancelToken,
        );
      } on DioError catch (e) {
        hasErrorForFile = true;
        hasError = true;
        print(e);
      } catch (e, st) {
        hasErrorForFile = true;
        hasError = true;
        print(e);
        print(st);
      }

      if (state == null) {
        // session already closed
        return;
      } else {
        state = state?.withFileStatus(file.file.id, hasErrorForFile ? FileStatus.failed : FileStatus.finished);
      }
    }

    state = state?.copyWith(
      status: hasError ? SessionStatus.finishedWithErrors : SessionStatus.finished,
      endTime: DateTime.now().millisecondsSinceEpoch,
    );
    print('Files sent successfully.');
  }

  /// Closes the send-session and sends a cancel event to the receiver.
  Future<void> cancelSession() async {
    final target = state?.target;
    if (target == null) {
      return;
    }
    state?.cancelToken?.cancel(); // cancel current request
    state = null;
    try {
      await _ref.read(dioProvider(DioType.discovery)).post(ApiRoute.cancel.target(target));
    } catch (_) {}
  }
}

extension on SendState {
  SendState withFileStatus(String fileId, FileStatus status) {
    return copyWith(
      files: {...files}..update(fileId, (file) => file.copyWith(status: status)),
    );
  }
}
