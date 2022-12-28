import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/provider/selected_files_provider.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:localsend_app/widget/big_button.dart';
import 'package:localsend_app/widget/dialogs/custom_bottom_sheet.dart';
import 'package:routerino/routerino.dart';

enum AddOption {
  file(Icons.description),
  image(Icons.image),
  video(Icons.movie);

  const AddOption(this.icon);

  final IconData icon;

  String get label {
    switch (this) {
      case AddOption.file:
        return t.sendTab.picker.file;
      case AddOption.image:
        return t.sendTab.picker.image;
      case AddOption.video:
        return t.sendTab.picker.video;
    }
  }

  Future<void> select(WidgetRef ref) async {
    switch (this) {
      case AddOption.file:
        final selectedFiles = ref.read(selectedFilesProvider);
        final result = await FilePicker.platform.pickFiles(allowMultiple: true);
        if (result != null) {
          ref.read(selectedFilesProvider.notifier).state = [
            ...selectedFiles,
            ...result.files.map((f) {
              return CrossFile(
                name: f.name,
                fileType: f.name.guessFileType(),
                size: f.size,
                path: kIsWeb ? null : f.path,
                bytes: kIsWeb ? f.bytes : null,
              );
            }),
          ];
        }
        break;
      case AddOption.image:
        final selectedFiles = ref.read(selectedFilesProvider);
        final images = await ImagePicker().pickMultiImage();
        ref.read(selectedFilesProvider.notifier).state = [
          ...selectedFiles,
          ...await Future.wait(images.map((file) async {
            return CrossFile(
              name: file.name,
              fileType: file.name.guessFileType(),
              size: await file.length(),
              path: kIsWeb ? null : file.path,
              bytes: kIsWeb ? await file.readAsBytes() : null,
            );
          })),
        ];
        break;
      case AddOption.video:
        final selectedFiles = ref.read(selectedFilesProvider);
        final file = await ImagePicker().pickVideo(source: ImageSource.gallery);
        if (file != null) {
          ref.read(selectedFilesProvider.notifier).state = [
            ...selectedFiles,
            CrossFile(
              name: file.name,
              fileType: file.name.guessFileType(),
              size: await file.length(),
              path: kIsWeb ? null : file.path,
              bytes: kIsWeb ? await file.readAsBytes() : null,
            ),
          ];
        }
        break;
    }
  }
}

class AddFileDialog extends StatelessWidget {
  final WidgetRef parentRef;
  final List<AddOption> options;

  const AddFileDialog({required this.parentRef, required this.options});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: t.general.add,
      description: null,
      child: Column(
        children: [
          const SizedBox(height: 20),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...List.generate(3, (index) {
                  final option = index < options.length ? options[index] : null;
                  return [
                    Expanded(
                      child: option == null
                          ? Container()
                          : BigButton(
                              icon: option.icon,
                              label: option.label,
                              onTap: () {
                                context.popUntilRoot();
                                option.select(parentRef);
                              },
                            ),
                    ),
                    const SizedBox(width: 15),
                  ];
                }).expand((e) => e).toList()
                  ..removeLast(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
