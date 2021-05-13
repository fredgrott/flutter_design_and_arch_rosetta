// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:asset_cache/asset_cache.dart';

import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

final byteAssets = ByteDataAssetCache(basePath: 'assets/');

String appTitle = "Start and Stop a Looping Animation";

String riveFileName = 'off_road_car_0_6.riv';




// Has the animation finished
bool isAnimationComplete = false;
late Artboard myArtboard;

late ByteData bytes;
