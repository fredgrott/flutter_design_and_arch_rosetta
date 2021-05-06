// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:mobx/mobx.dart';

class CounterStore {
  
  late Action increment;

  CounterStore() {
     // ignore: unused_local_variable
    late final increment = Action(_increment);
  }

  final   _value = Observable(0);
  int get value => _value.value;

  set value(int newValue) => _value.value = newValue;
  

  void _increment() {
    _value.value++;
  }
}