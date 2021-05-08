// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_setstate_cleanarch/app/shared/errors.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, CounterParam> {
  /// method call on class creation
  Future<Either<Failure, Type>> call(CounterParam params);
}
