// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// You always set defaults for compile time define variables unless
// you are using logic to detect build mode and then assign not assigned yet
// compile define variables.
//
// Asserts or checking for vm will not work for certain 
// platforms like web.
import 'package:flutter/foundation.dart';

class EnvironmentConfig {
  static const appNAME = String.fromEnvironment('DEFINEEXAMPLE_APP_NAME',
      defaultValue: 'Build Variants',);
  static const appSUFFIX = String.fromEnvironment('DEFINEEXAMPLE_APP_SUFFIX',
      defaultValue: 'production',);
}

// const variables are solidly defined at compile time hence the keyword const
const bool isProduction = kReleaseMode;

const bool isDevelopment = kDebugMode;

// isStagging can only be true if kDebugMode is true and stagging appSUFFIX is set
// its a good hack to use. You create things like this by writing out the 
// truth table. The easiest way to tell which variable needs the combined 
// conditional operators statement is the one that is not a true or false 
// compared to the other two vars and that isStagging  as the other two are 
// either false or true.
//
// ignore: avoid_bool_literals_in_conditional_expressions
const bool isStagging = kDebugMode ? (EnvironmentConfig.appSUFFIX == 'stagging') : !(EnvironmentConfig.appSUFFIX == 'production');
