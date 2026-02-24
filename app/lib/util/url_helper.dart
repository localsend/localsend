/// Checks if the given text is a valid URL with any protocol.
/// Accepts any protocol type (http, https, ftp, mailto, etc.)
bool isUrl(String text) {
  final trimmed = text.trim();

  return RegExp(
    r'^\w+:\/\/',
  ).hasMatch(trimmed);
}
