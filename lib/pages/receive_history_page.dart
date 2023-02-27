import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/receive_history_entry.dart';
import 'package:localsend_app/provider/receive_history_provider.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/util/native/open_file.dart';
import 'package:localsend_app/widget/dialogs/file_info_dialog.dart';
import 'package:localsend_app/widget/file_thumbnail.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';

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

class ReceiveHistoryPage extends ConsumerWidget {
  const ReceiveHistoryPage({Key? key}) : super(key: key);

  Future<void> _openFile(BuildContext context, ReceiveHistoryEntry entry) async {
    if (entry.path != null) {
      openFile(context, entry.fileType, entry.path!);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(receiveHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.receiveHistoryPage.title),
      ),
      body: Builder(builder: (context) {
        if (entries.isEmpty) {
          return Center(
            child: Text(t.receiveHistoryPage.empty, style: Theme.of(context).textTheme.headlineMedium),
          );
        }

        return ResponsiveListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          children: [
            ...entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: InkWell(
                  splashColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: entry.path != null ? () => _openFile(context, entry) : null,
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
                        onSelected: (_EntryOption item) {
                          switch (item) {
                            case _EntryOption.open:
                              _openFile(context, entry);
                              break;
                            case _EntryOption.info:
                              showDialog(
                                context: context,
                                builder: (_) => FileInfoDialog(entry: entry),
                              );
                              break;
                            case _EntryOption.delete:
                              ref.read(receiveHistoryProvider.notifier).removeEntry(entry.id);
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
        );
      }),
    );
  }
}
