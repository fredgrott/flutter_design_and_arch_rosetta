// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_provider_states/app/screens/myhomepage/statecontroller/my_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


void main() {
  test('increment/decrement update count and log change', () {
    final  logger = LoggerMock();
    final myNotifier = MyStateNotifier()..debugMockDependency<CounterLogger>(logger);

    expect(myNotifier.debugState.count, 0);

    myNotifier.increment();

    expect(myNotifier.debugState.count, 1000);

    verify(()=>logger.countChanged(1000)).called(1);
    
    verifyNoMoreInteractions(logger);
  });
}

class LoggerMock extends Mock implements CounterLogger {}
