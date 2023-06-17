import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/init.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/provider/app_arguments_provider.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/provider/tv_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/native/device_info_helper.dart';
import 'package:localsend_app/widget/watcher/life_cycle_watcher.dart';
import 'package:localsend_app/widget/watcher/shortcut_watcher.dart';
import 'package:localsend_app/widget/watcher/tray_watcher.dart';
import 'package:localsend_app/widget/watcher/window_watcher.dart';
import 'package:routerino/routerino.dart';

Future<void> main(List<String> args) async {
  final persistenceService = await preInit(args);
  runApp(ProviderScope(
    overrides: [
      deviceRawInfoProvider.overrideWithValue(await getDeviceInfo()),
      persistenceProvider.overrideWithValue(persistenceService),
      appArgumentsProvider.overrideWith((ref) => args),
      tvProvider.overrideWithValue(await checkIfTv()),
    ],
    child: TranslationProvider(
      child: const LocalSendApp(),
    ),
  ));
}

class LocalSendApp extends ConsumerWidget {
  const LocalSendApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(settingsProvider.select((settings) => settings.theme));
    final colorMode = ref.watch(settingsProvider.select((settings) => settings.colorMode));
    return TrayWatcher(
      child: WindowWatcher(
        child: LifeCycleWatcher(
          onChangedState: (AppLifecycleState state) async {
            if (state == AppLifecycleState.resumed) {
              await ref.read(networkStateProvider.notifier).init();
            }
          },
          child: ShortcutWatcher(
            child: DynamicColorBuilder(
              builder: (lightColor, darkColor) {
                return MaterialApp(
                  title: t.appName,
                  locale: TranslationProvider.of(context).flutterLocale,
                  supportedLocales: AppLocaleUtils.supportedLocales,
                  localizationsDelegates: GlobalMaterialLocalizations.delegates,
                  debugShowCheckedModeBanner: false,
                  theme: getTheme(Brightness.light, colorMode == ColorMode.system ? lightColor : null),
                  darkTheme: getTheme(Brightness.dark, colorMode == ColorMode.system ? darkColor : null),
                  themeMode: themeMode,
                  navigatorKey: Routerino.navigatorKey,
                  home: RouterinoHome(
                    builder: () => const HomePage(
                      initialTab: HomeTab.receive,
                      appStart: true,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
