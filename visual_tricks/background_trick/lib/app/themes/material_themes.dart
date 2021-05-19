// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.lightBlue[800],
  accentColor: Colors.cyan[600],
  appBarTheme: myAppBarTheme,
  
);

AppBarTheme myAppBarTheme = const AppBarTheme(
  centerTitle: true,
  brightness: Brightness.light,
  backgroundColor: Colors.transparent,
  elevation: 0,
  


);
