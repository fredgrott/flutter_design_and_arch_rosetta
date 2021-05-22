// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:lumberjack/lumberjack.dart';
import 'package:reactive_component/reactive_component.dart';

class Counter with ReactiveComponent {
  Counter(this.initialCount);

  final int initialCount;

  late VoidReactiveSink increment;
  VoidReactiveSink get myIncrement => increment = VoidReactiveSink(() {
        myCount.data++;
        logger.info("count increased by one");
      }, disposer: disposer);
  late Reactive<int> myCount = Reactive<int>(initialCount, disposer: disposer);
  Reactive<int> get count => myCount;

  Stream<int> get ourCount => myCount.stream;
}
