// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.




import 'package:counter_cubit_bloc/app/screens/myhomepage/my_homepage.dart';
import 'package:counter_cubit_bloc/app/screens/myhomepage/statecontroller/counter_bloc.dart';
import 'package:counter_cubit_bloc/app/screens/theme_cubit.dart';
import 'package:counter_cubit_bloc/app/shared/app_globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// It's generally called the MyApp widget as it usually set's up
/// the app-widget and theme data and specifies the first screen 
/// as the home-screen.
///
/// @author Fredrick Allan Grott
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
      //title: myAppTitle,
      //theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
       // primarySwatch: Colors.blue,
      //),
      //home: MyHomePage(title: myAppTitle, message: myHomepageMessage,),
    //);
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
            theme: theme,
            home: BlocProvider(
              create: (_) => CounterBloc(),
              child: MyHomePage(title: myAppTitle,message: myHomepageMessage,),
            ),
          );
        },
      ),
    );
  }
}