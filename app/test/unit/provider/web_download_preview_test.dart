import 'dart:convert';

import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/state/send/web/web_download_state.dart';
import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:localsend_app/model/state/server/web_share_state.dart';
import 'package:localsend_app/provider/network/server/controller/send_controller.dart';
import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:test/test.dart';

CrossFile _file(String name, String contents, {FileType type = FileType.text}) {
  final bytes = utf8.encode(contents);
  return CrossFile(
    name: name,
    fileType: type,
    size: bytes.length,
    thumbnail: null,
    asset: null,
    path: '/cache/$name',
    bytes: bytes,
    lastModified: null,
    lastAccessed: null,
  );
}

void main() {
  const state = ServerState(
    alias: 'Test device',
    port: 53317,
    https: true,
    session: null,
    web: WebShareDownload(
      state: WebDownloadState(sessions: {}, files: {}, autoAccept: false),
      pin: null,
    ),
  );
  final controller = SendController(
    ServerUtils(
      refFunc: () => throw StateError('An existing share must retain its settings'),
      getState: () => state,
      getStateOrNull: () => state,
      setState: (_) => throw StateError('Building a share must not change server state'),
    ),
  );

  test('a single shared text file embeds its own preview', () async {
    final result = await controller.buildWebDownloadState(files: [_file('message.txt', 'First message')]);
    expect(result.files.values.single.file.preview, 'First message');
  });

  test('multi-file shares embed no previews', () async {
    final result = await controller.buildWebDownloadState(
      files: [
        _file('first.txt', 'First message'),
        _file('second.txt', 'Second message'),
        _file('picture.png', 'binary', type: FileType.image),
      ],
    );
    expect(result.files.values.map((f) => f.file.preview), everyElement(isNull));
  });

  test('large browser shares retain the file contents without embedding a preview', () async {
    final source = _file('long.txt', 'a' * 105000);
    final result = await controller.buildWebDownloadState(files: [source]);
    final file = result.files.values.single;
    expect(file.file.preview, isNull);
    expect(file.bytes, source.bytes);
    expect(file.path, source.path);
    expect(file.file.size, source.size);
  });
}
