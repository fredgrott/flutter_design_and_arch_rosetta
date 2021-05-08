// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

/// The Architecture Layout or plan assumes that we
/// always have a State Controller, ie a Store. In this simple
/// Flutter ap template modified we make it a basic mixin as we
/// have non-blank functions(methods) here.
///
/// usage:
///
/// ```
///     CounterStoreMixin.myCounter++;
/// ```
/// as every Mixin has a default implied-constructor and thus we 
/// can always access the static const or vars this way.
///
/// @author Fredrick Allan Grott
///
class CounterStoreMixin {
  static const int _counter = 0;

  int myCounter = _counter;

  int increaseCounter() {
    return myCounter++;
  }
}
