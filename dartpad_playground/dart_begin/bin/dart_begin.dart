// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

/// Entry-point of the app
/// @author Fredrick Allan Grott
void main(List<String> arguments) {

  // In-line comment
  /*
  Block comment
  */

  /// Documentation






  var firstName = 'Mahmud'; // String type inference
  // ignore: omit_local_variable_types
  String lastName =
      'Ahsan'; // String type declared, not really needed as far as type annotation as we can instead inference it
  // ignore: omit_local_variable_types
  int number =
      100; // integer type declared, not really needed as far as type annotation as we can instead inference it
  // ignore: omit_local_variable_types
  double cost =
      11.40; // double type declared, not really needed as far as type annotation as we can instead inference it
  dynamic isOkay = true; // dynamic type can holds any type

  // print functions print to the screen in a console app
  print(firstName + ' ' + lastName);
  print(number);
  print(cost);
  print(isOkay);
}
