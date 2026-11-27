import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/state/network_state.dart';
import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:localsend_app/model/state/settings_state.dart';
import 'package:localsend_app/pages/tabs/receive_tab.dart';
import 'package:localsend_app/provider/animation_provider.dart';
import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/widget/rotating_widget.dart';
import 'package:refena_flutter/refena_flutter.dart';

import '../mocks.mocks.dart';

class _Settings extends Fake implements SettingsState {
  @override
  String get alias => 'Test';

  @override
  bool get enableAnimations => false; // skip fade-in
}

class _TestSettingsService extends SettingsService {
  _TestSettingsService() : super(MockPersistenceService());

  @override
  SettingsState init() => _Settings();
}

class _RunningServer extends ServerService {
  @override
  ServerState? init() => const ServerState(alias: 'Test', port: 53317, https: true, session: null, web: null);
}

class _TestLocalIp extends LocalIpService {
  _TestLocalIp(super.settingsService, this.network);

  final NetworkState network;

  @override
  NetworkState init() => network;

  @override
  get initialAction => null;
}

Future<void> _pump(WidgetTester tester, NetworkState network) async {
  await tester.pumpWidget(
    RefenaScope(
      overrides: [
        settingsProvider.overrideWithNotifier((_) => _TestSettingsService()),
        serverProvider.overrideWithNotifier((_) => _RunningServer()),
        localIpProvider.overrideWithNotifier((ref) => _TestLocalIp(ref.notifier(settingsProvider), network)),
        animationProvider.overrideWithBuilder((_) => true),
      ],
      child: const MaterialApp(home: Scaffold(body: ReceiveTab())),
    ),
  );
  await tester.pump(const Duration(seconds: 1));
}

bool _spinning(WidgetTester tester) => tester.widget<RotatingWidget>(find.byType(RotatingWidget)).spinning;

Future<void> _dispose(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox());
  await tester.pump(const Duration(seconds: 1)); // let the pending tick finish
}

void main() {
  testWidgets('shows offline and stops the logo when no local address was found', (tester) async {
    await _pump(tester, const NetworkState(localIps: [], initialized: true));
    expect(find.text(t.general.offline), findsOneWidget);
    expect(_spinning(tester), isFalse);
    await _dispose(tester);
  });

  testWidgets('does not show offline while the addresses are still being fetched', (tester) async {
    await _pump(tester, const NetworkState(localIps: [], initialized: false));
    expect(find.text(t.general.offline), findsNothing);
    expect(_spinning(tester), isTrue);
    await _dispose(tester);
  });

  testWidgets('shows the address id when a local address exists', (tester) async {
    await _pump(tester, const NetworkState(localIps: ['192.168.1.42'], initialized: true));
    expect(find.text('#42'), findsOneWidget);
    expect(_spinning(tester), isTrue);
    await _dispose(tester);
  });
}
