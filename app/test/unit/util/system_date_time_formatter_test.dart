import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/system_date_time_formatter.dart';
import 'package:system_date_time_format/system_date_time_format.dart';

void main() {
  // Loads the same date symbols as the app; intl's initializeDateFormatting() has more locales and hides fallback bugs.
  setUpAll(() => GlobalMaterialLocalizations.delegate.load(const Locale('en')));

  setUp(() => LocaleSettings.setLocale(AppLocale.en));

  testWidgets('Displayed dates and times follow the system patterns for an unsupported intl region', (tester) async {
    const channel = MethodChannel('system_date_time_format');
    var datePattern = 'dd/MM/y';
    var timePattern = 'HH:mm';
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (call) async {
      return switch (call.method) {
        'getDateFormat' => datePattern,
        'getTimeFormat' => timePattern,
        _ => null,
      };
    });
    addTearDown(() => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, null));
    tester.binding.platformDispatcher.localeTestValue = const Locale('en', 'IL');
    addTearDown(tester.binding.platformDispatcher.clearLocaleTestValue);

    final timestamp = DateTime(2026, 9, 27, 15, 54);

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: SDTFScope(
          child: Builder(
            builder: (context) => Text(SystemDateTimeFormatter.dateTime(context, timestamp)),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('27/09/2026 15:54'), findsOneWidget);

    datePattern = 'M/d/y';
    timePattern = 'h:mm a';
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(find.text('9/27/2026 3:54 PM'), findsOneWidget);

    // Linux's T_FMT may yield HH:mm:ss; keep minute precision in the UI.
    timePattern = 'HH:mm:ss';
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(find.text('9/27/2026 15:54'), findsOneWidget);

    timePattern = 'h:mm a:ss';
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(find.text('9/27/2026 3:54 PM'), findsOneWidget);

    timePattern = "HH:mm 'seconds'";
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(find.text('9/27/2026 15:54 seconds'), findsOneWidget);

    timePattern = "HH:mm 'm:ss'";
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(find.text('9/27/2026 15:54 m:ss'), findsOneWidget);
  });

  testWidgets('Day period uses the device language', (tester) async {
    final text = await _format(tester, device: const Locale('zh', 'CN'), app: AppLocale.zhCn, datePattern: 'y/M/d', timePattern: 'ah:mm');
    expect(text, '2026/9/27 下午3:54');
  });

  testWidgets('Device language wins over the app language', (tester) async {
    final text = await _format(tester, device: const Locale('ko', 'KR'), app: AppLocale.en, datePattern: 'y. M. d.', timePattern: 'a h:mm');
    expect(text, '2026. 9. 27. 오후 3:54');
  });

  testWidgets('Without system patterns, a regional app locale is used', (tester) async {
    final text = await _format(tester, device: const Locale('xx'), app: AppLocale.ptBr);
    expect(text, '27/09/2026 15:54');
  });

  testWidgets('Flexible day period falls back to the locale default', (tester) async {
    final text = await _format(tester, device: const Locale('zh', 'TW'), app: AppLocale.zhTw, datePattern: 'y/M/d', timePattern: 'Bh:mm');
    expect(text, '2026/9/27 下午3:54');
  });

  testWidgets('.NET-style weekday falls back to the locale default', (tester) async {
    final text = await _format(tester, device: const Locale('en', 'GB'), app: AppLocale.en, datePattern: 'ddd dd/MM/yyyy', timePattern: 'HH:mm');
    expect(text, '27/09/2026 15:54');
  });

  testWidgets('Short weekday falls back to the locale default', (tester) async {
    final text = await _format(tester, device: const Locale('en', 'GB'), app: AppLocale.en, datePattern: 'EEEEEE dd/MM/yyyy', timePattern: 'HH:mm');
    expect(text, '27/09/2026 15:54');
  });

  testWidgets('Time zone falls back to the locale default', (tester) async {
    final text = await _format(tester, device: const Locale('en', 'GB'), app: AppLocale.en, datePattern: 'dd/MM/yyyy', timePattern: 'HH:mm z');
    expect(text, '27/09/2026 15:54');
  });
}

Future<String> _format(
  WidgetTester tester, {
  required Locale device,
  required AppLocale app,
  String? datePattern,
  String? timePattern,
}) async {
  const channel = MethodChannel('system_date_time_format');
  tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (call) async {
    return switch (call.method) {
      'getDateFormat' => datePattern,
      'getTimeFormat' => timePattern,
      _ => null,
    };
  });
  addTearDown(() => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, null));
  tester.binding.platformDispatcher.localeTestValue = device;
  addTearDown(tester.binding.platformDispatcher.clearLocaleTestValue);
  // Loading translations is real async work that never completes under the fake clock.
  await tester.runAsync(() => LocaleSettings.setLocale(app));

  late String text;
  await tester.pumpWidget(
    SDTFScope(
      child: Builder(
        builder: (context) {
          text = SystemDateTimeFormatter.dateTime(context, DateTime(2026, 9, 27, 15, 54));
          return const SizedBox();
        },
      ),
    ),
  );
  await tester.pumpAndSettle();
  return text;
}
