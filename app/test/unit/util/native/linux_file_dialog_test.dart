import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/util/native/linux_file_dialog.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('org.localsend.localsend_app/file_dialog');
  final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  tearDown(() {
    messenger.setMockMethodCallHandler(channel, null);
  });

  test('openFilesLinux sends the literal labels and returns the selected paths', () async {
    MethodCall? call;
    messenger.setMockMethodCallHandler(channel, (methodCall) async {
      call = methodCall;
      return ['/tmp/a.txt', '/tmp/b.txt'];
    });

    final paths = await openFilesLinux(title: 'Open file', acceptLabel: 'Open', cancelLabel: 'Cancel');

    expect(call?.method, 'openFiles');
    expect(call?.arguments, {
      'title': 'Open file',
      'acceptLabel': 'Open',
      'cancelLabel': 'Cancel',
    });
    expect(paths, ['/tmp/a.txt', '/tmp/b.txt']);
  });

  test('openFilesLinux treats an empty result as cancellation', () async {
    messenger.setMockMethodCallHandler(channel, (methodCall) async => <String>[]);

    expect(await openFilesLinux(title: 'Open file', acceptLabel: 'Open', cancelLabel: 'Cancel'), isEmpty);
  });

  test('pickDirectoryLinux returns null when the dialog is cancelled', () async {
    messenger.setMockMethodCallHandler(channel, (methodCall) async => <String>[]);

    expect(await pickDirectoryLinux(title: 'Folder', acceptLabel: 'Open', cancelLabel: 'Cancel'), isNull);
  });

  test('pickDirectoryLinux returns the selected directory', () async {
    messenger.setMockMethodCallHandler(channel, (methodCall) async => ['/home/user/Documents']);

    expect(await pickDirectoryLinux(title: 'Folder', acceptLabel: 'Open', cancelLabel: 'Cancel'), '/home/user/Documents');
  });

  test('propagates platform errors so the caller can fall back', () async {
    messenger.setMockMethodCallHandler(channel, (methodCall) async {
      throw PlatformException(code: 'file_dialog_failed');
    });

    await expectLater(
      openFilesLinux(title: 'Open file', acceptLabel: 'Open', cancelLabel: 'Cancel'),
      throwsA(isA<PlatformException>()),
    );
  });
}
