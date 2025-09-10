import 'package:flutter/services.dart' as services;
import 'package:refena_flutter/refena_flutter.dart';
import 'package:common/model/clipboard_data.dart' as clipboard_model;
import 'package:uuid/uuid.dart';

final _uuid = Uuid();

/// Provider for managing clipboard operations
final clipboardProvider = ReduxProvider<ClipboardNotifier, ClipboardState>((ref) {
  return ClipboardNotifier();
});

class ClipboardState {
  final List<clipboard_model.ClipboardData> clipboardHistory;
  final clipboard_model.ClipboardData? currentClipboard;
  final bool isListening;

  const ClipboardState({
    this.clipboardHistory = const [],
    this.currentClipboard,
    this.isListening = false,
  });

  ClipboardState copyWith({
    List<clipboard_model.ClipboardData>? clipboardHistory,
    clipboard_model.ClipboardData? currentClipboard,
    bool? isListening,
  }) {
    return ClipboardState(
      clipboardHistory: clipboardHistory ?? this.clipboardHistory,
      currentClipboard: currentClipboard ?? this.currentClipboard,
      isListening: isListening ?? this.isListening,
    );
  }
}

class ClipboardNotifier extends ReduxNotifier<ClipboardState> {
  @override
  ClipboardState init() => const ClipboardState();

  /// Read clipboard content from the system
  Future<void> readClipboard() async {
    try {
      final clipboardData = await services.Clipboard.getData(services.Clipboard.kTextPlain);
      if (clipboardData?.text != null && clipboardData!.text!.isNotEmpty) {
        final data = clipboard_model.ClipboardData.text(
          id: _uuid.v4(),
          text: clipboardData.text ?? '',
        );
        
        dispatch(SetCurrentClipboardAction(data));
        dispatch(AddToHistoryAction(data));
      }
    } catch (e) {
      // Handle clipboard read error
      print('Error reading clipboard: $e');
    }
  }

  /// Read image from clipboard
  Future<void> readClipboardImage() async {
    try {
      final clipboardData = await services.Clipboard.getData(services.Clipboard.kTextPlain);
      // This is a simplified implementation
      // In a real app, you'd need platform-specific code to read image data
      if (clipboardData?.text != null) {
        // For now, we'll treat any clipboard content as text
        // In a real implementation, you'd check for image data
        final data = clipboard_model.ClipboardData.text(
          id: _uuid.v4(),
          text: clipboardData!.text!,
        );
        
        dispatch(SetCurrentClipboardAction(data));
        dispatch(AddToHistoryAction(data));
      }
    } catch (e) {
      print('Error reading clipboard image: $e');
    }
  }

  /// Set clipboard content to the system
  Future<void> setClipboard(clipboard_model.ClipboardData data) async {
    try {
      switch (data.type) {
        case clipboard_model.ClipboardDataType.text:
          await services.Clipboard.setData(services.ClipboardData(text: data.text ?? ''));
          break;
        case clipboard_model.ClipboardDataType.html:
          await services.Clipboard.setData(services.ClipboardData(text: data.html ?? ''));
          break;
        case clipboard_model.ClipboardDataType.url:
          await services.Clipboard.setData(services.ClipboardData(text: data.url ?? ''));
          break;
        case clipboard_model.ClipboardDataType.image:
          // Platform-specific implementation needed for images
          // For now, we'll set as text
          if (data.text != null) {
            await services.Clipboard.setData(services.ClipboardData(text: data.text!));
          }
          break;
        case clipboard_model.ClipboardDataType.files:
          // Platform-specific implementation needed for files
          // For now, we'll set as text
          if (data.filePaths != null) {
            await services.Clipboard.setData(services.ClipboardData(text: data.filePaths!.join('\n')));
          }
          break;
      }
      
      dispatch(SetCurrentClipboardAction(data));
      dispatch(AddToHistoryAction(data));
    } catch (e) {
      print('Error setting clipboard: $e');
    }
  }

  /// Start listening for clipboard changes
  void startListening() {
    dispatch(SetListeningAction(true));
    // In a real implementation, you'd set up a timer or listener
    // to periodically check for clipboard changes
  }

  /// Stop listening for clipboard changes
  void stopListening() {
    dispatch(SetListeningAction(false));
  }

  /// Clear clipboard history
  void clearHistory() {
    dispatch(ClearHistoryAction());
  }

  /// Send clipboard data to a remote device
  Future<void> sendClipboard(clipboard_model.ClipboardData data, String deviceId) async {
    // This would integrate with the network layer
    // For now, we'll just add to history
    dispatch(AddToHistoryAction(data));
  }

  /// Receive clipboard data from a remote device
  Future<void> receiveClipboard(clipboard_model.ClipboardData data) async {
    dispatch(SetCurrentClipboardAction(data));
    dispatch(AddToHistoryAction(data));
    
    // Automatically set to system clipboard
    await setClipboard(data);
  }
}

/// Action to set the current clipboard data
class SetCurrentClipboardAction extends ReduxAction<ClipboardNotifier, ClipboardState> {
  final clipboard_model.ClipboardData data;

  SetCurrentClipboardAction(this.data);

  @override
  ClipboardState reduce() {
    return state.copyWith(currentClipboard: data);
  }
}

/// Action to add clipboard data to history
class AddToHistoryAction extends ReduxAction<ClipboardNotifier, ClipboardState> {
  final clipboard_model.ClipboardData data;

  AddToHistoryAction(this.data);

  @override
  ClipboardState reduce() {
    final newHistory = List<clipboard_model.ClipboardData>.from(state.clipboardHistory);
    newHistory.insert(0, data); // Add to beginning
    
    // Keep only last 50 items
    if (newHistory.length > 50) {
      newHistory.removeRange(50, newHistory.length);
    }
    
    return state.copyWith(clipboardHistory: newHistory);
  }
}

/// Action to set listening state
class SetListeningAction extends ReduxAction<ClipboardNotifier, ClipboardState> {
  final bool isListening;

  SetListeningAction(this.isListening);

  @override
  ClipboardState reduce() {
    return state.copyWith(isListening: isListening);
  }
}

/// Action to clear clipboard history
class ClearHistoryAction extends ReduxAction<ClipboardNotifier, ClipboardState> {
  @override
  ClipboardState reduce() {
    return state.copyWith(clipboardHistory: []);
  }
}
