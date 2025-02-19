import 'dart:async';
import 'dart:io';

import 'package:common/model/file_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart' as android_channel;
import 'package:localsend_app/util/native/open_file.dart';
import 'package:localsend_app/util/native/open_folder.dart';
import 'package:path/path.dart' as path;
import 'package:routerino/routerino.dart';

class OpenFileDialog extends StatefulWidget {
  final String filePath;
  final FileType fileType;
  final bool openGallery;

  const OpenFileDialog({
    super.key,
    required this.filePath,
    required this.fileType,
    required this.openGallery,
  });

  static Future<void> open(
    BuildContext context, {
    required String filePath,
    required FileType fileType,
    required bool openGallery,
  }) async {
    await showDialog(
      context: context,
      builder: (context) => OpenFileDialog(
        filePath: filePath,
        fileType: fileType,
        openGallery: openGallery,
      ),
    );
  }

  @override
  State<OpenFileDialog> createState() => _OpenFileDialogState();
}

class _OpenFileDialogState extends State<OpenFileDialog> {
  late Timer _timer;
  int _countdown = 5; // Starting countdown value

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
      } else {
        timer.cancel();
        if (context.mounted) {
          context.pop(); // Automatically close the dialog
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.dialogs.openFile.title),
      content: Text(t.dialogs.openFile.content),
      actions: [
        TextButton(
          onPressed: () async {
            if (widget.openGallery && defaultTargetPlatform == TargetPlatform.android) {
              await android_channel.openGallery();
            } else {
              await openFile(context, widget.fileType, widget.filePath);
            }
          },
          child: Text(t.general.open),
        ),
        if (!widget.openGallery)
          TextButton(
            onPressed: () async => await openFolder(
              folderPath: File(widget.filePath).parent.path,
              fileName: path.basename(widget.filePath),
            ),
            child: Text(t.receiveHistoryPage.entryActions.showInFolder),
          ),
        TextButton(
          onPressed: () {
            _timer.cancel();
            context.pop();
          },
          child: Text('${t.general.close} ($_countdown)'),
        ),
      ],
    );
  }
}
