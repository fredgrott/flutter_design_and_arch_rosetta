// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';

Future<void> Function() harness(
    // ignore: prefer-trailing-comma
    UnitTestHarnessCallback<_UnitTestHarness> callback) {
  return () => givenWhenThenUnitTest(_UnitTestHarness(), callback);
}

class _UnitTestHarness {
  _UnitTestHarness() : super();

  int counter = 0;
}

extension CounterGiven on UnitTestGiven<_UnitTestHarness> {
  void preConditionCounterZero() {
    this.harness.counter = 0;
  }
}

extension CounterWhen on UnitTestWhen<_UnitTestHarness> {
  Future<void> userPerformsSomeActionCounterIncreases() async {
    this.harness.counter++;
  }
}

extension CounterThen on UnitTestThen<_UnitTestHarness> {
  void makeSomeAssertionCounterIs() {
    expect(this.harness.counter, equals(1));
  }
}

