// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

void main(List<String> arguments) {
  for (var i = 0; i < 10; ++i) {
    print(i);
  }

  var numbers = [1, 2, 3];

  for (var n in numbers) {
    print(n);
  }

  var numbersNumbers = [1, 2, 3];
  
  numbersNumbers.forEach((numbersNumbers) => print(numbersNumbers));

  var numbersNum = [1, 2, 3];

  numbersNum.forEach(printNum);

  // ignore: omit_local_variable_types
  int num = 5;

  while (num > 0){ 
    print(num);
    num -= 1;
  }

  // ignore: omit_local_variable_types
  int numNumNum = 5;

  do {
    print(numNumNum);
    numNumNum -= 1;
  } while(numNumNum > 0);

  for (var i = 0; i < 10; ++i) {
    if (i > 5) break;
    print(i);
  }

  for (var i = 0; i < 10; ++i) {
    if (i % 2 == 0) continue;
    print('Odd: $i');
  }





}


void printNum(numNum) {
  print(numNum);
}
