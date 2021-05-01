// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.






import 'package:counter_mvp_plain/app/shared/types.dart';
import 'package:logging/logging.dart';

// Works by setting the logger instance that we get in the class
// calling the mixin with a specific string name and thus allows
// a flexible setting what attributes of:
//  error(cause)
//  stackTrace
//  level via logger suffix of finest, finer, fine, info, config,
//                             warning, severe, shout
// message
// zone
// 
// color pens than are used at the logger line like this
// logger.info(penCyan('my message'), error, stackTrace)

mixin UiLogger implements LoggerType {
  @override
  Logger get logger => Logger('UI Logger - ${runtimeType.toString()}');
}

mixin NetworkLogger implements LoggerType {
  @override
  Logger get logger => Logger('Network Logger - ${runtimeType.toString()}');
}

mixin UtilityLogger implements LoggerType {
  @override
  Logger get logger => Logger('Utility Logger - ${runtimeType.toString()}');
}

Logger logAFunction(String name) => Logger('$Logger.fullName.$name ');
