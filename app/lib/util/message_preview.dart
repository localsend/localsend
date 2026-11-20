import 'dart:convert';

import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_type.dart';

/// Inline messages are laid out as a single selectable paragraph. Larger text
/// must use the normal file transfer flow to keep the receiver responsive.
/// This only limits the preview, never the transferred file contents.
const maxMessagePreviewBytes = 16 * 1024;

String? createMessagePreview(List<int>? bytes) {
  if (bytes == null || bytes.length > maxMessagePreviewBytes) {
    return null;
  }
  try {
    return utf8.decode(bytes);
  } on FormatException {
    // Binary or malformed text should still be transferable as a file.
    return null;
  }
}

bool isMessagePreviewWithinLimit(String preview) {
  // Reject obviously oversized strings before allocating an encoded copy.
  return preview.length <= maxMessagePreviewBytes && utf8.encode(preview).length <= maxMessagePreviewBytes;
}

String? extractMessagePreview(Iterable<FileDto> files) {
  if (files.length != 1) {
    return null;
  }
  final file = files.first;
  final preview = file.preview;
  return file.fileType == FileType.text && file.size <= maxMessagePreviewBytes && preview != null && isMessagePreviewWithinLimit(preview)
      ? preview
      : null;
}
