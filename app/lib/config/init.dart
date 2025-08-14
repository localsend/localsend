import 'dart:async';
import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:common/api_route_builder.dart';
import 'package:common/constants.dart';
import 'package:common/isolate.dart';
import 'package:common/model/dto/file_dto.dart';
import 'package:common/model/dto/multicast_dto.dart';
import 'package:common/util/logger.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:localsend_app/config/refena.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/pages/home_page_controller.dart';
import 'package:localsend_app/provider/animation_provider.dart';
import 'package:localsend_app/provider/app_arguments_provider.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/network/webrtc/signaling_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';

// [FOSS_REMOVE_START]
import 'package:localsend_app/provider/purchase_provider.dart';

// [FOSS_REMOVE_END]
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/provider/tv_provider.dart';
import 'package:localsend_app/provider/window_dimensions_provider.dart';
import 'package:localsend_app/rust/api/logging.dart' as rust_logging;
import 'package:localsend_app/rust/frb_generated.dart';
import 'package:localsend_app/util/i18n.dart';
import 'package:localsend_app/util/native/autostart_helper.dart';
import 'package:localsend_app/util/native/cache_helper.dart';
import 'package:localsend_app/util/native/content_uri_helper.dart';
import 'package:localsend_app/util/native/context_menu_helper.dart';
import 'package:localsend_app/util/native/cross_file_converters.dart';
import 'package:localsend_app/util/native/device_info_helper.dart';
import 'package:localsend_app/util/native/macos_channel.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/native/tray_helper.dart';
import 'package:localsend_app/util/rhttp.dart';
import 'package:localsend_app/util/ui/dynamic_colors.dart';
import 'package:localsend_app/util/ui/snackbar.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:rhttp/rhttp.dart';
import 'package:share_handler/share_handler.dart';
import 'package:window_manager/window_manager.dart';

final _logger = Logger('Init');

