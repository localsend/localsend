import 'package:localsend_app/config/init.dart';
import 'package:test/test.dart';

void main() {
  test('starts the receive server during desktop pre-initialization', () async {
    var startCount = 0;
    Object? reportedError;

    await startReceiveServerDuringPreInit(
      isDesktop: true,
      startServer: () async {
        startCount++;
      },
      onError: (error, stackTrace) {
        reportedError = error;
      },
    );

    expect(startCount, 1);
    expect(reportedError, isNull);
  });

  test('does not start the receive server during mobile pre-initialization', () async {
    var startCount = 0;

    await startReceiveServerDuringPreInit(
      isDesktop: false,
      startServer: () async {
        startCount++;
      },
      onError: (error, stackTrace) {
        fail('Unexpected error: $error');
      },
    );

    expect(startCount, 0);
  });

  test('reports desktop receive server failures without aborting initialization', () async {
    final expectedError = StateError('failed to bind');
    Object? reportedError;
    StackTrace? reportedStackTrace;

    await startReceiveServerDuringPreInit(
      isDesktop: true,
      startServer: () async {
        throw expectedError;
      },
      onError: (error, stackTrace) {
        reportedError = error;
        reportedStackTrace = stackTrace;
      },
    );

    expect(reportedError, same(expectedError));
    expect(reportedStackTrace, isNotNull);
  });
}
