import 'dart:convert';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:workmanager/workmanager.dart';
import 'package:localsend_app/gen/strings.g.dart';

class BackgroundService {
  static const String _taskName = 'localsend_background_task';
  static const String _channelId = 'localsend_file_transfer';
  static const String _channelName = 'File Transfer Notifications';
  static const String _channelDescription = 'Notifications for incoming file transfers';
  
  static FlutterLocalNotificationsPlugin? _notificationsPlugin;
  
  /// Initialize the background service
  static Future<void> initialize() async {
    if (!kIsWeb) {
      await _initializeNotifications();
      await _initializeWorkManager();
    }
  }
  
  /// Initialize local notifications
  static Future<void> _initializeNotifications() async {
    _notificationsPlugin = FlutterLocalNotificationsPlugin();
    
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const linuxSettings = LinuxInitializationSettings(
      defaultActionName: 'Open LocalSend',
    );
    const windowsSettings = WindowsInitializationSettings(
      appName: 'LocalSend',
      appUserModelId: 'org.localsend.localsend_app',
    );
    
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
      linux: linuxSettings,
      windows: windowsSettings,
    );
    
    await _notificationsPlugin!.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: _onBackgroundNotificationResponse,
    );
    
    // Create notification channel for Android
    if (defaultTargetPlatform == TargetPlatform.android) {
      await _createNotificationChannel();
    }
  }
  
  /// Create notification channel for Android
  static Future<void> _createNotificationChannel() async {
    const channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.high,
      sound: RawResourceAndroidNotificationSound('notification_sound'),
    );
    
    final androidPlugin = _notificationsPlugin!.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.createNotificationChannel(channel);
  }
  
  /// Initialize WorkManager for background tasks
  static Future<void> _initializeWorkManager() async {
    if (defaultTargetPlatform == TargetPlatform.android || 
        defaultTargetPlatform == TargetPlatform.iOS) {
      await Workmanager().initialize(
        _callbackDispatcher,
        isInDebugMode: kDebugMode,
      );
    }
  }
  
  /// Start background service to listen for incoming transfers
  static Future<void> startBackgroundListening() async {
    if (defaultTargetPlatform == TargetPlatform.android || 
        defaultTargetPlatform == TargetPlatform.iOS) {
      await Workmanager().registerPeriodicTask(
        'localsend_listener',
        _taskName,
        frequency: const Duration(minutes: 15), // Android minimum
        constraints: Constraints(
          networkType: NetworkType.connected,
        ),
        inputData: {
          'action': 'listen_for_transfers',
        },
      );
    }
  }
  
  /// Stop background service
  static Future<void> stopBackgroundListening() async {
    if (defaultTargetPlatform == TargetPlatform.android || 
        defaultTargetPlatform == TargetPlatform.iOS) {
      await Workmanager().cancelByUniqueName('localsend_listener');
    }
  }
  
  /// Show notification for incoming file transfer
  static Future<void> showTransferNotification({
    required String senderName,
    required String fileName,
    required String sessionId,
    required List<String> fileNames,
  }) async {
    if (_notificationsPlugin == null) return;
    
    final fileCountText = fileNames.length == 1 
        ? fileName 
        : '${fileNames.length} files';
    
    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.high,
      priority: Priority.high,
      category: AndroidNotificationCategory.message,
      actions: [
        AndroidNotificationAction(
          'accept',
          'Accept',
          icon: DrawableResourceAndroidBitmap('ic_check'),
          contextual: true,
        ),
        AndroidNotificationAction(
          'reject',
          'Reject',
          icon: DrawableResourceAndroidBitmap('ic_close'),
          contextual: true,
        ),
      ],
    );
    
    const iosDetails = DarwinNotificationDetails(
      categoryIdentifier: 'file_transfer',
      interruptionLevel: InterruptionLevel.timeSensitive,
    );
    
    const linuxDetails = LinuxNotificationDetails(
      actions: [
        LinuxNotificationAction(key: 'accept', label: 'Accept'),
        LinuxNotificationAction(key: 'reject', label: 'Reject'),
      ],
    );
    
    const windowsDetails = WindowsNotificationDetails(
      actions: [
        WindowsNotificationAction(
          activationType: WindowsNotificationActivationType.foreground,
          content: 'Accept',
          arguments: 'accept',
        ),
        WindowsNotificationAction(
          activationType: WindowsNotificationActivationType.foreground,
          content: 'Reject',
          arguments: 'reject',
        ),
      ],
    );
    
    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
      linux: linuxDetails,
      windows: windowsDetails,
    );
    
    await _notificationsPlugin!.show(
      sessionId.hashCode,
      'Incoming file transfer',
      '$senderName wants to send you $fileCountText',
      notificationDetails,
      payload: jsonEncode({
        'action': 'file_transfer',
        'sessionId': sessionId,
        'senderName': senderName,
        'files': fileNames,
      }),
    );
  }
  
  /// Handle notification tap
  static void _onNotificationResponse(NotificationResponse response) {
    _handleNotificationAction(response.actionId, response.payload);
  }
  
  /// Handle background notification tap
  @pragma('vm:entry-point')
  static void _onBackgroundNotificationResponse(NotificationResponse response) {
    _handleNotificationAction(response.actionId, response.payload);
  }
  
  /// Handle notification action
  static void _handleNotificationAction(String? actionId, String? payload) {
    if (payload == null) return;
    
    try {
      final data = jsonDecode(payload) as Map<String, dynamic>;
      final sessionId = data['sessionId'] as String;
      
      if (actionId == 'accept') {
        _handleAcceptTransfer(sessionId, data);
      } else if (actionId == 'reject') {
        _handleRejectTransfer(sessionId, data);
      } else {
        // Notification tapped, open app
        _openApp();
      }
    } catch (e) {
      print('Error handling notification action: $e');
    }
  }
  
  /// Handle accept transfer action
  static void _handleAcceptTransfer(String sessionId, Map<String, dynamic> data) {
    // TODO: Integrate with existing ServerProvider to accept transfer
    print('Accepting transfer: $sessionId');
    _openApp();
  }
  
  /// Handle reject transfer action
  static void _handleRejectTransfer(String sessionId, Map<String, dynamic> data) {
    // TODO: Integrate with existing ServerProvider to reject transfer
    print('Rejecting transfer: $sessionId');
  }
  
  /// Open the main app
  static void _openApp() {
    // TODO: Use app launcher or platform channel to open app
    print('Opening LocalSend app');
  }
}

/// Background task callback dispatcher
@pragma('vm:entry-point')
void _callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      switch (inputData?['action']) {
        case 'listen_for_transfers':
          await _backgroundListenForTransfers();
          break;
        default:
          print('Unknown background task: $task');
      }
      return Future.value(true);
    } catch (e) {
      print('Background task error: $e');
      return Future.value(false);
    }
  });
}

/// Background function to listen for incoming transfers
Future<void> _backgroundListenForTransfers() async {
  // TODO: Implement minimal server listening logic
  // This should check for incoming transfer requests and show notifications
  print('Background: Listening for transfers...');
}
