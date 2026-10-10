import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/config/init.dart';
import 'package:localsend_app/model/state/send/send_session_state.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/pages/home_page_controller.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/util/native/cache_helper.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:localsend_isolates/rust/api/model.dart';
import 'package:localsend_isolates/rust/frb_generated.dart';
import 'package:mockito/mockito.dart';
import 'package:refena_flutter/addons.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:share_handler/share_handler.dart';

class _FinishedSendNotifier extends SendNotifier {
  @override
  Map<String, SendSessionState> init() => {
    'previous': const SendSessionState(
      sessionId: 'previous',
      remoteSessionId: null,
      background: false,
      status: SessionStatus.finished,
      target: Device.empty,
      files: {},
      hashedFileCount: 0,
      startTime: null,
      endTime: null,
      sendingTasks: [],
      errorMessage: null,
    ),
  };
}

class _MetadataApi extends Mock implements RustLibApi {
  @override
  Future<FileMetadata?> crateApiMetadataReadFileMetadata({required String path}) async => null;
}

class _SessionNotifier extends SendNotifier {
  _SessionNotifier({required this.status, required this.background});

  final SessionStatus status;
  final bool background;

  @override
  Map<String, SendSessionState> init() => {
    'previous': SendSessionState(
      sessionId: 'previous',
      remoteSessionId: null,
      background: background,
      status: status,
      target: Device.empty,
      files: {},
      hashedFileCount: 0,
      startTime: null,
      endTime: null,
      sendingTasks: [],
      errorMessage: null,
    ),
  };
}

Future<RefenaContainer> _mountFinishedRoute(WidgetTester tester, {required SessionStatus status, bool background = false}) async {
  final container = RefenaContainer(
    overrides: [
      // Native cache maintenance is outside this selection/navigation widget test.
      globalReduxProvider.overrideWithGlobalReducer(reducer: {ClearCacheAction: null}),
      sendProvider.overrideWithNotifier((ref) => _SessionNotifier(status: status, background: background)),
    ],
  );
  addTearDown(container.disposeContainer);
  container.redux(selectedSendingFilesProvider).dispatch(AddMessageAction(message: 'first'));
  await tester.pumpWidget(
    RefenaScope.withContainer(
      container: container,
      ownsContainer: false,
      child: MaterialApp(
        navigatorKey: container.read(navigationProvider).key,
        home: Scaffold(
          body: PageView(
            controller: container.read(homePageControllerProvider).controller,
            children: const [Text('Receive'), Text('Send')],
          ),
        ),
      ),
    ),
  );
  unawaited(
    container
        .read(navigationProvider)
        .key
        .currentState!
        .push<void>(
          MaterialPageRoute(builder: (_) => const Scaffold(body: Text('Finished'))),
        ),
  );
  await tester.pumpAndSettle();
  expect(find.text('Finished'), findsOneWidget);
  return container;
}

