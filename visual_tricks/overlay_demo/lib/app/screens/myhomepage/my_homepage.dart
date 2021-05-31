// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:overlay_demo/app/screens/myhomepage/statecontroller/counter_store_mixin.dart';
import 'package:overlay_demo/app/screens/myhomepage/widgets/discovery.dart';
import 'package:overlay_demo/app/shared/app_globals.dart';
import 'package:overlay_demo/app/themes/discovery_platformiconbuttondata.dart';
import 'package:overlay_demo/app/themes/elevated_buttondata.dart';
import 'package:overlay_demo/app/themes/homepage_text_styles.dart';
import 'package:overlay_demo/app/themes/my_cupertino_navigation_bar_data.dart';
import 'package:overlay_demo/app/themes/my_cupertino_page_scaffold_data.dart';
import 'package:overlay_demo/app/themes/my_material_app_bar_data.dart';
import 'package:overlay_demo/app/themes/my_material_scaffold_data.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, this.message = ""})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String message;

  static const Key titleKey = Key('MyWidget.title');
  static const Key messageKey = Key('MyWidget.message');

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with CounterStoreMixin {
  bool showDiscovery = false;
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
  // ignore: long-method
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
        // ignore: prefer-trailing-comma
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
                    ))),),
                    Center(
                // ignore: prefer-trailing-comma
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PlatformText(myHomepageMessage, style: homepageTextStyle,),
                PlatformText('$myCounter', style: homepageTextStyle,),
            PlatformElevatedButton(
              onPressed: () => setState(() => showDiscovery = true),
              material: (_,__) => myMaterialElevatedButtonData,
              // can change background colors based on user actions to match some of 
              // material buttons, see:
              // https://stackoverflow.com/questions/56740448/how-to-change-cupertinobutton-background-color-only-when-onpressed-is-called
              cupertino: (_,__) => CupertinoElevatedButtonData(
                                         color: myBackgroundElevatedButtonColor,
                                         pressedOpacity: 0.12,
                                         onPressed: () {
                                            setState(()=> myBackgroundElevatedButtonColor = Colors.amber);
                                          },
                                    ),
              child: PlatformText('Show discovery', style: myElevatedButtonTextStyle,),

            ),
            


          ],


                ),

            ),
            Positioned(
                bottom: 54,
                right: 34,
                // ignore: prefer-trailing-comma
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer-trailing-comma
                    children: <Widget>[

                      Discovery(
                        visible: showDiscovery, 
                        onClose: () => setState(()=> showDiscovery = false), 
                        description: PlatformText("click to increment counter", style: myDiscoveryTextStyle,), 
                        child: PlatformIconButton(
                          key: const Key('increment'),
                          onPressed: () {
                            incrementCounter();
                          },
                          material: (context, platform) => myDiscoveryMaterialIconButtonData,
                          cupertino: (context, platform) => myDiscoveryCupertinoIconButtonData,
                          padding: EdgeInsets.zero,
                          icon: Icon(context.platformIcons.addCircledSolid, color: Colors.brown.shade100,),
                        
                        ),
                      ),
                      
                      
                      
                    ]
                    ),
                    ),


          ],

          ),
        )


    );

    
  }

}
