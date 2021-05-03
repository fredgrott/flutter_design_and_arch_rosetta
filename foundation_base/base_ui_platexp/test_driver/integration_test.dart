// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.

import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test_driver.dart';

// to get ready for when screenshot is enable in flutter 2.2, see
// https://github.com/flutter/plugins/blob/master/packages/integration_test/example/test_driver/extended_integration_test.dart
Future<void> main() async {
  enableFlutterDriverExtension();
  // ignore: unused_local_variable
  final FlutterDriver driver = await FlutterDriver.connect();
  await integrationDriver(
      //driver: driver,
      //onScreenshot: (String screenshotName, List<int> screenshotBytes) async {
      // return true;
      // },
      );
}
