// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:flutter_test/flutter_test.dart';
import 'package:grinder_example/app/screens/myhomepage/statecontroller/counter_store_mixin.dart';
import 'package:mocktail/mocktail.dart' as mocktail;

// our mock
class MockCounterStoreMixin extends mocktail.Mock implements CounterStoreMixin {}

// An example of how to use the mocktail substitute for mockito.
// I generally put my mock in the same file as the component test
// mocktail plugin notes are here
// https://pub.dev/packages/mocktail
// 
// Due to eBay having similar function names in their test lib, 
// use a prefix for the mocktail stuff to prevent function name
// collisions
// 
void main() {
  // set up var for mock
  late CounterStoreMixin counterStoreMixin;
  setUpAll(() {
    // ignore: no-empty-block
    TestWidgetsFlutterBinding.ensureInitialized();
    // initialize the mock
    counterStoreMixin = MockCounterStoreMixin();
  });

  group('Mock of Counter Store Mixin', () {
    test('increaseCounter increments by one', () {
      mocktail.when(() => counterStoreMixin.increaseCounter()).thenReturn(1);

      expect(counterStoreMixin.increaseCounter(), 1);
    });
    test('myCounter starts at zero', () {
      mocktail.when(() => counterStoreMixin.myCounter).thenReturn(0);
      expect(counterStoreMixin.myCounter, 0);
    });
  });
}
