import 'package:logging/logging.dart';

void initLogger(Level level) {
  Logger.root.level = level;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.time} ${'[${record.level.name}]'.padLeft(9)} [${record.loggerName}] ${record.message}');

    if (record.error != null) {
      // ignore: avoid_print
      print(record.error);
    }

    if (record.stackTrace != null) {
      // ignore: avoid_print
      print(record.stackTrace);
    }
  });
}
