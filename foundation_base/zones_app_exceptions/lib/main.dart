import 'dart:async';

import 'package:buildmodes/buildmodes.dart';

import 'package:flutter/widgets.dart';
import 'package:lumberjack/lumberjack.dart';
import 'package:zones_app_exceptions/app/my_app.dart';
import 'package:zones_app_exceptions/app/shared/app_globals.dart';

// the root Zone
Future<void> main() async {
  //since we are at the top in the root zone with no zones above we 
  // need to try-catch this stuff to have caught exceptions for 
  // app initialization stuff
  try {
    // this is always somewhat the first line in our main function
    WidgetsFlutterBinding.ensureInitialized();

    initLog();
  } catch (error) {
    LogException("an app initialization error: $error");
  }

  
  logAFunction("main in main.dart").info(penInfo(" main init completed"));

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

  // child zone
  runZonedGuarded<Future<void>>(
    () async {
      runApp(const MyApp());
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

        // sending print to console to root Zone to handle
        parent.print(zone, penInfo(messageToLog));
      },
    ),
  );
} 

Future<void> _reportError(dynamic error, StackTrace stackTrace) async {
  logger.severe(
    'Caught error: $error',
  );
  // Errors thrown in development mode are unlikely to be interesting. You
  // check if you are running in dev mode using an assertion and omit send
  // the report.
  if (isInDebugMode) {
    logger.severe(
      '$stackTrace',
    );
    logger.severe(
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
