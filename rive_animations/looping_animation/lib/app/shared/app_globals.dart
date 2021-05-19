// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';



String appTitle = "Looping Animation";

String riveFileName = 'assets/224-424-luke-vs-darth-0.7.9.riv';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();



// Has the animation finished
bool isAnimationComplete = false;
late Artboard myArtboard;


