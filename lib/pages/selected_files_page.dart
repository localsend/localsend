import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/util/cache_helper.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/util/native/open_file.dart';
import 'package:localsend_app/widget/file_thumbnail.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:routerino/routerino.dart';

class SelectedFilesPage extends ConsumerWidget {
  const SelectedFilesPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFiles = ref.watch(selectedSendingFilesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.sendTab.selection.title),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          Row(
            children: [
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t.sendTab.selection.files(files: selectedFiles.length)),
                    Text(t.sendTab.selection.size(size: selectedFiles.fold(0, (prev, curr) => prev + curr.size).asReadableFileSize)),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(selectedSendingFilesProvider.notifier).reset();
                  clearCache();
                  context.popUntilRoot();
                },
                child: Text(t.selectedFilesPage.deleteAll),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...selectedFiles.mapIndexed(
            (index, file) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  splashColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: file.path != null ? () => openFile(context, file.fileType, file.path!) : null,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CrossFileThumbnail(file),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  file.fileType == FileType.text && file.bytes != null
                                      ? '"${utf8.decode(file.bytes!).replaceAll('\n', ' ')}"'
                                      : file.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                                Text(file.size.asReadableFileSize, style: Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.onSurface),
                            onPressed: () {
                              final currCount = ref.read(selectedSendingFilesProvider).length;
                              ref.read(selectedSendingFilesProvider.notifier).removeAt(index);
                              if (currCount == 1) {
                                clearCache();
                                context.popUntilRoot();
                              }
                            },
                            child: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
