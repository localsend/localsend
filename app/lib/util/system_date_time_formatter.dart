import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:system_date_time_format/system_date_time_format.dart';

// TODO: Revisit this plugin when https://github.com/dart-lang/i18n/issues/67 is fixed.
// intl currently uses US date/time patterns for unsupported regional locales
// such as en_IL. Before returning to DateFormat.yMd/jm, verify those locales
// and user-selected system formats, which locale data alone may not reflect.

class SystemDateTimeFormatter {
  static String dateTime(BuildContext context, DateTime value) => '${date(context, value)} ${time(context, value)}';

  static String date(BuildContext context, DateTime value) {
    final pattern = SystemDateTimeFormat.of(context).datePattern;
    if (pattern == null || !_isSupported(pattern)) {
      // fallback to default formatting
      return DateFormat.yMd(_locale).format(value);
    }

    // use pattern supplied by OS
    return DateFormat(pattern, _locale).format(value);
  }

  static String time(BuildContext context, DateTime value) {
    final pattern = SystemDateTimeFormat.of(context).timePattern;
    if (pattern == null || !_isSupported(pattern)) {
      // fallback to default formatting
      return DateFormat.jm(_locale).format(value);
    }

    // use pattern supplied by OS
    return DateFormat(_withoutSeconds(pattern), _locale).format(value);
  }

  /// Fields intl mishandles: unknown letters (e.g. `B`) print literally, time zones (`v`, `z`, `Z`) print nothing,
  /// .NET-style `ddd` prints a padded day, `EEEEEE` throws.
  static final _unsupportedField = RegExp(r'(?![GyMkSEahKHcLQdDms])[A-Za-z]|d{3,}|E{6,}');

  static bool _isSupported(String pattern) {
    final parts = pattern.split("'");
    // Only even-indexed parts are outside quoted literals.
    for (var i = 0; i < parts.length; i += 2) {
      if (_unsupportedField.hasMatch(parts[i])) return false;
    }
    return true;
  }

  // On Linux, T_FMT may include seconds even where the UI uses minute precision.
  static String _withoutSeconds(String pattern) {
    final parts = pattern.split("'");
    // Only even-indexed parts are outside quoted literals.
    for (var i = 0; i < parts.length; i += 2) {
      parts[i] = parts[i].replaceFirst(RegExp(r'[:., ]?s+'), '');
    }
    return parts.join("'");
  }

  static String get _locale {
    return _verified(WidgetsBinding.instance.platformDispatcher.locale.toString()) ?? _verified(LocaleSettings.currentLocale.languageTag) ?? 'en';
  }

  /// Resolves e.g. `de_DE` to `de` and `pt-BR` to `pt`, or null if intl has no date symbols for the language.
  static String? _verified(String locale) => Intl.verifiedLocale(locale, DateFormat.localeExists, onFailure: (_) => null);
}
