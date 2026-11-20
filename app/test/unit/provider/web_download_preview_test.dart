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

  test('each shared file receives its own preview instead of the first file preview', () async {
    final result = await controller.buildWebDownloadState(
      files: [
        _file('first.txt', 'First message'),
        _file('second.txt', 'Second message'),
        _file('picture.png', 'binary', type: FileType.image),
      ],
    );
    final files = result.files.values.toList();
    expect(files[0].file.preview, 'First message');
    expect(files[1].file.preview, 'Second message');
    expect(files[2].file.preview, isNull);
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
