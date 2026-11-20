import 'dart:convert';

import 'package:localsend_app/model/state/server/receive_session_state.dart';
import 'package:localsend_app/model/state/server/receiving_file.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:test/test.dart';

const _previewLimit = 16 * 1024;

ReceiveSessionState _session(List<FileDto> files) => ReceiveSessionState(
  sessionId: 'session',
  status: SessionStatus.waiting,
  sender: Device.empty,
  senderAlias: 'Nearby device',
  files: {
    for (final file in files)
      file.id: ReceivingFile(file: file, token: null, desiredName: null, path: null, savedToGallery: false, errorMessage: null),
  },
  startTime: null,
  endTime: null,
  destinationDirectory: '/downloads',
  cacheDirectory: '/cache',
  saveToGallery: false,
  createdDirectories: {},
);

FileDto _text(String text, {String id = 'file', int? size}) => FileDto(
  id: id,
  fileName: '$id.txt',
  size: size ?? utf8.encode(text).length,
  fileType: FileType.text,
  hash: null,
  preview: text,
  metadata: null,
);

void main() {
  test('an empty request has no inline message', () {
    expect(_session([]).message, isNull);
  });

  test('short messages and links remain inline', () {
    for (final text in ['Hello, 你好 👋', 'https://localsend.org', '']) {
      expect(_session([_text(text)]).message, text);
    }
  });

  test('a message at the byte limit remains inline', () {
    final text = 'a' * _previewLimit;
    expect(_session([_text(text)]).message, text);
  });

  test('oversized previews from older peers use the file transfer flow', () {
    for (final text in ['a' * (_previewLimit + 1), 'a' * 105000, '中' * 6000, '👋' * 5000]) {
      final session = _session([_text(text)]);
      expect(session.message, isNull);
      expect(session.files.values.single.file.preview, text);
    }
  });

  test('a peer cannot bypass the preview limit by claiming a small file size', () {
    expect(_session([_text('中' * 6000, size: 1)]).message, isNull);
  });

  test('a large text file with a short preview is still a file', () {
    expect(_session([_text('preview', size: 42 * 1024 * 1024)]).message, isNull);
  });

  test('multiple text files are never treated as an inline message', () {
    expect(_session([_text('one'), _text('two', id: 'other')]).message, isNull);
  });
}
