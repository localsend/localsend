import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/background_service_provider.dart';
import 'package:localsend_app/widget/custom_list_tile.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// Settings section for background service configuration
class BackgroundSettingsSection extends ConsumerWidget {
  const BackgroundSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundState = ref.watch(backgroundServiceProvider);
    final backgroundNotifier = ref.notifier(backgroundServiceProvider);
    
    // Don't show background settings on unsupported platforms
    if (!backgroundNotifier.isSupported) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            t.settingsTab.background.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        CustomListTile(
          leading: const Icon(Icons.notifications_active),
          title: Text(t.settingsTab.background.enableBackgroundService),
          subtitle: Text(t.settingsTab.background.enableBackgroundServiceDescription),
          trailing: Switch(
            value: backgroundState.isEnabled,
            onChanged: (value) async {
              if (value) {
                await backgroundNotifier.enableBackgroundService();
              } else {
                await backgroundNotifier.disableBackgroundService();
              }
            },
          ),
        ),
        if (backgroundState.isEnabled && backgroundState.pendingTransferCount > 0)
          CustomListTile(
            leading: Icon(
              Icons.file_download,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(t.settingsTab.background.pendingTransfers),
            subtitle: Text(
              t.settingsTab.background.pendingTransfersCount(
                count: backgroundState.pendingTransferCount,
              ),
            ),
            trailing: TextButton(
              onPressed: () => _showPendingTransfersDialog(context, ref),
              child: Text(t.general.view),
            ),
          ),
        CustomListTile(
          leading: const Icon(Icons.info_outline),
          title: Text(t.settingsTab.background.howItWorks),
          subtitle: Text(t.settingsTab.background.howItWorksDescription),
        ),
      ],
    );
  }

  void _showPendingTransfersDialog(BuildContext context, WidgetRef ref) {
    final backgroundState = ref.read(backgroundServiceProvider);
    final backgroundNotifier = ref.notifier(backgroundServiceProvider);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.settingsTab.background.pendingTransfers),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: backgroundState.pendingTransfers.length,
            itemBuilder: (context, index) {
              final transfer = backgroundState.pendingTransfers.values.elementAt(index);
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.file_present),
                  title: Text(transfer.senderName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${transfer.fileNames.length} file(s)'),
                      Text(
                        'Received: ${_formatTime(transfer.receivedAt)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!transfer.isAccepted && !transfer.isRejected) ...[
                        IconButton(
                          icon: const Icon(Icons.check, color: Colors.green),
                          onPressed: () {
                            backgroundNotifier.acceptTransfer(transfer.sessionId);
                            Navigator.of(context).pop();
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            backgroundNotifier.rejectTransfer(transfer.sessionId);
                            Navigator.of(context).pop();
                          },
                        ),
                      ] else if (transfer.isAccepted) ...[
                        const Icon(Icons.check_circle, color: Colors.green),
                      ] else if (transfer.isRejected) ...[
                        const Icon(Icons.cancel, color: Colors.red),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(t.general.close),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}
