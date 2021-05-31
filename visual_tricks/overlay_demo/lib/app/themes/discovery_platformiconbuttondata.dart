// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

Color myBackgroundIconButtonColor = Colors.amber.shade800;
Color myDiscoveryTextColor = Colors.brown.shade200;

MaterialIconButtonData myDiscoveryMaterialIconButtonData =
    MaterialIconButtonData(
  color: myBackgroundIconButtonColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  padding: EdgeInsets.zero,
  icon: Icon(Icons.add_circle_rounded, color: myBackgroundIconButtonColor,)
);

CupertinoIconButtonData myDiscoveryCupertinoIconButtonData =
    CupertinoIconButtonData(
  color: myBackgroundIconButtonColor,
  padding: EdgeInsets.zero,
  icon: Icon(Icons.add_circle_rounded, color: myBackgroundIconButtonColor,)
);

TextStyle myDiscoveryTextStyle = TextStyle(
  color: myDiscoveryTextColor,
);
