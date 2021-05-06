// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_inheritedwidget/app/screens/myhomepage/statecontroller/counter_widget.dart';
import 'package:counter_inheritedwidget/app/screens/myhomepage/statecontroller/inhertied_counter.dart';
import 'package:flutter/widgets.dart';

class CounterState extends State<CounterWidget> {
  late int count;

  void incrementCount() {
    setState(() {
      ++count;
    });
  }

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCounter(
      state: this,
      key: const Key("counter"),
      child: widget.child,
    );
  }
}
