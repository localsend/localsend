import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/selected_files_provider.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:routerino/routerino.dart';

class SelectedFilesPage extends ConsumerWidget {
  const SelectedFilesPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFiles = ref.watch(selectedFilesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.sendTab.selection.title),
      ),
      body: ListView(
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
                  ref.read(selectedFilesProvider.notifier).state = [];
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
            },
          ),
        ],
      ),
    );
  }
}
