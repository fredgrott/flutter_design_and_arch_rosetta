// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_setstate_cleanarch/app/data/data_sources/number_remote_data_source.dart';
import 'package:counter_setstate_cleanarch/app/data/domain/entities/number.dart';
import 'package:counter_setstate_cleanarch/app/data/domain/repositories/counter_repository.dart';
import 'package:counter_setstate_cleanarch/app/shared/errors.dart';
import 'package:counter_setstate_cleanarch/app/shared/network_info.dart';
import 'package:dartz/dartz.dart';


///COunter repo implementation
class ICounterRepository implements CounterRepository {
  ///Counter repo constructor
  ICounterRepository({
    required NumberRemoteDataSource numberRemoteDataSource,
    required NetworkInfo networkInfo,
  })  : _numberRemoteDataSource = numberRemoteDataSource,
        _networkInfo = networkInfo;

  final NumberRemoteDataSource _numberRemoteDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, Number>> addOneToNumber(int number) {
    return _getCounter(() => _numberRemoteDataSource.incrementCounter(number));
  }

  Future<Either<Failure, Number>> _getCounter(
    Future<Number> Function() incrementCounter,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        
        final number = await incrementCounter();

        return Right(number);
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
