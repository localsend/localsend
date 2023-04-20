import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/send_mode.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/pages/selected_files_page.dart';
import 'package:localsend_app/pages/send_page.dart';
import 'package:localsend_app/pages/troubleshoot_page.dart';
import 'package:localsend_app/pages/web_send_page.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/scan_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/util/native/file_picker.dart';
import 'package:localsend_app/util/native/ios_network_permission_helper.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/widget/big_button.dart';
import 'package:localsend_app/widget/custom_icon_button.dart';
import 'package:localsend_app/widget/dialogs/add_file_dialog.dart';
import 'package:localsend_app/widget/dialogs/address_input_dialog.dart';
import 'package:localsend_app/widget/dialogs/no_files_dialog.dart';
import 'package:localsend_app/widget/dialogs/send_mode_help_dialog.dart';
import 'package:localsend_app/widget/file_thumbnail.dart';
import 'package:localsend_app/widget/list_tile/device_list_tile.dart';
import 'package:localsend_app/widget/list_tile/device_placeholder_list_tile.dart';
import 'package:localsend_app/widget/opacity_slideshow.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:localsend_app/widget/rotating_widget.dart';
import 'package:routerino/routerino.dart';

const _horizontalPadding = 15.0;

class SendTab extends ConsumerStatefulWidget {
  const SendTab({Key? key}) : super(key: key);

  @override
  ConsumerState<SendTab> createState() => _SendTabState();
}

