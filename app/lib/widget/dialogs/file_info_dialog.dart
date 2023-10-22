import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/receive_history_entry.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:routerino/routerino.dart';

class FileInfoDialog extends StatelessWidget {
  final ReceiveHistoryEntry entry;

  const FileInfoDialog({required this.entry, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.dialogs.fileInfo.title),
      content: Table(
        columnWidths: const {
          0: IntrinsicColumnWidth(),
          1: IntrinsicColumnWidth(),
          2: IntrinsicColumnWidth(),
        },
        children: [
          TableRow(
            children: [
              Text(t.dialogs.fileInfo.fileName, maxLines: 1),
              const SizedBox(width: 10),
              SelectableText(entry.fileName),
            ],
          ),
          TableRow(
            children: [
              Text(t.dialogs.fileInfo.path),
              const SizedBox(width: 10),
              SelectableText(entry.savedToGallery ? t.progressPage.savedToGallery : (entry.path ?? '')),
            ],
          ),
          TableRow(
            children: [
              Text(t.dialogs.fileInfo.size),
              const SizedBox(width: 10),
              SelectableText(entry.fileSize.asReadableFileSize),
            ],
          ),
          TableRow(
            children: [
              Text(t.dialogs.fileInfo.sender),
              const SizedBox(width: 10),
              SelectableText(entry.senderAlias),
            ],
          ),
          TableRow(
            children: [
              Text(t.dialogs.fileInfo.time),
              const SizedBox(width: 10),
              SelectableText(entry.timestampString),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(t.general.close),
        ),
      ],
    );
  }
}
