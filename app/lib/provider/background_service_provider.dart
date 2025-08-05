import 'package:flutter/foundation.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/util/background_service.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// Provider for managing background service state and operations
final backgroundServiceProvider = NotifierProvider<BackgroundServiceNotifier, BackgroundServiceState>(
  () => BackgroundServiceNotifier(),
);

/// State for background service
class BackgroundServiceState {
  final bool isEnabled;
  final bool isInitialized;
  final bool isListening;
  final Map<String, PendingTransfer> pendingTransfers;

  const BackgroundServiceState({
    this.isEnabled = false,
    this.isInitialized = false,
    this.isListening = false,
    this.pendingTransfers = const {},
  });

  BackgroundServiceState copyWith({
    bool? isEnabled,
    bool? isInitialized,
    bool? isListening,
    Map<String, PendingTransfer>? pendingTransfers,
  }) {
    return BackgroundServiceState(
      isEnabled: isEnabled ?? this.isEnabled,
      isInitialized: isInitialized ?? this.isInitialized,
      isListening: isListening ?? this.isListening,
      pendingTransfers: pendingTransfers ?? this.pendingTransfers,
    );
  }
}

/// Represents a pending file transfer from background service
class PendingTransfer {
  final String sessionId;
  final String senderName;
  final Device senderDevice;
  final List<String> fileNames;
  final DateTime receivedAt;
  final bool isAccepted;
  final bool isRejected;

  const PendingTransfer({
    required this.sessionId,
    required this.senderName,
    required this.senderDevice,
    required this.fileNames,
    required this.receivedAt,
    this.isAccepted = false,
    this.isRejected = false,
  });

  PendingTransfer copyWith({
    bool? isAccepted,
    bool? isRejected,
  }) {
    return PendingTransfer(
      sessionId: sessionId,
      senderName: senderName,
      senderDevice: senderDevice,
      fileNames: fileNames,
      receivedAt: receivedAt,
      isAccepted: isAccepted ?? this.isAccepted,
      isRejected: isRejected ?? this.isRejected,
    );
  }
}

/// Notifier for background service operations
class BackgroundServiceNotifier extends Notifier<BackgroundServiceState> {
  @override
  BackgroundServiceState init() => const BackgroundServiceState();

  /// Initialize the background service
  Future<void> initialize() async {
    try {
      await BackgroundService.initialize();
      state = state.copyWith(isInitialized: true);
      
      // Auto-enable background service if not explicitly disabled
      if (!state.isEnabled) {
        await enableBackgroundService();
      }
    } catch (e) {
      print('Failed to initialize background service: $e');
    }
  }

  /// Enable background service
  Future<void> enableBackgroundService() async {
    if (!state.isInitialized) {
      await initialize();
    }

    try {
      await BackgroundService.startBackgroundListening();
      state = state.copyWith(
        isEnabled: true,
        isListening: true,
      );
    } catch (e) {
      print('Failed to enable background service: $e');
    }
  }

  /// Disable background service
  Future<void> disableBackgroundService() async {
    try {
      await BackgroundService.stopBackgroundListening();
      state = state.copyWith(
        isEnabled: false,
        isListening: false,
      );
    } catch (e) {
      print('Failed to disable background service: $e');
    }
  }

  /// Handle incoming transfer request from background
  void handleIncomingTransfer({
    required String sessionId,
    required String senderName,
    required Device senderDevice,
    required List<String> fileNames,
  }) {
    final transfer = PendingTransfer(
      sessionId: sessionId,
      senderName: senderName,
      senderDevice: senderDevice,
      fileNames: fileNames,
      receivedAt: DateTime.now(),
    );

    final updatedTransfers = Map<String, PendingTransfer>.from(state.pendingTransfers);
    updatedTransfers[sessionId] = transfer;

    state = state.copyWith(pendingTransfers: updatedTransfers);

    // Show notification
    BackgroundService.showTransferNotification(
      senderName: senderName,
      fileName: fileNames.isNotEmpty ? fileNames.first : 'Unknown file',
      sessionId: sessionId,
      fileNames: fileNames,
    );
  }

  /// Accept a pending transfer
  Future<void> acceptTransfer(String sessionId) async {
    final transfer = state.pendingTransfers[sessionId];
    if (transfer == null) return;

    final updatedTransfers = Map<String, PendingTransfer>.from(state.pendingTransfers);
    updatedTransfers[sessionId] = transfer.copyWith(isAccepted: true);

    state = state.copyWith(pendingTransfers: updatedTransfers);

    // TODO: Integrate with existing server provider to actually accept the transfer
    print('Accepting transfer: $sessionId');
  }

  /// Reject a pending transfer
  Future<void> rejectTransfer(String sessionId) async {
    final transfer = state.pendingTransfers[sessionId];
    if (transfer == null) return;

    final updatedTransfers = Map<String, PendingTransfer>.from(state.pendingTransfers);
    updatedTransfers[sessionId] = transfer.copyWith(isRejected: true);

    state = state.copyWith(pendingTransfers: updatedTransfers);

    // TODO: Integrate with existing server provider to reject the transfer
    print('Rejecting transfer: $sessionId');
    
    // Remove from pending transfers after rejecting
    updatedTransfers.remove(sessionId);
    state = state.copyWith(pendingTransfers: updatedTransfers);
  }

  /// Clear old pending transfers (older than 5 minutes)
  void clearOldTransfers() {
    final now = DateTime.now();
    final updatedTransfers = Map<String, PendingTransfer>.from(state.pendingTransfers);
    
    updatedTransfers.removeWhere((key, transfer) {
      return now.difference(transfer.receivedAt).inMinutes > 5;
    });

    if (updatedTransfers.length != state.pendingTransfers.length) {
      state = state.copyWith(pendingTransfers: updatedTransfers);
    }
  }

  /// Get count of pending transfers
  int get pendingTransferCount => state.pendingTransfers.length;

  /// Check if background service is supported on current platform
  bool get isSupported => !kIsWeb && (
    defaultTargetPlatform == TargetPlatform.android ||
    defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.windows ||
    defaultTargetPlatform == TargetPlatform.linux ||
    defaultTargetPlatform == TargetPlatform.macOS
  );
}
