import 'dart:async';
import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/provider/animation_provider.dart';
import 'package:localsend_app/provider/app_arguments_provider.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
// [FOSS_REMOVE_START]
import 'package:localsend_app/provider/purchase_provider.dart';
// [FOSS_REMOVE_END]
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/provider/tv_provider.dart';
import 'package:localsend_app/provider/window_dimensions_provider.dart';
import 'package:localsend_app/refena.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/i18n.dart';
import 'package:localsend_app/util/logger.dart';
import 'package:localsend_app/util/native/cache_helper.dart';
import 'package:localsend_app/util/native/cross_file_converters.dart';
import 'package:localsend_app/util/native/device_info_helper.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/native/tray_helper.dart';
import 'package:localsend_app/util/ui/dynamic_colors.dart';
import 'package:localsend_app/util/ui/snackbar.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:share_handler/share_handler.dart';
import 'package:window_manager/window_manager.dart';

const launchAtStartupArg = 'autostart';

final _logger = Logger('Init');

/// Will be called before the MaterialApp started
Future<RefenaContainer> preInit(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  initLogger(args.contains('-v') || args.contains('--verbose') ? Level.ALL : Level.INFO);
  MapperContainer.globals.use(const FileDtoMapper());

  final dynamicColors = await getDynamicColors();

  final persistenceService = await PersistenceService.initialize(dynamicColors);

  initI18n();

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

  final container = RefenaContainer(
    observers: kDebugMode ? [CustomRefenaObserver()] : [],
    overrides: [
      persistenceProvider.overrideWithValue(persistenceService),
      deviceRawInfoProvider.overrideWithValue(await getDeviceInfo()),
      appArgumentsProvider.overrideWithValue(args),
      tvProvider.overrideWithValue(await checkIfTv()),
      dynamicColorsProvider.overrideWithValue(dynamicColors),
      sleepProvider.overrideWithInitialState((ref) => startHidden),
    ],
  );

  // wait until all overrides are set
  await container.ensureOverrides();

  return container;
}

StreamSubscription? _sharedMediaSubscription;

/// Will be called when home page has been initialized
Future<void> postInit(BuildContext context, Ref ref, bool appStart, void Function(int) goToPage) async {
  await updateSystemOverlayStyle(context);

  if (checkPlatform([TargetPlatform.android])) {
    try {
      await FlutterDisplayMode.setHighRefreshRate();
    } catch (e) {
      _logger.warning('Setting high refresh rate failed', e);
    }
  }

  try {
    await ref.notifier(serverProvider).startServerFromSettings();
  } catch (e) {
    if (context.mounted) {
      context.showSnackBar(e.toString());
    }
  }

  try {
    ref.redux(nearbyDevicesProvider).dispatchAsync(StartMulticastListener()); // ignore: unawaited_futures
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
        // ignore: unawaited_futures
        ref.dispatchAsync(_HandleShareIntentAction(
          payload: initialSharedPayload,
          goToPage: goToPage,
        ));
      }
    }

    _sharedMediaSubscription?.cancel(); // ignore: unawaited_futures
    _sharedMediaSubscription = shareHandler.sharedMediaStream.listen((SharedMedia payload) {
      ref.dispatchAsync(_HandleShareIntentAction(
        payload: payload,
        goToPage: goToPage,
      ));
    });
  }

  if (appStart && !hasInitialShare && (checkPlatformWithGallery() || checkPlatformCanReceiveShareIntent())) {
    // Clear cache on every app start.
    // If we received a share intent, then don't clear it, otherwise the shared file will be lost.
    ref.dispatchAsync(ClearCacheAction()); // ignore: unawaited_futures
  }

  // [FOSS_REMOVE_START]
  if (checkPlatformSupportPayment()) {
    // ignore: unawaited_futures
    ref.redux(purchaseProvider).dispatchAsync(InitPurchaseStream());
  }
  // [FOSS_REMOVE_END]
}

class _HandleShareIntentAction extends AsyncGlobalAction {
  final SharedMedia payload;
  final void Function(int) goToPage;

  _HandleShareIntentAction({
    required this.payload,
    required this.goToPage,
  });

  @override
  Future<void> reduce() async {
    final message = payload.content;
    if (message != null && message.trim().isNotEmpty) {
      ref.redux(selectedSendingFilesProvider).dispatch(AddMessageAction(message: message));
    }
    await ref.redux(selectedSendingFilesProvider).dispatchAsync(AddFilesAction(
          files: payload.attachments?.where((a) => a != null).cast<SharedAttachment>() ?? <SharedAttachment>[],
          converter: CrossFileConverters.convertSharedAttachment,
        ));

    goToPage(HomeTab.send.index);
  }
}
