// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_provider_states/app/shared/init_log.dart';
import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';

abstract class CounterLogger {
  int countChanged(int count);
}

class MyState {
  final int count;
  MyState(this.count);
}

class MyStateNotifier extends StateNotifier<MyState> with LocatorMixin {
  MyStateNotifier() : super(MyState(0));

  void increment() {
    state = MyState(state.count + 1000);
  }

  @override
  @protected
  set state(MyState value) {
    super.state = value;
  }
}

class CounterConsoleLogger implements CounterLogger {
  @override
  int countChanged(int count) {
    // ignore: avoid_print
    logger.info('Count changed $count');

    return count;
  }
}
