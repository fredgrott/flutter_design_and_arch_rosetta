// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:service_locator/app/shared/service_locator.dart';

class Dummy {
  final int id;
  final String name;

  Dummy(this.id, this.name);
  factory Dummy.named(String name) {
    return Dummy(Random().nextInt(1000000), name);
  }
}

void main() {
  ServiceLocator sl = ServiceLocator.newContainer();

  setUp(() {
    sl = ServiceLocator.newContainer();
  });

  group('ServiceLocator', () {
    test('registerFactory creates a new instance on every resolve', () {
      sl.registerFactory<Dummy>((_) => Dummy.named('John'));
      final firstResolve = sl.resolve<Dummy>();
      final secondResolve = sl.resolve<Dummy>();
      expect(firstResolve, isNot(equals(secondResolve)));
    });

    test('registerFactory1 creates a new instance on every resolve1', () {
      sl.registerFactory1<Dummy, String>((_, name) => Dummy.named(name));
      // same names but different random ids on resolve
      final firstResolve = sl.resolve1<Dummy, String>('john');
      final secondResolve = sl.resolve1<Dummy, String>('john');
      expect(firstResolve, isNot(equals(secondResolve)));
    });

    test('registerSingleton returns the same instance on every resolve', () {
      sl.registerSingleton<Dummy>((_) => Dummy.named('John'));
      final firstResolve = sl.resolve<Dummy>();
      final secondResolve = sl.resolve<Dummy>();
      expect(firstResolve, secondResolve);
    });

    test('sharedContainer can be replaced', () {
      final singleton = Dummy.named('Mr Singleton');

      // ServiceLocator() accesses ServiceLocator.sharedContainer
      ServiceLocator().registerSingleton<Dummy>((_) => singleton);
      expect(ServiceLocator().resolve<Dummy>(), singleton);

      // Replace current shared container with a new one
      ServiceLocator.sharedContainer = ServiceLocator.newContainer();

      // Register new instance with the same key
      final newOne = Dummy(1, 'New One');
      ServiceLocator().registerSingleton<Dummy>((_) => newOne);
      expect(ServiceLocator().resolve<Dummy>(), newOne);
    });
  });
}