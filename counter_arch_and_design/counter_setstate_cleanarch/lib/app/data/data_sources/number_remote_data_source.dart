// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:counter_setstate_cleanarch/app/data/models/number_model.dart';
import 'package:counter_setstate_cleanarch/app/shared/errors.dart';
import 'package:dio/dio.dart';

/// NumberRemote data source
abstract class NumberRemoteDataSource {
  /// increment counter function
  Future<NumberModel> incrementCounter(int number);
}

/// Number
class INumberRemoteDataSource implements NumberRemoteDataSource {
  final Dio _dio = Dio();

  @override
  Future<NumberModel> incrementCounter(int number) async {
    return  _incrementCounterFromApi('$number + 1');
  }

  Future<NumberModel> _incrementCounterFromApi(String operation) async {
    final response = await _dio.post<dynamic>(
      'https://api.mathjs.org/v4/',
      options: RequestOptions(
        headers: <String,dynamic>{"Content-Type": 'application/json'}, path: '',
      ) as Options?,
      data: {'expr': operation},
    );

    if (response.statusCode == 200) {
      final number = NumberModel.fromJson(
    
        response.data as Map<String, dynamic> ,
      );

      return number;
    } else {
      throw ServerException();
    }
  }
}
