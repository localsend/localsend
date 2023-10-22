import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/file_type.dart';

part 'receive_history_entry.mapper.dart';

@MappableClass()
class ReceiveHistoryEntry with ReceiveHistoryEntryMappable {
  final String id;
  final String fileName;
  final FileType fileType;
  final String? path;
  final bool savedToGallery;
  final int fileSize;
  final String senderAlias;
  final DateTime timestamp;

  const ReceiveHistoryEntry({
    required this.id,
    required this.fileName,
    required this.fileType,
    required this.path,
    required this.savedToGallery,
    required this.fileSize,
    required this.senderAlias,
    required this.timestamp,
  });

  /// Format string using the intl package.
  /// Because the raw timestamp is saved in UTC, we need to transform it to local time zone first.
  String get timestampString {
    final localTimestamp = timestamp.toLocal();
    return '${DateFormat.yMd(LocaleSettings.currentLocale.languageTag).format(localTimestamp)} ${DateFormat.jm(LocaleSettings.currentLocale.languageTag).format(localTimestamp)}';
  }

  static const fromJson = ReceiveHistoryEntryMapper.fromJson;
}
