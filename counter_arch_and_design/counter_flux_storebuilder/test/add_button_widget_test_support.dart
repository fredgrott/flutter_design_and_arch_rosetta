// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:counter_flux_storebuilder/app/modules/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:given_when_then/given_when_then.dart';

String myTitle = "FProject Layout";
String myMessage = "You have pushed the button this many times:";

Future<void> Function(WidgetTester) harness(
    // ignore: prefer-trailing-comma
    WidgetTestHarnessCallback<_WidgetTestHarness> callback) {
  return (tester) =>
      givenWhenThenWidgetTest(_WidgetTestHarness(tester), callback);
}

class _WidgetTestHarness extends WidgetTestHarness {
  _WidgetTestHarness(WidgetTester tester) : super(tester);
}

extension AddButtonGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> haveMyHomePage() async {
    await tester.pumpWidget(MyApp());
  }
}

extension AddButtonWhen on WidgetTestWhen<_WidgetTestHarness> {
  Future<void> userPerformsTapAdd() async {
    await tester.tap(find.byIcon(Icons.add));
  }
}

extension AddButtonThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> makeSureCounterReadsOne() async {
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  }
}
