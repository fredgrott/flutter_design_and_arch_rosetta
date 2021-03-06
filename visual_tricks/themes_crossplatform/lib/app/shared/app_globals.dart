// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

String myAppTitle = "Themes CrossPlatform";

String myHomepageMessage = "You have pushed the button this many times:";

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Brightness appBrightness = Brightness.light;

