import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/provider/window_dimensions_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/cache_helper.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:localsend_app/util/snackbar.dart';
import 'package:localsend_app/util/tray_helper.dart';
import 'package:routerino/routerino.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:share_handler/share_handler.dart';
import 'package:window_manager/window_manager.dart';

const launchAtStartupArg = 'autostart';

/// Will be called before the MaterialApp started
Future<PersistenceService> preInit(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

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
      await dio.post(ApiRoute.show.targetRaw('127.0.0.1', persistenceService.getPort(), persistenceService.isHttps()), queryParameters: {
        'token': persistenceService.getShowToken(),
      });
      exit(0); // Another instance does exist because no error is thrown
    } catch (_) {}

    // use the "slide" transition for desktop
    Routerino.transition = RouterinoTransition.cupertino;

    // initialize tray AFTER i18n has been initialized
    await initTray();

    // initialize size and position
    await WindowManager.instance.ensureInitialized();
    await dimensionsConfiguration(persistenceService);
    if (!args.contains(launchAtStartupArg) || !persistenceService.isAutoStartLaunchMinimized()) {
      // We show this app, when (1) app started manually, (2) app should not start minimized
      // In other words: only start minimized when launched on startup and "launchMinimized" is configured
      await WindowManager.instance.show();
    }
  }

  return persistenceService;
}

Future<void> dimensionsConfiguration(PersistenceService persistenceService) async {
  await WindowManager.instance.setMinimumSize(const Size(400, 500));
  final primaryDisplay = await ScreenRetriever.instance.getPrimaryDisplay();
  final width = (primaryDisplay.visibleSize ?? primaryDisplay.size).width;
  
  //TODO: Temporary replacement to a settigns toggle
  //persistenceService.getRememberLastPosition();
  const rememberLastPosition = true;
  if (rememberLastPosition) {
    final dimensions = WindowDimensionProvider(persistenceService).getDimensions();
    if(dimensions.isEmpty) {
      await setInitialSize(width);
    } else {
      await WindowManager.instance.setPosition(Offset(dimensions[0], dimensions[1]));
      await WindowManager.instance.setSize(Size(dimensions[2], dimensions[3]));
    }
  } else {
    await setInitialSize(width);
  }
}

Future<void> setInitialSize(double width) async {
  if (width >= 1200) {
    // make initial window size bigger as our display is big enough
    await WindowManager.instance.setSize(const Size(900, 600));
  }
  await WindowManager.instance.center();
}

StreamSubscription? _sharedMediaSubscription;

/// Will be called when home page has been initialized
Future<void> postInit(BuildContext context, WidgetRef ref, bool appStart, void Function(int) goToPage) async {
  await updateSystemOverlayStyle(context);

  final settings = ref.read(settingsProvider);
  try {
    await ref.read(serverProvider.notifier).startServer(
          alias: settings.alias,
          port: settings.port,
          https: settings.https,
        );
  } catch (e) {
    if (context.mounted) {
      context.showSnackBar(e.toString());
    }
  }

  try {
    ref.read(nearbyDevicesProvider.notifier).startMulticastListener();
  } catch (e) {
    print(e);
  }

  bool hasInitialShare = false;

  if (checkPlatformCanReceiveShareIntent()) {
    final shareHandler = ShareHandlerPlatform.instance;

    if (appStart) {
      final initialSharedPayload = await shareHandler.getInitialSharedMedia();
      if (initialSharedPayload != null) {
        hasInitialShare = true;
        unawaited(
          _handleSharedIntent(initialSharedPayload, ref),
        );
        goToPage(HomeTab.send.index);
      }
    }

    _sharedMediaSubscription?.cancel(); // ignore: unawaited_futures
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

Future<void> _handleSharedIntent(SharedMedia payload, WidgetRef ref) async {
  final message = payload.content;
  if (message != null && message.trim().isNotEmpty) {
    ref.read(selectedSendingFilesProvider.notifier).addMessage(message);
  }
  await ref.read(selectedSendingFilesProvider.notifier).addFiles(
        files: payload.attachments?.where((a) => a != null).cast<SharedAttachment>() ?? <SharedAttachment>[],
        converter: CrossFileConverters.convertSharedAttachment,
      );
}
