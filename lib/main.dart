import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/service/persistence_service.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/device_info_helper.dart';
import 'package:routerino/routerino.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.windows) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(400, 500));
  }

  final persistenceService = await PersistenceService.initialize();

  final locale = persistenceService.getLocale();
  if (locale == null) {
    LocaleSettings.useDeviceLocale();
  } else {
    LocaleSettings.setLocale(locale);
  }

  final deviceInfo = await getDeviceInfo();

  runApp(TranslationProvider(
    child: ProviderScope(
      overrides: [
        deviceRawInfoProvider.overrideWithValue(deviceInfo),
        settingsProvider.overrideWith((ref) => SettingsNotifier(persistenceService)),
      ],
      child: const LocalSendApp(),
    ),
  ));
}

class LocalSendApp extends ConsumerWidget {
  const LocalSendApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(settingsProvider.select((settings) => settings.theme));
    return MaterialApp(
      title: t.appName,
      debugShowCheckedModeBanner: false,
      theme: getTheme(Brightness.light),
      darkTheme: getTheme(Brightness.dark),
      themeMode: themeMode,
      navigatorKey: Routerino.navigatorKey,
      home: const HomePage(),
    );
  }
}
