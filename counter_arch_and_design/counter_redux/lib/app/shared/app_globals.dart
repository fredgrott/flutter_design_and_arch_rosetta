// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_redux/app/screens/myhomepage/statecontroller/counter_reducer.dart';
import 'package:redux/redux.dart';

String myAppTitle = "Flutter Boilerplate";

String myHomepageMessage = "You have pushed the button this many times:";

final store = Store<int>(counterReducer, initialState: 0);

