// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// plain data class
class CounterModel {
  late int counter;

  CounterModel(this.counter);
}

// business logic, ie the service layer
extension CounterModelX on CounterModel {
  // ignore: unnecessary_this
  int increment() => this.counter++;
}

