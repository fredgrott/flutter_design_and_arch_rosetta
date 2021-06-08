// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Gist: To get full power color have to fully define Material Color Schemes for
//       Light, Dark, HighContrastLight, and HighContrastDark instead of
//       just using a colorswatch through the Theme constructors.
//
//       Color is 0x Alpha(00) R(ff) G(FF) b(FF) ie
//       Color(0xffffffff)
//
//       MaterialBasedCupertinoTheme-wise one has to
//       somewhat map the MyMaterialAppColors to some appropriate
//       CupertinoDynamicColors constructs as then the Cupertino Themes
//       will use that instead of MyMaterialAppColors directly.
//       Why? Because, the MaterialBasedCupertinoTheme strategy was
//       prior to high contrast and dark.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_crossplatform/app/shared/app_globals.dart';

class MyCupertinoAppColors {
  CupertinoDynamicColor primaryLight =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.primaryLight,
          darkColor: AppPalette.primaryDark,
          highContrastColor: AppPalette.primaryHighContrastLight,
          darkHighContrastColor: AppPalette.primaryHighContrastDark);

  CupertinoDynamicColor primaryDark =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.primaryLight,
          darkColor: AppPalette.primaryDark,
          highContrastColor: AppPalette.primaryHighContrastLight,
          darkHighContrastColor: AppPalette.primaryHighContrastDark);

  CupertinoDynamicColor primaryVariantLight =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.primaryVariantLight,
          darkColor: AppPalette.primaryVariantDark,
          highContrastColor:
              AppPalette.primaryVariantHighContrastLight,
          darkHighContrastColor:
              AppPalette.primaryVariantHighContrastDark);

  CupertinoDynamicColor primaryVariantDark =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.primaryVariantLight,
          darkColor: AppPalette.primaryVariantDark,
          highContrastColor:
              AppPalette.primaryVariantHighContrastLight,
          darkHighContrastColor:
              AppPalette.primaryVariantHighContrastDark);

  CupertinoDynamicColor secondaryLight =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.secondaryLight,
          darkColor: AppPalette.secondaryDark,
          highContrastColor: AppPalette.secondaryHighContrastLight,
          darkHighContrastColor: AppPalette.secondaryHighContrastDark);

  CupertinoDynamicColor secondaryDark =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.secondaryLight,
          darkColor: AppPalette.secondaryDark,
          highContrastColor: AppPalette.secondaryHighContrastLight,
          darkHighContrastColor: AppPalette.secondaryHighContrastDark);

  CupertinoDynamicColor secondaryVariantLight =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.secondaryVariantLight,
          darkColor: AppPalette.secondaryVariantDark,
          highContrastColor:
              AppPalette.secondaryVariantHighContrastLight,
          darkHighContrastColor:
              AppPalette.secondaryVariantHighContrastDark);

  CupertinoDynamicColor secondaryVariantDark =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.secondaryVariantLight,
          darkColor: AppPalette.secondaryVariantDark,
          highContrastColor:
              AppPalette.secondaryVariantHighContrastLight,
          darkHighContrastColor:
              AppPalette.secondaryVariantHighContrastDark);

  CupertinoDynamicColor errorLight =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.errorLight,
          darkColor: AppPalette.errorDark,
          highContrastColor: AppPalette.errorHighContrastLight,
          darkHighContrastColor: AppPalette.errorHighContrastDark);

  CupertinoDynamicColor errorDark =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.errorLight,
          darkColor: AppPalette.errorDark,
          highContrastColor: AppPalette.errorHighContrastLight,
          darkHighContrastColor: AppPalette.errorHighContrastDark);

  CupertinoDynamicColor backgroundLight =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.backgroundLight,
          darkColor: AppPalette.backgroundDark,
          highContrastColor: AppPalette.backgroundHighContrastLight,
          darkHighContrastColor:
              AppPalette.backgroundHighContrastDark);

  CupertinoDynamicColor backgroundDark =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.backgroundLight,
          darkColor: AppPalette.backgroundDark,
          highContrastColor: AppPalette.backgroundHighContrastLight,
          darkHighContrastColor:
              AppPalette.backgroundHighContrastDark);

  CupertinoDynamicColor surfaceLight =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.surfaceLight,
          darkColor: AppPalette.surfaceDark,
          highContrastColor: AppPalette.surfaceHighContrastLight,
          darkHighContrastColor: AppPalette.surfaceHighContrastDark);

  CupertinoDynamicColor surfaceDark =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.surfaceLight,
          darkColor: AppPalette.surfaceDark,
          highContrastColor: AppPalette.surfaceHighContrastLight,
          darkHighContrastColor: AppPalette.surfaceHighContrastDark);

  CupertinoDynamicColor onErrorLight =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.onErrorLight,
          darkColor: AppPalette.onErrorDark,
          highContrastColor: AppPalette.onErrorHighContrastLight,
          darkHighContrastColor: AppPalette.onErrorHighContrastDark);

  CupertinoDynamicColor onErrorDark =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.onErrorLight,
          darkColor: AppPalette.onErrorDark,
          highContrastColor: AppPalette.onErrorHighContrastLight,
          darkHighContrastColor:
              AppPalette.onBackgroundHighContrastDark);

  CupertinoDynamicColor onSurfaceLight =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.onSurfaceLight,
          darkColor: AppPalette.onSurfaceDark,
          highContrastColor: AppPalette.onSurfaceHighContrastLight,
          darkHighContrastColor: AppPalette.onSurfaceHighContrastDark);

  CupertinoDynamicColor onSurfaceDark =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.onSurfaceLight,
          darkColor: AppPalette.onSurfaceDark,
          highContrastColor: AppPalette.onSurfaceHighContrastLight,
          darkHighContrastColor: AppPalette.onSurfaceHighContrastDark);

  CupertinoDynamicColor onBackgroundLight =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.onBackgroundLight,
          darkColor: AppPalette.onBackgroundDark,
          highContrastColor: AppPalette.onBackgroundHighContrastLight,
          darkHighContrastColor:
              AppPalette.onBackgroundHighContrastDark);

  CupertinoDynamicColor onBackgroundDark =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.onBackgroundLight,
          darkColor: AppPalette.onBackgroundDark,
          highContrastColor: AppPalette.onBackgroundHighContrastLight,
          darkHighContrastColor:
              AppPalette.onBackgroundHighContrastDark);

  CupertinoDynamicColor onPrimaryLight =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.onPrimaryLight,
          darkColor: AppPalette.onPrimaryDark,
          highContrastColor: AppPalette.onPrimaryHighContrastLight,
          darkHighContrastColor: AppPalette.onPrimaryHighContrastDark);

  CupertinoDynamicColor onPrimaryDark =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.onPrimaryLight,
          darkColor: AppPalette.onPrimaryDark,
          highContrastColor: AppPalette.onPrimaryHighContrastLight,
          darkHighContrastColor: AppPalette.onPrimaryHighContrastDark);

  CupertinoDynamicColor onSecondaryLight =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.onSecondaryLight,
          darkColor: AppPalette.onSecondaryDark,
          highContrastColor: AppPalette.onSecondaryHighContrastLight,
          darkHighContrastColor:
              AppPalette.onSecondaryHighContrastDark);

  CupertinoDynamicColor onSecondaryDark =
      const CupertinoDynamicColor.withBrightnessAndContrast(
          color: AppPalette.onSecondaryLight,
          darkColor: AppPalette.onSecondaryDark,
          highContrastColor: AppPalette.onSecondaryHighContrastLight,
          darkHighContrastColor:
              AppPalette.onSecondaryHighContrastDark);
}

