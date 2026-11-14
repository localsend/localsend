import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/model/state/send/send_session_state.dart';
import 'package:localsend_app/model/state/send/sending_file.dart';
import 'package:localsend_app/model/state/settings_state.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/provider/file_transfer_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_status.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

import '../mocks.mocks.dart';

class _Settings extends Fake implements SettingsState {
  @override
  bool get autoFinish => false;
}

class _SettingsService extends SettingsService {
  _SettingsService(super.persistence);
  @override
  SettingsState init() => _Settings();
}

class _Sender extends SendNotifier {
  final retry = Completer<void>();
  int attempts = 0;
  @override
  Map<String, SendSessionState> init() => {'layout': _fixture()};
  @override
  Future<void> retryFailedFiles(String sessionId, {required bool Function() isCurrent}) async {
    attempts++;
    await retry.future;
  }
}

void main() {
  testWidgets('file errors and retry remain reachable at normal settings', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    Routerino.navigatorKey = GlobalKey<NavigatorState>();
    final sender = _Sender();
    final container = RefenaContainer(
      overrides: [
        sendProvider.overrideWithNotifier((ref) => sender),
        settingsProvider.overrideWithNotifier((ref) => _SettingsService(MockPersistenceService())),
      ],
    );
    container.notifier(fileTransferProvider).setStatuses(sessionId: 'layout', statuses: {for (var i = 0; i < 12; i++) '$i': FileStatus.failed});
    await tester.pumpWidget(
      RefenaScope.withContainer(
        container: container,
        child: MaterialApp(
          navigatorKey: Routerino.navigatorKey,
          theme: getTheme(ColorMode.localsend, Colors.blue, Brightness.light, null),
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: child!,
          ),
          home: const ProgressPage(showAppBar: false, closeSessionOnClose: false, sessionId: 'layout'),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text(t.progressPage.retryFailed), findsOneWidget);
    final lastError = find.text('Error 11: The destination folder is unavailable. Choose another folder and retry.');
    await tester.scrollUntilVisible(
      lastError,
      250,
      scrollable: find.descendant(of: find.byType(ListView), matching: find.byType(Scrollable)),
    );
    await tester.pumpAndSettle();
    expect(lastError, findsOneWidget);
    final panel = tester.getRect(find.byType(Card).last);
    expect(tester.getRect(lastError).bottom, lessThanOrEqualTo(panel.top), reason: 'The footer must not cover the final file error');
    await tester.tap(find.text(t.progressPage.retryFailed));
    await tester.pump();
    await tester.tap(find.text(t.progressPage.retryFailed));
    expect(sender.attempts, 1);
    sender.retry.complete();
    await tester.pumpAndSettle();
    await tester.pumpWidget(const SizedBox());
    container.disposeContainer();
  });
}

SendSessionState _fixture() => SendSessionState(
  sessionId: 'layout',
  remoteSessionId: 'expired',
  background: false,
  status: SessionStatus.finishedWithErrors,
  target: const Device(
    signalingId: null,
    ip: '127.0.0.1',
    version: '2.2',
    port: 53317,
    https: false,
    fingerprint: 'layout',
    alias: 'Receiver',
    deviceModel: null,
    deviceType: DeviceType.mobile,
    download: false,
    channels: [],
  ),
  files: {
    for (var i = 0; i < 12; i++)
      '$i': SendingFile(
        file: FileDto(
          id: '$i',
          fileName: 'Nested folder/a very long file name number $i.txt',
          size: 2,
          fileType: FileType.other,
          hash: null,
          preview: null,
          metadata: null,
        ),
        token: 'expired',
        thumbnail: null,
        asset: null,
        path: null,
        bytes: null,
        errorMessage: 'Error $i: The destination folder is unavailable. Choose another folder and retry.',
      ),
  },
  hashedFileCount: 12,
  startTime: null,
  endTime: null,
  sendingTasks: [],
  errorMessage: null,
);
