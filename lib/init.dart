import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/provider/animation_provider.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/provider/window_dimensions_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/native/cache_helper.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/native/tray_helper.dart';
import 'package:localsend_app/util/ui/snackbar.dart';
import 'package:logging/logging.dart';
import 'package:riverpie_flutter/riverpie_flutter.dart';
import 'package:share_handler/share_handler.dart';
import 'package:window_manager/window_manager.dart';

const launchAtStartupArg = 'autostart';

final _logger = Logger('Init');

/// Will be called before the MaterialApp started
Future<(PersistenceService, bool)> preInit(List<String> args) async {
  // Init logger
  Logger.root.level = args.contains('-v') || args.contains('--verbose') ? Level.ALL : Level.INFO;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.time} ${'[${record.level.name}]'.padLeft(9)} [${record.loggerName}] ${record.message}');
  });

  final persistenceService = await PersistenceService.initialize();

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

  bool startHidden = false;
  if (checkPlatformIsDesktop()) {
    // Check if this app is already open and let it "show up".
    // If this is the case, then exit the current instance.

    final dio = createDio(const Duration(milliseconds: 100), persistenceService.getSecurityContext());

    try {
      await dio.post(
        ApiRoute.show.targetRaw(
          '127.0.0.1',
          persistenceService.getPort(),
          persistenceService.isHttps(),
          peerProtocolVersion,
        ),
        queryParameters: {
          'token': persistenceService.getShowToken(),
        },
      );
      exit(0); // Another instance does exist because no error is thrown
    } catch (_) {}

    // initialize tray AFTER i18n has been initialized
    try {
      await initTray();
    } catch (e) {
      _logger.warning('Initializing tray failed: $e');
    }

    // initialize size and position
    await WindowManager.instance.ensureInitialized();
    await WindowDimensionsController(persistenceService).initDimensionsConfiguration();
    if (!args.contains(launchAtStartupArg) || !persistenceService.isAutoStartLaunchMinimized()) {
      // We show this app, when (1) app started manually, (2) app should not start minimized
      // In other words: only start minimized when launched on startup and "launchMinimized" is configured
      await WindowManager.instance.show();
    } else {
      // keep this app hidden
      startHidden = true;
    }
  }

  setDefaultRouteTransition();

  return (persistenceService, startHidden);
}

StreamSubscription? _sharedMediaSubscription;

/// Will be called when home page has been initialized
Future<void> postInit(BuildContext context, Ref ref, bool appStart, void Function(int) goToPage) async {
  await updateSystemOverlayStyle(context);

  try {
    await ref.notifier(serverProvider).startServerFromSettings();
  } catch (e) {
    if (context.mounted) {
      context.showSnackBar(e.toString());
    }
  }

  try {
    ref.notifier(nearbyDevicesProvider).startMulticastListener();
  } catch (e) {
    _logger.warning('Starting multicast listener failed', e);
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

Future<void> _handleSharedIntent(SharedMedia payload, Ref ref) async {
  final message = payload.content;
  if (message != null && message.trim().isNotEmpty) {
    ref.notifier(selectedSendingFilesProvider).addMessage(message);
  }
  await ref.notifier(selectedSendingFilesProvider).addFiles(
        files: payload.attachments?.where((a) => a != null).cast<SharedAttachment>() ?? <SharedAttachment>[],
        converter: CrossFileConverters.convertSharedAttachment,
      );
}
