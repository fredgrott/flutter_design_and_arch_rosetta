// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'dart:developer';


import 'package:flutter_error_screen/app/shared/build_modes.dart';
import 'package:flutter_error_screen/app/shared/logging_appenders.dart';
import 'package:flutter_error_screen/app/shared/logging_formatters.dart';
import 'package:logging/logging.dart';

Logger appLogger = Logger("AppLogger");

void appInitLog() {
  if (isInDebugMode) {
    // do we want trace level
    recordStackTraceAtLevel = Level.ALL;
    appLogger.level = Level.ALL;

    // to use logz.io remote logging service
    // LogzIoApiAppender(
    //  apiToken: "<ACCOUNT_TOKEN_FROM_SETTINGS_GUI>",
    //  url: "https://listener-nl.logz.io:8071/",
    //  labels: {
    //    "version": "1.0.0", // dynamically later on
    //    "build": "2" // dynamically later on
    //   },
    //)..attachToLogger(Logger.root);
    Logger.root.onRecord.listen((record) {
      //I already have accounted for the zone info in my appender and record formatter pairs
      if (record.error != null && record.stackTrace != null) {
        
        log('${record.level.name}: ${record.loggerName}: ${record.time}: ${record.message}: ${record.error}: ${record.stackTrace}');
        
        log(
            // ignore: prefer-trailing-comma
            'level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message} error: ${record.error} exception: ${record.stackTrace}');
      } else if (record.error != null) {
        
        log('level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message} error: ${record.error}');
      } else {
        
        log('level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message}');
      }
    });
    MyDevLogAppender(formatter: const MyDevLogRecordFormatter())
        .attachToLogger(Logger.root);
  }
  // print to console stuff gets applied at ZoneSpec definition in the main function so 
  // no need to repeat it here.
  if (!isInDebugMode) {
    recordStackTraceAtLevel = Level.OFF;
    appLogger.level = Level.OFF;
  }
}
