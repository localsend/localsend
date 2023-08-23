import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/init.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/provider/animation_provider.dart';
import 'package:localsend_app/provider/app_arguments_provider.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/provider/tv_provider.dart';
import 'package:localsend_app/riverpie.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/native/device_info_helper.dart';
import 'package:localsend_app/util/ui/dynamic_colors.dart';
import 'package:localsend_app/widget/watcher/life_cycle_watcher.dart';
import 'package:localsend_app/widget/watcher/shortcut_watcher.dart';
import 'package:localsend_app/widget/watcher/tray_watcher.dart';
import 'package:localsend_app/widget/watcher/window_watcher.dart';
import 'package:riverpie_flutter/riverpie_flutter.dart';
import 'package:routerino/routerino.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final (persistenceService, startHidden) = await preInit(args);
  final scope = RiverpieScope(
    observer: kDebugMode ? CustomRiverpieDebugObserver() : null,
    overrides: [
      persistenceProvider.overrideWithValue(persistenceService),
      deviceRawInfoProvider.overrideWithValue(await getDeviceInfo()),
      appArgumentsProvider.overrideWithValue(args),
      tvProvider.overrideWithValue(await checkIfTv()),
      dynamicColorsProvider.overrideWithValue(await getDynamicColors()),
      sleepProvider.overrideWithInitialState((ref) => startHidden),
    ],
    child: TranslationProvider(
      child: const LocalSendApp(),
    ),
  );

  await scope.ensureOverrides();

  runApp(scope);
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
          onChangedState: (AppLifecycleState state) async {
            if (state == AppLifecycleState.resumed) {
              await ref.notifier(networkStateProvider).fetchLocalIp();
            }
          },
          child: ShortcutWatcher(
            child: MaterialApp(
              title: t.appName,
              locale: TranslationProvider.of(context).flutterLocale,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              debugShowCheckedModeBanner: false,
              theme: getTheme(Brightness.light, colorMode == ColorMode.system ? dynamicColors?.light : null),
              darkTheme: getTheme(Brightness.dark, colorMode == ColorMode.system ? dynamicColors?.dark : null),
              themeMode: themeMode,
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
