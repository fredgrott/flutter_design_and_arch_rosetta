// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'counter_model_unit_test_support.dart';

void main() {
  // ignore: no-empty-block
  setUpAll(() async {});

  setUp(() async {
    // ignore: unused_local_variable
    final WidgetsBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
  });

  // ignore: no-empty-block
  tearDownAll(() async {});

  // ignore: no-empty-block
  tearDown(() async {
    // Code that clears caches can go here
  });

  group('CounterMixin Model tests', () {

    // ignore: no-empty-block
    setUp( () async {
        // For example, each test could start at the FooHomePage
      
       
   });


    
    // ignore: no-empty-block
    tearDownAll(() async {});

    // ignore: no-empty-block
    tearDown(() async {});

    
    // Uses counter_unit_test_support ie test suite support so that 
    // we can unit test our CounterMixin model
    test('CounterModel tests', harness((given, when, then) async {
      given.preConditionCounterZero();
      await when.userPerformsSomeActionCounterIncreases();
      then.makeSomeAssertionCounterIs();
    }));

    
  });
}