// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:portal/my_portal.dart';
import 'package:catcher/catcher.dart';

import 'package:themes_crossplatform/app/screens/myhomepage/myhomepage.dart';
import 'package:themes_crossplatform/app/shared/app_globals.dart';
import 'package:themes_crossplatform/app/themes/app_color_schemes.dart';

import 'package:themes_crossplatform/app/themes/app_text_themes.dart';

import 'package:themes_crossplatform/app/themes/app_theme_data.dart';
import 'package:themes_crossplatform/app/themes/app_themes.dart';


class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp(this.navigatorKey);


 
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  

  



  @override
  Widget build(BuildContext context) {
    return Portal(
        child: Theme(
            // Google switched Material Widgets to full colorScheme thus we need to supply that from ThemeData
            data: appBrightness == Brightness.light
                ? ThemeData.from(colorScheme: myMaterialAppColorsSchemeLight, textTheme: myMaterialTextTheme)
                : ThemeData.from(colorScheme: myMaterialAppColorsSchemeDark, textTheme: myMaterialTextTheme) ,
            child: PlatformProvider(
                settings: PlatformSettingsData(
                          // cheap way to test ui looks via emulator as I test via web 
                          // in production this is commented out
                          //platformStyle: const PlatformStyleData(web: PlatformStyle.Cupertino),
                       ),
                builder: (context) => PlatformApp(
                    // always do this in demo, debug, and production apps
                    // differ by one more on the MaterialApp
                    debugShowCheckedModeBanner: false,
                    showPerformanceOverlay: false,
                    showSemanticsDebugger: false,
                    checkerboardOffscreenLayers: false,
                    checkerboardRasterCacheImages: false,
                    // need nav key to enable proper Catcher display of full error-stacktrace page
                    navigatorKey: Catcher.navigatorKey,
                    // ignore: prefer_const_literals_to_create_immutables
                    localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                      DefaultMaterialLocalizations.delegate,
                      DefaultWidgetsLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate,
                    ],
                    title: myAppTitle,
                    material: (_, __) {
                      return MaterialAppData(
                         // one no longer builds a full custom ThemeData as the Material  Widgets have 
                         // moved to using ColorScheme. 
                         theme: AppThemeData.lightThemeData,
                         darkTheme: AppThemeData.darkThemeData,
                         themeMode: appBrightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
                         // one would integrate these into a function to detect is in debugMode and build variant to 
                         // set them to trigger to true if on material platforms
                         debugShowMaterialGrid: false,
                         
                      );
                    },
                    cupertino: (_, __) => CupertinoAppData(
                      // still have to use CupertinoThemeData since we use Flutter Platform Widgets 
                      // way to do our cross platform approach.
                      theme: CupertinoThemeData(
                        brightness: appBrightness,
                        primaryColor: cupertinoThemeData.primaryColor,
                        primaryContrastingColor: cupertinoThemeData.primaryContrastingColor,
                        // we do not use flex_color_schemes way of setting text themes as we use 
                        // the google_fonts plugin to set our text theme fonts
                        textTheme: myCupertinoTextThemeData,
                        barBackgroundColor: cupertinoThemeData.barBackgroundColor,
                        scaffoldBackgroundColor: cupertinoThemeData.scaffoldBackgroundColor,
                      ),
                      
                    ),
                    home: MyHomePage( title: myAppTitle), 
                ),
            ),
        ),
    );
  }
}
