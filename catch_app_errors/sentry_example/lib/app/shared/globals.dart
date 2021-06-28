// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';

// For complete web support we can not use asserts here.
// That is the main reason why the catchy example is now 
// archived as it has the asserts way to detect DebugMode.
bool get isInDebugMode {
  bool inDebugMode = false;

  if (kDebugMode) {
    return inDebugMode = true;
  }

  return inDebugMode;
}
