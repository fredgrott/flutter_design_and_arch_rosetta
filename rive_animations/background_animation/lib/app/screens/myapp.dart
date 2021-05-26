// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:background_animation/app/screens/myhomepage/my_homepage.dart';
import 'package:background_animation/app/shared/app_globals.dart';
import 'package:background_animation/app/themes/material_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget {

  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp(this.navigatorKey);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: myAppTitle,
      theme: myTheme,
      home: MyHomePage(title: myAppTitle),
    );
  }
}