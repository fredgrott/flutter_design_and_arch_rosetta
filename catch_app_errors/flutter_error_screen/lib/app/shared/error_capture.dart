// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_error_screen/app/shared/globals.dart';
import 'package:package_info_plus/package_info_plus.dart';

late PackageInfo info;

Future<Null> runCapturedApp(Widget app, ErrorReporter reporter) async {
  info = await PackageInfo.fromPlatform();

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
      await reporter.logException(error,
          stackTrace: stackTrace, message: 'whoops',);
    },
  );
}

class ErrorReporter {
  Future<void> logException(
    Object error, {
    required String message,
    required StackTrace stackTrace,
  }) async {
    log('Caught error: $error\n$stackTrace');

    if (isInDebugMode) {
      log(stackTrace.toString());
      log('In dev mode. Not sending report to ');

      return;
    }

    log('Reporting to ...');

    final PackageInfo info = await PackageInfo.fromPlatform();

    
  }
}
