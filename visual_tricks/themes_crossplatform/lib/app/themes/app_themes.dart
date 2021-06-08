// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:themes_crossplatform/app/shared/app_globals.dart';
import 'package:themes_crossplatform/app/themes/app_color_schemes.dart';


import 'package:themes_crossplatform/app/themes/card_theme.dart';

// Gist: Google does not document this in the flutter docs. The way to theme
//       CupertinoApps is use the MaterialBasedCupertinoThemeData to copy the
//       appropriate color stuff from Material's ThemeData which happens to be
//       populated from Material's ColorScheme.
//
//       
//       
late final MaterialBasedCupertinoThemeData cupertinoThemeData = MaterialBasedCupertinoThemeData(materialTheme: materialTheme);

// should be able to define one colorscheme and the material Theme infrastructure figures out things 
// for light, high contrast light and high contrast dark
ThemeData materialTheme = ThemeData(
  brightness: appBrightness,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  //buttonTheme: ,
  cardTheme: myCardTheme,
  //elevatedButtonTheme: ,
 
  //toggleButtonsTheme: ,
  //scaffoldBackgroundColor: C,
  //canvasColor: ,
  //shadowColor: ,
  colorScheme: myCupertinoColorScheme,

);

