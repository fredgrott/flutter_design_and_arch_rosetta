// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.





import 'package:logging/logging.dart';

abstract class LoggingCampType {
  Logger get campLogger;
}

extension LoggingCampSpawner on LoggingCampType {
  Logger newLogger(String name) => Logger('${campLogger.fullName}.$name');
  Logger detachedLogger(String name) => Logger.detached(name);
}

mixin UiLoggerMixin implements LoggingCampType {
  @override
  Logger get campLogger => Logger('UILogger - ${runtimeType.toString()}');
}

mixin NetworkLoggingMixin implements LoggingCampType {
  @override
  Logger get campLogger => Logger('NetworkLogger - ${runtimeType.toString()}');
}
