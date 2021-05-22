// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_statesrebuilder/app/screens/myhomepage/statecontroller/counter_model.dart';
import 'package:lumberjack/lumberjack.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final model = RM.inject<CounterModel>(
  () => CounterModel(0), 
  undoStackLength: 8,
  //Called after new state calculation and just before state mutation
  middleSnapState: (MiddleSnapState middleSnap){
    //Log all state transition.
    logger.info(middleSnap.currentSnap);
    logger.info(middleSnap.nextSnap);

    

    //Can return another state
  }
);