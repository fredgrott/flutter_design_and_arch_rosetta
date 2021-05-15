// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:start_stop_animation/app/screens/myapp/widgets/myanimation.dart';

import 'package:start_stop_animation/app/shared/app_globals.dart';

class MyApp extends StatelessWidget {

  // navigatorKey for catcher so I can get a full 
  // page exception report
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp(this.navigatorKey);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: const Scaffold(
        body: Center(
          child: MyAnimation(),
        ),
      ),
    );
  }
}
