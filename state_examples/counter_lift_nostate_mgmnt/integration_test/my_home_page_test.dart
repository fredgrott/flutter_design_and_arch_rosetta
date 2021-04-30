// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:counter_lift_nostate_mgmnt/app/modules/my_app.dart';
import 'package:counter_lift_nostate_mgmnt/app/shared/app_globals.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';

import 'my_page_objects.dart';

void main() {
   setUp(() async {
    // ignore: unused_local_variable
    final WidgetsBinding binding =
        IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  });
  testWidgets('My home widget has a title and message, using PageObject',
      // ignore: prefer-trailing-comma
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final app = MyAppPageObject();
    expect(app.home.title, allOf(findsOneWidget, _HasText(myAppTitle)));
    expect(app.home.message, allOf(findsOneWidget, _HasText(myHomepageMessage)));
  });
}

// our custom matcher
// ignore: unused_element
class _HasText extends CustomMatcher {
  _HasText(dynamic matcher) : super('Text data', 'data', matcher);

  @override
  String? featureValueOf(dynamic actual) {
    if (actual is Finder) {
      final element = actual.evaluate().single;
      final widget = element.widget;
      if (widget is Text) {
        return widget.data;
      } else {
        // ignore: avoid_escaping_inner_quotes
        throw Exception('_HasText matcher can\'t be applied to $element');
      }
    } else {
      throw Exception(
          // ignore: prefer-trailing-comma
          '_HasText matcher can only be applied to a Finder object');
    }
  }
}