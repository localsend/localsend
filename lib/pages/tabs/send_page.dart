import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/nearby_devices_provider.dart';
import 'package:localsend_app/provider/selected_files_provider.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/widget/device_widget.dart';

class SendPage extends ConsumerStatefulWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SendPage> createState() => _SendPageState();
}

class _SendPageState extends ConsumerState<SendPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedFiles = ref.watch(selectedFilesProvider);
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
        ...devices.when(
          data: (data) {
            return data.map((device) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: DeviceWidget(device: device),
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
