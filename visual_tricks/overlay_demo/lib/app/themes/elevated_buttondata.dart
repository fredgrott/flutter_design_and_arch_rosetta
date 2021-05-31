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
  foregroundColor: MaterialStateProperty.all<Color>(Colors.amber),
  overlayColor:
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered))
      // ignore: curly_braces_in_flow_control_structures
      return Colors.amberAccent.withOpacity(0.04);

    if (states.contains(MaterialState.focused) ||
        states.contains(MaterialState.pressed))
      // ignore: curly_braces_in_flow_control_structures
      return Colors.amber.withOpacity(0.12);
    // just a dummy so that we do not return null
    return Colors.amber;
  }),
  backgroundColor:
      MaterialStateProperty.all<Color>(myBackgroundElevatedButtonColor),
);

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
