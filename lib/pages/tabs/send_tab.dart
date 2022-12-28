import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/pages/selected_files_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/selected_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/widget/list_tile/device_list_tile.dart';
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
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      children: [
        const SizedBox(height: 20),
        if (selectedFiles.isEmpty)
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            t.sendTab.selection.title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        )
        else
          ...[
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ...selectedFiles.map((file) {
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Opacity(
                                          opacity: 1,
                                          child: Icon(file.fileType.icon, size: 32),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                child: IgnorePointer(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: FractionalOffset.centerLeft,
                                        end: FractionalOffset.centerRight,
                                        colors: [
                                          Colors.transparent,
                                          Colors.transparent,
                                          Theme.of(context).cardColorWithElevation.withOpacity(0),
                                          Theme.of(context).cardColorWithElevation,
                                        ],
                                        stops: const [0, 0, 0.7, 1],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          style: IconButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: Theme.of(context).colorScheme.onPrimary,
                          ),
                          onPressed: () {
                            context.push(() => const SelectedFilesPage());
                          },
                          icon: const Icon(Icons.edit),
                          label: Text(t.general.edit),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                t.general.add,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _BigButton(
                  icon: Icons.description,
                  label: t.sendTab.picker.file,
                  onTap: () async {
                    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
                    if (result != null) {
                      ref.read(selectedFilesProvider.notifier).state = [
                        ...selectedFiles,
                        ...result.files.map((f) {
                          return CrossFile(
                            name: f.name,
                            fileType: f.name.guessFileType(),
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
              if (defaultTargetPlatform == TargetPlatform.iOS)
                Expanded(
                  child: _BigButton(
                    icon: Icons.image,
                    label: t.sendTab.picker.image,
                    onTap: () async {
                      final images = await ImagePicker().pickMultiImage();
                      ref.read(selectedFilesProvider.notifier).state = [
                        ...selectedFiles,
                        ...await Future.wait(images.map((file) async {
                          return CrossFile(
                              name: file.name,
                              fileType: file.name.guessFileType(),
                              size: await file.length(),
                              path: kIsWeb ? null : file.path,
                              bytes: kIsWeb ? await file.readAsBytes() : null,
                            );
                          })
                        ),
                      ];
                    },
                  ),
                )
              else
                Expanded(child: Container()),
              const SizedBox(width: 15),
              if (defaultTargetPlatform == TargetPlatform.iOS)
                Expanded(
                  child: _BigButton(
                    icon: Icons.movie,
                    label: t.sendTab.picker.video,
                    onTap: () async {
                      final file = await ImagePicker().pickVideo(source: ImageSource.gallery);
                      if (file != null) {
                        ref.read(selectedFilesProvider.notifier).state = [
                          ...selectedFiles,
                          CrossFile(
                            name: file.name,
                            fileType: file.name.guessFileType(),
                            size: await file.length(),
                            path: kIsWeb ? null : file.path,
                            bytes: kIsWeb ? await file.readAsBytes() : null,
                          ),
                        ];
                      }
                    },
                  ),
                )
              else
                Expanded(child: Container()),
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
            Text(t.sendTab.nearbyDevices, style: Theme.of(context).textTheme.subtitle1),
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
        const SizedBox(height: 20),
        Text(t.sendTab.help, style: const TextStyle(color: Colors.grey), textAlign: TextAlign.center),
        const SizedBox(height: 50),
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
        padding: EdgeInsets.symmetric(vertical: defaultTargetPlatform == TargetPlatform.windows ? 20 : 10),
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
