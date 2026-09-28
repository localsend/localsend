import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/system_date_time_formatter.dart';
import 'package:system_date_time_format/system_date_time_format.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting();
    await LocaleSettings.setLocale(AppLocale.en);
  });

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
}
