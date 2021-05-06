// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:counter_redux/app/screens/myhomepage/statecontroller/actions.dart';

int counterReducer(int state, dynamic action) {
  if (action == Actions.increment) {
    return state + 1;
  }

  return state;
}
