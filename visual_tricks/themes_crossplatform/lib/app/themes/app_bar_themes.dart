// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

MaterialAppBarData myMaterialAppBarData = MaterialAppBarData(
  textTheme: myMaterialTitleTextTheme ,
  // to adjust to iOS which defaults to title centered when no icons are present
  centerTitle: true,
  titleSpacing: 0,
  brightness: Brightness.light,
  // when we want it transparent such as when using background images
  backgroundColor: Colors.transparent,
  elevation: 0,
  bottomOpacity: 90,
  
);

TextTheme myMaterialTitleTextTheme = const TextTheme(
  // ignore: prefer-trailing-comma
  headline6: TextStyle(
    color: Colors.white,
    // ignore: prefer-trailing-comma
    fontWeight: FontWeight.bold  
    )
);

CupertinoNavigationBarData myCupertinoNavigationBarData = CupertinoNavigationBarData(
  brightness: Brightness.light,
  // when using background images in screens
  backgroundColor: Colors.transparent,
);