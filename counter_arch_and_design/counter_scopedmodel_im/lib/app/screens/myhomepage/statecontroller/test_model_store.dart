// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:counter_scopedmodel_im/app/screens/myhomepage/statecontroller/abstract_model_store.dart';

class TestModelStore extends AbstractModelStore {
  int _counter = 111;

  @override
  int get counter => _counter;

  @override
  void increment() {
    _counter += 2;
    notifyListeners();
  }
}