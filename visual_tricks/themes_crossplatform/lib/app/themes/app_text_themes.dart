// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


// TextTheme defines the typography styles defined in MD so this
// just re-assigns those styles to use NotoSans fonts
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themes_crossplatform/app/themes/app_themes.dart';

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

CupertinoTextThemeData myCupertinoTextThemeData = CupertinoTextThemeData(
    // ignore: avoid_redundant_argument_values
    primaryColor: cupertinoThemeData.primaryColor,
    textStyle: myKDefaultTextStyle,
    actionTextStyle: myKDefaultActionTextStyle,
    tabLabelTextStyle: myKDefaultTabLabelTextStyle,
    navTitleTextStyle: myKDefaultMiddleTitleTextStyle,
    navLargeTitleTextStyle: myKDefaultLargeTitleTextStyle,
    pickerTextStyle: myKDefaultPickerTextStyle,
    // ignore: prefer-trailing-comma
    dateTimePickerTextStyle: myKDefaultDatePickerTextStyle);

TextStyle get myKDefaultTextStyle {
  final TextStyle myKDefaultTextStyle = GoogleFonts.notoSans(
      // ignore: prefer-trailing-comma
      textStyle: const TextStyle(
          color: CupertinoColors.label,
          letterSpacing: -0.41,
          decoration: TextDecoration.none,
          // ignore: prefer-trailing-comma
          fontSize: 17.0));

  return myKDefaultTextStyle;
}

TextStyle get myKDefaultActionTextStyle {
  final TextStyle myKDefaultActionTextStyle = GoogleFonts.notoSans(
      // ignore: prefer-trailing-comma
      textStyle: const TextStyle(
    inherit: false,
    color: CupertinoColors.activeBlue,
    decoration: TextDecoration.none,
    letterSpacing: -0.41,
    fontSize: 17.0,
  ));

  return myKDefaultActionTextStyle;
}

TextStyle get myKDefaultTabLabelTextStyle {
  final TextStyle myKDefaultLabelTextStyle = GoogleFonts.notoSans(
      // ignore: prefer-trailing-comma
      textStyle: const TextStyle(
          inherit: false,
          color: CupertinoColors.inactiveGray,
          letterSpacing: -0.24,
          // ignore: prefer-trailing-comma
          fontSize: 10.0));

  return myKDefaultLabelTextStyle;
}

TextStyle get myKDefaultMiddleTitleTextStyle {
  final TextStyle myKDefaultMiddleTitleTextStyle = GoogleFonts.notoSans(
      // ignore: prefer-trailing-comma
      textStyle: const TextStyle(
          inherit: false,
          color: CupertinoColors.label,
          letterSpacing: -0.41,
          fontSize: 17.0,
          // ignore: prefer-trailing-comma
          fontWeight: FontWeight.w600));

  return myKDefaultMiddleTitleTextStyle;
}

TextStyle get myKDefaultLargeTitleTextStyle {
  final TextStyle myKDefaultLargeTitleTextStyle = GoogleFonts.notoSans(
      // ignore: prefer-trailing-comma
      textStyle: const TextStyle(
    inherit: false,
    fontSize: 34,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.41,
    color: CupertinoColors.label,
  ));

  return myKDefaultLargeTitleTextStyle;
}

TextStyle get myKDefaultPickerTextStyle {
  final TextStyle myKDefaultPickerTextStyle = GoogleFonts.notoSans(
      // ignore: prefer-trailing-comma
      textStyle: const TextStyle(
          inherit: false,
          fontSize: 21.0,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.6,
          // ignore: prefer-trailing-comma
          color: CupertinoColors.label));

  return myKDefaultPickerTextStyle;
}

TextStyle get myKDefaultDatePickerTextStyle {
  final TextStyle myKDefaultDatePickerTextStyle = GoogleFonts.notoSans(
      // ignore: prefer-trailing-comma
      textStyle: const TextStyle(
    inherit: false,
    fontSize: 21.0,
    fontWeight: FontWeight.normal,
    color: CupertinoColors.label,
  ));
  
  return myKDefaultDatePickerTextStyle;
}

TextStyle homepageTextStyle = const TextStyle(
  color: Colors.brown,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
);
