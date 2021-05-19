// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:background_trick/app/screens/myapp/widgets/mybackground.dart';
import 'package:background_trick/app/shared/app_globals.dart';
import 'package:background_trick/app/themes/material_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAppBase extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyAppBase(this.navigatorKey);

  @override
  Widget build(BuildContext context) => BaseApp();

}

class BaseApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}
class _AppState extends State<BaseApp> {
  Brightness brightness = Brightness.light;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: myTheme,
      home: const MyBackground(
        
          
            title: "Background Trick",
          ),
        
      
    );
  }
}