Future<bool> _loadArgs(WidgetTester tester, RefenaContainer container, List<String> args) async {
  return (await tester.runAsync(() => container.redux(selectedSendingFilesProvider).dispatchAsyncTakeResult(LoadSelectionFromArgsAction(args))))!;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  RustLib.initMock(api: _MetadataApi());

  testWidgets('a new share replaces a finished send screen and its selection', (tester) async {
    final container = RefenaContainer(
      overrides: [
        globalReduxProvider.overrideWithGlobalReducer(reducer: {ClearCacheAction: null}),
        sendProvider.overrideWithNotifier((ref) => _FinishedSendNotifier()),
      ],
    );
    container.redux(selectedSendingFilesProvider).dispatch(AddMessageAction(message: 'first'));

    await tester.pumpWidget(
      RefenaScope.withContainer(
        container: container,
        child: MaterialApp(
          navigatorKey: container.read(navigationProvider).key,
          home: Scaffold(
            body: PageView(controller: container.read(homePageControllerProvider).controller, children: const [Text('Receive'), Text('Send')]),
          ),
        ),
      ),
    );
    unawaited(
      container.read(navigationProvider).key.currentState!.push<void>(MaterialPageRoute(builder: (_) => const Scaffold(body: Text('Finished')))),
    );
    await tester.pumpAndSettle();
    expect(find.text('Finished'), findsOneWidget);

    await container.global.dispatchAsync(HandleShareIntentAction(payload: SharedMedia(content: 'second')));
    await tester.pumpAndSettle();

    expect(find.text('Finished'), findsNothing);
    expect(find.text('Send'), findsOneWidget);
    expect(container.read(sendProvider), isEmpty);
    expect(container.read(selectedSendingFilesProvider), hasLength(1));
    expect(container.read(selectedSendingFilesProvider).single.bytes, 'second'.codeUnits);
  });

  for (final status in [SessionStatus.finished, SessionStatus.finishedWithErrors]) {
    testWidgets('desktop file batch replaces a $status send screen and old selection', (tester) async {
      final dir = Directory.systemTemp.createTempSync('localsend-desktop-share-');
      addTearDown(() => dir.deleteSync(recursive: true));
      final first = File('${dir.path}/first.txt')..writeAsStringSync('first file');
      final second = File('${dir.path}/second.txt')..writeAsStringSync('second file');
      final container = await _mountFinishedRoute(tester, status: status);

      expect(await _loadArgs(tester, container, [first.path, second.path]), isTrue);
      container.redux(homePageControllerProvider).dispatch(ChangeTabAction(HomeTab.send));
      await tester.pumpAndSettle();

      expect(find.text('Finished'), findsNothing);
      expect(find.text('Send'), findsOneWidget);
      expect(container.read(sendProvider), isEmpty);
      expect(container.read(selectedSendingFilesProvider).map((file) => file.path).toSet(), {first.path, second.path});
    });
  }

  testWidgets('mixed desktop args prepare once, preserving every parsed item', (tester) async {
    final dir = Directory.systemTemp.createTempSync('localsend-desktop-mixed-');
    addTearDown(() => dir.deleteSync(recursive: true));
    final folder = Directory('${dir.path}/folder')..createSync();
    final nested = File('${folder.path}/nested.txt')..writeAsStringSync('nested');
    final shared = File('${dir.path}/shared.txt')..writeAsStringSync('shared');
    final container = await _mountFinishedRoute(tester, status: SessionStatus.finished);
    final windowsShare = jsonEncode({
      'content': 'shared message',
      'attachments': [
        {'path': shared.path, 'type': 3},
      ],
    });

    expect(await _loadArgs(tester, container, ['--text', '  desktop message  ', folder.path, '--share', windowsShare]), isTrue);
    await tester.pumpAndSettle();

    final selection = container.read(selectedSendingFilesProvider);
    expect(find.text('Finished'), findsNothing);
    expect(container.read(sendProvider), isEmpty);
    expect(selection.map((file) => file.path).whereType<String>().toSet(), {nested.path, shared.path});
    expect(selection.where((file) => file.bytes != null).map((file) => utf8.decode(file.bytes!)).toList(), ['desktop message', 'shared message']);
    expect(selection, hasLength(4));
  });

  testWidgets('invalid and empty desktop args leave a finished session alone', (tester) async {
    final container = await _mountFinishedRoute(tester, status: SessionStatus.finished);
    final missingPath = '${Directory.systemTemp.path}/localsend-missing-${DateTime.now().microsecondsSinceEpoch}';

    expect(await _loadArgs(tester, container, ['--unknown', missingPath, '--text', '  ', '--share', '{"content":"  ","attachments":[]}']), isFalse);
    await tester.pumpAndSettle();

    expect(find.text('Finished'), findsOneWidget);
    expect(container.read(sendProvider), contains('previous'));
    expect(container.read(selectedSendingFilesProvider), hasLength(1));
    expect(utf8.decode(container.read(selectedSendingFilesProvider).single.bytes!), 'first');
  });

  for (final (label, status, background) in <(String, SessionStatus, bool)>[
    ('active send', SessionStatus.sending, false),
    ('background completed send', SessionStatus.finished, true),
  ]) {
    testWidgets('desktop args keep $label and append selection', (tester) async {
      final dir = Directory.systemTemp.createTempSync('localsend-desktop-keep-');
      addTearDown(() => dir.deleteSync(recursive: true));
      final file = File('${dir.path}/new.txt')..writeAsStringSync('new');
      final container = await _mountFinishedRoute(tester, status: status, background: background);

      expect(await _loadArgs(tester, container, [file.path]), isTrue);
      await tester.pumpAndSettle();

      expect(find.text('Finished'), findsOneWidget);
      expect(container.read(sendProvider), contains('previous'));
      expect(container.read(selectedSendingFilesProvider), hasLength(2));
      expect(container.read(selectedSendingFilesProvider).last.path, file.path);
    });
  }
}
