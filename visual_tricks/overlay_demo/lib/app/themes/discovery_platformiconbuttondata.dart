// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

Color myBackgroundIconButtonColor = Colors.brown.shade900;
Color myDiscoveryTextColor = Colors.blueGrey.shade100;

MaterialIconButtonData myDiscoveryMaterialIconButtonData =
    MaterialIconButtonData(
  color: myBackgroundIconButtonColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  padding: EdgeInsets.zero,
);

CupertinoIconButtonData myDiscoveryCupertinoIconButtonData =
    CupertinoIconButtonData(
  color: myBackgroundIconButtonColor,
);

TextStyle myDiscoveryTextStyle = TextStyle(
  color: myDiscoveryTextColor,
);
