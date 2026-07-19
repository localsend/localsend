extension IntFileSize on int {
  /// Converts the integer representing bytes to a readable string
  /// Uses decimal (SI) units: 1 KB = 1000 B, 1 MB = 1000 KB, 1 GB = 1000 MB
  String get asReadableFileSize {
    if (this < 1000) {
      return '$this B';
    } else if (this < 1000 * 1000) {
      return '${(this / 1000).toStringAsFixed(1)} KB';
    } else if (this < 1000 * 1000 * 1000) {
      return '${(this / (1000 * 1000)).toStringAsFixed(1)} MB';
    } else {
      return '${(this / (1000 * 1000 * 1000)).toStringAsFixed(1)} GB';
    }
  }
}
