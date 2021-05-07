// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.




import 'package:counter_getx_obs/app/screens/myhomepage/my_homepage.dart';
import 'package:counter_getx_obs/app/screens/myhomepage/statecontroller/counter_controller.dart';
import 'package:counter_getx_obs/app/shared/app_globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget{
  final  CounterController controller =  Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: myAppTitle,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: myAppTitle, message: myHomepageMessage,),
    );
  }

}