// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_mvc_plain/app/data/models/counter_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class MyHomePageController extends ControllerMVC {
  factory MyHomePageController() {
    // ignore: join_return_with_assignment
    //_this ??= MyHomePageController._();
    return _this;
  }

  static late MyHomePageController _this;

  // ignore: unused_element
  MyHomePageController._();

  static MyHomePageController get myHomePageController => _this;

  int get displayThis => _counter;
  late int _counter;

  @override
  initState(){
    /// Demonstrating how the 'initState()' is easily implemented.
    _counter = CounterModel.counter;
  }

  void whatever(){
    /// The Controller knows how to 'talk to' the Model. It knows the name, but Model does the work.
    _counter = CounterModel.incrementCounter();
  }
}
