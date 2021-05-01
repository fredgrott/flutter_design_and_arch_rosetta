// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:counter_mvvm_plain/app/shared/log_pens.dart';
import 'package:counter_mvvm_plain/app/shared/logger_types.dart';

class CounterViewModel {
  final _counterController = StreamController<int>.broadcast();

  int _counter = 0;

  void dispose() => _counterController.close();

  Stream<int> get streamCounter => _counterController.stream.map((val) {
        logAFunction("get streamCounter in CounterViewModel").info(penInfo(" _counter incremented by one"));
        return _counter += val;
      });

  Sink get sinkCounter => _counterController;
}
