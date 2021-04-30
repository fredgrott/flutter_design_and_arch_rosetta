// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore: avoid_classes_with_only_static_members
class CounterModel{

  static int get counter => _counter;
  static int _counter = 0;

  static int incrementCounter(){
    return ++_counter;
  }
}