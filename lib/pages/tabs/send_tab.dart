import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/selected_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/widget/list_tile/device_list_tile.dart';
import 'package:localsend_app/widget/rotating_widget.dart';

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
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      children: [
        Text(
          selectedFiles.isEmpty ? t.send.files : t.send.filesWithCount(count: selectedFiles.length),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 10),
        ...selectedFiles.mapIndexed((index, file) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(file.name),
                          Text(file.size.asReadableFileSize, style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        final newList = [...selectedFiles];
                        newList.removeAt(index);
                        ref.read(selectedFilesProvider.notifier).state = newList;
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _BigButton(
                  icon: Icons.description,
                  label: t.send.picker.file,
                  onTap: () async {
                    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
                    if (result != null) {
                      ref.read(selectedFilesProvider.notifier).state = [
                        ...selectedFiles,
                        ...result.files.map((f) {
                          return CrossFile(
                            name: f.name,
                            size: f.size,
                            path: kIsWeb ? null : f.path,
                            bytes: kIsWeb ? f.bytes : null,
                          );
                        }),
                      ];
                    }
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _BigButton(
                  icon: Icons.image,
                  label: t.send.picker.image,
                  onTap: () async {
                    final images = await ImagePicker().pickMultiImage();
                    ref.read(selectedFilesProvider.notifier).state = [
                      ...selectedFiles,
                      ...await Future.wait(images.map((file) async {
                        return CrossFile(
                            name: file.name,
                            size: await file.length(),
                            path: kIsWeb ? null : file.path,
                            bytes: kIsWeb ? await file.readAsBytes() : null,
                          );
                        })
                      ),
                    ];
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _BigButton(
                  icon: Icons.movie,
                  label: t.send.picker.video,
                  onTap: () async {
                    final file = await ImagePicker().pickVideo(source: ImageSource.gallery);
                    if (file != null) {
                      ref.read(selectedFilesProvider.notifier).state = [
                        ...selectedFiles,
                        CrossFile(
                          name: file.name,
                          size: await file.length(),
                          path: kIsWeb ? null : file.path,
                          bytes: kIsWeb ? await file.readAsBytes() : null,
                        ),
                      ];
                    }
                  },
                ),
              ),
              // const SizedBox(width: 15),
              // Expanded(
              //   child: _BigButton(
              //     icon: Icons.subject,
              //     label: t.send.picker.text,
              //     onTap: () async {
              //       final result = await FilePicker.platform.pickFiles(allowMultiple: true);
              //       if (result != null) {
              //         ref.read(selectedFilesProvider.notifier).state = [...selectedFiles, ...result.files];
              //       }
              //     },
              //   ),
              // ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Text(t.send.nearbyDevices, style: Theme.of(context).textTheme.subtitle1),
            RotatingWidget(
              duration: const Duration(seconds: 2),
              spinning: nearbyDevicesState.running,
              reverse: true,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  shape: const CircleBorder(),
                ),
                onPressed: _scan,
                child: const Icon(Icons.sync),
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
        ...nearbyDevicesState.devices.map((device) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Hero(
              tag: 'device-${device.ip}',
              child: DeviceListTile(
                device: device,
                onTap: () {
                  ref.read(sendProvider.notifier).startSession(
                        target: device,
                        files: ref.read(selectedFilesProvider),
                      );
                },
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _BigButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _BigButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(height: 5),
          Expanded(
            child: FittedBox(
              child: Text(label, maxLines: 1),
            ),
          ),
        ],
      ),
    );
  }
}
