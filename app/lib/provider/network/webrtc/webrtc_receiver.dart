import 'package:collection/collection.dart';
import 'package:common/model/dto/file_dto.dart' as dart_model;
import 'package:common/model/file_status.dart';
import 'package:common/model/file_type.dart';
import 'package:common/model/session_status.dart';
import 'package:common/model/stored_security_context.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/model/state/server/receive_session_state.dart';
import 'package:localsend_app/model/state/server/receiving_file.dart';
import 'package:localsend_app/model/state/settings_state.dart';
import 'package:localsend_app/model/webrtc/ice_server_config.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/pages/receive_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/webrtc/signaling_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:localsend_app/provider/receive_history_provider.dart';
import 'package:localsend_app/provider/selection/selected_receiving_files_provider.dart';
import 'package:localsend_app/rust/api/model.dart';
import 'package:localsend_app/rust/api/webrtc.dart' as rust_webrtc;
import 'package:localsend_app/util/native/directories.dart';
import 'package:localsend_app/util/native/file_saver.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

part 'webrtc_receiver.mapper.dart';

final _logger = Logger('WebRTCReceive');

@MappableClass()
class WebRTCReceiveState with WebRTCReceiveStateMappable {
  final rust_webrtc.LsSignalingConnection connection;
  final rust_webrtc.WsServerSdpMessage offer;
  final rust_webrtc.RTCStatus? status;
  final rust_webrtc.RtcReceiveController? controller;
  final ReceiveSessionState? sessionState;

  const WebRTCReceiveState({
    required this.connection,
    required this.offer,
    required this.status,
    required this.controller,
    required this.sessionState,
  });
}

class WebRTCReceiveService extends ReduxNotifier<WebRTCReceiveState> {
  final Ref _ref;
  final String _signalingServer;
  final List<IceServerConfig> _iceServers;
  final rust_webrtc.LsSignalingConnection _connection;
  final rust_webrtc.WsServerSdpMessage _offer;
  final SettingsState _settings;
  final List<FavoriteDevice> _favorites;
  final StoredSecurityContext _key;

  WebRTCReceiveService({
    required Ref ref,
    required String signalingServer,
    required List<IceServerConfig> iceServers,
    required rust_webrtc.LsSignalingConnection connection,
    required rust_webrtc.WsServerSdpMessage offer,
    required SettingsState settings,
    required List<FavoriteDevice> favorites,
    required StoredSecurityContext key,
  }) : _ref = ref,
       _signalingServer = signalingServer,
       _iceServers = iceServers,
       _connection = connection,
       _offer = offer,
       _settings = settings,
       _favorites = favorites,
       _key = key;

  @override
  WebRTCReceiveState init() {
    return WebRTCReceiveState(
      connection: _connection,
      offer: _offer,
      status: null,
      controller: null,
      sessionState: null,
    );
  }
}

class AcceptOfferAction extends AsyncReduxAction<WebRTCReceiveService, WebRTCReceiveState> {
  @override
  Future<WebRTCReceiveState> reduce() async {
    final controller = await state.connection.acceptOffer(
      iceServers: notifier._iceServers.map((server) => server.toRust()).toList(),
      offer: state.offer,
      privateKey: notifier._key.privateKey,
    );

    controller.listenStatus().listen((status) {
      dispatch(_SetStatusAction(status));
    });

    return state.copyWith(controller: controller);
  }

  @override
  void after() {
    // ignore: discarded_futures
    dispatchAsync(_AcceptOfferAction());
  }
}

extension on IceServerConfig {
  rust_webrtc.IceServerConfig toRust() {
    return rust_webrtc.IceServerConfig(
      urls: urls,
      username: username,
      credential: credential,
    );
  }
}

