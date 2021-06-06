// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

void main(List<String> arguments) {
  // String -> int
  var one = int.parse('1');
  assert(one == 1);

  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  // int -> String
  // ignore: omit_local_variable_types
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  // double -> String
  // ignore: omit_local_variable_types
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

}
