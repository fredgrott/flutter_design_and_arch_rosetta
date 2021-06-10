// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// Modified from the Dark project
// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:matcher/matcher.dart';

import 'matchers.dart';

/// The result of a single test.
class TestResult {
  // ignore: avoid_positional_boolean_parameters
  const TestResult(this.success, this.messages);

  final bool success;
  final List<String> messages;
}

/// A hint that should be shown to the user upon failing an [expect] check, if
/// [unwrappedMatcher] matches the failing value
class PossibleHint {
  const PossibleHint(this.unwrappedMatcher, this.message);

  final dynamic unwrappedMatcher;
  final String message;
}

/// Exception object thrown by [expect] when its matcher fails to match an item.
class TestFailure {
  const TestFailure(this.log, [this.hint = '']);

  final String log;
  final String hint;
}

/// A function suitable for testing by the [test] method.
typedef TestableFunction = Future<void> Function();

/// Logs a string in an unspecified way (Dart's print method, for instance).
typedef LoggerFunction = void Function(String msg);

/// A function created by [test], which will execute a single test and return
/// the result.
typedef TestRunnerFunction = Future<TestResult> Function();

/// Reports test results to the user.
typedef TestReporterFunction = void Function(List<TestResult>);

// A default [TestReportFunction] that prints a basic summary.
void _reportResults(List<TestResult> results) {
  print('REPORTED RESULTS:');
  // ignore: avoid_function_literals_in_foreach_calls
  results.forEach(
      (result) => log('RESULT ${result.success} -- ${result.messages}'));
}

/// Executes a group of [test]-created [TestRunnerFunction]s serially, then
/// reports the results via [reporter].
Future<void> group(
  String description,
  List<TestRunnerFunction> tests, {
  TestReporterFunction reporter = _reportResults,
}) async {
  final results = <TestResult>[];

  for (final test in tests) {
    results.add(await test());
  }

  reporter(results);
}

/// Creates a single test that will execute [fn].
///
/// Test authors should use [expect] to check for success/failure inside the
/// functions passed as [fn]. Any errors thrown during [fn]'s execution will be
/// treated as failed tests. If nothing is thrown, the test is considered
/// successful.
TestRunnerFunction test(
  String description,
  TestableFunction fn, {
  String successMessage = 'Test passed!',
  String defaultHintMessage =
      'Not quite right. Keep trying, and check the console for details.',
  LoggerFunction logFn = print,
}) {
  assert(description != null);
  assert(fn != null);
  assert(successMessage != null);
  assert(defaultHintMessage != null);
  assert(logFn != null);

  return () => runZoned(() async {
        logFn('TEST: $description');

        try {
          await fn();
        } on TestFailure catch (failure) {
          logFn('TEST FAILED - ${failure.hint}');
          logFn(failure.log);
          return TestResult(false, [failure.hint]);
        } catch (err) {
          logFn('TEST FAILED');
          logFn('Error thrown by test: $err');
          return const TestResult(false, [
            // ignore: no_adjacent_strings_in_list
            'An error was thrown by the test. Check '
                'the console for details.'
          ]);
        }

        logFn('TEST PASSED');

        return TestResult(true, [successMessage]);
        // need to change this to a runZonedGuarded impl
      }, onError: (dynamic err) {
        // It's possible that some un-awaited async action spawned during the
        // execution of [fn] above could throw an error after [test]
        // returns. By wrapping its body in [runZoned] and using the [onError]
        // property, these errors can be caught and gracefully ignored.
      });
}

/// Checks [item] against [unwrappedSuccessMatcher] and an optional list of
/// [PossibleHint]s to determine whether a test should continue toward success
/// or immediately fail.
///
/// This function is intended to be executed inside functions given to [test] as
/// its [fn] argument. If [unwrappedSuccessMatcher] matches [item], the Future
/// returned by [expect] completes without an an error, allowing [fn] to
/// continue executing (as it should during a successful test).
///
/// If [unwrappedSuccessMatcher] does not match [item], [item] is tested against
/// the [unwrappedMatcher] in each [PossibleHint]. As soon as one matches, a
/// [TestFailure] is thrown with the matching hint message. If none is found,
/// [TestFailure] is thrown with an empty hint message.
///
/// Functions calling [expect] *must* await the Future it returns to guarantee
/// [expect] has a chance to check for both success and failure.
Future<void> expect(
  dynamic item,
  dynamic unwrappedSuccessMatcher, {
  List<PossibleHint> hints = const [],
}) async {
  final successMatcher = (unwrappedSuccessMatcher is AsyncMatcher)
      ? unwrappedSuccessMatcher
      : MatcherToAsyncMatcherAdapter(unwrappedSuccessMatcher);

  // Attempt to match the result against the success matcher.
  final successResults = await successMatcher.matchAsync(item);

  if (!successResults.isMatch) {
    final matcherDescription = StringDescription();
    final mismatchDescription = StringDescription();

    successMatcher.describe(matcherDescription);
    successMatcher.describeMismatch(
        item, mismatchDescription, successResults.matchState, false);

    final logMsg =
        _formatFailure(matcherDescription, item, mismatchDescription);
    var hintMsg = '';

    // Result wasn't successful, so find the first possible hint that
    // matches.
    for (final hint in hints) {
      final hintMatcher = (hint.unwrappedMatcher is AsyncMatcher)
          ? hint.unwrappedMatcher as AsyncMatcher
          : MatcherToAsyncMatcherAdapter(hint.unwrappedMatcher);
      final matchResult = await hintMatcher.matchAsync(item);

      if (matchResult.isMatch) {
        hintMsg = hint.message;
        break;
      }
    }

    throw TestFailure(logMsg, hintMsg);
  }
}

// Pretty-prints a failed match from [expect] into a String so that it can be
// returned in a [TestFailure].
String _formatFailure(Description matcherDescription, dynamic expected,
    Description mismatchDescription) {
  final buffer = StringBuffer();
  final pretty = StringDescription().addDescriptionOf(expected).toString();

  buffer.writeln('Expected: $matcherDescription');
  buffer.writeln('  Actual: $pretty');

  if (mismatchDescription.length > 0) {
    buffer.writeln('   Which: ${mismatchDescription.toString()}');
  }

  return buffer.toString();
}
