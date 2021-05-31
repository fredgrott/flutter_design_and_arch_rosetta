// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Note: material apps still use the typography class for the
//       default text styles which are:
//           BlackMountainView WhiteMountainView android, fuschia
//           BlackRedmond WhiteRedmond MS Windows
//           BlackHelsinki WhiteHelsinki Linux

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TextTheme defines the typography styles defined in MD so this
// just re-assigns those styles to use NotoSans fonts
final TextTheme myMaterialTextTheme = GoogleFonts.notoSansTextTheme(myMaterialFullTextTheme);

// A probable adjustment is to match the letter-spacing of cupertino text settings
TextTheme myMaterialFullTextTheme = const TextTheme(
  headline1: TextStyle(debugLabel: 'headline1', decoration: TextDecoration.none, fontSize: 112.0, fontWeight: FontWeight.w700),
  headline2: TextStyle(debugLabel: 'headline2', decoration: TextDecoration.none, fontSize: 56.0, fontWeight: FontWeight.w600),
  headline3: TextStyle(debugLabel: 'headline3', decoration: TextDecoration.none, fontSize: 45.0, fontWeight: FontWeight.w500),
  headline4: TextStyle(debugLabel: 'headline4', decoration: TextDecoration.none, fontSize: 34.0, fontWeight: FontWeight.normal),
  headline5: TextStyle(debugLabel: 'headline5', decoration: TextDecoration.none, fontSize: 24.0, fontWeight: FontWeight.normal),
  headline6: TextStyle(debugLabel: 'headline6', decoration: TextDecoration.none, fontSize: 20.0, fontWeight: FontWeight.w500),
  bodyText1: TextStyle(debugLabel: 'bodytext1', decoration: TextDecoration.none, fontSize: 14.0, fontWeight: FontWeight.w500),
  bodyText2: TextStyle(debugLabel: 'bodytext2', decoration: TextDecoration.none, fontSize: 14.0, fontWeight: FontWeight.normal),
  subtitle1: TextStyle(debugLabel: 'subtitle1', decoration: TextDecoration.none, fontSize: 16.0, fontWeight: FontWeight.normal),
  subtitle2: TextStyle(debugLabel: 'subtitle2', decoration: TextDecoration.none, fontSize: 14.0, fontWeight: FontWeight.w500),
  caption: TextStyle(debugLabel: 'caption', decoration: TextDecoration.none, fontSize: 12.0, fontWeight: FontWeight.normal),
  button: TextStyle(debugLabel: 'button', decoration: TextDecoration.none, fontSize: 14.0, fontWeight: FontWeight.w500),
  overline: TextStyle(debugLabel: 'overline', decoration: TextDecoration.none, fontSize: 10.0, fontWeight: FontWeight.normal),
);
