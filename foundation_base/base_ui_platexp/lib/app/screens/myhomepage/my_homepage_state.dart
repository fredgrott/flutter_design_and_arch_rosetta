// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:base_ui_platexp/app/screens/myhomepage/my_home_page.dart';
import 'package:base_ui_platexp/app/screens/myhomepage/statecontroller/counter_store_mixin.dart';
import 'package:base_ui_platexp/app/shared/app_globals.dart';
import 'package:base_ui_platexp/app/themes/my_cupertino_navigation_bar_data.dart';
import 'package:base_ui_platexp/app/themes/my_cupertino_page_scaffold_data.dart';
import 'package:base_ui_platexp/app/themes/my_material_app_bar_data.dart';
import 'package:base_ui_platexp/app/themes/my_material_scaffold_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MyHomePageState extends State<MyHomePage> with CounterStoreMixin {
  void incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      increaseCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
        child: PlatformScaffold(
          material: (
            _,
            __,
          ) =>
              myMaterialScaffoldData,
          cupertino: (
            _,
            __,
          ) =>
              myCupertinoPageScaffoldData,
              appBar: PlatformAppBar(
            backgroundColor: Colors.transparent,
            title: PlatformText(myAppTitle),
            material: (
              _,
              __,
            ) =>
                myMaterialAppBarData,
            cupertino: (_, __) => myCupertinoNavigationBarData,
            trailingActions: <Widget>[
              PlatformIconButton(
                padding: EdgeInsets.zero,
                 
                icon: Icon(context.platformIcons.share),
                color: Colors.black87,
               
                // ignore: no-empty-block
                onPressed: () {},
              ),
            ],
          ),
          body: Stack(children: <Widget>[
            Center(
              child: Container(
                constraints: const BoxConstraints.expand(),
                    // ignore: prefer-trailing-comma
                    decoration: const BoxDecoration(
                        // ignore: prefer-trailing-comma
                        image: DecorationImage(
                      image: AssetImage("images/background.jpg"),
                      fit: BoxFit.cover,
                    )))),
                    Center(
                // ignore: prefer-trailing-comma
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PlatformText("increment or decrement"),
                PlatformText(
              '$myCounter',
              
            ),

              ],


              )

            ),
            Positioned(
                bottom: 54,
                right: 34,
                // ignore: prefer-trailing-comma
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer-trailing-comma
                    children: <Widget>[
                      PlatformIconButton(
                        key: const Key('increment'),
                        onPressed: () {
                          incrementCounter();
                        },
                        padding: EdgeInsets.zero,
                        icon: Icon(context.platformIcons.addCircledSolid),
                        
                      ),
                      
                    ]))


          ]

          )
        )


    );

    
  }
}
