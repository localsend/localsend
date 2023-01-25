import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:localsend_app/util/snackbar.dart';
import 'package:localsend_app/util/tray_helper.dart';
import 'package:routerino/routerino.dart';
import 'package:share_handler/share_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
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

  if (checkPlatformWithGallery()) {
    try {
      PhotoManager.clearFileCache();
    } catch (e) {
      print(e);
    }
  }

  final persistenceService = await PersistenceService.initialize();

  final locale = persistenceService.getLocale();
  if (locale == null) {
    LocaleSettings.useDeviceLocale();
  } else {
    LocaleSettings.setLocale(locale);
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
Future<void> postInit(BuildContext context, WidgetRef ref, void Function(int) goToPage) async {
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

  if (checkPlatformCanReceiveShareIntent()) {
    final shareHandler = ShareHandlerPlatform.instance;
    final initialSharedPayload = await shareHandler.getInitialSharedMedia();
    if (initialSharedPayload != null) {
      _handleSharedIntent(initialSharedPayload, ref);
      goToPage(HomeTab.send.index);
    }

    _sharedMediaSubscription?.cancel();
    _sharedMediaSubscription = shareHandler.sharedMediaStream.listen((SharedMedia payload) {
      _handleSharedIntent(payload, ref);
      goToPage(HomeTab.send.index);
    });
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
