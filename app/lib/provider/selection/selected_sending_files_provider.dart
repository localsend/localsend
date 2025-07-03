import 'dart:convert' show jsonDecode, utf8;
import 'dart:io';
import 'dart:typed_data';

import 'package:common/model/file_type.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:localsend_app/util/native/cache_helper.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart' as android_channel;
import 'package:localsend_app/util/native/content_uri_helper.dart';
import 'package:localsend_app/util/native/cross_file_converters.dart';
import 'package:localsend_app/util/send_ignore.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:refena_flutter/refena_flutter.dart';
import 'package:share_handler/share_handler.dart';
import 'package:uuid/uuid.dart';

final _logger = Logger('SelectedSendingFiles');
const _uuid = Uuid();

/// Manages files selected for sending.
/// Will stay alive even after a session has been completed to send the same files to another device.
final selectedSendingFilesProvider = ReduxProvider<SelectedSendingFilesNotifier, List<CrossFile>>((ref) {
  return SelectedSendingFilesNotifier();
});

class SelectedSendingFilesNotifier extends ReduxNotifier<List<CrossFile>> {
  @override
  List<CrossFile> init() => [];
}

/// Adds a message.
class AddMessageAction extends ReduxAction<SelectedSendingFilesNotifier, List<CrossFile>> {
  final String message;
  final int? index;

  AddMessageAction({
    required this.message,
    this.index,
  });

  @override
  List<CrossFile> reduce() {
    final List<int> bytes = utf8.encode(message);
    final file = CrossFile(
      name: '${_uuid.v4()}.txt',
      fileType: FileType.text,
      size: bytes.length,
      thumbnail: null,
      asset: null,
      path: null,
      bytes: bytes,
      lastModified: null,
      lastAccessed: null,
    );

    return List.unmodifiable([
      ...state,
    ]..insert(index ?? state.length, file));
  }
}

/// Updates a message.
class UpdateMessageAction extends ReduxAction<SelectedSendingFilesNotifier, List<CrossFile>> {
  final String message;
  final int index;

  UpdateMessageAction({
    required this.message,
    required this.index,
  });

  @override
  List<CrossFile> reduce() {
    dispatch(RemoveSelectedFileAction(index));
    dispatch(AddMessageAction(message: message, index: index));
    return state;
  }
}

/// Adds a binary file to the list.
/// During the sending process, the file will be read from the memory.
class AddBinaryAction extends ReduxAction<SelectedSendingFilesNotifier, List<CrossFile>> {
  final Uint8List bytes;
  final FileType fileType;
  final String fileName;

  AddBinaryAction({
    required this.bytes,
    required this.fileType,
    required this.fileName,
  });

  @override
  List<CrossFile> reduce() {
    final file = CrossFile(
      name: fileName,
      fileType: fileType,
      size: bytes.length,
      thumbnail: fileType == FileType.image ? bytes : null,
      asset: null,
      path: null,
      bytes: bytes,
      lastModified: null,
      lastAccessed: null,
    );

    return List.unmodifiable([
      ...state,
      file,
    ]);
  }
}

/// Adds one or more files to the list.
class AddFilesAction<T> extends AsyncReduxAction<SelectedSendingFilesNotifier, List<CrossFile>> {
  final Iterable<T> files;
  final Future<CrossFile> Function(T) converter;

  AddFilesAction({
    required this.files,
    required this.converter,
  });

  @override
  Future<List<CrossFile>> reduce() async {
    final newFiles = <CrossFile>[];
    for (final file in files) {
      // we do it sequential because there are bugs
      //  https://github.com/fluttercandies/flutter_photo_manager/issues/589

      final crossFile = await converter(file);
      final isAlreadySelect = state.any((element) => element.isSameFile(otherFile: crossFile));
      if (!isAlreadySelect) {
        newFiles.add(crossFile);
      }
    }
    return List.unmodifiable([
      ...state,
      ...newFiles,
    ]);
  }
}

/// Adds files inside the directory recursively.
class AddDirectoryAction extends AsyncReduxAction<SelectedSendingFilesNotifier, List<CrossFile>> {
  final String directoryPath;

  AddDirectoryAction(this.directoryPath);

  @override
  Future<List<CrossFile>> reduce() async {
    _logger.info('Reading files in $directoryPath');
    final newFiles = <CrossFile>[];
    final directoryName = p.basename(directoryPath);
    final sendIgnore = SendIgnore();
    await for (final entity in Directory(directoryPath).list(recursive: true)) {
      if (entity is File) {
        final innerRelative = p.relative(entity.path, from: directoryPath).replaceAll('\\', '/');
        final relative = '$directoryName/$innerRelative';
        if (sendIgnore.isIgnoreFile(p.basename(entity.path))) {
          sendIgnore.loadIgnoreContent(
            parentPath: innerRelative.contains('/') ? p.dirname(innerRelative) : null,
            ignoreContents: await entity.readAsLines(),
          );
          _logger.info('Loaded ignore file: $innerRelative');
          continue;
        } else if (sendIgnore.isIgnored(innerRelative)) {
          _logger.info('Ignored: $innerRelative');
          continue;
        }

        _logger.info('Add file $relative');

        final file = CrossFile(
          name: relative,
          fileType: relative.guessFileType(),
          size: entity.lengthSync(),
          thumbnail: null,
          asset: null,
          path: entity.path,
          bytes: null,
          lastModified: entity.lastModifiedSync().toUtc(),
          lastAccessed: entity.lastAccessedSync().toUtc(),
        );

        final isAlreadySelect = state.any((element) => element.isSameFile(otherFile: file));
        if (!isAlreadySelect) {
          newFiles.add(file);
        }
      }
    }

    return List.unmodifiable([
      ...state,
      ...newFiles,
    ]);
  }
}

