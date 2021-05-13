// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:asset_cache/asset_cache.dart';
import 'package:callback_controller/app/screens/myapp/widgets/callback_animation.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

final byteAssets = ByteDataAssetCache(basePath: 'assets/');

String appTitle = "Callback Controller";

late CallbackAnimation myAnimation;
String riveFileName = 'success_check.riv';

// Has the animation finished
bool isAnimationComplete = false;
late RuntimeArtboard myArtboard;

late ByteData bytes;
