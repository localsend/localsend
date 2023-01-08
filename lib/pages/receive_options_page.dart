import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/selection/selected_receiving_files_provider.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/widget/dialogs/file_name_input_dialog.dart';
import 'package:localsend_app/widget/dialogs/quick_actions_dialog.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';

class ReceiveOptionsPage extends ConsumerStatefulWidget {
  const ReceiveOptionsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ReceiveOptionsPage> createState() => _ReceiveOptionsPageState();
}

class _ReceiveOptionsPageState extends ConsumerState<ReceiveOptionsPage> {
  @override
  Widget build(BuildContext context) {
    final receiveState = ref.watch(serverProvider.select((s) => s?.receiveState));
    if (receiveState == null) {
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
              Text(t.receiveOptionsPage.destination, style: Theme.of(context).textTheme.headline6),
              const SizedBox(width: 10),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size.zero,
                  shape: const CircleBorder(),
                ),
                onPressed: () async {
                  final directory = await FilePicker.platform.getDirectoryPath();
                  if (directory != null) {
                    ref.read(serverProvider.notifier).setSessionDestinationDir(directory);
                  }
                },
                child: const Icon(Icons.edit),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(receiveState.destinationDirectory),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(t.general.files, style: Theme.of(context).textTheme.headline6),
              const SizedBox(width: 10),
              Tooltip(
                message: t.dialogs.quickActions.title,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onSurface,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: Size.zero,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    showDialog(context: context, builder: (_) => const QuickActionsDialog());
                  },
                  child: const Icon(Icons.tips_and_updates),
                ),
              ),
              const SizedBox(width: 10),
              Tooltip(
                message: t.general.reset,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onSurface,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: Size.zero,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () async {
                    ref.read(selectedReceivingFilesProvider.notifier).init(receiveState.files.values.map((f) => f.file).toList());
                  },
                  child: const Icon(Icons.undo),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ...receiveState.files.values.map((file) {
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
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                        '${!selectState.containsKey(file.file.id)
                              ? t.general.skipped
                              : (selectState[file.file.id] == file.file.fileName ? t.general.unchanged : t.general.renamed)} - ${file.file.size.asReadableFileSize}',
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
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.onSurface,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: Size.zero,
                          shape: const CircleBorder(),
                        ),
                        onPressed: selectState[file.file.id] == null ? null : () async {
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
