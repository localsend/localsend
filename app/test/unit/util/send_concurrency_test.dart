import 'package:localsend_app/model/send_concurrency.dart';
import 'package:localsend_isolates/constants.dart';
import 'package:test/test.dart';

void main() {
  group('sanitizeSendConcurrency', () {
    test('falls back to the default when nothing is stored', () {
      expect(sanitizeSendConcurrency(null), defaultSendConcurrency);
    });

    test('keeps a stored value that is offered by the settings', () {
      for (final concurrency in sendConcurrencyOptions) {
        expect(sanitizeSendConcurrency(concurrency), concurrency);
      }
    });

    test('falls back to the default for a value outside the offered range', () {
      expect(sanitizeSendConcurrency(0), defaultSendConcurrency);
      expect(sanitizeSendConcurrency(-1), defaultSendConcurrency);
      expect(sanitizeSendConcurrency(42), defaultSendConcurrency);
    });

    test('never offers a concurrency below one', () {
      expect(sendConcurrencyOptions.every((concurrency) => concurrency >= 1), isTrue);
    });
  });
}
