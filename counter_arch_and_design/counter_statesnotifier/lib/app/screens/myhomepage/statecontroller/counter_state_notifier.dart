// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_statenotifier/app/shared/init_log.dart';
import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';

// For both ChangeNotifier and StatesNotifier you should be do this exact 
// set of oop patterns. 

abstract class CounterLogger {
  void countChanged(int count);
}

class MyCounterState {
  MyCounterState(this.count);
  final int count;
}

class MyCounterStateNotifier extends StateNotifier<MyCounterState>
    with LocatorMixin {
  MyCounterStateNotifier() : super(MyCounterState(0));

  void increment() {
    state = MyCounterState(state.count + 1);
  }

  @override
  @protected
  set state(MyCounterState value) {
    if (state.count != value.count) {
      read<CounterLogger>().countChanged(value.count);
    }
    super.state = value;
  }
}

class CounterConsoleLogger implements CounterLogger {
  @override
  void countChanged(int count) {
    // ignore: avoid_print
    logger.info('Count changed $count');
  }
}