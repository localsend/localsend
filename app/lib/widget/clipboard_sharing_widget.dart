import 'package:flutter/material.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:common/model/clipboard_data.dart' as clipboard_model;
import 'package:common/model/device.dart';
import 'package:localsend_app/provider/clipboard_provider.dart';
import 'package:localsend_app/provider/network/clipboard_network_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:uuid/uuid.dart';

class ClipboardSharingWidget extends StatefulWidget {
  const ClipboardSharingWidget({super.key});

  @override
  State<ClipboardSharingWidget> createState() => _ClipboardSharingWidgetState();
}

class _ClipboardSharingWidgetState extends State<ClipboardSharingWidget> with Refena {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clipboardState = ref.watch(clipboardProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.content_copy, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  t.clipboard.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    clipboardState.isListening ? Icons.pause : Icons.play_arrow,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    if (clipboardState.isListening) {
                      ref.redux(clipboardProvider).dispatch(SetListeningAction(false));
                    } else {
                      ref.redux(clipboardProvider).dispatch(SetListeningAction(true));
                    }
                  },
                  tooltip: clipboardState.isListening ? t.clipboard.stopListening : t.clipboard.startListening,
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Current clipboard display
            if (clipboardState.currentClipboard != null) ...[
              Text(
                t.clipboard.currentContent,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clipboardState.currentClipboard!.displayName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      clipboardState.currentClipboard!.sizeFormatted,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    if (clipboardState.currentClipboard!.text != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        clipboardState.currentClipboard!.text!,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Manual text input
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: t.clipboard.enterText,
                hintText: t.clipboard.enterTextHint,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendText,
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _readClipboard,
                    icon: const Icon(Icons.content_paste),
                    label: Text(t.clipboard.readClipboard),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _readClipboardImage,
                    icon: const Icon(Icons.image),
                    label: Text(t.clipboard.readImage),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _clearHistory,
                    icon: const Icon(Icons.clear_all),
                    label: Text(t.clipboard.clearHistory),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: clipboardState.currentClipboard != null ? _sendCurrentClipboard : null,
                    icon: const Icon(Icons.send),
                    label: Text(t.clipboard.sendClipboard),
                  ),
                ),
              ],
            ),

            // Clipboard history
            if (clipboardState.clipboardHistory.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                t.clipboard.history,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: clipboardState.clipboardHistory.length,
                  itemBuilder: (context, index) {
                    final item = clipboardState.clipboardHistory[index];
                    return ListTile(
                      leading: Icon(_getIconForType(item.type)),
                      title: Text(
                        item.displayName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        '${item.sizeFormatted} • ${_formatTimestamp(item.timestamp)}',
                      ),
                      trailing: PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'send',
                            child: ListTile(
                              leading: const Icon(Icons.send),
                              title: Text(t.clipboard.send),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                          PopupMenuItem(
                            value: 'copy',
                            child: ListTile(
                              leading: const Icon(Icons.copy),
                              title: Text(t.clipboard.copy),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                        onSelected: (value) {
                          switch (value) {
                            case 'send':
                              _sendClipboard(item);
                              break;
                            case 'copy':
                              _copyClipboard(item);
                              break;
                          }
                        },
                      ),
                      onTap: () => _copyClipboard(item),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getIconForType(clipboard_model.ClipboardDataType type) {
    switch (type) {
      case clipboard_model.ClipboardDataType.text:
        return Icons.text_fields;
      case clipboard_model.ClipboardDataType.image:
        return Icons.image;
      case clipboard_model.ClipboardDataType.html:
        return Icons.code;
      case clipboard_model.ClipboardDataType.url:
        return Icons.link;
      case clipboard_model.ClipboardDataType.files:
        return Icons.folder;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    
    if (difference.inMinutes < 1) {
      return t.clipboard.justNow;
    } else if (difference.inHours < 1) {
      return t.clipboard.minutesAgo(count: difference.inMinutes);
    } else if (difference.inDays < 1) {
      return t.clipboard.hoursAgo(count: difference.inHours);
    } else {
      return t.clipboard.daysAgo(count: difference.inDays);
    }
  }

  void _sendText() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      final data = clipboard_model.ClipboardData.text(
        id: const Uuid().v4(),
        text: text,
      );
      ref.redux(clipboardProvider).dispatch(SetCurrentClipboardAction(data));
      ref.redux(clipboardProvider).dispatch(AddToHistoryAction(data));
      _textController.clear();
    }
  }

  void _readClipboard() {
    ref.redux(clipboardProvider).dispatchAsync(ReadClipboardAction());
  }

  void _readClipboardImage() {
    ref.redux(clipboardProvider).dispatchAsync(ReadClipboardImageAction());
  }

  void _clearHistory() {
    ref.redux(clipboardProvider).dispatch(ClearHistoryAction());
  }

  void _sendCurrentClipboard() {
    final current = ref.read(clipboardProvider).currentClipboard;
    if (current != null) {
      _sendClipboard(current);
    }
  }

  void _sendClipboard(clipboard_model.ClipboardData data) {
    final nearbyDevices = ref.read(nearbyDevicesProvider).devices;
    
    if (nearbyDevices.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t.clipboard.noDevices),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    // Show device selection dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.clipboard.selectDevice),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: nearbyDevices.length,
            itemBuilder: (context, index) {
              final device = nearbyDevices.values.elementAt(index);
              return ListTile(
                leading: Icon(Icons.device_hub),
                title: Text(device.alias),
                subtitle: Text('${device.ip ?? 'Unknown'}:${device.port}'),
                onTap: () {
                  Navigator.of(context).pop();
                  _sendToDevice(data, device);
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(t.general.cancel),
          ),
        ],
      ),
    );
  }

  void _sendToDevice(clipboard_model.ClipboardData data, Device device) async {
    try {
      await ref.notifier(clipboardNetworkProvider).sendClipboard(data, device);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.clipboard.sentTo(device: device.alias)),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.clipboard.sendError(error: e.toString())),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  void _copyClipboard(clipboard_model.ClipboardData data) {
    ref.redux(clipboardProvider).dispatchAsync(SetClipboardAction(data));
  }
}

// Additional actions for the clipboard provider
class ReadClipboardAction extends AsyncReduxAction<ClipboardNotifier, ClipboardState> {
  @override
  Future<ClipboardState> reduce() async {
    await notifier.readClipboard();
    return state;
  }
}

class ReadClipboardImageAction extends AsyncReduxAction<ClipboardNotifier, ClipboardState> {
  @override
  Future<ClipboardState> reduce() async {
    await notifier.readClipboardImage();
    return state;
  }
}

class SetClipboardAction extends AsyncReduxAction<ClipboardNotifier, ClipboardState> {
  final clipboard_model.ClipboardData data;

  SetClipboardAction(this.data);

  @override
  Future<ClipboardState> reduce() async {
    await notifier.setClipboard(data);
    return state;
  }
}
