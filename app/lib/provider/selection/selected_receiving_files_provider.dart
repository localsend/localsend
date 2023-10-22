import 'package:collection/collection.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// Manages files to be selected to receive.
/// Only alive during [ReceivePage], i.e. this provider gets disposed as soon as the actual file transfer begin.
/// Map: FileId -> FileName
final selectedReceivingFilesProvider = NotifierProvider<SelectedReceivingFilesNotifier, Map<String, String>>((ref) {
  return SelectedReceivingFilesNotifier();
});

class SelectedReceivingFilesNotifier extends Notifier<Map<String, String>> {
  SelectedReceivingFilesNotifier();

  @override
  Map<String, String> init() {
    return {};
  }

  void setFiles(List<FileDto> files) {
    state = {
      for (final f in files) f.id: f.fileName, // by default, accept all files and take their original name
    };
  }

  void unselect(String fileId) {
    state = {...state}..remove(fileId);
  }

  void select(FileDto file) {
    state = {
      ...state,
      file.id: file.fileName,
    };
  }

  void rename(String fileId, String fileName) {
    state = {...state}..update(fileId, (_) => fileName);
  }

  void applyRandom() {
    state = {
      for (final entry in state.entries) entry.key: entry.value.withFileNameKeepExtension(_uuid.v4()),
    };
  }

  void applyCounter({
    required String prefix,
    required bool padZero,
    required bool sortFirst,
  }) {
    final files = state.entries.toList();
    if (sortFirst) {
      files.sort((a, b) => a.value.compareTo(b.value));
    }
    final maxKeyStringLength = files.length.toString().length;
    state = Map.fromEntries(files.mapIndexed((index, element) {
      String number = (index + 1).toString();
      if (padZero) {
        number.padLeft(maxKeyStringLength, '0');
      }
      return MapEntry(element.key, element.value.withFileNameKeepExtension('$prefix$number'));
    }));
  }
}
