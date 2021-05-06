// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_getit/app/shared/app_globals.dart';
import 'package:flutter/widgets.dart';


abstract class CounterStoreModel extends ChangeNotifier {
  void incrementCounter();

  int get counter;
}

class CounterStoreModelImplementation extends CounterStoreModel {
  int _counter = 0;

  CounterStoreModelImplementation() {
    /// lets pretend we have to do some async initialization
    Future<dynamic>.delayed(const Duration(seconds: 3))
        .then<dynamic>((dynamic _) => getIt.signalReady(this));
  }

  @override
  
  int get counter => _counter;

  @override
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
