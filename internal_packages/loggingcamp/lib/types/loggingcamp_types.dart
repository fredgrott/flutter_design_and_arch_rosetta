// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:simple_logger/simple_logger.dart';

// How To Use
//
// At top of our chain of responsibilities we have the Root Zone in 
// the app main function and the RunApp is in the child Zone.
// It's usually easier to split up the screens into Logger name 
// areas than to fork  zones. Thus, you create customized Logger
// Mixins as needed for each screen in the app.
//
// detached Loggers are just detached from the Parent logger. Whereas, 
// the newLogger with unique name is not detached but hierarchical below the 
// root AppLogger thus for example in the app template demo app 
// the logger name for the MyHomeScreen would set up as:
//   AppLogger.UILogger 
// and that is the full name of the logger. 
//
// Easy way is to just log something as it's set up so the first call to it
// will fully initialize it.

abstract class LoggingCampType {
  Logger get myNewLogger;
  Logger get myDetachedLogger;
}

extension LoggingCampSpawner on LoggingCampType {
  //LoggingCampLogger newSimpleLogger() =>
  //LoggingCampLogger();
  //LoggingCampLogger detachedSimpleLogger(String name) => myLogger.detached(name);
  Logger newLogger(String name) => Logger(name);
  Logger detachedLogger(String name) => Logger.detached(name);
}


// examples of how to customize your LoggerMixins
// assumes that hierarchical is set to true
// in appInitLog
mixin NetworkLoggerMixin implements LoggingCampType {
  String name = 'NetworkLogger';
  @override
  Logger get myNewLogger => newLogger(name);
  @override
  Logger get myDetachedLogger => detachedLogger(name);
}

mixin UiLoggerMixin implements LoggingCampType {
  String name = "UILogger";
  @override
  Logger get myNewLogger => newLogger(name);
  @override
  Logger get myDetachedLogger => detachedLogger(name);
}
