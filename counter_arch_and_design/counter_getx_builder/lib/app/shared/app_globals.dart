// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_getx_builder/app/shared/log_writer_callback.dart';
import 'package:get/get.dart';

String myAppTitle = "Flutter Boilerplate";

String myHomepageMessage = "You have pushed the button this many times:";

// ignore: no-empty-block
final myConfig = Get.config(
  enableLog: true,
  logWriterCallback: MyLogWriterCallback.write,

  );
