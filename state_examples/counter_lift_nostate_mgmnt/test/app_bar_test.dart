// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:counter_lift_nostate_mgmnt/app/shared/app_globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';


import 'app_bar_widget_test_support.dart';


void main() {
  // ignore: no-empty-block
  setUpAll(() async {});

  setUp(() async {
    // ignore: unused_local_variable
    final WidgetsBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
  });

  // ignore: no-empty-block
  tearDownAll(() async {});

  // ignore: no-empty-block
  tearDown(() async {
    // Code that clears caches can go here
  });

  group('appbar test', () {
    testWidgets('AppBar Title is $myAppTitle', harness((given, when, then) async {
    await given.myAppExists();
    await when.appBarFound();
    await then.appBarTitleIs();
  }));
  });
}