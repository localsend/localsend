import 'package:common/isolate.dart';
import 'package:common/src/isolate/child/upload_isolate.dart';
import 'package:common/src/isolate/dto/isolate_task_result.dart';
import 'package:test/test.dart';

void main() {
  test('removes cancel tokens after successful uploads', () async {
    final cancelTokens = <int, CustomCancelToken>{};
    final results = <IsolateTaskStreamResult<double>>[];
    CustomCancelToken? registeredToken;

    await executeHttpUploadTask(
      taskId: 1,
      cancelTokens: cancelTokens,
      upload: (cancelToken) async {
        registeredToken = cancelToken;
        expect(cancelTokens[1], same(cancelToken));
      },
      sendToMain: results.add,
    );

    expect(registeredToken, isNotNull);
    expect(cancelTokens, isEmpty);
    expect(results, hasLength(1));
    expect(results.single.id, 1);
    expect(results.single.done, isTrue);
    expect(results.single.error, isNull);
  });

  test('removes cancel tokens after failed uploads', () async {
    final cancelTokens = <int, CustomCancelToken>{};
    final results = <IsolateTaskStreamResult<double>>[];

    await executeHttpUploadTask(
      taskId: 2,
      cancelTokens: cancelTokens,
      upload: (_) async {
        throw StateError('boom');
      },
      sendToMain: results.add,
    );

    expect(cancelTokens, isEmpty);
    expect(results, hasLength(1));
    expect(results.single.id, 2);
    expect(results.single.done, isTrue);
    expect(results.single.error, 'Bad state: boom');
  });

  test('cancels and removes registered upload tasks', () {
    final cancelTokens = <int, CustomCancelToken>{};
    final cancelToken = CustomCancelToken();
    var canceled = false;

    cancelToken.setCancel(() {
      canceled = true;
    });
    cancelTokens[3] = cancelToken;

    cancelHttpUploadTask(
      taskId: 3,
      cancelTokens: cancelTokens,
    );

    expect(canceled, isTrue);
    expect(cancelTokens, isEmpty);
  });
}