// Gist: The App Palette needs some additional colors as the idea is to has
//       many options as possible with top-bar, bottom-bar stylings.
class AppPalette {
  static const Color topBarBackground =
      Color(0x00000000); // full transparency is 0x00000000
  static const Color bottomBarBackground =
      Color(0x00000000); // full transparency is 0x00000000
  static const Color canvas =
      Color(0x00000000); // full transparency is 0x00000000
  static const Color scaffoldBackground =
      Color(0x00000000); // full transparency is 0x00000000
  // material tablets, web, desktop
  static const Color navRailBackground = 
      Color(0x00000000); // full transparency is 0x00000000
  // cupertino tablets, desktop
  static const Color sideNavBackground = 
      Color(0x00000000); // full transparency is 0x00000000

  // light
  static const Color primaryLight = Color(0xE53E2723); //brown900
  static const Color primaryVariantLight = Color(0xFF5d4037); //brown700
  static const Color secondaryLight = Color(0xff212121); //gray900
  static const Color secondaryVariantLight = Color(0xff616161); //gray700
  static const Color errorLight = Color(0xffd50000);
  static const Color surfaceLight = Colors.white;
  static const Color backgroundLight = Colors.transparent;
  static const Color onPrimaryLight = Colors.black;
  static const Color onSecondaryLight = Colors.black;
  static const Color onSurfaceLight = Colors.black;
  static const Color onBackgroundLight = Colors.black38;
  static const Color onErrorLight = Colors.black38;

