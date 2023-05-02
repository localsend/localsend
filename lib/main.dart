import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/init.dart';
import 'package:localsend_app/pages/init_page.dart';
import 'package:localsend_app/provider/app_arguments_provider.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/provider/tv_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/native/device_info_helper.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/native/tray_helper.dart';
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
    return TrayWatcher(
      child: WindowWatcher(
        onClose: () async {
          if (!checkPlatformIsDesktop()) {
            return;
          }
          try {
            if (ref.read(settingsProvider).minimizeToTray) {
              await hideToTray();
            } else {
              exit(0);
            }
          } catch (e) {
            print(e);
          }
        },
        child: LifeCycleWatcher(
          onChangedState: (AppLifecycleState state) async {
            if (state == AppLifecycleState.resumed) {
              await ref.read(networkStateProvider.notifier).init();
            }
          },
          child: ShortcutWatcher(
            child: MaterialApp(
              title: t.appName,
              locale: TranslationProvider.of(context).flutterLocale,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              debugShowCheckedModeBanner: false,
              theme: getTheme(Brightness.light),
              darkTheme: getTheme(Brightness.dark),
              themeMode: themeMode,
              navigatorKey: Routerino.navigatorKey,
              home: const InitPage(),
            ),
          ),
        ),
      ),
    );
  }
}
