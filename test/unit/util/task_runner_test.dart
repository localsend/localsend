import 'package:localsend_app/util/sleep.dart';
import 'package:localsend_app/util/task_runner.dart';
import 'package:test/test.dart';

void main() {
  group('TaskRunner', () {
    test('should run all tasks in parallel', () async {
      final results = TaskRunner<String?>(
        concurrency: 10,
        initialTasks: [
          for (final data in [
            [10, null],
            [30, 'a'],
            [20, 'b'],
            [40, 'c']
          ])
            () async {
              final delay = data[0] as int;
              final result = data[1] as String?;
              await sleepAsync(delay);
              return result;
            },
        ],
      ).stream;

      String? finalResult;

      await results.forEach((result) {
        if (finalResult == null && result != null) {
          finalResult = result;
        }
      });

      expect(finalResult, 'b');
    });
  });
}
