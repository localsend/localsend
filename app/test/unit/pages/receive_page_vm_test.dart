import 'package:localsend_app/pages/receive_page.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:test/test.dart';

void main() {
  test('Should mask a message the sender marked secret', () {
    expect(_createVm(message: 'password', secret: true).secret, true);
  });

  test('Should not mask a regular message', () {
    expect(_createVm(message: 'hello', secret: false).secret, false);
  });

  test('Should not mask files, only messages', () {
    expect(_createVm(message: null, secret: true).secret, false);
  });
}

ReceivePageVm _createVm({required String? message, required bool secret}) {
  return ReceivePageVm(
    status: SessionStatus.waiting,
    sender: const Device(
      signalingId: null,
      ip: '0.0.0.0',
      version: '2.1',
      port: 53317,
      https: true,
      fingerprint: 'fingerprint',
      alias: 'alias',
      deviceModel: null,
      deviceType: DeviceType.desktop,
      download: false,
      channels: [],
    ),
    showSenderInfo: false,
    files: [
      FileDto(
        id: 'id',
        fileName: 'message.txt',
        size: 8,
        fileType: FileType.text,
        hash: null,
        preview: message,
        metadata: null,
        secret: secret,
      ),
    ],
    message: message,
    onAccept: () {},
    onDecline: () {},
    onClose: () {},
  );
}
