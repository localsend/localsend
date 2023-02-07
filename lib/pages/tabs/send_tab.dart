import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/pages/selected_files_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
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
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:localsend_app/widget/rotating_widget.dart';
import 'package:routerino/routerino.dart';

class SendTab extends ConsumerStatefulWidget {
  const SendTab({Key? key}) : super(key: key);

  @override
  ConsumerState<SendTab> createState() => _SendTabState();
}

class _SendTabState extends ConsumerState<SendTab> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final devices = ref.read(nearbyDevicesProvider.select((state) => state.devices));
      if (devices.isEmpty) {
        _scan(null);
      }
    });
  }

  void _scan(String? localIp) {
    if (localIp != null) {
      final settings = ref.read(settingsProvider);
      final port = settings.port;
      final https = settings.https;
      ref.read(nearbyDevicesProvider.notifier).startScan(port: port, localIp: localIp, https: https);
    } else {
      ref.read(networkInfoProvider.notifier).scanWhenInitialized();
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedFiles = ref.watch(selectedSendingFilesProvider);
    final networkInfo = ref.watch(networkInfoProvider);
    final myDevice = ref.watch(deviceInfoProvider);
    final nearbyDevicesState = ref.watch(nearbyDevicesProvider);
    final addOptions = [
      FilePickerOption.file,
      if (checkPlatformWithGallery()) FilePickerOption.media,
      FilePickerOption.text,
    ];

    return ResponsiveListView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      children: [
        const SizedBox(height: 20),
        if (selectedFiles.isEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              t.sendTab.selection.title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...List.generate(3, (index) {
                  final option = index < addOptions.length ? addOptions[index] : null;
                  return [
                    Expanded(
                      child: option == null
                          ? Container()
                          : BigButton(
                              icon: option.icon,
                              label: option.label,
                              filled: false,
                              onTap: () => option.select(
                                context: context,
                                ref: ref,
                              ),
                            ),
                    ),
                    const SizedBox(width: 15),
                  ];
                }).expand((e) => e).toList()
                  ..removeLast(),
              ],
            ),
          ),
        ] else ...[
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.sendTab.selection.title,
                    style: Theme.of(context).textTheme.subtitle1,
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
        const SizedBox(height: 20),
        Row(
          children: [
            Text(t.sendTab.nearbyDevices, style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(width: 10),
            if (networkInfo.localIps.length == 1)
              Tooltip(
                message: t.sendTab.scan,
                child: RotatingWidget(
                  duration: const Duration(seconds: 2),
                  spinning: nearbyDevicesState.runningIps.isNotEmpty,
                  reverse: true,
                  child: CustomIconButton(
                    onPressed: () => _scan(null),
                    child: const Icon(Icons.sync),
                  ),
                ),
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
        if (networkInfo.localIps.length > 1)
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Wrap(
              spacing: 15,
              runSpacing: 15,
              children: networkInfo.localIps.map((ip) {
                return Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Tooltip(
                          message: t.sendTab.scan,
                          child: RotatingWidget(
                            duration: const Duration(seconds: 2),
                            spinning: nearbyDevicesState.runningIps.contains(ip),
                            reverse: true,
                            child: CustomIconButton(
                              onPressed: () => _scan(ip),
                              child: const Icon(Icons.sync),
                            ),
                          ),
                        ),
                        Text(ip),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        Hero(
          tag: 'this-device',
          child: DeviceListTile(
            device: myDevice,
            thisDevice: true,
          ),
        ),
        const SizedBox(height: 10),
        ...nearbyDevicesState.devices.values.map((device) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
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
        const SizedBox(height: 20),
        OpacitySlideshow(
          durationMillis: 6000,
          children: [
            Text(t.sendTab.help, style: const TextStyle(color: Colors.grey), textAlign: TextAlign.center),
            if (checkPlatformCanReceiveShareIntent())
              Text(t.sendTab.shareIntentInfo, style: const TextStyle(color: Colors.grey), textAlign: TextAlign.center),
          ],
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
