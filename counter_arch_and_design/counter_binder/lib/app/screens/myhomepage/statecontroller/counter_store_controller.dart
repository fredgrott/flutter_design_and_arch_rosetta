// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:binder/binder.dart';

final counterRef = StateRef(0);
final homeLogicRef = LogicRef((scope) => HomeLogic(scope));

class HomeLogic with Logic {
  HomeLogic(this.scope);

  @override
  final Scope scope;

  void increment() {
    update(counterRef, (int x) => x + 1);
  }
}