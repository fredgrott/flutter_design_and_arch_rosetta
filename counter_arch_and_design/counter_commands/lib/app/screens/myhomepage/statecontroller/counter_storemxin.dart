// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter_command/flutter_command.dart';

class CounterStoreMixin {

  int counter = 0;


   late Command<void, String> incrementCounterCommand;

}