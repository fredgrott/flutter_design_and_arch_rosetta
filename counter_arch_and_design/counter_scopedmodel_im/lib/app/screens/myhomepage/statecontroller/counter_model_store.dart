// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:counter_scopedmodel_im/app/screens/myhomepage/statecontroller/abstract_model_store.dart';

class CounterModelStore extends AbstractModelStore {
  int _counter = 0;

  @override
  int get counter => _counter;

  
  
  @override
  // ignore: avoid_void_async
  void increment() async {
    // First, increment the counter
    _counter++;

    // needed for simulate an async action like an http request ...
    await Future<dynamic>.delayed(const Duration(seconds: 1));

    // Then notify all the listeners.
    notifyListeners();
  }
}