// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';



String appTitle = "Mixing Animations";

String riveFileName = 'assets/off_road_car_0_6.riv';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();



// Has the animation finished
bool isAnimationComplete = false;
late Artboard myArtboard;


