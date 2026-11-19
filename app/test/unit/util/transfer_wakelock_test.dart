import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/util/native/transfer_wakelock.dart';

void main() {
  test(
    'finishing before the platform grants the wake lock still releases it',
    () async {
      final requested = Completer<void>();
      final granted = Completer<void>();
      final calls = <bool>[];
      final wakelock = TransferWakelock(
        toggle: ({required enable}) async {
          calls.add(enable);
          if (enable) {
            requested.complete();
            await granted.future;
          }
        },
      );
      final page = Object();

      unawaited(wakelock.update(page, active: true));
      await requested.future;
      final finished = wakelock.update(page, active: false);
      unawaited(wakelock.update(page, active: false));
      expect(calls, [true]);
      granted.complete();
      await finished;

      expect(calls, [true, false]);
    },
  );

  test(
    'holds one wake lock until the last active progress page finishes',
    () async {
      final calls = <bool>[];
      final wakelock = TransferWakelock(
        toggle: ({required enable}) async => calls.add(enable),
      );
      final first = Object();
      final second = Object();

      await wakelock.update(first, active: true);
      await wakelock.update(first, active: true);
      await wakelock.update(second, active: true);
      await wakelock.update(first, active: false);
      await wakelock.update(first, active: false);
      expect(calls, [true]);

      await wakelock.update(second, active: false);
      expect(calls, [true, false]);
    },
  );
}
