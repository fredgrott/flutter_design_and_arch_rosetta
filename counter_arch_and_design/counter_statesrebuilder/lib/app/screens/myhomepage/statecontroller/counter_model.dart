// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// business logic
class CounterMixin {
  late int counter;
  // ignore: unnecessary_this
  dynamic increment() => this.counter++;
}

// service dto layer
class CounterModel with CounterMixin {
  // ignore: avoid_unused_constructor_parameters
  CounterModel(int counter);
}
