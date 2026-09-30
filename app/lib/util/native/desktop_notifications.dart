import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

final _logger = Logger('DesktopNotifications');

({String sessionId, String? action})? decodeDesktopRequestAction({required String? payload, required String? actionId}) {
  if (actionId != null && (actionId.startsWith('accept:') || actionId.startsWith('decline:'))) {
    final separator = actionId.indexOf(':');
    final sessionId = actionId.substring(separator + 1);
    if (sessionId.isEmpty) return null;
    return (sessionId: sessionId, action: actionId.substring(0, separator));
  }
  if (payload == null || payload.isEmpty) return null;
  return (sessionId: payload, action: actionId == 'accept' || actionId == 'decline' ? actionId : null);
}

class DesktopNotifications {
  DesktopNotifications._();

  static const _requestNotificationId = 53317;
  static const _requestCategory = 'incoming-transfer';
  static const _accept = 'accept';
  static const _decline = 'decline';

  static final _plugin = FlutterLocalNotificationsPlugin();
  static const _macPanelChannel = MethodChannel('main-delegate-channel');
  static bool _ready = false;
  static String? _activeRequestSessionId;
  static File? _activePreviewFile;
  static Future<void> Function(String sessionId, String? action)? onRequestAction;
  static Future<void> Function(String entryId)? onCompletedFile;

  static Future<void> init() async {
    if (!checkPlatformIsDesktop()) return;
    try {
      _ready =
          await _plugin.initialize(
            settings: InitializationSettings(
              macOS: DarwinInitializationSettings(
                notificationCategories: [
                  DarwinNotificationCategory(
                    _requestCategory,
                    actions: [
                      DarwinNotificationAction.plain(_accept, t.general.accept),
                      DarwinNotificationAction.plain(
                        _decline,
                        t.general.decline,
                        options: {DarwinNotificationActionOption.destructive},
                      ),
                    ],
                  ),
                ],
              ),
              linux: LinuxInitializationSettings(defaultActionName: t.tray.open),
              windows: const WindowsInitializationSettings(
                appName: 'LocalSend',
                appUserModelId: 'org.localsend.localsend_app',
                guid: 'bd662d16-444b-4db1-b597-c521ef35cad9',
              ),
            ),
            onDidReceiveNotificationResponse: (response) async {
              final payload = response.payload;
              if (payload != null && payload.startsWith('file:')) {
                await onCompletedFile?.call(payload.substring(5));
                return;
              }
              final request = decodeDesktopRequestAction(payload: response.payload, actionId: response.actionId);
              if (request != null) await onRequestAction?.call(request.sessionId, request.action);
            },
          ) ??
          false;
    } catch (e) {
      _logger.warning('Could not initialize desktop notifications', e);
    }
  }

  static Future<bool> showIncomingRequest({
    required String sessionId,
    required String sender,
    required int fileCount,
    required bool isMessage,
    String? previewName,
    String? previewType,
    Uint8List? previewBytes,
  }) async {
    _activeRequestSessionId = sessionId;
    final displaySender = sender.trim().isEmpty ? t.general.unknown : sender.trim();
    if (defaultTargetPlatform == TargetPlatform.macOS) {
      try {
        final shown = await _macPanelChannel.invokeMethod<bool>('showIncomingTransferPanel', {
          'sessionId': sessionId,
          'sender': displaySender,
          'detail': isMessage ? t.receivePage.subTitleMessage : t.receivePage.subTitle(n: fileCount),
          'fileCount': fileCount,
          'previewName': previewName ?? '',
          'previewType': previewType ?? 'other',
          'previewBytes': previewBytes,
          'accept': t.general.accept,
          'decline': t.general.decline,
        });
        if (shown == true) return true;
      } catch (e) {
        _logger.warning('Could not show incoming transfer panel', e);
      }
    }

    if (!_ready) return false;
    try {
      if (defaultTargetPlatform == TargetPlatform.macOS) {
        final permissions = await _plugin.resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()?.checkPermissions();
        if (permissions?.isAlertEnabled != true) return false;
      }
      File? previewFile;
      if (previewBytes != null && previewBytes.length <= 64 * 1024) {
        try {
          final directory = await getTemporaryDirectory();
          previewFile = await File('${directory.path}/localsend-incoming-${sessionId.hashCode}.png').writeAsBytes(previewBytes, flush: true);
          _activePreviewFile = previewFile;
        } catch (e) {
          _logger.warning('Could not prepare incoming preview', e);
        }
      }
      await _plugin.show(
        id: _requestNotificationId,
        title: displaySender,
        body: isMessage ? t.receivePage.subTitleMessage : t.receivePage.subTitle(n: fileCount),
        payload: sessionId,
        notificationDetails: NotificationDetails(
          macOS: const DarwinNotificationDetails(categoryIdentifier: _requestCategory),
          linux: LinuxNotificationDetails(
            defaultActionName: t.tray.open,
            icon: previewFile == null ? null : FilePathLinuxIcon(previewFile.path),
            actions: [
              LinuxNotificationAction(key: _accept, label: t.general.accept),
              LinuxNotificationAction(key: _decline, label: t.general.decline),
            ],
          ),
          windows: WindowsNotificationDetails(
            images: previewFile == null
                ? const []
                : [WindowsImage(Uri.file(previewFile.path, windows: true), altText: previewName ?? displaySender, placement: WindowsImagePlacement.appLogoOverride)],
            actions: [
              WindowsAction(content: t.general.accept, arguments: '$_accept:$sessionId'),
              WindowsAction(content: t.general.decline, arguments: '$_decline:$sessionId'),
            ],
          ),
        ),
      );
      return true;
    } catch (e) {
      _logger.warning('Could not show incoming request', e);
      return false;
    }
  }

  static void dismissIncomingRequest({String? sessionId}) {
    if (sessionId != null && sessionId != _activeRequestSessionId) return;
    _activeRequestSessionId = null;
    final previewFile = _activePreviewFile;
    _activePreviewFile = null;
    if (previewFile != null) {
      unawaited(previewFile.delete().catchError((Object e) {
        _logger.warning('Could not remove incoming preview', e);
        return previewFile;
      }));
    }
    if (defaultTargetPlatform == TargetPlatform.macOS) {
      unawaited(
        _macPanelChannel.invokeMethod<void>('hideIncomingTransferPanel', sessionId).catchError((Object e) {
          _logger.warning('Could not hide incoming transfer panel', e);
        }),
      );
    }
    if (!_ready) return;
    unawaited(
      _plugin.cancel(id: _requestNotificationId).catchError((Object e) {
        _logger.warning('Could not dismiss incoming request', e);
      }),
    );
  }

  static Future<void> showCompletedFile({required String entryId, required String fileName, required String sender}) async {
    if (!_ready) return;
    try {
      await _plugin.show(
        id: entryId.hashCode & 0x7fffffff,
        title: fileName,
        body: sender,
        payload: 'file:$entryId',
        notificationDetails: const NotificationDetails(
          macOS: DarwinNotificationDetails(),
          linux: LinuxNotificationDetails(),
          windows: WindowsNotificationDetails(),
        ),
      );
    } catch (e) {
      _logger.warning('Could not show completed file', e);
    }
  }
}
