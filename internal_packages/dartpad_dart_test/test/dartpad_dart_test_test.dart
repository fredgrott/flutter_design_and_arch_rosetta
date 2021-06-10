

import 'package:test/test.dart';
import 'package:matcher/matcher.dart';
import 'package:dartpad_dart_test/dartpad_dart_test.dart' as dpt;


void main() {
  group('expect tests', () {
    test('Continues after simple success', () async {
      await dpt.expect('123', '123');
    });

    test('Throws TestFailure for simple failure', () {
      expect(
        () async {
          await dpt.expect('wrong', 'right');
        },
        throwsA(const TypeMatcher<dpt.TestFailure>()),
      );
    });

    test('Throws TestFailure with correct hint', () {
      expect(
        () async {
          await dpt.expect(
            'wrong',
            'right',
            hints: [const dpt.PossibleHint('wrong', 'msg')],
          );
        },
        throwsA(
          predicate<dpt.TestFailure>(
              (f) => f.hint == 'msg', "a TestFailure with a hint of 'msg'"),
        ),
      );
    });
  });

  group('CompletionMatcher tests', () {
    test('Returns success for a basic future', () async {
      final result =
          await dpt.completion('right').matchAsync(Future.value('right'));
      expect(result.isMatch, true);
    });

    test('throws for incorrect future', () async {
      final result =
          await dpt.completion('right').matchAsync(Future.value('wrong'));
      expect(result.isMatch, false);
    });

    test('throws for null', () async {
      final result = await dpt.completion('right').matchAsync(null);
      expect(result.isMatch, false);
    });

    test('throws for sync value', () async {
      final result = await dpt.completion('right').matchAsync('right');
      expect(result.isMatch, false);
    });
  });

  // No-op logger functions used to spare the console all the extra output
  group('test method integration tests', () {
    test('Simple test that should pass', () async {
      final testFn = dpt.test(
        'description',
        () async {
          await dpt.expect('right', 'right');
        },
        logFn: (s) {},
      );

      final result = await testFn();

      expect(result.success, true);
    });

    test('Simple test that should fail', () async {
      final testFn = dpt.test(
        'description',
        () async {
          await dpt.expect('wrong', 'right');
        },
        logFn: (s) {},
      );

      final result = await testFn();

      expect(result.success, false);
    });

    test('Method that throws should fail', () async {
      final testFn = dpt.test(
        'description',
        () async {
          // ignore: dead_code
          await dpt.expect(throw 'I am error', 'right');
        },
        logFn: (s) {},
      );

      final result = await testFn();

      expect(result.success, false);
    });

    test('Async test that should pass', () async {
      final testFn = dpt.test(
        'description',
        () async {
          await dpt.expect(Future.value('right'), dpt.completion('right'));
        },
        logFn: (s) {},
      );

      final result = await testFn();

      expect(result.success, true);
    });

    test('Async test that should fail', () async {
      final testFn = dpt.test(
        'description',
        () async {
          await dpt.expect(Future.value('wrong'), dpt.completion('right'));
        },
        logFn: (s) {},
      );

      final result = await testFn();

      expect(result.success, false);
    });

    test('Async method that throws should fail', () async {
      final testFn = dpt.test(
        'description',
        () async {
          await dpt.expect(Future(() => throw 'I am error'), 'right');
        },
        logFn: (s) {},
      );

      final result = await testFn();

      expect(result.success, false);
    });
  });
}
