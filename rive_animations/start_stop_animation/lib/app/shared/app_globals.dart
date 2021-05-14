// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:asset_cache/asset_cache.dart';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';


final byteAssets = ByteDataAssetCache(basePath: 'assets/');

String appTitle = "Start and Stop a Looping Animation";

String riveFileName = '224-424-luke-vs-darth.riv';

// so that we have the right way to grab this for widget testing
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();




// Has the animation finished
bool isAnimationComplete = false;


late ByteData? bytes;
