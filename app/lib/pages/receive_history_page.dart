import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/receive_history_entry.dart';
import 'package:localsend_app/provider/receive_history_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/util/native/get_destination_directory.dart';
import 'package:localsend_app/util/native/open_file.dart';
import 'package:localsend_app/util/native/open_folder.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/widget/dialogs/file_info_dialog.dart';
import 'package:localsend_app/widget/dialogs/history_clear_dialog.dart';
import 'package:localsend_app/widget/file_thumbnail.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:refena_flutter/refena_flutter.dart';

enum _EntryOption {
  open,
  info,
  delete;

  String get label {
    switch (this) {
      case _EntryOption.open:
        return t.receiveHistoryPage.entryActions.open;
      case _EntryOption.info:
        return t.receiveHistoryPage.entryActions.info;
      case _EntryOption.delete:
        return t.receiveHistoryPage.entryActions.deleteFromHistory;
    }
  }
}

const _optionsAll = _EntryOption.values;
final _optionsWithoutOpen = [_EntryOption.info, _EntryOption.delete];

class ReceiveHistoryPage extends StatelessWidget {
  const ReceiveHistoryPage({super.key});

  Future<void> _openFile(
    BuildContext context,
    ReceiveHistoryEntry entry,
    Dispatcher<ReceiveHistoryService, List<ReceiveHistoryEntry>> dispatcher,
  ) async {
    if (entry.path != null) {
      await openFile(
        context,
        entry.fileType,
        entry.path!,
        onDeleteTap: () => dispatcher.dispatchAsync(RemoveHistoryEntryAction(entry.id)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final entries = context.watch(receiveHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.receiveHistoryPage.title),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 15),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainerIfDark,
                    foregroundColor: Theme.of(context).colorScheme.onSecondaryContainerIfDark,
                  ),
                  onPressed: checkPlatform([TargetPlatform.iOS])
                      ? null
                      : () async {
                          // ignore: use_build_context_synchronously
                          final destination = context.read(settingsProvider).destination ?? await getDefaultDestinationDirectory();
                          await openFolder(destination);
                        },
                  icon: const Icon(Icons.folder),
                  label: Text(t.receiveHistoryPage.openFolder),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainerIfDark,
                    foregroundColor: Theme.of(context).colorScheme.onSecondaryContainerIfDark,
                  ),
                  onPressed: entries.isEmpty
                      ? null
                      : () async {
                          final result = await showDialog(
                            context: context,
                            builder: (_) => const HistoryClearDialog(),
                          );

                          if (context.mounted && result == true) {
                            await context.redux(receiveHistoryProvider).dispatchAsync(RemoveAllHistoryEntriesAction());
                          }
                        },
                  icon: const Icon(Icons.delete),
                  label: Text(t.receiveHistoryPage.deleteHistory),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (entries.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(child: Text(t.receiveHistoryPage.empty, style: Theme.of(context).textTheme.headlineMedium)),
            )
          else
            ...entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: InkWell(
                  splashColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: entry.path != null ? () async => _openFile(context, entry, context.redux(receiveHistoryProvider)) : null,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FilePathThumbnail(
                        path: entry.path,
                        fileType: entry.fileType,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 3),
                            Text(
                              entry.fileName,
                              style: const TextStyle(fontSize: 16),
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                            Text(
                              '${entry.timestampString} - ${entry.fileSize.asReadableFileSize} - ${entry.senderAlias}',
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      PopupMenuButton<_EntryOption>(
                        onSelected: (_EntryOption item) async {
                          switch (item) {
                            case _EntryOption.open:
                              await _openFile(context, entry, context.redux(receiveHistoryProvider));
                              break;
                            case _EntryOption.info:
                              // ignore: use_build_context_synchronously
                              await showDialog(
                                context: context,
                                builder: (_) => FileInfoDialog(entry: entry),
                              );
                              break;
                            case _EntryOption.delete:
                              // ignore: use_build_context_synchronously
                              await context.redux(receiveHistoryProvider).dispatchAsync(RemoveHistoryEntryAction(entry.id));
                              break;
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return (entry.path != null ? _optionsAll : _optionsWithoutOpen).map((e) {
                            return PopupMenuItem<_EntryOption>(
                              value: e,
                              child: Text(e.label),
                            );
                          }).toList();
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }
}
