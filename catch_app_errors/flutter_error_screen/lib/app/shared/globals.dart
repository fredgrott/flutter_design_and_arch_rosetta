// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

const int megaBYTE = 1024 * 1024;

bool get isInDebugMode {
  bool inDebugMode = false;

  if (kDebugMode) {
    inDebugMode = true;
  }

  return inDebugMode;
}

final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

Map<String, dynamic> deviceData = <String, dynamic>{};