  // dark
  static const Color primaryDark = Color(0xffefebe9); //brown50
  static const Color primaryVariantDark = Color(0xffbcaaa4); //brown200
  static const Color secondaryDark = Color(0xfffafafa); //gray50
  static const Color secondaryVariantDark = Color(0xffeeeeee); //gray200
  static const Color surfaceDark = Color(0xff121212);
  static const Color backgroundDark = Color(0xff121212);
  static const Color errorDark = Color(0xffcf6679);
  static const Color onPrimaryDark = Colors.black;
  static const Color onSecondaryDark = Colors.black;
  static const Color onSurfaceDark = Colors.black;
  static const Color onBackgroundDark = Colors.black38;
  static const Color onErrorDark = Colors.black38;

  // high contrast light
  static const Color primaryHighContrastLight = Color(0xffd7ccc8); //brown100
  static const Color primaryVariantHighContrastLight =
      Color(0xffa1887f); //brown300
  static const Color secondaryHighContrastLight = Color(0xfff5f5f5); //gray100
  static const Color secondaryVariantHighContrastLight =
      Color(0xffe0e0e0); //gray300
  static const Color errorHighContrastLight = Color(0xffcf6679);
  static const Color surfaceHighContrastLight = Color(0xff121212);
  static const Color backgroundHighContrastLight = Color(0xff121212);
  static const Color onPrimaryHighContrastLight = Colors.black;
  static const Color onSecondaryHighContrastLight = Colors.black;
  static const Color onSurfaceHighContrastLight = Colors.black;
  static const Color onBackgroundHighContrastLight = Colors.black38;
  static const Color onErrorHighContrastLight = Colors.black38;

  // high contrast dark
  static const Color primaryHighContrastDark = Color(0xffd7ccc8); //brown100
  static const Color primaryVariantHighContrastDark =
      Color(0xffa1887f); //brown300
  static const Color secondaryHighContrastDark = Color(0xfff5f5f5); //gray100
  static const Color secondaryVariantHighContrastDark =
      Color(0xffe0e0e0); //gray300
  static const Color errorHighContrastDark = Color(0xffcf6679);
  static const Color surfaceHighContrastDark = Color(0xff121212);
  static const Color backgroundHighContrastDark = Color(0xff121212);
  static const Color onPrimaryHighContrastDark = Colors.black;
  static const Color onSecondaryHighContrastDark = Colors.black;
  static const Color onSurfaceHighContrastDark = Colors.black;
  static const Color onBackgroundHighContrastDark = Colors.black38;
  static const Color onErrorHighContrastDark = Colors.black38;
}


ColorScheme myMaterialAppColorsSchemeLight = const ColorScheme.light(
  primary: AppPalette.primaryLight,
  primaryVariant: AppPalette.primaryVariantLight,
  secondary: AppPalette.secondaryLight,
  secondaryVariant: AppPalette.secondaryVariantLight,
  error: AppPalette.errorLight,
  background: AppPalette.backgroundLight,
  // ignore: avoid_redundant_argument_values
  surface: AppPalette.surfaceLight,
  onPrimary: AppPalette.onPrimaryLight,
  onBackground: AppPalette.onBackgroundLight,
  // ignore: avoid_redundant_argument_values
  onSecondary: AppPalette.onSecondaryLight,
  onError: AppPalette.onErrorLight,
  // ignore: avoid_redundant_argument_values
  onSurface: AppPalette.onSurfaceLight,
);

