// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_setstate_cleanarch/app/data/domain/entities/number.dart';
import 'package:counter_setstate_cleanarch/app/shared/errors.dart';
import 'package:dartz/dartz.dart';

abstract class CounterRepository {
  /// Add 1 to the number passed as parameter
  Future<Either<Failure, Number>> addOneToNumber(int number);
}
