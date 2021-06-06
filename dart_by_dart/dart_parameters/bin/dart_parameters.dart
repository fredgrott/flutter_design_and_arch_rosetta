// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

void main(List<String> arguments) {
  print(sum(2, 2));

  print(sumName(num1: 2, num2: 2));

  print(sumSum(2, num2: 2));
  print(sumSum(2));

  print(sumNum(2, 2));
  print(sumNum(2));

  print(isAdult(1));
  print(isAdult());




}

dynamic sum(var num1, var num2) => num1 + num2;

dynamic sumName({var num1, var num2}) => num1 + num2;

dynamic sumSum(var num1, {var num2}) => num1 + ( num2 ?? 0 );

dynamic sumNum(var num1, [var num2]) => num1 + ( num2 ?? 0 );

bool isAdult([int age = 18]) => age >= 18;

