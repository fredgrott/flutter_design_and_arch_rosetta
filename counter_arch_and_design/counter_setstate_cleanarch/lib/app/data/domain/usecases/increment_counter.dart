// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_setstate_cleanarch/app/data/domain/entities/counter_param.dart';
import 'package:counter_setstate_cleanarch/app/data/domain/entities/number.dart';
import 'package:counter_setstate_cleanarch/app/data/domain/repositories/counter_repository.dart';
import 'package:counter_setstate_cleanarch/app/data/domain/usecases/use_case.dart';
import 'package:counter_setstate_cleanarch/app/shared/errors.dart';
import 'package:dartz/dartz.dart';

class IncrementCounter implements UseCase<Number, CounterParam> {
  /// Increment Counter constructor
  IncrementCounter({
    required CounterRepository counterRepo,
  })  : _counterRepo = counterRepo;

  final CounterRepository _counterRepo;

  @override
  Future<Either<Failure, Number>> call(CounterParam params) async {
    return  _counterRepo.addOneToNumber(params.number);
  }
}
