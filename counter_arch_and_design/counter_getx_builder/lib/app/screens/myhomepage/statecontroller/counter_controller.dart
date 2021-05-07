// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:get/get.dart';

class CounterController extends GetxController{


  int counter = 0;

  void increment() {
    counter++;
    update(); // look here!
  }

}