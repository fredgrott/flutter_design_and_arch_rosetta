// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.




import 'package:flutter/widgets.dart';

// to use with asset_cache plugin


String appTitle = "Start and Stop a Looping Animation";

// just in case we have more breaking changes with the rive engine
String riveFileName = 'assets/224-424-luke-vs-darth-0.7.9.riv';

// so that we have the right way to grab this for widget testing
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();




// Has the animation finished
bool isAnimationComplete = false;



