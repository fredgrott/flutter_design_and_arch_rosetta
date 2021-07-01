// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_error_screen/app/shared/appinitlog.dart';
import 'package:flutter_error_screen/app/shared/build_modes.dart';


// Note: Sentry is Desired as they collect additional info 
//       from their dart-flutter integrations automatically
//       and thus the info is reduced that one has to 
//       provide via SentryEvent. We still collected 
//       when not using Sentry integration to supply it 
//       to catcher via the email hooks so devs still 
//       get the info.

// SentryEvent 
//     loggerName: ''
//     exception: error
//     stackTrace: stackTrace
//     release: '${info.version}_${info.buildNumber}
//     environment: 'qa-debug'
//     tags: tags
//     extra: extra
//     level: SeverityLevel.fatal


/// runCaptureApp function to implement flutter app
/// exception reporting to user and to app exceptions 
/// service providers.
/// 
/// This allows me to keep the app main function thin instead 
/// of being fat.
/// 
/// @author Fredrick Allan Grott
// ignore: prefer_void_to_null
Future<Null> runCapturedApp(Widget app, ErrorReporter reporter) async {
  

  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to Sentry.
      // ignore: cast_nullable_to_non_nullable
      Zone.current
          // ignore: cast_nullable_to_non_nullable
          .handleUncaughtError(details.exception, details.stack as StackTrace);
    }
  };
  runZonedGuarded(
    () {
      runApp(app);
    },
    (Object error, StackTrace stackTrace) async {
      await reporter.logAppExceptionWithService(error,
          stackTrace: stackTrace, message: 'whoops',);
    },
  );
}

/// ErrorReporter class assembles the device info and 
/// stack trace and app exception and sends it to the 
/// app exceptions service provider.
///
/// @author Fredrick Allan Grott
class ErrorReporter {
  Future<void> logAppExceptionWithService(
    Object error, {
    required String message,
    required StackTrace stackTrace,
  }) async {
    appLogger.shout('Caught error: $error\n$stackTrace');

    if (isInDebugMode) {
      appLogger.shout(stackTrace.toString());
      appLogger.shout('In dev mode. Not sending report to ');

      return;
    }

    appLogger.info('Reporting to ...');

    

    
  }
}
