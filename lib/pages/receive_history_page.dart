import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/receive_history_provider.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/widget/dialogs/cannot_open_file_dialog.dart';
import 'package:localsend_app/widget/file_thumbnail.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:open_filex/open_filex.dart';

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

class ReceiveHistoryPage extends ConsumerWidget {
  const ReceiveHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(receiveHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.receiveHistoryPage.title),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          ...entries.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: InkWell(
                splashColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: e.path != null
                    ? () async {
                        final result = await OpenFilex.open(e.path);
                        if (result.type != ResultType.done) {
                          // TODO: use context.mounted when migrated to Flutter 3.7
                          // ignore: use_build_context_synchronously
                          CannotOpenFileDialog.open(context, e.path!);
                        }
                      }
                    : null,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilePathThumbnail(
                      path: e.path,
                      fileType: e.fileType,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 3),
                          Text(
                            e.fileName,
                            style: const TextStyle(fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                          Text(
                            '${DateFormat.yMd().format(e.timestamp)} ${DateFormat.jm().format(e.timestamp)} - ${e.fileSize.asReadableFileSize} - ${e.senderAlias}',
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
                        print(item);
                      },
                      itemBuilder: (BuildContext context) {
                        return _EntryOption.values.map((e) {
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
