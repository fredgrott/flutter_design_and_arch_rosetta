// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

void main(List<String> arguments) {
  const aConstNum = 0; // int constant
  const aConstBool = true; // bool constant 
  const aConstString = 'a constant string'; // string constant

  print(aConstNum);
  print(aConstBool);
  print(aConstString);

  print(aConstNum.runtimeType);
  print(aConstBool.runtimeType);
  print(aConstString.runtimeType);

  final amount = 5;
  print(amount);

  var list = const [1, 2, 3];
  list.add(4); // it will produce error as list points constant values
  print(list);



}
