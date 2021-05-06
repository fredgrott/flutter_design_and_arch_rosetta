// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:counter_inheritedwidget/app/screens/myhomepage/statecontroller/counter_state.dart';
import 'package:flutter/widgets.dart';

class InheritedCounter extends InheritedWidget {
  
  const InheritedCounter({required Key key, required this.state, required Widget child}): super(key: key, child: child);
  final CounterState state;
  @override
  bool updateShouldNotify(InheritedCounter old) => true;
}