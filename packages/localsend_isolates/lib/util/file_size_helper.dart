import 'package:intl/intl.dart';

extension IntFileSize on int {
  /// Converts the integer representing bytes to a readable string
  /// using decimal units (1 KB = 1000 B).
  String readableFileSize({String? locale}) {
    final format = NumberFormat('0.0', locale);
    if (this < 1000) {
      return '$this B';
    } else if (this < 1000 * 1000) {
      return '${format.format(this / 1000)} KB';
    } else if (this < 1000 * 1000 * 1000) {
      return '${format.format(this / (1000 * 1000))} MB';
    } else {
      return '${format.format(this / (1000 * 1000 * 1000))} GB';
    }
  }

  String get asReadableFileSize => readableFileSize();
}
