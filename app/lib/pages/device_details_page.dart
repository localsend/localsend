import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/pages/verify_page.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/util/favorites.dart';
import 'package:localsend_app/widget/big_button.dart';
import 'package:localsend_app/widget/dialogs/favorite_delete_dialog.dart';
import 'package:localsend_app/widget/dialogs/favorite_edit_dialog.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

final _timeFormat = DateFormat.jm(LocaleSettings.currentLocale.languageTag);

/// Shows the general information of a discovered device and
/// the log of its retained discovery confirmations.
class DeviceDetailsPage extends StatefulWidget {
  final Device device;

  const DeviceDetailsPage({required this.device});

  @override
  State<DeviceDetailsPage> createState() => _DeviceDetailsPageState();
}

class _DeviceDetailsPageState extends State<DeviceDetailsPage> with Refena {
  List<DeviceLog> _logs = const [];

  @override
  void initState() {
    super.initState();

    ensureRef((ref) async {
      final logs = await ref
          .redux(parentIsolateProvider)
          .dispatchAsyncTakeResult(IsolateDiscoveryDeviceLogsAction(fingerprint: widget.device.fingerprint));
      if (mounted) {
        setState(() => _logs = logs);
      }
    });
  }

  Future<void> _toggleFavorite(FavoriteDevice? favoriteEntry) async {
    if (favoriteEntry != null) {
      final result = await showDialog<bool>(
        context: context,
        builder: (_) => FavoriteDeleteDialog(favoriteEntry),
      );
      if (result == true) {
        await ref.redux(favoritesProvider).dispatchAsync(RemoveFavoriteAction(deviceFingerprint: widget.device.fingerprint));
      }
    } else {
      await showDialog(
        context: context,
        builder: (_) => FavoriteEditDialog(prefilledDevice: widget.device),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final device = widget.device;
    final favoriteEntry = ref.watch(favoritesProvider).findDevice(device);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.deviceDetailsPage.title),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigButton(
                icon: favoriteEntry != null ? Icons.favorite : Icons.favorite_border,
                label: t.deviceDetailsPage.favorite,
                filled: favoriteEntry != null,
                width: 120,
                onTap: () async => await _toggleFavorite(favoriteEntry),
              ),
              const SizedBox(width: 20),
              BigButton(
                icon: Icons.verified_user,
                label: t.deviceDetailsPage.verify,
                filled: false,
                width: 120,
                onTap: () async => await context.push(
                  () => VerifyPage(
                    fingerprint: CombinedFingerprint.load(context, device.fingerprint),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            children: [
              for (final entry in {
                t.deviceDetailsPage.info.name: device.alias,
                t.deviceDetailsPage.info.version: t.deviceDetailsPage.info.protocol(version: device.version),
                if (device.ip != null) t.deviceDetailsPage.info.address: '${device.ip}:${device.port}',
              }.entries)
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15, bottom: 5),
                      child: Text(entry.key, style: const TextStyle(color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SelectableText(entry.value),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 20),
          Text(t.deviceDetailsPage.logs.title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          if (_logs.isEmpty)
            Text(t.deviceDetailsPage.logs.empty, style: const TextStyle(color: Colors.grey))
          else
            ..._logs.map(
              (log) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('[${_timeFormat.format(log.timestamp)}]'),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(log.description),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

extension on DeviceLog {
  String get description {
    final protocol = channel.https ? 'HTTPS' : 'HTTP';
    return switch (kind) {
      DeviceLogKind.discovered => t.deviceDetailsPage.logs.discovered(protocol: protocol, host: channel.host),
      DeviceLogKind.updated => t.deviceDetailsPage.logs.updated(protocol: protocol, host: channel.host),
    };
  }
}
