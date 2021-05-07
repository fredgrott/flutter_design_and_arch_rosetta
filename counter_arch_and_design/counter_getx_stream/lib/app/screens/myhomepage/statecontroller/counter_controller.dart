// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:get/get.dart';

// this has some impl and performance considerations
//https://github.com/jonataslaw/getx/issues/184

class CounterController extends RxController {
  final dynamic  _number = 0.reactive;
  dynamic get count => _number.value;
  set count(dynamic value) => _number.value = value;

  static CounterController get to => Get.find();

  void increment() {
    count++;

    
  }
}