class _AcceptOfferAction extends AsyncReduxAction<WebRTCReceiveService, WebRTCReceiveState> {
  @override
  Future<WebRTCReceiveState> reduce() async {
    final controller = state.controller;
    if (controller == null) {
      return state;
    }

    final rustFiles = await controller.listenFiles();
    final files = rustFiles.map((e) => e.toFileDto()).toList();
    final destinationDir = notifier._settings.destination ?? await getDefaultDestinationDirectory();
    final cacheDir = await getCacheDirectory();
    final sender = state.offer.peer.toDevice(notifier._signalingServer);
    final sessionState = ReceiveSessionState(
      sessionId: state.offer.sessionId,
      status: SessionStatus.waiting,
      sender: sender,
      senderAlias: notifier._favorites.firstWhereOrNull((e) => e.fingerprint == sender.fingerprint)?.alias ?? sender.alias,
      files: {
        for (final file in files)
          file.id: ReceivingFile(
            file: file,
            status: FileStatus.queue,
            token: null,
            desiredName: null,
            path: null,
            savedToGallery: false,
            errorMessage: null,
          ),
      },
      startTime: null,
      endTime: null,
      destinationDirectory: destinationDir,
      cacheDirectory: cacheDir,
      saveToGallery: checkPlatformWithGallery() && notifier._settings.saveToGallery && files.every((f) => !f.fileName.contains('/')),
      createdDirectories: {},
      responseHandler: null,
    );

    final vm = ViewProvider((ref) {
      final state = ref.watch(
        notifier.provider as ReduxProvider<WebRTCReceiveService, WebRTCReceiveState>,
      );
      final session = state.sessionState;
      final message = session?.message;
      return ReceivePageVm(
        status: session?.status ?? state.status.toSessionStatus(),
        sender: session?.sender ?? sender,
        showSenderInfo: true,
        files: session?.files.values.map((f) => f.file).toList() ?? files,
        message: message,
        onAccept: () {
          if (message != null) {
            ref
                .redux(
                  notifier.provider as ReduxProvider<WebRTCReceiveService, WebRTCReceiveState>,
                )
                .dispatch(AcceptSelectionAction({}));
            return;
          }

          final selection = ref.read(selectedReceivingFilesProvider);
          ref
              .redux(
                notifier.provider as ReduxProvider<WebRTCReceiveService, WebRTCReceiveState>,
              )
              .dispatch(AcceptSelectionAction(selection));
        },
        onDecline: () {
          final provider = notifier.provider as ReduxProvider<WebRTCReceiveService, WebRTCReceiveState>;
          // ignore: discarded_futures
          ref.redux(provider).dispatchAsync(DeclineOfferAction());
        },
        onClose: () {},
      );
    });

    // ignore: unawaited_futures, use_build_context_synchronously
    Routerino.context.push(() => ReceivePage(vm));

    return state.copyWith(controller: controller, sessionState: sessionState);
  }
}

class _SetStatusAction extends ReduxAction<WebRTCReceiveService, WebRTCReceiveState> {
  final rust_webrtc.RTCStatus status;

  _SetStatusAction(this.status);

  @override
  WebRTCReceiveState reduce() {
    return state.copyWith(status: status);
  }
}

class AcceptSelectionAction extends ReduxAction<WebRTCReceiveService, WebRTCReceiveState> {
  final Map<String, String> selection;

  AcceptSelectionAction(this.selection);

