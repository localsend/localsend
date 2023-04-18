import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/selection/selected_receiving_files_provider.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/widget/custom_dropdown_button.dart';
import 'package:localsend_app/widget/custom_icon_button.dart';
import 'package:localsend_app/widget/dialogs/file_name_input_dialog.dart';
import 'package:localsend_app/widget/dialogs/quick_actions_dialog.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';

class ReceiveOptionsPage extends ConsumerWidget {
  const ReceiveOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiveSession = ref.watch(serverProvider.select((s) => s?.session));
    if (receiveSession == null) {
      return Scaffold(
        body: Container(),
      );
    }
    final selectState = ref.watch(selectedReceivingFilesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.receiveOptionsPage.title),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          Row(
            children: [
              Text(t.receiveOptionsPage.destination, style: Theme.of(context).textTheme.titleLarge),
              if (checkPlatformWithFileSystem())
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomIconButton(
                    onPressed: () async {
                      final directory = await FilePicker.platform.getDirectoryPath();
                      if (directory != null) {
                        ref.read(serverProvider.notifier).setSessionDestinationDir(directory);
                      }
                    },
                    child: const Icon(Icons.edit),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(checkPlatformWithFileSystem() ? receiveSession.destinationDirectory : t.receiveOptionsPage.appDirectory),
          if (checkPlatformWithGallery())
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(t.receiveOptionsPage.saveToGallery, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CustomDropdownButton<bool>(
                      value: receiveSession.saveToGallery,
                      expanded: false,
                      items: [false, true].map((b) {
                        return DropdownMenuItem(
                          value: b,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(b ? t.general.on : t.general.off),
                          ),
                        );
                      }).toList(),
                      onChanged: (b) {
                        if (b != null) {
                          ref.read(serverProvider.notifier).setSessionSaveToGallery(b);
                        }
                      },
                    ),
                    if (receiveSession.containsDirectories && !receiveSession.saveToGallery)
                      ...[
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(t.receiveOptionsPage.saveToGalleryOff, style: const TextStyle(color: Colors.grey)),
                        ),
                      ]
                  ],
                ),
              ],
            ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(t.general.files, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(width: 10),
              Tooltip(
                message: t.dialogs.quickActions.title,
                child: CustomIconButton(
                  onPressed: () async {
                    await showDialog(context: context, builder: (_) => const QuickActionsDialog());
                  },
                  child: const Icon(Icons.tips_and_updates),
                ),
              ),
              const SizedBox(width: 10),
              Tooltip(
                message: t.general.reset,
                child: CustomIconButton(
                  onPressed: () async {
                    ref.read(selectedReceivingFilesProvider.notifier).init(receiveSession.files.values.map((f) => f.file).toList());
                  },
                  child: const Icon(Icons.undo),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ...receiveSession.files.values.map((file) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(file.file.fileType.icon, size: 46),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectState[file.file.id] ?? file.file.fileName,
                          style: const TextStyle(fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                        Text(
                          '${!selectState.containsKey(file.file.id) ? t.general.skipped : (selectState[file.file.id] == file.file.fileName ? t.general.unchanged : t.general.renamed)} - ${file.file.size.asReadableFileSize}',
                          style: TextStyle(
                              color: !selectState.containsKey(file.file.id)
                                  ? Colors.grey
                                  : (selectState[file.file.id] == file.file.fileName
                                      ? Theme.of(context).colorScheme.tertiaryContainer
                                      : Colors.orange)),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIconButton(
                        onPressed: selectState[file.file.id] == null
                            ? null
                            : () async {
                                final result = await showDialog<String>(
                                  context: context,
                                  builder: (_) => FileNameInputDialog(
                                    originalName: file.file.fileName,
                                    initialName: selectState[file.file.id]!,
                                  ),
                                );
                                if (result != null) {
                                  ref.read(selectedReceivingFilesProvider.notifier).rename(file.file.id, result);
                                }
                              },
                        child: const Icon(Icons.edit),
                      ),
                      Checkbox(
                        value: selectState.containsKey(file.file.id),
                        activeColor: Theme.of(context).colorScheme.onSurface,
                        checkColor: Theme.of(context).colorScheme.surface,
                        onChanged: (selected) {
                          if (selected == true) {
                            ref.read(selectedReceivingFilesProvider.notifier).select(file.file);
                          } else {
                            ref.read(selectedReceivingFilesProvider.notifier).unselect(file.file.id);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
