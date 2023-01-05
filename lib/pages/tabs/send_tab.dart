import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/pages/selected_files_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/selected_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/file_picker.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/util/platform_check.dart';
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
        _scan();
      }
    });
  }

  void _scan() {
    final port = ref.read(settingsProvider.select((settings) => settings.port));
    final networkInfo = ref.read(networkInfoProvider);
    final localIp = networkInfo?.localIp;
    if (localIp != null) {
      ref.read(nearbyDevicesProvider.notifier).startScan(port: port, localIp: localIp);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedFiles = ref.watch(selectedFilesProvider);
    final myDevice = ref.watch(deviceInfoProvider);
    final nearbyDevicesState = ref.watch(nearbyDevicesProvider);
    final addOptions = [
      FilePickerOption.file,
      if (checkPlatformWithGallery())
        FilePickerOption.media,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    t.sendTab.selection.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(t.sendTab.selection.files(files: selectedFiles.length)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(t.sendTab.selection.size(size: selectedFiles.fold(0, (prev, curr) => prev + curr.size).asReadableFileSize)),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...selectedFiles.map((file) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: FileThumbnail(file),
                          );
                        }),
                      ],
                    ),
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                      onPressed: () {
                        if (addOptions.length == 1) {
                          addOptions.first.select(context: context, ref: ref); // open directly
                          return;
                        }
                        context.pushBottomSheet(() => AddFileDialog(
                              parentRef: ref,
                              options: addOptions,
                            ));
                      },
                      child: Text(t.general.add),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
        const SizedBox(height: 20),
        Row(
          children: [
            Text(t.sendTab.nearbyDevices, style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(width: 10),
            Tooltip(
              message: t.sendTab.scan,
              child: RotatingWidget(
                duration: const Duration(seconds: 2),
                spinning: nearbyDevicesState.running,
                reverse: true,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onSurface,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: Size.zero,
                    shape: const CircleBorder(),
                  ),
                  onPressed: _scan,
                  child: const Icon(Icons.sync),
                ),
              ),
            ),
            Tooltip(
              message: t.dialogs.addressInput.title,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size.zero,
                  shape: const CircleBorder(),
                ),
                onPressed: () async {
                  final files = ref.read(selectedFilesProvider);
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
                  final files = ref.read(selectedFilesProvider);
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
        if (checkPlatformCanReceiveShareIntent())
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(t.sendTab.shareIntentInfo, style: const TextStyle(color: Colors.grey), textAlign: TextAlign.center),
          ),
        Text(t.sendTab.help, style: const TextStyle(color: Colors.grey), textAlign: TextAlign.center),
        const SizedBox(height: 50),
      ],
    );
  }
}
