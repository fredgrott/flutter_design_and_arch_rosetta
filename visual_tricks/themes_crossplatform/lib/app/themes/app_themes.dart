// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:themes_crossplatform/app/shared/app_globals.dart';

// Gist: Google does not document this in the flutter docs. The way to theme
//       CupertinoApps is use the MaterialBasedCupertinoThemeData to copy the
//       appropriate color stuff from Material's ThemeData which happens to be
//       populated from Material's ColorScheme.
//
//       I use flex_color_scheme to somewhat automate the process of choosing
//       a palette or deriving a custom palette.
late final MaterialBasedCupertinoThemeData cupertinoThemeData;

FlexSchemeData customFlexScheme = FlexSchemeData(
  name: "BlueGreys",
  description: "Blue Greys",
  light: FlexSchemeColor(
    primary: Colors.blueGrey.shade400,
    primaryVariant: Colors.blueGrey.shade700,
    secondary: Colors.blueGrey.shade600,
    secondaryVariant: Colors.blueGrey.shade500,
    appBarColor: Colors.transparent,
    error: Colors.red.shade600,
    accentColor: Colors.brown.shade300,
  ),
  dark: FlexSchemeColor(
    primary: Colors.blueGrey.shade200,
    primaryVariant: Colors.blueGrey.shade300,
    secondary: Colors.blueGrey.shade100,
    secondaryVariant: Colors.grey.shade200,
    appBarColor: Colors.transparent,
    error: Colors.red.shade200,
    accentColor: Colors.brown.shade50,
  ),
);

ColorScheme appColorSchemeLight = ColorScheme(
  primary: customFlexScheme.light.primary,
  primaryVariant: customFlexScheme.light.primaryVariant,
  secondary: customFlexScheme.light.secondary,
  secondaryVariant: customFlexScheme.light.secondaryVariant,
  surface: Colors.transparent,
  background: Colors.transparent,
  // ignore: cast_nullable_to_non_nullable
  error: customFlexScheme.light.error as Color,
  onPrimary: Colors.white10,
  onSecondary: Colors.white24,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.black87,
  brightness: Brightness.light,
);



ColorScheme appColorSchemeDark = ColorScheme(
  primary: customFlexScheme.dark.primary,
  primaryVariant: customFlexScheme.dark.primaryVariant,
  secondary: customFlexScheme.dark.secondary,
  secondaryVariant: customFlexScheme.dark.secondaryVariant,
  surface: Colors.transparent,
  background: Colors.transparent,
  // ignore: cast_nullable_to_non_nullable
  error: customFlexScheme.dark.error as Color,
  onPrimary: Colors.white10,
  onSecondary: Colors.white24,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.black87,
  brightness: appBrightness,
);