/// A special [AddDirectoryAction] specifically for Android.
class AddAndroidDirectoryAction extends AsyncReduxAction<SelectedSendingFilesNotifier, List<CrossFile>> {
  final android_channel.PickDirectoryResult result;

  AddAndroidDirectoryAction(this.result);

  @override
  Future<List<CrossFile>> reduce() async {
    final newFiles = <CrossFile>[];
    _logger.info('Reading files in ${result.directoryUri}');

    final basePath = ContentUriHelper.getPathFromTreeUri(result.directoryUri);
    if (basePath == null) {
      _logger.warning('Could not get base path from ${result.directoryUri}');
      return state;
    }
    final folderName = ContentUriHelper.getEntityNameFromPath(basePath);
    if (folderName == null) {
      _logger.warning('Could not get folder name from $basePath');
      return state;
    }

    for (final file in result.files) {
      final relative = ContentUriHelper.guessRelativePathFromPickedFileContentUri(
        folderContentUri: result.directoryUri,
        basePath: basePath,
        folderName: folderName,
        uri: file.uri,
      );
      if (relative == null) {
        _logger.warning('Could not get relative path from ${file.uri}');
        continue;
      }
      _logger.info('Add file $relative (${file.uri})');

      final crossFile = CrossFile(
        name: relative,
        fileType: file.name.guessFileType(),
        size: file.size,
        thumbnail: null,
        asset: null,
        path: file.uri,
        bytes: null,
        lastModified: DateTime.fromMillisecondsSinceEpoch(file.lastModified, isUtc: true),
        lastAccessed: null,
      );

      final isAlreadySelect = state.any((element) => element.isSameFile(otherFile: crossFile));
      if (!isAlreadySelect) {
        newFiles.add(crossFile);
      }
    }

    return List.unmodifiable([
      ...state,
      ...newFiles,
    ]);
  }
}

/// Removes a file at the given [index].
class RemoveSelectedFileAction extends ReduxAction<SelectedSendingFilesNotifier, List<CrossFile>> with GlobalActions {
  final int index;

  RemoveSelectedFileAction(this.index);

  @override
  List<CrossFile> reduce() {
    return List<CrossFile>.unmodifiable([...state]..removeAt(index));
  }

  @override
  void after() {
    if (state.isEmpty) {
      global.dispatchAsync(ClearCacheAction()); // ignore: discarded_futures
    }
  }
}

/// Loads the selection from the arguments of the app start.
/// Returns `true` if files were added.
class LoadSelectionFromArgsAction extends AsyncReduxActionWithResult<SelectedSendingFilesNotifier, List<CrossFile>, bool> {
  final List<String> args;

  LoadSelectionFromArgsAction(this.args);

  @override
  Future<(List<CrossFile>, bool)> reduce() async {
    bool filesAdded = false;
    bool nextShare = false;
    for (final arg in args) {
      if (arg == '--share') {
        nextShare = true;
        continue;
      }
      if (nextShare) {
        nextShare = false;
        final json = jsonDecode(arg);
        final SharedMedia payload = SharedMedia.decode(json);
        final message = payload.content;
        if (message != null && message.trim().isNotEmpty) {
          dispatch(AddMessageAction(message: message));
        }
        await dispatchAsync(AddFilesAction(
              files: payload.attachments?.where((a) => a != null).cast<SharedAttachment>() ?? <SharedAttachment>[],
              converter: CrossFileConverters.convertSharedAttachment,
            ));
        filesAdded = true;
        continue;
      }
      if (arg.startsWith('-')) {
        continue;
      }

      final file = File(arg);
      final directory = Directory(arg);

      if (file.existsSync()) {
        await dispatchAsync(AddFilesAction(
          files: [file],
          converter: CrossFileConverters.convertFile,
        ));
        filesAdded = true;
      } else if (directory.existsSync()) {
        await dispatchAsync(AddDirectoryAction(arg));
        filesAdded = true;
      }
    }

    return (state, filesAdded);
  }
}

/// Removes all files from the list.
class ClearSelectionAction extends ReduxAction<SelectedSendingFilesNotifier, List<CrossFile>> with GlobalActions {
  @override
  List<CrossFile> reduce() {
    return const [];
  }

  @override
  void after() {
    global.dispatchAsync(ClearCacheAction()); // ignore: discarded_futures
  }
}
