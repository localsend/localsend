import 'package:collection/collection.dart';
import 'package:common/model/dto/file_dto.dart' as dart_model;
import 'package:common/model/file_status.dart';
import 'package:common/model/session_status.dart';
import 'package:common/model/stored_security_context.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/model/state/server/receive_session_state.dart';
import 'package:localsend_app/model/state/server/receiving_file.dart';
import 'package:localsend_app/model/state/settings_state.dart';
import 'package:localsend_app/pages/receive_page.dart';
import 'package:localsend_app/provider/network/webrtc/signaling_provider.dart';
import 'package:localsend_app/rust/api/model.dart';
import 'package:localsend_app/rust/api/webrtc.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

part 'webrtc_receiver.mapper.dart';

@MappableClass()
class WebRTCReceiveState with WebRTCReceiveStateMappable {
  final LsSignalingConnection connection;
  final WsServerSdpMessage offer;
  final RTCStatus? status;
  final RtcReceiveController? controller;
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
  final String _signalingServer;
  final List<String> _stunServers;
  final LsSignalingConnection _connection;
  final WsServerSdpMessage _offer;
  final SettingsState _settings;
  final List<FavoriteDevice> _favorites;
  final StoredSecurityContext _key;

  WebRTCReceiveService({
    required String signalingServer,
    required List<String> stunServers,
    required LsSignalingConnection connection,
    required WsServerSdpMessage offer,
    required SettingsState settings,
    required List<FavoriteDevice> favorites,
    required StoredSecurityContext key,
  })  : _signalingServer = signalingServer,
        _stunServers = stunServers,
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
      stunServers: notifier._stunServers,
      offer: state.offer,
      privateKey: notifier._key.privateKey,
    );

    controller.listenStatus().listen((status) {
      dispatch(_SetStatusAction(status));
    });

    return state.copyWith(
      controller: controller,
    );
  }

  @override
  void after() {
    // ignore: discarded_futures
    dispatchAsync(_AcceptOfferAction());
  }
}

class _AcceptOfferAction extends AsyncReduxAction<WebRTCReceiveService, WebRTCReceiveState> {
  @override
  Future<WebRTCReceiveState> reduce() async {
    final controller = state.controller;
    if (controller == null) {
      return state;
    }

    final files = await controller.listenFiles();
    final convertedFiles = files.map((e) => e.toFileDto()).toList();
    dispatch(_InitSessionState(convertedFiles));

    final vm = ViewProvider((ref) {
      final state = ref.watch(notifier.provider as ReduxProvider<WebRTCReceiveService, WebRTCReceiveState>);
      return ReceivePageVm(
        status: switch (state.status) {
          null => SessionStatus.waiting,
          RTCStatus_SdpExchanged() => SessionStatus.waiting,
          RTCStatus_Connected() => SessionStatus.waiting,
          RTCStatus_PinRequired() => SessionStatus.waiting,
          RTCStatus_TooManyAttempts() => SessionStatus.tooManyAttempts,
          RTCStatus_Declined() => SessionStatus.declined,
          RTCStatus_Sending() => SessionStatus.sending,
          RTCStatus_Finished() => SessionStatus.finished,
          RTCStatus_Error() => SessionStatus.finishedWithErrors,
        },
        sender: state.offer.peer.toDevice(notifier._signalingServer),
        showSenderInfo: true,
        files: convertedFiles,
        message: files.length == 1 && files[0].fileType.startsWith('text/') ? files[0].preview : null,
        onAccept: () {},
        onDecline: () {},
        onClose: () {},
      );
    });

    // ignore: unawaited_futures, use_build_context_synchronously
    Routerino.context.push(() => ReceivePage(vm));

    return state.copyWith(
      controller: controller,
    );
  }
}

class _InitSessionState extends ReduxAction<WebRTCReceiveService, WebRTCReceiveState> {
  final List<dart_model.FileDto> files;

  _InitSessionState(this.files);

  @override
  WebRTCReceiveState reduce() {
    return state;
    // TODO
    // return state.copyWith(
    //   sessionState: ReceiveSessionState(
    //     sessionId: state.offer.sessionId,
    //     status: SessionStatus.waiting,
    //     sender: state.offer.peer.toDevice(notifier._signalingServer),
    //     senderAlias: notifier._favorites.firstWhereOrNull((e) => e.fingerprint == notifier.info.fingerprint)?.alias ?? dto.info.alias,
    //     files: {
    //       for (final file in files)
    //         file.id: ReceivingFile(
    //           file: file,
    //           status: FileStatus.queue,
    //           token: null,
    //           desiredName: null,
    //           path: null,
    //           savedToGallery: false,
    //           errorMessage: null,
    //         ),
    //     },
    //     startTime: null,
    //     endTime: null,
    //     destinationDirectory: destinationDir,
    //     cacheDirectory: cacheDir,
    //     saveToGallery: checkPlatformWithGallery() && settings.saveToGallery && dto.files.values.every((f) => !f.fileName.contains('/')),
    //     createdDirectories: {},
    //     responseHandler: streamController,
    //   ),
    // );
  }
}

class _SetStatusAction extends ReduxAction<WebRTCReceiveService, WebRTCReceiveState> {
  final RTCStatus status;

  _SetStatusAction(this.status);

  @override
  WebRTCReceiveState reduce() {
    return state.copyWith(
      status: status,
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
      legacy: false,
      metadata: metadata?.toFileMetadata(),
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
