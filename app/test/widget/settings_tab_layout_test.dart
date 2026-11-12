import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/model/send_mode.dart';
import 'package:localsend_app/model/state/settings_state.dart';
import 'package:localsend_app/pages/tabs/settings_tab.dart';
import 'package:localsend_app/pages/tabs/settings_tab_controller.dart';
import 'package:localsend_app/pages/tabs/settings_tab_vm.dart';
import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/provider/tv_provider.dart';
import 'package:localsend_app/provider/version_provider.dart';
import 'package:localsend_app/util/i18n.dart';
import 'package:localsend_isolates/constants.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/device_info_result.dart';
import 'package:mockito/mockito.dart';
import 'package:refena_flutter/refena_flutter.dart';

import '../mocks.mocks.dart';

void main() {
  tearDown(() async {
    await LocaleSettings.setLocale(AppLocale.en);
  });

  testWidgets('Ukrainian downloads label stays on one line when space is available', (tester) async {
    await _pumpSettings(tester, locale: AppLocale.uk, width: 1200);

    final paragraph = tester.renderObject<RenderParagraph>(find.text(t.settingsTab.receive.downloads));
    final lines = paragraph.getBoxesForSelection(TextSelection(baseOffset: 0, extentOffset: t.settingsTab.receive.downloads.length));
    expect(lines, hasLength(1));
    expect(tester.takeException(), isNull);
  }, variant: TargetPlatformVariant.only(TargetPlatform.macOS));

  testWidgets('downloads button moves below its label when the row is too narrow', (tester) async {
    await _pumpSettings(tester, locale: AppLocale.uk, width: 320, textScale: 2);

    final label = tester.getRect(find.text(t.settingsTab.receive.destination));
    final button = tester.getRect(find.ancestor(of: find.text(t.settingsTab.receive.downloads), matching: find.byType(TextButton)));
    expect(button.top, greaterThan(label.bottom));
    _expectTextInsideButton(tester, t.settingsTab.receive.downloads);
    expect(tester.takeException(), isNull);
  }, variant: TargetPlatformVariant.only(TargetPlatform.macOS));

  for (final locale in [AppLocale.en, AppLocale.zhCn, AppLocale.uk, AppLocale.fr, AppLocale.de, AppLocale.ptPt, AppLocale.id, AppLocale.ar]) {
    for (final width in [320.0, 600.0, 1200.0]) {
      for (final scale in [1.0, 1.5, 2.0]) {
        testWidgets('${locale.languageTag} buttons fit at width $width and text scale $scale', (tester) async {
          await _pumpSettings(tester, locale: locale, width: width, textScale: scale);

          _expectTextInsideButton(tester, t.settingsTab.receive.downloads);
          _expectTextInsideButton(tester, locale.getLocaleName());
          expect(tester.takeException(), isNull);
        }, variant: TargetPlatformVariant.only(TargetPlatform.macOS));
      }
    }
  }

  testWidgets('long custom destination wraps inside its button', (tester) async {
    const destination = '/Users/test/Documents/Incoming shared files/Фотографії за жовтень 2026';
    await _pumpSettings(tester, locale: AppLocale.uk, width: 320, textScale: 2, destination: destination);

    _expectTextInsideButton(tester, destination);
    expect(tester.takeException(), isNull);
  }, variant: TargetPlatformVariant.only(TargetPlatform.macOS));

  testWidgets('wrapped language button remains tappable', (tester) async {
    var taps = 0;
    await _pumpSettings(tester, locale: AppLocale.ptPt, width: 320, textScale: 2, onTapLanguage: () => taps++);

    final language = find.text(AppLocale.ptPt.getLocaleName());
    await tester.ensureVisible(language);
    await tester.tap(language);
    await tester.pump();
    expect(taps, 1);
    expect(tester.takeException(), isNull);
  }, variant: TargetPlatformVariant.only(TargetPlatform.macOS));
}

