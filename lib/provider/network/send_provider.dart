import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/main.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/model/dto/send_request_dto.dart';
import 'package:localsend_app/model/send/send_state.dart';
import 'package:localsend_app/model/send/sending_file.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:localsend_app/routes.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final sendProvider = StateNotifierProvider<SendNotifier, SendState?>((ref) {
  return SendNotifier(ref);
});

class SendNotifier extends StateNotifier<SendState?> {
  final Ref _ref;
  SendNotifier(this._ref) : super(null);

  Future<void> sendRequest({
    required Device target,
    required List<PlatformFile> files,
  }) async {
    final dio = Dio(BaseOptions(
      connectTimeout: 30 * 1000,
      sendTimeout: 30 * 1000,
    ));
    final cancelToken = CancelToken();

    final requestState = SendState(
      status: SessionStatus.waiting,
      target: target,
      files: Map.fromEntries(files.map((file) {
        final id = _uuid.v4();
        return MapEntry(
          id,
          SendingFile(
            file: FileDto(
              id: id,
              fileName: file.name,
              size: file.size,
              fileType: file.name.guessFileType(),
            ),
            token: null,
            path: kIsWeb ? null : file.path,
            bytes: file.bytes,
          ),
        );
      })),
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
        for (final file in requestState.files.values)
          file.file.id: file.file,
      },
    );

    try {
      state = requestState;

      // ignore: use_build_context_synchronously
      const SendRoute().push(LocalSendApp.routerContext);

      final response = await dio.post(
        ApiRoute.sendRequest.target(target),
        data: requestDto.toJson(),
        cancelToken: cancelToken,
      );

      final responseMap = response.data as Map;
      final sendingFiles = {
        for (final file in requestState.files.values)
          file.file.id: responseMap.containsKey(file.file.id) ? file.copyWith(token: responseMap[file.file.id]) : file,
      };

      // ignore: use_build_context_synchronously
      const ProgressRoute().go(LocalSendApp.routerContext);

      state = requestState.copyWith(
        status: SessionStatus.sending,
        files: sendingFiles,
      );

      await _send(target, sendingFiles);
    } on DioError catch (e) {
      if (e.type != DioErrorType.response && e.type != DioErrorType.cancel) {
        print(e);
      }
      state = state?.copyWith(
        status: SessionStatus.declined,
      );
    }
  }

  Future<void> _send(Device target, Map<String, SendingFile> files) async {
    for (final file in files.values) {
      final token = file.token;
      if (token == null) {
        continue;
      }

      print('Sending ${file.file.fileName}');

      try {
        await Dio().post(
          ApiRoute.send.target(target, query: {
            'fileId': file.file.id,
            'token': token,
          }),
          options: Options(
            headers: {
              'Content-Length': file.file.size,
            }
          ),
          data: file.path != null ? File(file.path!).openRead() : file.bytes!,
          onSendProgress: (curr, total) {
            _ref.read(progressProvider.notifier).setProgress(file.file.id, curr / total);
          }
        );
      } on DioError catch (e) {
        print(e);
      }
    }

    state = state?.copyWith(
      status: SessionStatus.finished,
    );
    print('Files sent successfully.');
  }

  Future<void> cancel() async {
    final target = state?.target;
    if (target == null) {
      return;
    }
    state?.cancelToken?.cancel();
    state = null;
    try {
      await Dio().post(ApiRoute.cancel.target(target));
    } catch (_) {}
  }
}
