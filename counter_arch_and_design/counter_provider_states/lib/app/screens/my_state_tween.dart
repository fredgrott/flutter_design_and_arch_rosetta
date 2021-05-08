// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:counter_provider_states/app/screens/myhomepage/statecontroller/my_state_notifier.dart';
import 'package:flutter/animation.dart';

class MyStateTween extends Tween<MyState> {
  MyStateTween({MyState? begin,  MyState? end}) : super(begin: begin, end: end);

  @override
  MyState lerp(double t) {
    final countTween = IntTween(begin: begin!.count, end: end!.count);
    // Tween the count
    return MyState(
      countTween.lerp(t),
    );
  }
}