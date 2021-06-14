// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:buildmodes/buildmodes.dart';
import 'package:catcher/catcher.dart';
import 'package:catchme/catchme.dart';
import 'package:derry_example/app/screens/my_app.dart';
import 'package:derry_example/app/shared/app_globals.dart';
import 'package:loggingcamp/loggingcamp.dart';

import 'package:flutter/material.dart';


// Project Note: Sort of Arch and Flutter Training Wheels in that
//               it has the basics of layered or onion architecture without getting
//               into the more powerful and complex stuff.
//
//                As we get into more complex applications such as the todo app,
//                we get into more complex arch such as use-cases, full DTOs, service layers,
//                repository layers, etc.
//
//                Standard set up to catch app errors to a service and zones set up.

// ignore: long-method
Future<void> main() async {
  // proper use of Futures is to try catch block the inner stuff so that
  // we properly catch as many exceptions as possible from the large
  // amount of uncaught exceptions at the beginning development of an
  // application
  try {
    WidgetsFlutterBinding.ensureInitialized();

    appInitLog();
  } catch (error) {
    appLogger.shout("error: $error");
  }

  // to enable sentry add this [SentryHandler(SentryClient("YOUR_DSN_HERE"))]
  // due to web as a target platform we do not set the snapshot path
  // setting for catcher.
  // Using report mode as I have found it's better feedback in getting
  // user to send report if the stack trace is shown to them
  // ignore: avoid_redundant_argument_values

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  //logger.info("init completed");
  appLogger.info("main init completed");

  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to
      // app exceptions provider. We do not need this in Profile mode.
      // ignore: no-empty-block
      if (isInReleaseMode) {
        // FlutterError class has something not changed as far as null safety
        // so I just assume we do not have a stack trace but still want the
        // detail of the exception.
        Zone.current.handleUncaughtError(details.exception, StackTrace.empty);
        //Zone.current.handleUncaughtError(details.exception,  details.stack);
      }
    }
  };

  runZonedGuarded<Future<void>>(
    () async {
      //runApp(MyApp());
      // via the catcher plugin
      Catcher(
        runAppFunction: () {
          runApp(
            MyApp(navigatorKey),
          );
        },
        debugConfig: debugOptions,
        releaseConfig: releaseOptions,
        navigatorKey: navigatorKey,
      );
    },
    (error, stackTrace) async {
      await _reportError(error, stackTrace);
    },
    // yes we can redefine the zoneSpecification to intercept the print
    // calls and funnel them to log calls via the logger of simple logger
    zoneSpecification: ZoneSpecification(
      // Intercept all print calls
      print: (self, parent, zone, line) async {
        // Include a timestamp and the name of the App
        final messageToLog = "[${DateTime.now()}] $myAppTitle $line $zone";

        // Also print the message in the "Debug Console"
        // but it's ony an info message and contains no
        // privacy prohibited stuff
        parent.print(zone, messageToLog);
      },
    ),
    
    
    
  );
}

Future<void> _reportError(dynamic error, StackTrace stackTrace) async {
  appLogger.severe(
    'Caught error: $error',
  );
  // Errors thrown in development mode are unlikely to be interesting. You
  // check if you are running in dev mode using an assertion and omit send
  // the report.
  if (isInDebugMode) {
    appLogger.severe(
      '$stackTrace',
    );
    appLogger.severe(
        // ignore: prefer-trailing-comma
        'In dev mode. Not sending report to an app exceptions provider.');

    return;
  } else {
    // reporting error and stacktrace to app exceptions provider code goes here
    // ignore: no-empty-block
    if (isInReleaseMode) {
      // we only need something here if we are doing some other app exceptions
      // reporting to 3rd parties beyond the catcher sentry stuff for example if
      // we are using a logging to 3rd party appender for example where
      // we might want to sent app exceptions the same way as an added log
      // event to that 3rd party system
    }
  }
}
