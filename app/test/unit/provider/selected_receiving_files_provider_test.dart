import 'package:localsend_app/provider/selection/selected_receiving_files_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:test/test.dart';

void main() {
  test('pads counters to the width of the file count', () {
    final service = Notifier.test(
      notifier: SelectedReceivingFilesNotifier(),
      initialState: {for (var i = 0; i < 12; i++) '$i': 'original-$i.txt'},
    );

    service.notifier.applyCounter(prefix: 'file-', padZero: true, sortFirst: false);

    expect(service.state.values, [
      'file-01.txt',
      'file-02.txt',
      'file-03.txt',
      'file-04.txt',
      'file-05.txt',
      'file-06.txt',
      'file-07.txt',
      'file-08.txt',
      'file-09.txt',
      'file-10.txt',
      'file-11.txt',
      'file-12.txt',
    ]);
  });
}
