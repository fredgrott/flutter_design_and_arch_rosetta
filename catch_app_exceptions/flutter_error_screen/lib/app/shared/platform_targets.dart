// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';

// universal_io is used so we can get web too with one package rather than 
// have a switch thing in imports to switch to another io package when oon web

bool get isOnWeb {
  // ignore: unused_local_variable
  bool _isWeb;

  log("isOnWeb: $kIsWeb");

  return kIsWeb ? (_isWeb = true) : (_isWeb = false);
}

bool get isOnAndroid {
  // ignore: unused_local_variable
  bool _isAndroid;

  log("isOnAndroid:$Platform.isAndroid");

  return Platform.isAndroid ? (_isAndroid = true) : (_isAndroid = false);
}

bool get isOnIOS {
  // ignore: unused_local_variable
  bool _isIOS;

  log("isOnIOS: $Platform.isIOS");

  return Platform.isIOS ? (_isIOS = true) : (_isIOS = false);
}
