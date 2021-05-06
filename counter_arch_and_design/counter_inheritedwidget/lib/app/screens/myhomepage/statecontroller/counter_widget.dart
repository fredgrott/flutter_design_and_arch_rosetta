// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:counter_inheritedwidget/app/screens/myhomepage/statecontroller/counter_state.dart';
import 'package:flutter/widgets.dart';

class CounterWidget extends StatefulWidget {

  const CounterWidget({required Key key, required this.child}) : super(key: key);

  final Widget child;

  @override
  CounterState createState() => CounterState();
}