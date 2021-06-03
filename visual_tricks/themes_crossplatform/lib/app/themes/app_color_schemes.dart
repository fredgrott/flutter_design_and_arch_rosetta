// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Gist: To get full power color have to fully define Material Color Schemes for
//       Light, Dark, HighContrastLight, and HighContrastDark instead of
//       just using a colorswatch through the Theme constructors.
//
//       Color is 0x Alpha(00) R(ff) G(FF) b(FF) ie
//       Color(0xffffffff)

import 'package:flutter/material.dart';

class MyAppColors {
  // light
  static const Color primaryLight = Color(0xff3e2723); //brown900
  static const Color primaryVariantLight = Color(0xFF5d4037); //brown700
  static const Color secondaryLight = Color(0xff212121); //gray900
  static const Color secondaryVariantLight = Color(0xff616161); //gray700
  static const Color errorLight = Color(0xffd50000);

  //dark
  static const Color primaryDark = Color(0xffefebe9); //brown50
  static const Color primaryVariantDark = Color(0xffbcaaa4); //brown200
  static const Color secondaryDark = Color(0xfffafafa); //gray50
  static const Color secondaryVariantDark = Color(0xffeeeeee); //gray200
  static const Color surfaceDark = Color(0xff121212);
  static const Color backgroundDark = Color(0xff121212);
  static const Color errorDark = Color(0xffcf6679);

  // high contrast light
  static const Color primaryHighContrastLight = Color(0xffd7ccc8); //brown100
  static const Color primaryVariantHighContrastLight =
      Color(0xffa1887f); //brown300
  static const Color secondaryHighContrastLight = Color(0xfff5f5f5); //gray100
  static const Color secondaryVariantHighContrastLight =
      Color(0xffe0e0e0); //gray300
  static const Color errorHighContrastLight = Color(0xffcf6679);

  // high contrast dark
  static const Color primaryHighContrastDark = Color(0xffd7ccc8); //brown100
  static const Color primaryVariantHighContrastDark =
      Color(0xffa1887f); //brown300
  static const Color secondaryHighContrastDark = Color(0xfff5f5f5); //gray100
  static const Color secondaryVariantHighContrastDark =
      Color(0xffe0e0e0); //gray300
  static const Color errorHighContrastDark = Color(0xffcf6679);

}

ColorScheme myAppColorSchemeLight = const ColorScheme.light(
  primary: MyAppColors.primaryLight,
  primaryVariant: MyAppColors.primaryVariantLight,
  secondary: MyAppColors.secondaryLight,
  secondaryVariant: MyAppColors.secondaryVariantLight,
  error: MyAppColors.errorLight,
);

ColorScheme myAppColorSchemeDark = const ColorScheme.dark(
    primary: MyAppColors.primaryDark,
    primaryVariant: MyAppColors.primaryVariantDark,
    secondary: MyAppColors.secondaryDark,
    secondaryVariant: MyAppColors.secondaryVariantDark,
    
);

ColorScheme myAppColorSchemeHighContrastLight = const ColorScheme.highContrastLight(
  primary: MyAppColors.primaryHighContrastLight,
  primaryVariant: MyAppColors.primaryVariantHighContrastLight,
  secondary: MyAppColors.secondaryHighContrastLight,
  secondaryVariant: MyAppColors.secondaryVariantHighContrastLight,
  error: MyAppColors.errorHighContrastLight,
);

ColorScheme myAppColorSchemeHighContrastDark = const ColorScheme.highContrastDark(
  primary: MyAppColors.primaryHighContrastDark,
  primaryVariant: MyAppColors.primaryVariantHighContrastDark,
  secondary: MyAppColors.secondaryHighContrastDark,
  secondaryVariant: MyAppColors.secondaryVariantHighContrastDark,
  error: MyAppColors.errorHighContrastDark,
);
