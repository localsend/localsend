import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/selected_files_provider.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/widget/device_list_tile.dart';

class SendTab extends ConsumerStatefulWidget {
  const SendTab({Key? key}) : super(key: key);

  @override
  ConsumerState<SendTab> createState() => _SendTabState();
}

class _SendTabState extends ConsumerState<SendTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedFiles = ref.watch(selectedFilesProvider);
    final myDevice = ref.watch(deviceInfoProvider);
    final devices = ref.watch(nearbyDevicesProvider);
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
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: ElevatedButton.icon(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(allowMultiple: true);
                if (result != null) {
                  ref.read(selectedFilesProvider.notifier).state = [...selectedFiles, ...result.files];
                }
              },
              icon: const Icon(Icons.add),
              label: Text(t.send.selectFiles),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(t.send.nearbyDevices, style: Theme.of(context).textTheme.subtitle1),
        const SizedBox(height: 10),
        Hero(
          tag: 'this-device',
          child: DeviceListTile(
            device: myDevice,
            thisDevice: true,
          ),
        ),
        const SizedBox(height: 10),
        ...devices.when(
          data: (data) {
            return data.map((device) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Hero(
                  tag: 'device-${device.ip}',
                  child: DeviceListTile(
                    device: device,
                    onTap: () {
                      ref.read(sendProvider.notifier).sendRequest(
                            target: device,
                            files: ref.read(selectedFilesProvider),
                          );
                    },
                  ),
                ),
              );
            });
          },
          error: (e, st) {
            return [
              Center(
                child: Text(e.toString()),
              ),
            ];
          },
          loading: () {
            return [
              const Center(
                child: CircularProgressIndicator(),
              ),
            ];
          },
        ),
      ],
    );
  }
}
