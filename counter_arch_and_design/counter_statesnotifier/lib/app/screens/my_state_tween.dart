// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_statenotifier/app/screens/myhomepage/statecontroller/counter_state_notifier.dart';
import 'package:flutter/animation.dart';

class MyStateTween extends Tween<MyCounterState>{
  MyStateTween({ MyCounterState?  begin,  MyCounterState? end}) : super(begin: begin, end: end);

  @override
  MyCounterState lerp(double t) {
    final countTween = IntTween(begin: begin!.count, end: end!.count);
    // Tween the count
    return MyCounterState(
      countTween.lerp(t),
    );
  }
}