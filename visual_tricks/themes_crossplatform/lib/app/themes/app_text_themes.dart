// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


// TextTheme defines the typography styles defined in MD so this
// just re-assigns those styles to use NotoSans fonts
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themes_crossplatform/app/themes/app_themes.dart';




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
