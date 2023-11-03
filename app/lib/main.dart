import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/init.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/ui/dynamic_colors.dart';
import 'package:localsend_app/widget/watcher/life_cycle_watcher.dart';
import 'package:localsend_app/widget/watcher/shortcut_watcher.dart';
import 'package:localsend_app/widget/watcher/tray_watcher.dart';
import 'package:localsend_app/widget/watcher/window_watcher.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

Future<void> main(List<String> args) async {
  final container = await preInit(args);

  runApp(RefenaScope.withContainer(
    container: container,
    child: TranslationProvider(
      child: const LocalSendApp(),
    ),
  ));
}

class LocalSendApp extends StatelessWidget {
  const LocalSendApp();

  @override
  Widget build(BuildContext context) {
    final ref = context.ref;
    final (themeMode, colorMode) = ref.watch(settingsProvider.select((settings) => (settings.theme, settings.colorMode)));
    final dynamicColors = ref.watch(dynamicColorsProvider);
    return TrayWatcher(
      child: WindowWatcher(
        child: LifeCycleWatcher(
          onChangedState: (AppLifecycleState state) {
            if (state == AppLifecycleState.resumed) {
              ref.redux(localIpProvider).dispatch(InitLocalIpAction());
            }
          },
          child: ShortcutWatcher(
            child: MaterialApp(
              title: t.appName,
              locale: TranslationProvider.of(context).flutterLocale,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              debugShowCheckedModeBanner: false,
              theme: getTheme(colorMode, Brightness.light, dynamicColors),
              darkTheme: getTheme(colorMode, Brightness.dark, dynamicColors),
              themeMode: colorMode == ColorMode.oled ? ThemeMode.dark : themeMode,
              navigatorKey: Routerino.navigatorKey,
              home: RouterinoHome(
                builder: () => const HomePage(
                  initialTab: HomeTab.receive,
                  appStart: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
