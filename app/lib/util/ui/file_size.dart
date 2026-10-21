import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_isolates/util/file_size_helper.dart';

extension LocalizedFileSize on int {
  String get asLocalizedFileSize => readableFileSize(locale: LocaleSettings.currentLocale.languageTag);
}
