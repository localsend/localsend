import 'dart:io';

import 'package:args/args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localsend_app/config/init.dart';
import 'package:localsend_app/config/init_error.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/ui/dynamic_colors.dart';
import 'package:localsend_app/widget/watcher/life_cycle_watcher.dart';
import 'package:localsend_app/widget/watcher/shortcut_watcher.dart';
import 'package:localsend_app/widget/watcher/tray_watcher.dart';
import 'package:localsend_app/widget/watcher/window_watcher.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:localsend_isolates/util/logger.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

enum CliParse {
  verbose(isFlag: true),
  help(isFlag: true),
  share(isFlag: false)
  ;

  final bool isFlag;
  const CliParse({required this.isFlag});
}

class ParseResult {
  final bool verbose;
  final bool help;
  final List<String> shareFiles;

  const ParseResult({
    required this.verbose,
    required this.help,
    required this.shareFiles,
  });

  factory ParseResult.parse(List<String> arguments) {
    final parser = ArgParser()
      ..addFlag(CliParse.verbose.name, abbr: 'v', negatable: false, help: 'Enable verbose')
      ..addFlag(CliParse.help.name, abbr: 'h', negatable: false, help: 'Show help')
      ..addFlag(CliParse.share.name, abbr: 's', negatable: false, help: 'Share files');

    final results = parser.parse(arguments);

    if (results[CliParse.help.name] as bool) {
      print('Usage: localsend [options] <files>');
      print(parser.usage);
      exit(0);
    }

    return ParseResult(
      verbose: results[CliParse.verbose.name] as bool,
      help: results[CliParse.help.name] as bool,
      shareFiles: results.rest,
    );
  }
}

Future<void> main(List<String> args) async {
  final parsed = ParseResult.parse(args);
  final RefenaContainer container;
  try {
    container = await preInit(args);
  } catch (e, stackTrace) {
    showInitErrorApp(
      error: e,
      stackTrace: stackTrace,
    );
    return;
  }

  if (parsed.verbose) {
    initLogger(args.contains('-v') || args.contains('--verbose') ? Level.ALL : Level.OFF);
  } else {
    initLogger(Level.OFF);
  }

  runApp(
    RefenaScope.withContainer(
      container: container,
      child: TranslationProvider(
        child: LocalSendApp(args: parsed),
      ),
    ),
  );
}

class LocalSendApp extends StatelessWidget {
  final ParseResult args;

  const LocalSendApp({
    required this.args,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ref = context.ref;
    final (themeMode, colorMode) = ref.watch(settingsProvider.select((settings) => (settings.theme, settings.colorMode)));
    final dynamicColors = ref.watch(dynamicColorsProvider);
    return TrayWatcher(
      child: WindowWatcher(
        child: LifeCycleWatcher(
          onChangedState: (AppLifecycleState state) {
            switch (state) {
              case AppLifecycleState.resumed:
                ref.redux(localIpProvider).dispatch(InitLocalIpAction());
                break;
              case AppLifecycleState.detached:
                // The main isolate is only exited when all child isolates are exited.
                // https://github.com/localsend/localsend/issues/1568
                ref.redux(parentIsolateProvider).dispatch(IsolateDisposeAction());
                break;
              default:
                break;
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
                builder: () => HomePage(
                  initialTab: args.shareFiles.isEmpty ? HomeTab.receive : HomeTab.send,
                  appStart: true,
                  argsForinitalTab: args.shareFiles,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
