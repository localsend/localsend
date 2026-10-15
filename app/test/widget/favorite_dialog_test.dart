import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/model/state/settings_state.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/http_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/widget/dialogs/favorite_dialog.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/rust/api/http.dart';
import 'package:localsend_isolates/rust/api/model.dart' as rust;
import 'package:mockito/mockito.dart';
import 'package:refena_flutter/refena_flutter.dart';

import '../mocks.mocks.dart';

class _Settings extends Fake implements SettingsState {
  @override
  bool get https => false;
}

class _TestSettingsService extends SettingsService {
  _TestSettingsService(super.persistence, this.testState);

  final SettingsState testState;

  @override
  SettingsState init() => testState;
}

class _UnavailableClient extends Mock implements RsHttpClient {
  bool registerCalled = false;

  @override
  Future<ResultWithPublicKeyRegisterResponseDto> register({
    required rust.ProtocolType protocol,
    required String ip,
    required int port,
    required rust.RegisterDto payload,
  }) async {
    registerCalled = true;
    throw StateError('device unavailable');
  }
}

void main() {
  testWidgets('connection error remains scrollable in a short dialog with large text', (tester) async {
    tester.view.physicalSize = const Size(640, 280);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final favorites = List.generate(
      8,
      (index) => FavoriteDevice(
        id: '$index',
        fingerprint: '$index',
        ip: '192.168.1.${index + 1}',
        port: 53317,
        alias: 'Device $index',
      ),
    );
    final persistence = MockPersistenceService();
    when(persistence.getFavorites()).thenReturn(favorites);
    final settings = _Settings();
    final client = _UnavailableClient();

    await tester.pumpWidget(
      RefenaScope(
        overrides: [
          persistenceProvider.overrideWithValue(persistence),
          settingsProvider.overrideWithNotifier((ref) => _TestSettingsService(persistence, settings)),
          deviceFullInfoProvider.overrideWithBuilder(
            (ref) => const Device(
              signalingId: null,
              ip: '192.168.1.100',
              version: '2.0',
              port: 53317,
              alias: 'This device',
              https: false,
              fingerprint: 'TEST',
              deviceModel: null,
              deviceType: DeviceType.desktop,
              download: false,
              channels: [],
            ),
          ),
          httpProvider.overrideWithBuilder(
            (ref) => HttpClientCollection(privateKey: '', certificate: '', discovery: client),
          ),
        ],
        child: MaterialApp(
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(2.5)),
            child: child!,
          ),
          home: Scaffold(
            body: Builder(
              builder: (context) => TextButton(
                onPressed: () => showDialog<void>(context: context, builder: (_) => const FavoritesDialog()),
                child: const Text('Open favorites'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open favorites'));
    await tester.pumpAndSettle();

    expect(find.text('Device 0\n(192.168.1.1)'), findsOneWidget);
    expect(tester.takeException(), isNull);
    final favoriteText = find.text('Device 0\n(192.168.1.1)');
    final visiblePart = tester.getRect(favoriteText).intersect(tester.getRect(find.byType(SingleChildScrollView).first));
    expect(visiblePart.height, greaterThan(20));
    await tester.tapAt(visiblePart.center);
    await tester.pumpAndSettle();

    expect(client.registerCalled, isTrue);
    expect(find.text(t.general.error), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.ensureVisible(find.byIcon(Icons.info));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.info).hitTestable(), findsOneWidget);
    await tester.tap(find.byIcon(Icons.info));
    await tester.pumpAndSettle();
    expect(find.textContaining('device unavailable'), findsOneWidget);
  });
}
