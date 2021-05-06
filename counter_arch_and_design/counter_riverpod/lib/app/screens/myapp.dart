// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_riverpod/app/screens/myhomepage/my_homepage.dart';
import 'package:counter_riverpod/app/shared/app_globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
     return MaterialApp(home: MyHomePage(title: myAppTitle,));
  }
}
