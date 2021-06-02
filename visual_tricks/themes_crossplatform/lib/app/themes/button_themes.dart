// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Color myBackgroundElevatedButtonColor = Colors.amber.shade900;

MaterialElevatedButtonData myMaterialElevatedButtonData =
    MaterialElevatedButtonData(
  style: myMaterialElevatedButtonStyle,
);

ButtonStyle myMaterialElevatedButtonStyle = ButtonStyle(
  visualDensity: VisualDensity.adaptivePlatformDensity,
    
    backgroundColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
  if (states.contains(MaterialState.hovered)) {
    return myBackgroundElevatedButtonColor.withOpacity(0.04);
  }
  if (states.contains(MaterialState.focused) ||
      states.contains(MaterialState.pressed)) {
    return myBackgroundElevatedButtonColor.withOpacity(0.12);
  }

  return myBackgroundElevatedButtonColor;
}),);

TextStyle myElevatedButtonTextStyle = GoogleFonts.notoSans(
    // ignore: prefer-trailing-comma
    textStyle: const TextStyle(
  inherit: false,
  color: Colors.brown,
  letterSpacing: -0.24,
  fontStyle: FontStyle.italic,
  // ignore: prefer-trailing-comma
  fontSize: 10.0,
));

Color myBackgroundIconButtonColor = Colors.amber.shade800;
Color myDiscoveryTextColor = Colors.brown.shade200;

MaterialIconButtonData myDiscoveryMaterialIconButtonData =
    MaterialIconButtonData(
  color: myBackgroundIconButtonColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  padding: EdgeInsets.zero,
  // ignore: prefer-trailing-comma
  icon: Icon(Icons.add_circle_rounded, color: myBackgroundIconButtonColor,),
);

CupertinoIconButtonData myDiscoveryCupertinoIconButtonData =
    CupertinoIconButtonData(
  color: myBackgroundIconButtonColor,
  padding: EdgeInsets.zero,
  icon: Icon(Icons.add_circle_rounded, color: myBackgroundIconButtonColor,),
);

TextStyle myDiscoveryTextStyle = TextStyle(
  color: myDiscoveryTextColor,
);