// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:equatable/equatable.dart';

class CounterParam extends Equatable {
  ///Counter
  const CounterParam({ required this.number});

  ///Param number value
  final int number;

  @override
  List<Object> get props => [number];
}
