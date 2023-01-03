import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/selected_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:localsend_app/util/snackbar.dart';
import 'package:share_handler/share_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:window_manager/window_manager.dart';

/// Will be called before the MaterialApp started
Future<PersistenceService> preInit() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && checkPlatform([TargetPlatform.windows, TargetPlatform.macOS])) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(400, 500));
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
    ref.read(selectedFilesProvider.notifier).addMessage(message);
  }
  ref.read(selectedFilesProvider.notifier).addFiles(
    files: payload.attachments?.where((a) => a != null).cast<SharedAttachment>() ?? <SharedAttachment>[],
    converter: CrossFileConverters.convertSharedAttachment,
  );
}