void _expectTextInsideButton(WidgetTester tester, String label) {
  // Text selection boxes can differ from layout bounds by a fraction of a pixel.
  const tolerance = 0.5;
  final text = find.text(label);
  final paragraph = tester.renderObject<RenderParagraph>(text);
  final button = find.ancestor(of: text, matching: find.byType(TextButton));
  expect(button, findsOneWidget);
  expect(paragraph.didExceedMaxLines, isFalse);

  final buttonRect = tester.getRect(button);
  final textRect = tester.getRect(text);
  expect(buttonRect.inflate(tolerance).contains(textRect.topLeft), isTrue);
  expect(buttonRect.inflate(tolerance).contains(textRect.bottomRight), isTrue);
  // A wrapped line's trailing whitespace may extend beyond the layout bounds.
  for (final word in RegExp(r'\S+').allMatches(label)) {
    for (final box in paragraph.getBoxesForSelection(TextSelection(baseOffset: word.start, extentOffset: word.end))) {
      expect(box.left, greaterThanOrEqualTo(-tolerance));
      expect(box.right, lessThanOrEqualTo(paragraph.size.width + tolerance));
      expect(box.top, greaterThanOrEqualTo(-tolerance));
      expect(box.bottom, lessThanOrEqualTo(paragraph.size.height + tolerance));
    }
  }
}

Future<void> _pumpSettings(
  WidgetTester tester, {
  required AppLocale locale,
  required double width,
  double textScale = 1,
  String? destination,
  VoidCallback? onTapLanguage,
}) async {
  await tester.binding.setSurfaceSize(Size(width, 900));
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.runAsync(() => LocaleSettings.setLocale(locale));

  final settingsService = SettingsService(MockPersistenceService());
  final settings = SettingsState(
    showToken: 'test',
    alias: 'LocalSend',
    theme: ThemeMode.system,
    colorMode: ColorMode.localsend,
    customColor: Colors.teal,
    locale: locale,
    destination: destination,
    port: defaultPort,
    multicastGroup: defaultMulticastGroup,
    networkWhitelist: null,
    networkBlacklist: null,
    saveToGallery: false,
    saveToHistory: true,
    quickSave: false,
    quickSaveFromFavorites: false,
    receivePin: null,
    autoFinish: false,
    minimizeToTray: false,
    https: true,
    sendMode: SendMode.single,
    saveWindowPlacement: false,
    alwaysOnTop: false,
    enableAnimations: false,
    deviceType: null,
    deviceModel: null,
    shareViaLinkAutoAccept: false,
    receiveViaLinkAutoAccept: false,
    createChecksums: false,
    verifyChecksums: false,
    discoveryTimeout: 500,
    advancedSettings: true,
  );
  final deviceInfo = DeviceInfoResult(deviceType: DeviceType.desktop, deviceModel: 'Mac', androidSdkInt: null);
  final vm = SettingsTabVm(
    advanced: true,
    aliasController: TextEditingController(text: 'LocalSend'),
    deviceModelController: TextEditingController(text: 'Mac'),
    portController: TextEditingController(text: '$defaultPort'),
    timeoutController: TextEditingController(text: '500'),
    multicastController: TextEditingController(text: defaultMulticastGroup),
    settings: settings,
    serverState: null,
    deviceInfo: deviceInfo,
    colorModes: [settings.colorMode],
    autoStart: false,
    autoStartLaunchHidden: false,
    showInContextMenu: false,
    onChangeTheme: (_, _) {},
    onChangeColorMode: (_, _) {},
    onTapLanguage: (_) => onTapLanguage?.call(),
    onToggleAutoStart: (_) {},
    onToggleAutoStartLaunchHidden: (_) {},
    onToggleShowInContextMenu: (_) {},
    onTapRestartServer: (_) {},
    onTapStartServer: (_) {},
    onTapStopServer: () {},
    onTapAdvanced: (_) {},
  );

  await tester.pumpWidget(
    RefenaScope(
      overrides: [
        tvProvider.overrideWithValue(false),
        settingsTabControllerProvider.overrideWithNotifier((_) => _LayoutController(vm, settingsService, deviceInfo)),
        versionProvider.overrideWithFuture((_) async => VersionData(version: '1.18.2', buildNumber: '64')),
      ],
      child: MaterialApp(
        locale: locale.flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        theme: getTheme(ColorMode.localsend, Colors.teal, Brightness.light, null),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        home: const Scaffold(body: SettingsTab()),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

class _LayoutController extends SettingsTabController {
  final SettingsTabVm vm;

  _LayoutController(this.vm, SettingsService settings, DeviceInfoResult deviceInfo)
    : super(
        settingsService: settings,
        serverNotifier: _MockServerService(),
        isolateController: _MockIsolateController(),
        localIpService: _MockLocalIpService(),
        initialDeviceInfo: deviceInfo,
        supportsDynamicColors: false,
      );

  @override
  SettingsTabVm init() => vm;

  @override
  get initialAction => null;
}

class _MockServerService extends Mock implements ServerService {}

class _MockIsolateController extends Mock implements IsolateController {}

class _MockLocalIpService extends Mock implements LocalIpService {}
