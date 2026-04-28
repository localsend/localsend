import 'dart:convert';
import 'dart:io';

import 'package:common/model/file_type.dart';
import 'package:logging/logging.dart';

final _logger = Logger('PostReceiveHook');

class PostReceiveHook {
 final String command;

 PostReceiveHook(this.command);

 Future<void> execute({
 required String filePath,
 required String originalFileName,
 required String senderAlias,
 required int fileSize,
 required FileType fileType,
 required bool savedToGallery,
 }) async {
 if (command.trim().isEmpty) {
 return;
 }

 final env = {
 'LOCALSEND_FILE_PATH': filePath,
 'LOCALSEND_ORIGINAL_NAME': originalFileName,
 'LOCALSEND_SENDER_ALIAS': senderAlias,
 'LOCALSEND_FILE_SIZE': fileSize.toString(),
   'LOCALSEND_FILE_TYPE': fileType.name,
   'LOCALSEND_SAVED_TO_GALLERY': savedToGallery.toString(),
 };

   try {
     _logger.info('Executing post-receive hook: $command');
     _logger.fine('Hook environment: $env');

     final process = await Process.run(
       command,
       [],
       environment: env,
       runInShell: true,
     );

     if (process.stdout.toString().trim().isNotEmpty) {
       _logger.info('Hook stdout: ${process.stdout}');
     }
     if (process.stderr.toString().trim().isNotEmpty) {
       _logger.warning('Hook stderr: ${process.stderr}');
     }

     if (process.exitCode != 0) {
       _logger.warning('Post-receive hook exited with code ${process.exitCode}');
     } else {
       _logger.info('Post-receive hook completed successfully');
     }
   } catch (e, st) {
     _logger.warning('Post-receive hook failed', e, st);
   }
 }
}