class _SendTabState extends ConsumerState<SendTab> {
  final options = FilePickerOption.getOptionsForPlatform();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Automatically scan the network when visiting the scan tab
      _init();
    });
  }

  void _init() async {
    final devices = ref.read(nearbyDevicesProvider.select((state) => state.devices));
    if (devices.isEmpty) {
      await ref.read(scanProvider).startSmartScan(forceLegacy: false);
      if (devices.isEmpty) {
        // After the first complete scan, if devices aren't found on IOS a Network trigger is called
        if(checkPlatform([TargetPlatform.iOS]) && mounted) {
          checkIosNetworkPermission(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final sendMode = ref.watch(settingsProvider.select((s) => s.sendMode));
    final selectedFiles = ref.watch(selectedSendingFilesProvider);
    final networkInfo = ref.watch(networkStateProvider);
    final nearbyDevicesState = ref.watch(nearbyDevicesProvider);

    return ResponsiveListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 20),
        if (selectedFiles.isEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
            child: Text(
              t.sendTab.selection.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 10),
                ...options.map((option) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: BigButton(
                      icon: option.icon,
                      label: option.label,
                      filled: false,
                      onTap: () async => option.select(
                        context: context,
                        ref: ref,
                      ),
                    ),
                  );
                }),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ] else ...[
          Card(
            margin: const EdgeInsets.only(bottom: 10, left: _horizontalPadding, right: _horizontalPadding),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.sendTab.selection.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(t.sendTab.selection.files(files: selectedFiles.length)),
                  Text(t.sendTab.selection.size(size: selectedFiles.fold(0, (prev, curr) => prev + curr.size).asReadableFileSize)),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...selectedFiles.map((file) {
                          return [
                            CrossFileThumbnail(file),
                            const SizedBox(width: 10),
                          ];
                        }).expand((e) => e),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.onSurface,
                        ),
                        onPressed: () async {
                          await context.push(() => const SelectedFilesPage());
                        },
                        child: Text(t.general.edit),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                        onPressed: () async {
                          if (options.length == 1) {
                            await options.first.select(context: context, ref: ref); // open directly
                            return;
                          }
                          await AddFileDialog.open(
                            context: context,
                            parentRef: ref,
                            options: options,
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: Text(t.general.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
        Row(
          children: [
            const SizedBox(width: _horizontalPadding),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(t.sendTab.nearbyDevices, style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
            const SizedBox(width: 10),
            _ScanButton(
              ips: networkInfo.localIps,
            ),
            Tooltip(
              message: t.dialogs.addressInput.title,
              child: CustomIconButton(
                onPressed: () async {
                  final files = ref.read(selectedSendingFilesProvider);
                  if (files.isEmpty) {
                    await context.pushBottomSheet(() => const NoFilesDialog());
                    return;
                  }
                  final device = await showDialog<Device?>(
                    context: context,
                    builder: (_) => const AddressInputDialog(),
                  );
                  if (device != null && mounted) {
                    await ref.read(sendProvider.notifier).startSession(
                          target: device,
                          files: files,
                          background: false,
                        );
                  }
                },
                child: const Icon(Icons.ads_click),
              ),
            ),
            _SendModeButton(
              onSelect: (mode) async {
                if (mode == SendMode.link) {
                  final files = ref.read(selectedSendingFilesProvider);
                  if (files.isEmpty) {
                    await context.pushBottomSheet(() => const NoFilesDialog());
                    return;
                  }
                  await context.push(() => WebSendPage(files));
                  return;
                }

                await ref.read(settingsProvider.notifier).setSendMode(mode);
                if (mode != SendMode.multiple) {
                  ref.read(sendProvider.notifier).clearAllSessions();
                }
              },
            ),
          ],
        ),
        if (nearbyDevicesState.devices.isEmpty)
          const Padding(
            padding: EdgeInsets.only(bottom: 10, left: _horizontalPadding, right: _horizontalPadding),
            child: Opacity(
              opacity: 0.3,
              child: DevicePlaceholderListTile(),
            ),
          ),
        ...nearbyDevicesState.devices.values.map((device) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, left: _horizontalPadding, right: _horizontalPadding),
            child: Hero(
              tag: 'device-${device.ip}',
              child: sendMode == SendMode.multiple
                  ? _MultiSendDeviceListTile(device: device)
                  : DeviceListTile(
                      device: device,
                      onTap: () async {
                        final files = ref.read(selectedSendingFilesProvider);
                        if (files.isEmpty) {
                          await context.pushBottomSheet(() => const NoFilesDialog());
                          return;
                        }

                        await ref.read(sendProvider.notifier).startSession(
                              target: device,
                              files: files,
                              background: false,
                            );
                      },
                    ),
            ),
          );
        }),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              await context.push(() => const TroubleshootPage());
            },
            child: Text(t.troubleshootPage.title),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
          child: OpacitySlideshow(
            durationMillis: 6000,
            children: [
              Text(t.sendTab.help, style: const TextStyle(color: Colors.grey), textAlign: TextAlign.center),
              if (checkPlatformCanReceiveShareIntent())
                Text(t.sendTab.shareIntentInfo, style: const TextStyle(color: Colors.grey), textAlign: TextAlign.center),
            ],
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}

/// A button that opens a popup menu to select [T].
/// This is used for the scan button and the send mode button.
class _CircularPopupButton<T> extends StatelessWidget {
  final String tooltip;
  final PopupMenuItemBuilder<T> itemBuilder;
  final PopupMenuItemSelected<T>? onSelected;
  final Widget child;

  const _CircularPopupButton({
    required this.tooltip,
    required this.onSelected,
    required this.itemBuilder,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(9999),
      child: Material(
        type: MaterialType.transparency,
        child: DividerTheme(
          data: DividerThemeData(
            color: Theme.of(context).brightness == Brightness.light ? Colors.teal.shade100 : Colors.grey.shade700,
          ),
          child: PopupMenuButton(
            offset: const Offset(0, 40),
            onSelected: onSelected,
            tooltip: tooltip,
            itemBuilder: itemBuilder,
            child: child,
          ),
        ),
      ),
    );
  }
}

/// The scan button that uses [_CircularPopupButton].
class _ScanButton extends ConsumerWidget {
  final List<String> ips;

  const _ScanButton({
    required this.ips,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanningIps = ref.watch(nearbyDevicesProvider.select((s) => s.runningIps));

    if (ips.length <= ScanFacade.maxInterfaces) {
      return RotatingWidget(
        duration: const Duration(seconds: 2),
        spinning: scanningIps.isNotEmpty,
        reverse: true,
        child: CustomIconButton(
          onPressed: () async => ref.read(scanProvider).startSmartScan(forceLegacy: true),
          child: const Icon(Icons.sync),
        ),
      );
    }

    return _CircularPopupButton(
      tooltip: t.sendTab.scan,
      onSelected: (ip) async => ref.read(scanProvider).startLegacySubnetScan([ip]),
      itemBuilder: (_) {
        return [
          ...ips.map(
            (ip) => PopupMenuItem(
              value: ip,
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _RotatingSyncIcon(ip),
                  const SizedBox(width: 10),
                  Text(ip),
                ],
              ),
            ),
          ),
        ];
      },
      child: RotatingWidget(
        duration: const Duration(seconds: 2),
        spinning: scanningIps.isNotEmpty,
        reverse: true,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.sync),
        ),
      ),
    );
  }
}

/// A separate widget, so it gets the latest data from provider.
class _RotatingSyncIcon extends ConsumerWidget {
  final String ip;

  const _RotatingSyncIcon(this.ip);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanningIps = ref.watch(nearbyDevicesProvider.select((s) => s.runningIps));
    return RotatingWidget(
      duration: const Duration(seconds: 2),
      spinning: scanningIps.contains(ip),
      reverse: true,
      child: const Icon(Icons.sync),
    );
  }
}