/// Will be called before the MaterialApp started
Future<RefenaContainer> preInit(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  initLogger(args.contains('-v') || args.contains('--verbose') ? Level.ALL : Level.INFO);
  MapperContainer.globals.use(const FileDtoMapper());

  await RustLib.init();

  if (kDebugMode) {
    try {
      await rust_logging.enableDebugLogging();
    } catch (e) {
      _logger.warning('Enabling debug logging failed', e);
    }
  }

  await Rhttp.init();

  final dynamicColors = await getDynamicColors();

  final persistenceService = await PersistenceService.initialize(
    supportsDynamicColors: dynamicColors != null,
  );

  if (persistenceService.isFirstAppStart && !persistenceService.isPortableMode()) {
    await enableContextMenu();
  }

  await initI18n();

  bool startHidden = false;
  if (checkPlatformIsDesktop()) {
    // Check if this app is already open and let it "show up".
    // If this is the case, then exit the current instance.

    final client = createRhttpClient(const Duration(milliseconds: 100), persistenceService.getSecurityContext());

    try {
      await client.post(
        ApiRoute.show.targetRaw(
          '127.0.0.1',
          persistenceService.getPort(),
          persistenceService.isHttps(),
          peerProtocolVersion,
        ),
        query: {
          'token': persistenceService.getShowToken(),
        },
        body: HttpBody.json({
          'args': args,
        }),
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
    if (args.contains(startHiddenFlag)) {
      // keep this app hidden
      startHidden = true;
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      startHidden = await isLaunchedAsLoginItem() && await getLaunchAtLoginMinimized();
    }
    
    doWhenWindowReady(() {
      if (startHidden) {
        unawaited(hideToTray());
      } else {
        unawaited(showFromTray());
      }
    });

    if (defaultTargetPlatform == TargetPlatform.macOS) {
      await setupStatusBar();
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
    platformHint: RefenaScope.getPlatformHint(), // help Refena know the correct platform
  );

  // initialize multi-threading
  container.set(parentIsolateProvider.overrideWithNotifier((ref) {
    final settings = ref.read(settingsProvider);
    return IsolateController(
      initialState: ParentIsolateState.initial(
        SyncState(
          init: () async {
            await Rhttp.init();
          },
          rootIsolateToken: RootIsolateToken.instance!,
          httpClientFactory: RhttpWrapper.create,
          securityContext: persistenceService.getSecurityContext(),
          deviceInfo: ref.read(deviceInfoProvider),
          alias: settings.alias,
          port: settings.port,
          networkWhitelist: settings.networkWhitelist,
          networkBlacklist: settings.networkBlacklist,
          protocol: settings.https ? ProtocolType.https : ProtocolType.http,
          multicastGroup: settings.multicastGroup,
          discoveryTimeout: settings.discoveryTimeout,
          serverRunning: true,
          download: false,
        ),
      ),
    );
  }));

  await container.redux(parentIsolateProvider).dispatchAsync(IsolateSetupAction(
        uriContentStreamResolver: AndroidUriContentStreamResolver(),
      ));

  return container;
}

StreamSubscription? _sharedMediaSubscription;

/// Will be called when home page has been initialized
Future<void> postInit(BuildContext context, Ref ref, bool appStart) async {
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

  ref.redux(signalingProvider).dispatch(SetupSignalingConnection());

  if (appStart) {
    if (defaultTargetPlatform == TargetPlatform.macOS) {
      // handle dropped files
      pendingFilesStream.listen((files) async {
        await ref.global.dispatchAsync(_HandleAppStartArgumentsAction(
          args: files,
        ));
      });

      // handle dropped strings
      pendingStringsStream.listen((pendingStrings) {
        for (final string in pendingStrings) {
          ref.redux(selectedSendingFilesProvider).dispatch(AddMessageAction(message: string));
        }
        ref.redux(homePageControllerProvider).dispatch(ChangeTabAction(HomeTab.send));
      });

      await setupMethodCallHandler();
    } else {
      final args = ref.read(appArgumentsProvider);
      await ref.global.dispatchAsync(_HandleAppStartArgumentsAction(
        args: args,
      ));
    }
  }

  bool hasInitialShare = false;

  if (checkPlatformCanReceiveShareIntent()) {
    final shareHandler = ShareHandlerPlatform.instance;

    if (appStart) {
      final initialSharedPayload = await shareHandler.getInitialSharedMedia();
      if (initialSharedPayload != null) {
        hasInitialShare = true;
        // ignore: unawaited_futures
        ref.global.dispatchAsync(_HandleShareIntentAction(
          payload: initialSharedPayload,
        ));
      }
    }

    _sharedMediaSubscription?.cancel(); // ignore: unawaited_futures
    _sharedMediaSubscription = shareHandler.sharedMediaStream.listen((SharedMedia payload) async {
      await ref.global.dispatchAsync(_HandleShareIntentAction(
        payload: payload,
      ));
    });
  }

  if (appStart && !hasInitialShare && (checkPlatformWithGallery() || checkPlatformCanReceiveShareIntent())) {
    // Clear cache on every app start.
    // If we received a share intent, then don't clear it, otherwise the shared file will be lost.
    ref.global.dispatchAsync(ClearCacheAction()); // ignore: unawaited_futures
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

  _HandleShareIntentAction({
    required this.payload,
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

    ref.redux(homePageControllerProvider).dispatch(ChangeTabAction(HomeTab.send));
  }
}

class _HandleAppStartArgumentsAction extends AsyncGlobalAction {
  final List<String> args;

  _HandleAppStartArgumentsAction({
    required this.args,
  });

  @override
  Future<void> reduce() async {
    final filesAdded = await ref.redux(selectedSendingFilesProvider).dispatchAsyncTakeResult(LoadSelectionFromArgsAction(args));
    if (filesAdded) {
      ref.redux(homePageControllerProvider).dispatch(ChangeTabAction(HomeTab.send));
    }
  }
}
