import 'package:localsend_app/util/shared_preferences/shared_preferences_file.dart';

/// Custom implementation of SharedPreferencesStorePlatform
/// that uses a file named settings.json located next to the executable.
/// This is used to for portable mode.
class SharedPreferencesPortable extends SharedPreferencesFile {
  SharedPreferencesPortable() : super(filePath: 'settings.json', beautify: true);
}
