// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// The Gist:  Migration to ColorScheme still on-going so adopting the
//            GalleryApp example approach to handle legacy asti somewhat
//            repeats in a different way same stuff in flex_color_scheme
//            plugin.
//
//            Accent color refs are and should be secondary colors
//
//            Borrowed from the gallery example:
//            https://github.com/flutter/gallery/blob/master/lib/themes/gallery_theme_data.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themes_crossplatform/app/shared/app_globals.dart';
import 'package:themes_crossplatform/app/themes/card_theme.dart';


// ignore: avoid_classes_with_only_static_members
class AppThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: myMaterialTextTheme,
      primaryColor: const Color(0xFF030303),
      bottomAppBarTheme: const BottomAppBarTheme(
        elevation: 0,
      ),
      //tabBarTheme: myTabBarTheme,
      //textButtonTheme: ,
      //textSelectionTheme: ,
      //timePickerTheme: ,
      //toggleButtonsTheme: ,
      //tooltipTheme: 
      //bannerTheme: ,
      //bottomNavigationBarTheme: ,
      //bottomSheetTheme: ,
      //buttonBarTheme: ,
      //elevatedButtonTheme: is handled by flutter platform widgets themes
      //buttonTheme: , handled by rest of flutter platform widgets themes
      //outlinedButtonTheme: , handled by rest of flutter platform widgets themes
      cardTheme: myCardTheme,
      //checkboxTheme: ,
      //chipTheme: ,
      //cupertinoOverrideTheme: ,
      //inputDecorationTheme: ,
      
      appBarTheme: AppBarTheme(
        textTheme: myMaterialTextTheme.apply(bodyColor: colorScheme.onPrimary),
        color: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        brightness: colorScheme.brightness,
        systemOverlayStyle: appBrightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: myMaterialTextTheme.subtitle1!.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    primaryVariant: Color(0xFF117378),
    secondary: Color(0xFFEFF3F3),
    secondaryVariant: Color(0xFFFAFBFB),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    primaryVariant: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    secondaryVariant: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF), // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );
}

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