  @override
  WebRTCReceiveState reduce() {
    final controller = state.controller;
    final session = state.sessionState;
    if (controller == null || session == null) {
      return state;
    }

    // ignore: discarded_futures
    controller.sendSelection(selection: selection.keys.toSet());

    if (selection.isEmpty) {
      return state.copyWith(
        sessionState: session.copyWith(status: SessionStatus.finished),
      );
    }

    // ignore: discarded_futures, unawaited_futures, use_build_context_synchronously
    Routerino.context.pushAndRemoveUntilImmediately(
      removeUntil: ReceivePage,
      builder: () => ProgressPage(
        showAppBar: false,
        closeSessionOnClose: true,
        sessionId: session.sessionId,
      ),
    );

    return state.copyWith(
      sessionState: session.copyWith(
        status: SessionStatus.sending,
        startTime: DateTime.now().millisecondsSinceEpoch,
        files: Map.fromEntries(
          session.files.values.map((entry) {
            final desiredName = selection[entry.file.id];
            return MapEntry(
              entry.file.id,
              entry.copyWith(
                status: desiredName != null ? FileStatus.queue : FileStatus.skipped,
                desiredName: desiredName,
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  void after() {
    if (selection.isNotEmpty) {
      // ignore: discarded_futures
      dispatchAsync(_ReceiveFilesAction());
    }
  }
}

class DeclineOfferAction extends AsyncReduxAction<WebRTCReceiveService, WebRTCReceiveState> {
  @override
  Future<WebRTCReceiveState> reduce() async {
    await state.controller?.decline();
    return state.copyWith(
      sessionState: state.sessionState?.copyWith(
        status: SessionStatus.declined,
        endTime: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }
}

class _ReceiveFilesAction extends AsyncReduxAction<WebRTCReceiveService, WebRTCReceiveState> {
  @override
  Future<WebRTCReceiveState> reduce() async {
    final controller = state.controller;
    if (controller == null) {
      return state;
    }

    await for (final receiver in controller.listenReceiving()) {
      await _receiveFile(controller, receiver);
    }

    final session = state.sessionState;
    if (session == null || !session.files.values.map((e) => e.status).isFinishedOrError) {
      return state;
    }

    final hasError = session.files.values.any(
      (f) => f.status == FileStatus.failed,
    );
    return state.copyWith(
      sessionState: session.copyWith(
        status: hasError ? SessionStatus.finishedWithErrors : SessionStatus.finished,
        endTime: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<void> _receiveFile(
    rust_webrtc.RtcReceiveController controller,
    rust_webrtc.RtcFileReceiver receiver,
  ) async {
    final fileId = await receiver.getFileId();
    final session = state.sessionState;
    final receivingFile = session?.files[fileId];
    if (session == null || receivingFile == null) {
      await controller.sendFileStatus(
        status: rust_webrtc.RTCSendFileResponse(
          id: fileId,
          success: false,
          error: 'Unknown file',
        ),
      );
      return;
    }

    dispatch(_SetReceivingFileStatus(fileId, FileStatus.sending, null));

    final fileType = receivingFile.file.fileType;
    final shouldSaveToGallery = session.saveToGallery && (fileType == FileType.image || fileType == FileType.video);
    String? filePath;
    bool savedToGallery = false;
    String? fileError;

    try {
      (savedToGallery, filePath) = await saveFile(
        destinationDirectory: session.destinationDirectory,
        fileName: receivingFile.desiredName!,
        saveToGallery: shouldSaveToGallery,
        isImage: fileType == FileType.image,
        stream: receiver.receive(),
        onProgress: (savedBytes) {
          if (receivingFile.file.size != 0) {
            notifier._ref
                .notifier(progressProvider)
                .setProgress(
                  sessionId: session.sessionId,
                  fileId: fileId,
                  progress: savedBytes / receivingFile.file.size,
                );
          }
        },
        lastModified: receivingFile.file.metadata?.lastModified,
        lastAccessed: receivingFile.file.metadata?.lastAccessed,
        androidSdkInt: notifier._ref.read(deviceInfoProvider).androidSdkInt,
        createdDirectories: session.createdDirectories,
      );

      await notifier._ref
          .redux(receiveHistoryProvider)
          .dispatchAsync(
            AddHistoryEntryAction(
              entryId: fileId,
              fileName: receivingFile.desiredName!,
              fileType: receivingFile.file.fileType,
              path: filePath,
              savedToGallery: savedToGallery,
              isMessage: false,
              fileSize: receivingFile.file.size,
              senderAlias: session.senderAlias,
              timestamp: DateTime.now().toUtc(),
            ),
          );
    } catch (e, st) {
      fileError = e.toString();
      _logger.severe('Failed to save WebRTC file', e, st);
    }

    notifier._ref.notifier(progressProvider).setProgress(sessionId: session.sessionId, fileId: fileId, progress: 1);

    dispatch(
      _FinishReceivingFile(
        fileId: fileId,
        status: fileError == null ? FileStatus.finished : FileStatus.failed,
        path: filePath,
        savedToGallery: savedToGallery,
        errorMessage: fileError,
      ),
    );

    await controller.sendFileStatus(
      status: rust_webrtc.RTCSendFileResponse(
        id: fileId,
        success: fileError == null,
        error: fileError,
      ),
    );
  }
}

class _SetReceivingFileStatus extends ReduxAction<WebRTCReceiveService, WebRTCReceiveState> {
  final String fileId;
  final FileStatus status;
  final String? errorMessage;

  _SetReceivingFileStatus(this.fileId, this.status, this.errorMessage);

  @override
  WebRTCReceiveState reduce() {
    return state.copyWith(
      sessionState: state.sessionState?.withFileStatus(
        fileId: fileId,
        status: status,
        errorMessage: errorMessage,
      ),
    );
  }
}

class _FinishReceivingFile extends ReduxAction<WebRTCReceiveService, WebRTCReceiveState> {
  final String fileId;
  final FileStatus status;
  final String? path;
  final bool savedToGallery;
  final String? errorMessage;

  _FinishReceivingFile({
    required this.fileId,
    required this.status,
    required this.path,
    required this.savedToGallery,
    required this.errorMessage,
  });

  @override
  WebRTCReceiveState reduce() {
    return state.copyWith(
      sessionState: state.sessionState?.fileFinished(
        fileId: fileId,
        status: status,
        path: path,
        savedToGallery: savedToGallery,
        errorMessage: errorMessage,
      ),
    );
  }
}

extension on FileDto {
  dart_model.FileDto toFileDto() {
    return dart_model.FileDto(
      id: id,
      fileName: fileName,
      size: size.toInt(),
      fileType: dart_model.decodeFromMime(fileType),
      hash: null,
      preview: preview,
      metadata: metadata?.toFileMetadata(),
    );
  }
}

extension on rust_webrtc.RTCStatus? {
  SessionStatus toSessionStatus() {
    return switch (this) {
      null => SessionStatus.waiting,
      rust_webrtc.RTCStatus_SdpExchanged() => SessionStatus.waiting,
      rust_webrtc.RTCStatus_Connected() => SessionStatus.waiting,
      rust_webrtc.RTCStatus_PinRequired() => SessionStatus.waiting,
      rust_webrtc.RTCStatus_TooManyAttempts() => SessionStatus.tooManyAttempts,
      rust_webrtc.RTCStatus_Declined() => SessionStatus.declined,
      rust_webrtc.RTCStatus_Sending() => SessionStatus.sending,
      rust_webrtc.RTCStatus_Finished() => SessionStatus.finished,
      rust_webrtc.RTCStatus_Error() => SessionStatus.finishedWithErrors,
    };
  }
}

extension on ReceiveSessionState {
  ReceiveSessionState withFileStatus({
    required String fileId,
    required FileStatus status,
    required String? errorMessage,
  }) {
    return copyWith(
      files: {...files}
        ..update(
          fileId,
          (file) => file.copyWith(status: status, errorMessage: errorMessage),
        ),
    );
  }

  ReceiveSessionState fileFinished({
    required String fileId,
    required FileStatus status,
    required String? path,
    required bool savedToGallery,
    required String? errorMessage,
  }) {
    return copyWith(
      files: {...files}
        ..update(
          fileId,
          (file) => file.copyWith(
            status: status,
            path: path,
            savedToGallery: savedToGallery,
            errorMessage: errorMessage,
          ),
        ),
    );
  }
}

extension on FileMetadata {
  dart_model.FileMetadata toFileMetadata() {
    return dart_model.FileMetadata(
      lastModified: DateTime.tryParse(modified ?? ''),
      lastAccessed: DateTime.tryParse(accessed ?? ''),
    );
  }
}
