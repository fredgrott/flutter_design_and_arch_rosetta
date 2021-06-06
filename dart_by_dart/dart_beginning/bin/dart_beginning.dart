// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// main is the entry part of the app
// for console apps you supply a set of args
// the void declares that the main function does not return a value or object
void main(List<String> arguments) {
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