ColorScheme myMaterialAppColorsSchemeDark = const ColorScheme.dark(
  primary: AppPalette.primaryDark,
  primaryVariant: AppPalette.primaryVariantDark,
  secondary: AppPalette.secondaryDark,
  secondaryVariant: AppPalette.secondaryVariantDark,
  // ignore: avoid_redundant_argument_values
  error: AppPalette.errorDark,
  // ignore: avoid_redundant_argument_values
  background: AppPalette.backgroundDark,
  // ignore: avoid_redundant_argument_values
  surface: AppPalette.surfaceDark,
  // ignore: avoid_redundant_argument_values
  onPrimary: AppPalette.onPrimaryDark,
  onBackground: AppPalette.onBackgroundDark,
  // ignore: avoid_redundant_argument_values
  onSecondary: AppPalette.onSecondaryDark,
  onError: AppPalette.onErrorDark,
  // ignore: avoid_redundant_argument_values
  onSurface: AppPalette.onSurfaceDark,
);

ColorScheme myMaterialAppColorschemeHighContrastLight =
    const ColorScheme.highContrastLight(
  primary: AppPalette.primaryHighContrastLight,
  primaryVariant: AppPalette.primaryVariantHighContrastLight,
  secondary: AppPalette.secondaryHighContrastLight,
  secondaryVariant: AppPalette.secondaryVariantHighContrastLight,
  error: AppPalette.errorHighContrastLight,
  background: AppPalette.backgroundHighContrastLight,
  // ignore: avoid_redundant_argument_values
  surface: AppPalette.surfaceHighContrastLight,
  // ignore: avoid_redundant_argument_values
  onPrimary: AppPalette.onPrimaryHighContrastLight,
  onBackground: AppPalette.onBackgroundHighContrastLight,
  // ignore: avoid_redundant_argument_values
  onSecondary: AppPalette.onSecondaryHighContrastLight,
  onError: AppPalette.onErrorHighContrastLight,
  // ignore: avoid_redundant_argument_values
  onSurface: AppPalette.onSurfaceHighContrastLight,
);

ColorScheme myMaterialAppColorschemeHighContrastDark =
    const ColorScheme.highContrastDark(
  primary: AppPalette.primaryHighContrastDark,
  primaryVariant: AppPalette.primaryVariantHighContrastDark,
  secondary: AppPalette.secondaryHighContrastDark,
  secondaryVariant: AppPalette.secondaryVariantHighContrastDark,
  error: AppPalette.errorHighContrastDark,
  // ignore: avoid_redundant_argument_values
  background: AppPalette.backgroundHighContrastDark,
  // ignore: avoid_redundant_argument_values
  surface: AppPalette.surfaceHighContrastDark,
  // ignore: avoid_redundant_argument_values
  onPrimary: AppPalette.onPrimaryHighContrastDark,
  onBackground: AppPalette.onBackgroundHighContrastDark,
  // ignore: avoid_redundant_argument_values
  onSecondary: AppPalette.onSecondaryHighContrastDark,
  onError: AppPalette.onErrorHighContrastDark,
  // ignore: avoid_redundant_argument_values
  onSurface: AppPalette.onSurfaceHighContrastDark,
);





ColorScheme myCupertinoColorScheme = ColorScheme(
    primary: MyCupertinoAppColors().primaryLight,
    primaryVariant: MyCupertinoAppColors().primaryVariantLight,
    secondary: MyCupertinoAppColors().secondaryLight,
    secondaryVariant: MyCupertinoAppColors().secondaryVariantLight,
    surface: MyCupertinoAppColors().surfaceLight,
    background: MyCupertinoAppColors().backgroundLight,
    error: MyCupertinoAppColors().errorLight,
    onPrimary: MyCupertinoAppColors().onPrimaryLight,
    onSecondary: MyCupertinoAppColors().onSecondaryLight,
    onSurface: MyCupertinoAppColors().onSurfaceLight,
    onBackground: MyCupertinoAppColors().onBackgroundLight,
    onError: MyCupertinoAppColors().onErrorLight,
    brightness: appBrightness
);
