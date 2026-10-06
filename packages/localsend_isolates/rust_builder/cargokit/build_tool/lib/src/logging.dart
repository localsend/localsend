/// This is copied from Cargokit (which is the official way to use it currently)
/// Details: https://fzyzcjy.github.io/flutter_rust_bridge/manual/integrate/builtin

import 'dart:io';

import 'package:logging/logging.dart';

const String kSeparator = "--";
const String kDoubleSeparator = "==";

bool _lastMessageWasSeparator = false;

void _log(LogRecord rec) {
  final prefix = '${rec.level.name}: ';
  final out = rec.level == Level.SEVERE ? stderr : stdout;
  if (rec.message == kSeparator) {
    if (!_lastMessageWasSeparator) {
      out.write(prefix);
      out.writeln('-' * 80);
      _lastMessageWasSeparator = true;
    }
    return;
  } else if (rec.message == kDoubleSeparator) {
    out.write(prefix);
    out.writeln('=' * 80);
    _lastMessageWasSeparator = true;
    return;
  }
  out.write(prefix);
  out.writeln(rec.message);
  _lastMessageWasSeparator = false;
}

void initLogging() {
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((LogRecord rec) {
    final lines = rec.message.split('\n');
    for (final line in lines) {
      if (line.isNotEmpty || lines.length == 1 || line != lines.last) {
        _log(LogRecord(
          rec.level,
          line,
          rec.loggerName,
        ));
      }
    }
  });
}

void enableVerboseLogging() {
  Logger.root.level = Level.ALL;
}