class _SendModeButton extends StatelessWidget {
  final void Function(SendMode mode) onSelect;

  const _SendModeButton({required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return _CircularPopupButton<int>(
      tooltip: t.sendTab.sendMode,
      onSelected: (mode) async {
        switch (mode) {
          case 0:
            onSelect(SendMode.single);
            break;
          case 1:
            onSelect(SendMode.multiple);
            break;
          case 2:
            onSelect(SendMode.link);
            break;
          case -1:
            await showDialog(context: context, builder: (_) => const SendModeHelpDialog());
            break;
        }
      },
      itemBuilder: (_) => [
        PopupMenuItem(
          value: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final sendMode = ref.watch(settingsProvider.select((s) => s.sendMode));
                  return Visibility(
                    visible: sendMode == SendMode.single,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: const Icon(Icons.check_circle),
                  );
                },
              ),
              const SizedBox(width: 10),
              Text(t.sendTab.sendModes.single),
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final sendMode = ref.watch(settingsProvider.select((s) => s.sendMode));
                  return Visibility(
                    visible: sendMode == SendMode.multiple,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: const Icon(Icons.check_circle),
                  );
                },
              ),
              const SizedBox(width: 10),
              Text(t.sendTab.sendModes.multiple),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Visibility(
                visible: false,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Icon(Icons.check_circle),
              ),
              const SizedBox(width: 10),
              Text(t.sendTab.sendModes.link),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: -1,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.help),
              const SizedBox(width: 10),
              Text(t.sendTab.sendModeHelp),
            ],
          ),
        ),
      ],
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Icon(Icons.settings),
      ),
    );
  }
}

/// An advanced list tile which shows the progress of the file transfer.
class _MultiSendDeviceListTile extends ConsumerWidget {
  final Device device;

  const _MultiSendDeviceListTile({
    required this.device,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sendProvider).values.firstWhereOrNull((s) => s.target.ip == device.ip);
    final double? progress;
    if (session != null) {
      final files = session.files.values.where((f) => f.token != null);
      final progressNotifier = ref.watch(progressProvider);
      final currBytes = files.fold<int>(0, (prev, curr) => prev + ((progressNotifier.getProgress(sessionId: session.sessionId, fileId: curr.file.id) * curr.file.size).round()));
      final totalBytes = files.fold<int>(0, (prev, curr) => prev + curr.file.size);
      progress = totalBytes == 0 ? 0 : currBytes / totalBytes;
    } else {
      progress = null;
    }
    return DeviceListTile(
      device: device,
      info: session?.status.humanString,
      progress: progress,
      onTap: () async {
        if (session != null) {
          if (session.status == SessionStatus.waiting) {
            ref.read(sendProvider.notifier).setBackground(session.sessionId, false);
            await context.push(
              () => SendPage(showAppBar: true, closeSessionOnClose: false, sessionId: session.sessionId),
              transition: RouterinoTransition.fade,
            );
            ref.read(sendProvider.notifier).setBackground(session.sessionId, true);
            return;
          } else if (session.status == SessionStatus.sending || session.status == SessionStatus.finishedWithErrors) {
            ref.read(sendProvider.notifier).setBackground(session.sessionId, false);
            await context.push(() => ProgressPage(showAppBar: true, closeSessionOnClose: false, sessionId: session.sessionId));
            ref.read(sendProvider.notifier).setBackground(session.sessionId, true);
            return;
          }
        }

        final files = ref.read(selectedSendingFilesProvider);
        if (files.isEmpty) {
          // ignore: use_build_context_synchronously
          await context.pushBottomSheet(() => const NoFilesDialog());
          return;
        }

        if (session != null) {
          // close old session
          ref.read(sendProvider.notifier).closeSession(session.sessionId);
        }

        await ref.read(sendProvider.notifier).startSession(
          target: device,
          files: files,
          background: true,
        );
      },
    );
  }
}

extension on SessionStatus {
  String? get humanString {
    switch (this) {
      case SessionStatus.waiting:
        return t.sendPage.waiting;
      case SessionStatus.recipientBusy:
        return t.sendPage.busy;
      case SessionStatus.declined:
        return t.sendPage.rejected;
      case SessionStatus.sending:
        return null;
      case SessionStatus.finished:
        return t.general.finished;
      case SessionStatus.finishedWithErrors:
        return t.progressPage.total.title.finishedError;
      case SessionStatus.canceledBySender:
        return t.progressPage.total.title.canceledSender;
      case SessionStatus.canceledByReceiver:
        return t.progressPage.total.title.canceledReceiver;
    }
  }
}
