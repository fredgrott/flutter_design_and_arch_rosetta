// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:counter_provider_states/app/screens/myapp.dart';
import 'package:counter_provider_states/app/screens/myhomepage/statecontroller/my_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<CounterLogger>(create: (_) => LoggerMock()),
          StateNotifierProvider<MyStateNotifier, MyState>(
            create: (_) => MyStateNotifier(),
          ),
        ],
        child: MyApp(),
      ),
    );

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1000'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1000'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });
}

class LoggerMock extends Mock implements CounterLogger {}