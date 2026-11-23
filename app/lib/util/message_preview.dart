import 'dart:convert';
import 'dart:math';

import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_type.dart';

/// Inline messages are laid out as a single selectable paragraph. Larger text
/// must use the normal file transfer flow to keep the receiver responsive.
/// This only limits the preview, never the transferred file contents.
/// Keep in sync with `MAX_MESSAGE_BYTES` in `cli/src/app/sending.rs`.
const maxMessagePreviewBytes = 16 * 1024;

/// Number of bytes decoded for a single-line label of a text file.
const _labelBytes = 256;

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

/// Decodes only the start of [bytes] for a single-line label,
/// so large text never has to be decoded or laid out in full.
String createMessageLabel(List<int> bytes) {
  final label = const Utf8Decoder(allowMalformed: true).convert(bytes, 0, min(bytes.length, _labelBytes));
  // A character cut off at the end decodes to a replacement character.
  final trimmed = bytes.length > _labelBytes && label.endsWith('�') ? label.substring(0, label.length - 1) : label;
  return bytes.length > _labelBytes ? '$trimmed…' : trimmed;
}

bool isMessagePreviewWithinLimit(String preview) {
  // A UTF-16 code unit encodes to at most 3 UTF-8 bytes,
  // so only strings close to the limit need an encoded copy.
  if (preview.length > maxMessagePreviewBytes) {
    return false;
  }
  if (preview.length * 3 <= maxMessagePreviewBytes) {
    return true;
  }
  return utf8.encode(preview).length <= maxMessagePreviewBytes;
}

/// Returns true if [files] is a "message request": a single text file with its preview included.
///
/// Unlike [extractMessagePreview], this ignores the size of the preview. Older peers
/// embed text of any length, which is received as a file instead of shown inline,
/// but must still not be accepted automatically, as before.
///
/// Current senders omit the preview above [maxMessagePreviewBytes], so their large
/// text is indistinguishable from a regular `.txt` file and is treated as one.
bool isMessageRequestOf(Iterable<FileDto> files) {
  if (files.length != 1) {
    return false;
  }
  final file = files.first;
  return file.fileType == FileType.text && file.preview != null;
}

String? extractMessagePreview(Iterable<FileDto> files) {
  if (!isMessageRequestOf(files)) {
    return null;
  }
  final file = files.first;
  final preview = file.preview!;
  return file.size <= maxMessagePreviewBytes && isMessagePreviewWithinLimit(preview) ? preview : null;
}
