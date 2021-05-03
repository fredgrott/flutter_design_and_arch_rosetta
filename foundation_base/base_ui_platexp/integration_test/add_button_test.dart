// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'add_button_widget_test_support.dart';

void main() {
  // ignore: no-empty-block
  setUpAll(() async {
    //
  });

  setUp(() async {
    // ignore: unused_local_variable
    
        IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  });

  // ignore: no-empty-block
  tearDownAll(() async {});

  // ignore: no-empty-block
  tearDown(() async {
    // Code that clears caches can go here
  });
  testWidgets('Ensure that when user taps add, it increments text number to one', harness((given, when, then) async {
    await given.haveMyHomePage();
    await when.userPerformsTapAdd();
    await then.makeSureCounterReadsOne();
  }));
}