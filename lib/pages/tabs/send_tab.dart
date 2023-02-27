import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/pages/selected_files_page.dart';
import 'package:localsend_app/pages/troubleshoot_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/scan_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/util/file_picker.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:localsend_app/widget/custom_icon_button.dart';
import 'package:localsend_app/widget/opacity_slideshow.dart';
import 'package:localsend_app/widget/big_button.dart';
import 'package:localsend_app/widget/dialogs/add_file_dialog.dart';
import 'package:localsend_app/widget/dialogs/address_input_dialog.dart';
import 'package:localsend_app/widget/dialogs/no_files_dialog.dart';
import 'package:localsend_app/widget/file_thumbnail.dart';
import 'package:localsend_app/widget/list_tile/device_list_tile.dart';
import 'package:localsend_app/widget/responsive_builder.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:localsend_app/widget/scan_button.dart';
import 'package:routerino/routerino.dart';

const _horizontalPadding = 15.0;

class SendTab extends ConsumerStatefulWidget {
  const SendTab({Key? key}) : super(key: key);

  @override
  ConsumerState<SendTab> createState() => _SendTabState();
}

class _SendTabState extends ConsumerState<SendTab> {
  @override
  void initState() {
    super.initState();

    // Automatically scan the network when visiting the scan tab
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final devices = ref.read(nearbyDevicesProvider.select((state) => state.devices));
      if (devices.isEmpty) {
        ref.read(scanProvider).startSmartScan();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedFiles = ref.watch(selectedSendingFilesProvider);
    final networkInfo = ref.watch(networkStateProvider);
    final myDevice = ref.watch(deviceInfoProvider);
    final nearbyDevicesState = ref.watch(nearbyDevicesProvider);
    final addOptions = [
      FilePickerOption.file,
      if (checkPlatformWithGallery()) FilePickerOption.media,
      FilePickerOption.text,
      if (checkPlatform([TargetPlatform.android])) FilePickerOption.app,
    ];

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
                ...addOptions.map((option) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: BigButton(
                      icon: option.icon,
                      label: option.label,
                      filled: false,
                      onTap: () => option.select(
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
                        onPressed: () {
                          context.push(() => const SelectedFilesPage());
                        },
                        child: Text(t.general.edit),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                        onPressed: () {
                          if (addOptions.length == 1) {
                            addOptions.first.select(context: context, ref: ref); // open directly
                            return;
                          }
                          AddFileDialog.open(
                            context: context,
                            parentRef: ref,
                            options: addOptions,
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
            ScanButton(
              ips: networkInfo.localIps,
              onSelect: (ip) => ref.read(scanProvider).startLegacySubnetScan(ip),
            ),
            Tooltip(
              message: t.dialogs.addressInput.title,
              child: CustomIconButton(
                onPressed: () async {
                  final files = ref.read(selectedSendingFilesProvider);
                  if (files.isEmpty) {
                    context.pushBottomSheet(() => const NoFilesDialog());
                    return;
                  }
                  final device = await showDialog<Device?>(
                    context: context,
                    builder: (_) => const AddressInputDialog(),
                  );
                  if (device != null && mounted) {
                    ref.read(sendProvider.notifier).startSession(
                          target: device,
                          files: files,
                        );
                  }
                },
                child: const Icon(Icons.ads_click),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
          child: Hero(
            tag: 'this-device',
            child: DeviceListTile(
              device: myDevice,
              thisDevice: true,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ...nearbyDevicesState.devices.values.map((device) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, left: _horizontalPadding, right: _horizontalPadding),
            child: Hero(
              tag: 'device-${device.ip}',
              child: DeviceListTile(
                device: device,
                onTap: () {
                  final files = ref.read(selectedSendingFilesProvider);
                  if (files.isEmpty) {
                    context.pushBottomSheet(() => const NoFilesDialog());
                    return;
                  }

                  ref.read(sendProvider.notifier).startSession(
                        target: device,
                        files: files,
                      );
                },
              ),
            ),
          );
        }),
        ResponsiveBuilder(
          builder: (sizingInformation) {
            if (sizingInformation.isMobile) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(() => const TroubleshootPage());
                    },
                    child: Text(t.troubleshootTab.title),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
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
