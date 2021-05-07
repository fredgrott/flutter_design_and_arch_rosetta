// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'dart:async';
import 'dart:developer';

import 'package:counter_changenotifier/app/shared/log_pens.dart';














/// To make sure that we collect all expected and unexpected exceptions we
/// have to prevent log swallowing via the => log return problem
/// while at the same time make it somewhat easy to do Future await
/// paring code writing in an easy way to catch exceptions.
///
/// We can do this to cover both Futures and all functions if we have an
/// easy to use LogException method that we can use in the program main since
/// all exceptions both expected and unexpected are
/// bubbled up in dart.
///
/// The other part of this of course is the LogMixin as still effectively using
/// most functions in some type of class as we are still not fully into doing FP
/// in flutter. Well, at lest the pure kind.
/// 
/// This is null-safety enabled code as my dart target is 2.12.0 and above. I only 
/// need to ensure non-null here as when it's called the zone, time, stacktrace, and level 
/// always exist.
///
/// @author Fredrick Allan Grott
class LogException {
  /// Message describing the
  final String message;
  final StackTrace? stackTrace;
  final Zone? zone;
  DateTime? time;
  int? level = 1000;
  final Object? cause;
  LogException(this.message,
      {StackTrace? stackTrace, this.cause,  this.zone, this.level, this.time,})
      // ignore: prefer_initializing_formals
      : stackTrace = stackTrace {
    log(penWarning(
        // ignore: prefer-trailing-comma
        // ignore: unnecessary_null_comparison
        // ignore: prefer-trailing-comma
        "$message\n$stackTrace${cause != null ? "\nCaused by:\n$cause" : ""} in zone of $zone at level: $level on this $time"));
  }
}
