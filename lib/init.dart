import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/cache_helper.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:localsend_app/util/snackbar.dart';
import 'package:localsend_app/util/tray_helper.dart';
import 'package:routerino/routerino.dart';
import 'package:share_handler/share_handler.dart';
import 'package:window_manager/window_manager.dart';

const launchAtStartupArg = 'autostart';

/// Will be called before the MaterialApp started
Future<PersistenceService> preInit(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (checkPlatformIsDesktop()) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(400, 500));

    // use the "slide" transition for desktop
    Routerino.transition = RouterinoTransition.cupertino;
  }

  final persistenceService = await PersistenceService.initialize();

  final locale = persistenceService.getLocale();
  if (locale == null) {
    LocaleSettings.useDeviceLocale();
  } else {
    LocaleSettings.setLocale(locale);
  }

  // Register default plural resolver
  for (final locale in AppLocale.values) {
    if ([AppLocale.en, AppLocale.de].contains(locale)) {
      continue;
    }

    LocaleSettings.setPluralResolver(
      locale: locale,
      cardinalResolver: (n, {zero, one, two, few, many, other}) {
        if (n == 0) {
          return zero ?? other ?? n.toString();
        }
        if (n == 1) {
          return one ?? other ?? n.toString();
        }
        return other ?? n.toString();
      },
      ordinalResolver: (n, {zero, one, two, few, many, other}) {
        return other ?? n.toString();
      },
    );
  }

  if (checkPlatformIsDesktop()) {
    // Check if this app is already open and let it "show up".
    // If this is the case, then exit the current instance.

    final dio = createDio(DioType.startupCheckAnotherInstance);

    try {
      await dio.post(ApiRoute.show.targetRaw('127.0.0.1', persistenceService.getPort()), queryParameters: {
        'token': persistenceService.getShowToken(),
      });
      exit(0); // Another instance does exist because no error is thrown
    } catch (_) {}
  }

  if (checkPlatformIsDesktop()) {
    // initialize tray AFTER i18n has been initialized
    await initTray();

    if (!args.contains(launchAtStartupArg) || !persistenceService.isAutoStartLaunchMinimized()) {
      // We show this app, when (1) app started manually, (2) app should not start minimized
      // In other words: only start minimized when launched on startup and "launchMinimized" is configured
      await windowManager.show();
    }
  }

  return persistenceService;
}

StreamSubscription? _sharedMediaSubscription;

/// Will be called when home page has been initialized
Future<void> postInit(BuildContext context, WidgetRef ref, bool appStart, void Function(int) goToPage) async {
  updateSystemOverlayStyle(context);

  final settings = ref.read(settingsProvider);
  try {
    await ref.read(serverProvider.notifier).startServer(
          alias: settings.alias,
          port: settings.port,
        );
  } catch (e) {
    context.showSnackBar(e.toString());
  }

  bool hasInitialShare = false;

  if (checkPlatformCanReceiveShareIntent()) {
    final shareHandler = ShareHandlerPlatform.instance;

    if (appStart) {
      final initialSharedPayload = await shareHandler.getInitialSharedMedia();
      if (initialSharedPayload != null) {
        hasInitialShare = true;
        _handleSharedIntent(initialSharedPayload, ref);
        goToPage(HomeTab.send.index);
      }
    }

    _sharedMediaSubscription?.cancel();
    _sharedMediaSubscription = shareHandler.sharedMediaStream.listen((SharedMedia payload) {
      _handleSharedIntent(payload, ref);
      goToPage(HomeTab.send.index);
    });
  }

  if (appStart && !hasInitialShare && (checkPlatformWithGallery() || checkPlatformCanReceiveShareIntent())) {
    // Clear cache on every app start.
    // If we received a share intent, then don't clear it, otherwise the shared file will be lost.
    clearCache();
  }
}

void _handleSharedIntent(SharedMedia payload, WidgetRef ref) {
  final message = payload.content;
  if (message != null && message.trim().isNotEmpty) {
    ref.read(selectedSendingFilesProvider.notifier).addMessage(message);
  }
  ref.read(selectedSendingFilesProvider.notifier).addFiles(
        files: payload.attachments?.where((a) => a != null).cast<SharedAttachment>() ?? <SharedAttachment>[],
        converter: CrossFileConverters.convertSharedAttachment,
      );
}
