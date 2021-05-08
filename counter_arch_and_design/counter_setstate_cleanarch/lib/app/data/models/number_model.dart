// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:counter_setstate_cleanarch/app/data/domain/entities/number.dart';

class NumberModel extends Number {
  ///Number model constructor
  NumberModel({required int value}) : super(value: value);

  /// Factory constructor from json
  factory NumberModel.fromJson(Map<String, dynamic> json) {
    return NumberModel(
      value: int.parse( json['result'] as String),
    );
  }

  /// Map constructor from model
  Map<String, dynamic> toJson() {
    return  <String, dynamic>{
      'value':  value,
    };
  }
}
