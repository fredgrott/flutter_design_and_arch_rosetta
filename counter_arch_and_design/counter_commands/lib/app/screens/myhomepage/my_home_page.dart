// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:counter_commands/app/screens/myhomepage/my_home_page_state.dart';
import 'package:flutter/widgets.dart';


/// MyHomePage is actually a small-light state configuration that 
/// that is the type for the MyHomePageState container.
/// 
/// You will notice the use of Keys as we need to mark our widgets to make it easier 
/// to grab things when we have factories, which is just one example of using keys 
/// to able to grab it via a test finder.
/// 
/// @author Fredrick Allan Grott
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, this.message = ""}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String message ;


  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');

  @override
  MyHomePageState createState() => MyHomePageState();
}